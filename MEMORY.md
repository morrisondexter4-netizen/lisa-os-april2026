# LisaOS Memory -- Lisa Wolf
# Volatile state only. Auto-managed. Target < 60 lines.
# Updated: 2026-06-15

## Gmail Hub
- Central email: lisabwolf14@gmail.com (connected via Gmail MCP)
- Forwards from: lisa.wolf2@fora.travel, wolfl@harborfieldscsd.org
- Google Sheets/Docs owned by this account

## Brightlings (Tutoring Center)
- Active students: James Anthony, Timothy Mullen, Jack Marino, Edward Eighmey, William Eighmey, Madelyn Stojanovic
- All rates: $150/hr. Payment via Stripe.
- Subjects, parentContact, sessionsOwed: to be filled during /setup call
- Teacher sign-up doc: https://docs.google.com/document/d/1z5Da56i3BQfM1QjR5C0y4PzjadWtFBmLwiQ9FLRNspY/edit

## Quintessential Travel
- Agency: Fora Travel (handles all payments -- no invoicing needed)
- Contact: lisa.wolf2@fora.travel
- No active clients on file yet -- to be populated during /setup

## Harborfields District Consulting
- 3 monthly invoices: Literacy at WDPS | MTSS | Special Education
- Rate: $150/hr across all 3 verticals
- PO formats: [Month#]LIT, [Month#]MTSS, [Month#]SpedEd
- District email: wolfl@harborfieldscsd.org
- Day tracking sheet: https://docs.google.com/spreadsheets/d/1BInv_snIxbOpSEAHjxxuf0FHw_213pWSIh1o2bDXtok/edit
- Still needed from Lisa: district contact name, billing contacts per vertical

## Setup Status
- v2.1 (2026-06-15): simpler 5-minute /setup (test-first connections, confirm-don't-interrogate, optional deep dive) + new /dashboard (visual view, opens in browser via scripts/build-dashboard.mjs, no new permissions)
- Setup call with Lisa: happened 2026-04-06
- MCPs still pending on Lisa's machine (Gmail, Calendar need connection)
- Student data fields present (subjects, sessionsOwed, lastInvoiced); detail filled via optional deep dive in /setup
- Next: Lisa runs /update, then /setup (fast path) to connect MCPs and see her dashboard

## Gotchas
- Never send email -- Gmail drafts only, Lisa sends manually
- Never create GCal events without confirmation
- Never delete from JSON files without explicit instruction
- Google Sheet is source of truth for consulting days, not local JSON
- Invoice formats: knowledge/invoice-formats.md
- Troubleshooting: knowledge/troubleshooting.md
