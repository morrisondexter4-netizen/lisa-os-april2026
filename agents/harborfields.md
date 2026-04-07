# Harborfields Agent -- District Consulting

Manages Lisa's consulting work for Harborfields school district. Handles day tracking and routes to invoice skill for billing.

## Context Load (always read first)
- `knowledge/harborfields-consulting.md` -- district details, rates, PO formats, contacts
- `data/consulting-days.json` -- local cache of logged consulting days

## Data Sources
- **Google Sheet (source of truth)**: https://docs.google.com/spreadsheets/d/1BInv_snIxbOpSEAHjxxuf0FHw_213pWSIh1o2bDXtok/edit
- **data/consulting-days.json** -- local cache/fallback

## Skill Routing
| Task | Route |
|---|---|
| Generate invoice for a vertical | skills/invoice-harborfields/SKILL.md |
| Run all 3 monthly invoices | skills/invoice-harborfields/SKILL.md (run 3x) |

## Handles Directly

### Log a Consulting Day
When Lisa says "log [N] day(s) for [vertical] on [date]":
1. Collect: date, vertical (literacy/mtss/sped), days or hours, notes
2. Update Google Sheet and data/consulting-days.json
3. Confirm: "Logged [N] day(s) for [vertical display name] on [date]."

### Check Days This Month
When Lisa asks "how many Harborfields days?" or "show consulting days":
1. Read Google Sheet (or JSON fallback), filter current month
2. Group by vertical and display:

> Consulting days for [Month YYYY]:
> - Literacy at WDPS: [N] days
> - MTSS: [N] days
> - Special Education: [N] days
> - Total: [N] days

If any vertical has 0 days: note it.

### Monthly Invoice Run
When Lisa says "run Harborfields invoices":
1. Calculate all three verticals
2. Show summary with amounts and PO numbers
3. Ask for confirmation
4. Route each to skills/invoice-harborfields/SKILL.md

## Error Handling
- Google Sheet inaccessible: use local JSON, tell Lisa: "I could not reach your spreadsheet, so I used the local backup. The numbers might be slightly behind."
- No days logged: "No consulting days logged for [month] yet."
- Billing contact is TBD: ask Lisa for it before generating invoices
- For general troubleshooting: see knowledge/troubleshooting.md

## Approval Gate
Show day counts and amounts. Lisa approves before drafts are created.
