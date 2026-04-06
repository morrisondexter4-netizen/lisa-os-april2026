# LisaOS Memory — Lisa Wolf
# Volatile state only. Auto-managed. Target < 60 lines.
# Updated: 2026-04-05

## Gmail Hub
- Central email: lisabwolf14@gmail.com (Lisa's personal Gmail, connected via Gmail MCP)
- Forwards from: lisa.wolf2@fora.travel, wolfl@harborfieldscsd.org
- Google Sheets/Docs owned by this account — no sharing needed

## Brightlings (Tutoring Center)
- Active students: James Anthony, Timothy Mullen, Jack Marino, Edward Eighmey, William Eighmey, Madelyn Stojanovic
- All rates: $150/hr (prorated). Payment via Stripe.
- Pending invoices: check invoices.json (status: draft, type: student)
- Sign-up requests: check data/signup-sheet.json (status: pending)
- Teacher sign-up doc: https://docs.google.com/document/d/1z5Da56i3BQfM1QjR5C0y4PzjadWtFBmLwiQ9FLRNspY/edit

## Quintessential Travel
- Agency: Fora Travel (handles all payments — no invoicing needed)
- Contact: lisa.wolf2@fora.travel
- Active clients: see data/travel-clients.json
- Intake form — collected during /setup

## Harborfields District Consulting
- 3 monthly invoices: Literacy at WDPS | MTSS | Special Education
- Rate: $150/hr (prorated) across all 3 verticals
- PO formats: [Month#]LIT, [Month#]MTSS, [Month#]SpedEd
- District email: wolfl@harborfieldscsd.org
- Day tracking Google Sheet (source of truth): https://docs.google.com/spreadsheets/d/1BInv_snIxbOpSEAHjxxuf0FHw_213pWSIh1o2bDXtok/edit
- Local cache: data/consulting-days.json
- Still needed from Lisa: district contact name, billing contacts per vertical

## Consulting Schedule
- Upcoming sessions: see data/schedule.json

## Gotchas
- Never send email — Gmail drafts only, Lisa sends manually
- Never create GCal events without Lisa's confirmation
- Never delete rows from JSON files without explicit instruction
- Invoice IDs: timestamp format, generated fresh each invoice
- Main agent file: agents/claude.md
- Google Sheet is source of truth for consulting days, not the local JSON

## Business Context
- Brightlings details: knowledge/tutoring-center.md
- Quintessential Travel details: knowledge/travel-agency.md
- Harborfields consulting details: knowledge/harborfields-consulting.md
