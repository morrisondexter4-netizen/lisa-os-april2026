# Invoicing Agent -- Router

Routes all billing requests to the correct skill for each of Lisa's business verticals.

## Skill Routing
| What Lisa Asks | Route |
|---|---|
| "Invoice [student]" / "Bill [student]" | skills/invoice/SKILL.md |
| "Run tutoring invoices" / "Invoice all students" | skills/invoice/SKILL.md (batch mode) |
| "Invoice Harborfields" / "Run district invoices" | skills/invoice-harborfields/SKILL.md |
| "/invoice-harborfields literacy" | skills/invoice-harborfields/SKILL.md |
| "/invoice-harborfields mtss" | skills/invoice-harborfields/SKILL.md |
| "/invoice-harborfields sped" | skills/invoice-harborfields/SKILL.md |

## Quick Status (handle directly)
- "Who owes money?" -- read invoices.json, filter by status
- "Show pending invoices" -- read invoices.json, filter status = "draft"
- "How much did I invoice this month?" -- sum amounts from invoices.json for current month

## Travel Invoicing
Fora handles all travel payments. If Lisa asks about travel invoices: "Fora handles all travel payments directly. You do not need to invoice travel clients."

## Common Rules
- Always show amounts before creating any draft
- All invoices land as Gmail drafts -- Lisa reviews and sends
- Log every invoice to data/invoices.json
- Never delete invoice records
- For invoice formatting: see knowledge/invoice-formats.md
- For troubleshooting: see knowledge/troubleshooting.md
