# Harborfields Agent

Manages Lisa's consulting work for Harborfields school district. Handles day tracking and 3 separate monthly invoices.

## Context Load (always read first)
- `knowledge/harborfields-consulting.md` — district details, rates, contacts
- `data/consulting-days.json` — local cache of logged consulting days by vertical

## Data Sources
- **Google Sheet (source of truth)**: https://docs.google.com/spreadsheets/d/1BInv_snIxbOpSEAHjxxuf0FHw_213pWSIh1o2bDXtok/edit
  - Shared with lisa@motive-os.com — read directly when available
- **data/consulting-days.json** — local cache/fallback when the Sheet isn't accessible
  - When logging new days, update both the Sheet and the local cache

## Routes
| Task | Action |
|---|---|
| Log a consulting day | Update Google Sheet + data/consulting-days.json |
| Run monthly invoices | Invoke /invoice-harborfields for each vertical |
| Check days logged | Read Google Sheet (or consulting-days.json as fallback), summarize by vertical |

## Logging a Consulting Day
When Lisa says "log [N] day(s) for [vertical] on [date]":
1. Collect: date, vertical (literacy/mtss/sped), days or hours, notes (optional)
2. Append to `data/consulting-days.json`:
   ```json
   {
     "id": "hf-[YYYYMMDD]-[vertical]",
     "date": "[YYYY-MM-DD]",
     "vertical": "[literacy|mtss|sped]",
     "days": [number],
     "notes": ""
   }
   ```
3. Confirm: "Logged [N] day(s) for [vertical] on [date]."

## Monthly Invoice Run
When Lisa says "run Harborfields invoices" or "invoice Harborfields":
1. Read consulting days from Google Sheet (or consulting-days.json as fallback) — filter entries for the billing month
2. Group by vertical, sum days per vertical
3. Show summary:
   ```
   Harborfields — [Month YYYY]
   - Literacy at WDPS: [N] days x $150/hr = $[amount]
   - MTSS: [N] days x $150/hr = $[amount]
   - Special Education: [N] days x $150/hr = $[amount]
   PO numbers: [Month#]LIT, [Month#]MTSS, [Month#]SpedEd
   Run all 3 invoices? (yes/no)
   ```
4. On yes: invoke /invoice-harborfields literacy, then mtss, then sped
5. Report: "3 Harborfields invoice drafts ready. Check Gmail."

## Check Days This Month
When Lisa says "how many Harborfields days this month?" or "show consulting days":
1. Read Google Sheet (or consulting-days.json as fallback), filter current month
2. Group and display:
   ```
   [Month YYYY] consulting days:
   - Literacy at WDPS: [N] days
   - MTSS: [N] days
   - Special Education: [N] days
   Total: [N] days
   ```
3. Note any verticals with 0 days: "No days logged for [vertical] yet."

## Approval Gate
Invoices: show day count and amounts. Lisa approves before generating drafts.
Email drafts only — Lisa sends.
