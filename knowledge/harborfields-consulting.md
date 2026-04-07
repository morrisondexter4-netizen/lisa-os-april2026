# Knowledge — Harborfields District Consulting
# Updated: 2026-04-06

## Business Context
Lisa consults for the Harborfields Central School District across three verticals. Each vertical is invoiced separately every month. This is a separate business line from Brightlings tutoring.

## District Contact
- Lisa's district email: wolfl@harborfieldscsd.org (forwards to lisabwolf14@gmail.com)
- District billing contacts: TBD — to be filled during /setup call with Lisa

## Rate
$150/hr across all three verticals (prorated for partial days)

## Consulting Verticals (3 monthly invoices)

### 1. Literacy at WDPS
- Description: Literacy consulting at Washington Drive Primary School
- Rate: $150/hr (prorated)
- PO format: [Month#]LIT (e.g., 4LIT for April)
- Billing contact: TBD

### 2. MTSS (Multi-Tiered System of Supports)
- Description: MTSS framework consulting for the district
- Rate: $150/hr (prorated)
- PO format: [Month#]MTSS (e.g., 4MTSS for April)
- Billing contact: TBD

### 3. Special Education
- Description: Special education consulting and support
- Rate: $150/hr (prorated)
- PO format: [Month#]SpedEd (e.g., 4SpedEd for April)
- Billing contact: TBD

## PO Number Format
- Structure: [MonthNumber][VerticalCode]
- Month number is 1-12 (January = 1, December = 12)
- Codes: LIT, MTSS, SpedEd
- Examples: 4LIT (April Literacy), 5MTSS (May MTSS), 12SpedEd (December Special Education)

## Day Tracking
- Google Sheet (source of truth): https://docs.google.com/spreadsheets/d/1BInv_snIxbOpSEAHjxxuf0FHw_213pWSIh1o2bDXtok/edit
- Owned by: lisabwolf14@gmail.com
- Local cache/fallback: data/consulting-days.json
- Each entry: date, vertical (literacy/mtss/sped), days or hours, notes
- When logging: update both Google Sheet and local JSON
- When reading: prefer Google Sheet, fall back to JSON if Sheet is inaccessible

## Invoice Policy
- Billing cycle: monthly
- Calculation: consulting days x rate, per vertical
- 3 separate invoices generated each month (one per vertical)
- Delivery: Gmail drafts only — Lisa reviews and sends
- Invoice format: see knowledge/invoice-formats.md
- After invoicing: log to invoices.json with vertical field

## Invoice Generation
- Use /invoice-harborfields [literacy|mtss|sped] for individual verticals
- Use "run Harborfields invoices" to generate all 3 at once
- Always show day count and amount before generating — Lisa approves first
