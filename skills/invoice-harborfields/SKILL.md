# Skill — /invoice-harborfields

**Trigger:** `/invoice-harborfields [literacy|mtss|sped]`

Generates one of the 3 Harborfields district consulting invoices based on days logged in consulting-days.json. Creates a Gmail draft — never sends.

## Usage
```
/invoice-harborfields literacy
/invoice-harborfields mtss
/invoice-harborfields sped
```

## Steps

### 1. Load context
- Read `knowledge/harborfields-consulting.md` — get rate for the specified vertical, district contact
- Read `data/consulting-days.json` — filter by vertical and current billing month

### 2. Calculate
- Sum consulting days for the vertical this month
- Amount = days × rate (from knowledge file)
- If 0 days logged: report "No [vertical] days logged for [month]. Nothing to invoice."

### 3. Confirm with Lisa
```
Harborfields invoice — [Vertical Name] — [Month YYYY]
Consulting days: [N]
Rate: $[rate]/day
Total: $[amount]
Bill to: [contact from knowledge file]
Generate invoice? (yes/no)
```

### 4. On confirmation
a. Create Gmail draft:
   - To: [district contact from knowledge/harborfields-consulting.md]
   - Subject: `Invoice — Harborfields [Vertical] — [Month YYYY]`
   - Body: professional invoice with Lisa's name, consulting description, days, rate, total, payment instructions

b. Write to `data/invoices.json`:
   ```json
   {
     "id": "hf-[vertical]-[YYYYMMDD]",
     "clientName": "Harborfields",
     "type": "harborfields-[vertical]",
     "vertical": "[literacy|mtss|sped]",
     "amount": [number],
     "days": [number],
     "date": "[YYYY-MM-DD]",
     "month": "[YYYY-MM]",
     "status": "draft",
     "gmailDraftId": "[id from Gmail]"
   }
   ```

c. Report: "Invoice draft ready for Harborfields [Vertical] — $[amount]. Check Gmail to review and send."

## Vertical Display Names
- `literacy` → "Literacy at WDPS"
- `mtss` → "MTSS (Multi-Tiered System of Supports)"
- `sped` → "Special Education"

## Approval Gate
Never send email. Always stop at "draft ready — check Gmail."
Lisa reviews and sends all invoices manually.
