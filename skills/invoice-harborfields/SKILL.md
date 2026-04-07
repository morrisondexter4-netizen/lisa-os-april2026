# Skill -- /invoice-harborfields

**Trigger:** `/invoice-harborfields [literacy|mtss|sped]`

Generates one of the 3 Harborfields district consulting invoices. Creates a Gmail draft -- never sends.

---

## Usage
```
/invoice-harborfields literacy
/invoice-harborfields mtss
/invoice-harborfields sped
```

Or natural language: "Invoice Harborfields for literacy", "run the MTSS invoice", "bill the district for special ed"

---

## Vertical Names
| Input | Display Name | PO Code |
|---|---|---|
| literacy | Literacy at WDPS | LIT |
| mtss | MTSS (Multi-Tiered System of Supports) | MTSS |
| sped | Special Education | SpedEd |

---

## Steps

### 1. Load Context
- Read `knowledge/harborfields-consulting.md` -- get rate, billing contact for the vertical
- Read `knowledge/invoice-formats.md` -- get the exact invoice format
- Read consulting days from Google Sheet (source of truth): https://docs.google.com/spreadsheets/d/1BInv_snIxbOpSEAHjxxuf0FHw_213pWSIh1o2bDXtok/edit
- If Sheet is not accessible, fall back to `data/consulting-days.json`
- Filter entries by the specified vertical and current billing month

### 2. Calculate
- Sum consulting days for the vertical this month
- Amount = days x $150 (rate from knowledge file)
- Generate PO number: [Month#][VerticalCode] (e.g., 4LIT for April Literacy)
- If 0 days logged: "No [vertical display name] days logged for [Month]. Nothing to invoice."

### 3. Check Billing Contact
- If billing contact is still "TBD": "I do not have a billing contact for [vertical display name] yet. Who should this invoice go to? I need a name and email."
- Collect the contact and update knowledge/harborfields-consulting.md before proceeding

### 4. Confirm with Lisa

> Here is the Harborfields invoice for [Vertical Display Name] -- [Month YYYY]:
>
> Consulting days: [N]
> Rate: $150/day
> Total: $[amount]
> PO number: [Month#][Code]
> Bill to: [contact name]
>
> Should I create this invoice draft?

Wait for Lisa's confirmation.

### 5. Create the Invoice Draft
On confirmation:

a. Create Gmail draft:
   - To: [billing contact email from knowledge file]
   - Subject: Invoice -- Harborfields [Vertical Display Name] -- [Month YYYY]
   - Body: Use the Harborfields District Invoice format from invoice-formats.md

b. Log to `data/invoices.json`:
   ```json
   {
     "id": "hf-[vertical]-[YYYYMMDD]",
     "clientName": "Harborfields",
     "type": "harborfields-[vertical]",
     "vertical": "[literacy|mtss|sped]",
     "amount": [calculated amount],
     "days": [day count],
     "date": "[YYYY-MM-DD]",
     "month": "[YYYY-MM]",
     "status": "draft",
     "gmailDraftId": "[from Gmail response]"
   }
   ```

c. Report:
> Done! Invoice draft ready for Harborfields [Vertical Display Name] -- $[amount] for [N] days.
> PO number: [PO#]. It is in your Gmail drafts.

### 6. Run All Three
If Lisa says "run all Harborfields invoices" or "invoice Harborfields":
1. Calculate all three verticals
2. Show summary of all three with amounts
3. Ask for confirmation
4. On yes: run each vertical one at a time
5. Final report: "All 3 Harborfields invoice drafts are ready in your Gmail."

---

## Approval Gate
Never send email. Always show the amount and PO number before creating.
If billing contact is TBD, collect it first.
