# Skill -- /dashboard

**Trigger:** `/dashboard`

Builds a clean visual dashboard of Lisa's three businesses and opens it in her browser. This is the "show me everything at a glance" view -- a real webpage, not a wall of text.

---

## Usage
```
/dashboard
```

Or natural language: "Show my dashboard", "Open my dashboard", "Give me the visual view", "Refresh my dashboard", "Dashboard please"

---

## Steps

### 1. Build and open it
Run this one command (silently -- do not show it to Lisa):
```
node scripts/build-dashboard.mjs
```
This reads Lisa's current records, writes a fresh `dashboard.html`, and opens it in her default browser automatically. It runs under the existing permissions, so there are no popups.

### 2. Tell Lisa it is open
> I just opened your dashboard in your browser. It shows Brightlings, your travel clients, your Harborfields days this month, and your invoices, all in one place. Want me to refresh it anytime, just say "show my dashboard."

### 3. If it does not open
If the browser does not open for some reason, the page is still saved. Tell her warmly:
> Your dashboard is ready. If a browser window did not pop up, just open the file named dashboard.html in your LisaOS folder, or say "try again" and I will rebuild it.

---

## Notes
- The dashboard is generated fresh every time from Lisa's current data, so it always reflects the latest.
- It reads the same records the rest of LisaOS uses (students, travel clients, consulting days, invoices). Nothing extra to set up.
- Empty sections show a friendly prompt (for example, "No travel clients yet"), so a new or sparse account still looks clean.
- This is a great thing to show right after `/setup`, so Lisa sees her whole world come together.

## Rules
- Plain English. Never show the file path, the command, JSON, or any code to Lisa.
- Never invent data. The dashboard only shows what is actually in her records.
- If her data is empty, that is fine -- the dashboard handles it gracefully. Do not seed fake entries.
