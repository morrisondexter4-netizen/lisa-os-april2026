#!/usr/bin/env node
// LisaOS dashboard generator.
// Reads Lisa's data files and writes a self-contained dashboard.html, then opens it.
// Runs under the allowed "node:*" permission, so no popups for Lisa.
// Usage: node scripts/build-dashboard.mjs [--no-open]

import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { execFile } from "node:child_process";

const ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
const noOpen = process.argv.includes("--no-open");

function readJson(rel, fallback) {
  try {
    return JSON.parse(fs.readFileSync(path.join(ROOT, rel), "utf8"));
  } catch {
    return fallback;
  }
}

const students = readJson("data/students.json", { students: [] }).students || [];
const invoicesRaw = readJson("data/invoices.json", []);
const invoices = Array.isArray(invoicesRaw) ? invoicesRaw : invoicesRaw.invoices || [];
const consulting = readJson("data/consulting-days.json", { entries: [] }).entries || [];
const travel = readJson("data/travel-clients.json", { clients: [] }).clients || [];

const now = new Date();
const monthLabel = now.toLocaleString("en-US", { month: "long", year: "numeric" });
const money = (n) => "$" + Math.round(n).toLocaleString("en-US");

// --- Brightlings ---
const toInvoice = students.filter((s) => (s.sessionsOwed || 0) > 0);
const studentRows = students.map((s) => {
  const owed = s.sessionsOwed || 0;
  const rate = s.rate || 150;
  let pill, cls;
  if (owed > 0) { pill = `${owed} to invoice`; cls = "warn"; }
  else { pill = "up to date"; cls = "muted"; }
  const amount = owed > 0 ? ` &middot; ${money(owed * rate)}` : "";
  return { name: s.name, status: s.status || "active", pill, cls, amount };
});

// --- Harborfields ---
const VLABEL = { literacy: "Literacy at WDPS", mtss: "MTSS", sped: "Special Education" };
const thisMonthDays = {};
let totalDays = 0;
for (const e of consulting) {
  const d = new Date(e.date);
  if (d.getMonth() === now.getMonth() && d.getFullYear() === now.getFullYear()) {
    const v = (e.vertical || "").toLowerCase();
    thisMonthDays[v] = (thisMonthDays[v] || 0) + (e.days || 0);
    totalDays += e.days || 0;
  }
}

// --- Invoices ---
const byStatus = (st) => invoices.filter((i) => (i.status || "").toLowerCase() === st);
const draftInv = byStatus("draft");

// --- Travel ---
const travelByStatus = travel.reduce((acc, c) => {
  const s = (c.status || "active").toLowerCase();
  (acc[s] = acc[s] || []).push(c);
  return acc;
}, {});

// --- Needs attention ---
const attention = [];
if (toInvoice.length) attention.push(`${toInvoice.length} student${toInvoice.length > 1 ? "s" : ""} ready to invoice`);
if (draftInv.length) attention.push(`${draftInv.length} invoice draft${draftInv.length > 1 ? "s" : ""} waiting in Gmail`);
if (totalDays > 0) attention.push(`${totalDays} Harborfields day${totalDays > 1 ? "s" : ""} logged this month`);
if (travel.length === 0) attention.push("no travel clients on file yet");

const greetHour = now.getHours();
const greet = greetHour < 12 ? "Good morning" : greetHour < 18 ? "Good afternoon" : "Good evening";
const attentionLine = attention.length
  ? `${greet}, Lisa. ${attention.join(", ")}.`
  : `${greet}, Lisa. Everything looks handled right now.`;

// --- Render helpers ---
const card = (icon, title, right, body) => `
  <section class="card">
    <header><span class="ico">${icon}</span><h2>${title}</h2>${right ? `<span class="tag">${right}</span>` : ""}</header>
    ${body}
  </section>`;

const row = (left, right, rightCls = "") =>
  `<div class="row"><span class="l">${left}</span><span class="r ${rightCls}">${right}</span></div>`;

const empty = (msg) => `<div class="empty">${msg}</div>`;

// Brightlings card
const brightBody = studentRows.length
  ? studentRows.map((r) => row(r.name, `<span class="pill ${r.cls}">${r.pill}</span>${r.amount}`)).join("")
  : empty("No students yet. Say &ldquo;add a student&rdquo; or run setup.");

// Travel card
let travelBody;
if (travel.length) {
  travelBody = Object.entries(travelByStatus)
    .flatMap(([st, list]) => list.map((c) => row(`${c.name}${c.destination ? `, ${c.destination}` : ""}`, `<span class="pill info">${st}</span>`)))
    .join("") + `<div class="note">Fora handles payments, no invoicing needed.</div>`;
} else {
  travelBody = empty("No travel clients yet. Say &ldquo;add a travel client.&rdquo;") +
    `<div class="note">Fora handles payments, no invoicing needed.</div>`;
}

// Harborfields card
const hfBody = totalDays
  ? ["literacy", "mtss", "sped"].map((v) => row(VLABEL[v], `${thisMonthDays[v] || 0} day${(thisMonthDays[v] || 0) === 1 ? "" : "s"}`)).join("") +
    row("<strong>Total this month</strong>", `<strong>${totalDays} days</strong>`)
  : empty(`No consulting days logged for ${monthLabel} yet. Say &ldquo;log a literacy day.&rdquo;`);

// Invoices card
const invBody = invoices.length
  ? invoices.slice(-5).reverse().map((i) => {
      const st = (i.status || "draft").toLowerCase();
      const cls = st === "paid" ? "ok" : st === "draft" ? "muted" : "warn";
      const amt = i.amount ? ` &middot; ${money(i.amount)}` : "";
      return row(`${i.client || i.student || "Invoice"}${i.vertical ? ` (${i.vertical})` : ""}`, `<span class="pill ${cls}">${st}</span>${amt}`);
    }).join("")
  : empty("No invoices yet. They appear here once you create one.");

const html = `<!doctype html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Lisa OS</title>
<style>
  :root { color-scheme: light; }
  * { box-sizing: border-box; }
  body { margin: 0; background: #f6f5f2; color: #20201e; font: 15px/1.5 -apple-system, BlinkMacSystemFont, "Segoe UI", system-ui, sans-serif; padding: 28px 18px 40px; }
  .wrap { max-width: 980px; margin: 0 auto; }
  .top { display: flex; align-items: center; gap: 12px; margin-bottom: 14px; }
  .avatar { width: 44px; height: 44px; border-radius: 50%; background: #e6f1fb; color: #185fa5; display: flex; align-items: center; justify-content: center; font-weight: 600; }
  .top h1 { font-size: 20px; margin: 0; font-weight: 600; }
  .top .sub { color: #6b6a65; font-size: 13px; }
  .banner { background: #fff; border: 1px solid #e7e5df; border-radius: 12px; padding: 12px 16px; margin-bottom: 18px; color: #44443f; display: flex; gap: 10px; align-items: flex-start; }
  .banner .b { color: #185fa5; }
  .grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 14px; }
  .card { background: #fff; border: 1px solid #e7e5df; border-radius: 14px; padding: 16px 18px; }
  .card header { display: flex; align-items: center; gap: 8px; margin-bottom: 4px; }
  .card h2 { font-size: 15px; margin: 0; font-weight: 600; }
  .card .ico { font-size: 17px; }
  .card .tag { margin-left: auto; font-size: 11px; font-weight: 600; color: #185fa5; background: #e6f1fb; padding: 2px 9px; border-radius: 8px; }
  .row { display: flex; align-items: center; gap: 10px; padding: 8px 0; border-top: 1px solid #f0eee8; font-size: 14px; }
  .row .l { flex: 1; }
  .row .r { color: #6b6a65; white-space: nowrap; }
  .pill { font-size: 11px; font-weight: 600; padding: 2px 8px; border-radius: 8px; }
  .pill.warn { background: #faeeda; color: #854f0b; }
  .pill.ok { background: #e1f5ee; color: #0f6e56; }
  .pill.info { background: #e6f1fb; color: #185fa5; }
  .pill.muted { background: #f1efe8; color: #5f5e5a; }
  .empty { padding: 12px 0 4px; color: #8a897f; font-size: 13px; border-top: 1px solid #f0eee8; }
  .note { padding: 10px 0 0; color: #8a897f; font-size: 12px; }
  .foot { text-align: center; color: #a3a299; font-size: 12px; margin-top: 22px; }
</style></head>
<body><div class="wrap">
  <div class="top">
    <div class="avatar">LW</div>
    <div><h1>Lisa OS</h1><div class="sub">Brightlings &middot; Quintessential Travel &middot; Harborfields</div></div>
  </div>
  <div class="banner"><span class="b">&#9679;</span><span>${attentionLine}</span></div>
  <div class="grid">
    ${card("&#127979;", "Brightlings students", "$150/hr", brightBody)}
    ${card("&#9992;", "Quintessential travel", "Fora", travelBody)}
    ${card("&#128188;", "Harborfields consulting", monthLabel, hfBody)}
    ${card("&#129534;", "Invoices", "", invBody)}
  </div>
  <div class="foot">Updated ${now.toLocaleString("en-US", { dateStyle: "medium", timeStyle: "short" })} &middot; say &ldquo;refresh my dashboard&rdquo; anytime</div>
</div></body></html>`;

const outPath = path.join(ROOT, "dashboard.html");
fs.writeFileSync(outPath, html);
console.log("Dashboard written to " + outPath);

if (!noOpen) {
  execFile("open", [outPath], (err) => {
    if (err) console.log("Open it in your browser: " + outPath);
  });
}
