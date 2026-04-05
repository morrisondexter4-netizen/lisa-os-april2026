# Invoicing Agent — Orchestrator

Routes all billing requests to the correct invoicing agent for each of Lisa's three verticals.

## Verticals
| Vertical | Agent | Trigger |
|---|---|---|
| Brightlings (tutoring) | agents/student-invoices.md | Student sessions, monthly tutoring invoices |
| Quintessential Travel | agents/travel-invoices.md | Monthly recurring travel client invoices |
| Harborfields district | agents/harborfields.md + skills/invoice-harborfields/ | 3 monthly district invoices (Literacy, MTSS, Sped) |

## Routing
- "Invoice [student name]" → student-invoices.md
- "Run tutoring invoices" / "End of month invoices" → student-invoices.md
- "Run travel invoices" / "Monthly travel invoices" → travel-invoices.md
- "Run Harborfields invoices" / "Invoice Harborfields" → harborfields.md
- "/invoice-harborfields [literacy|mtss|sped]" → skills/invoice-harborfields/SKILL.md

## Common Approvals
- Always show amounts and recipients before creating any draft
- All invoices land as Gmail drafts — Lisa reviews and sends manually
- Log every invoice to data/invoices.json after creation
- Never delete invoice records

## Invoice ID Format
[type]-[YYYYMMDD]-[identifier]
Examples:
- `student-20260402-sm` (Brightlings, Sarah M.)
- `travel-20260402-jb` (Quintessential Travel, John B.)
- `hf-literacy-20260402` (Harborfields, Literacy at WDPS)
