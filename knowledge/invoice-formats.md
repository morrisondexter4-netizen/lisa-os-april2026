# Knowledge — Invoice Formats
# Updated: 2026-04-06

## General Rules
- All invoices are Gmail drafts — never sent automatically
- Lisa reviews every invoice before sending
- Invoice IDs generated fresh each time: [type]-[YYYYMMDD]-[identifier]
- All invoices logged to data/invoices.json after creation
- Always show Lisa the amount and recipient before creating the draft

---

## Brightlings Student Invoice

**Subject:** Invoice -- [Student Name] -- [Month YYYY]

**Body:**

```
INVOICE

From: Lisa Wolf / Brightlings
16 Janes Lane, Lloyd Harbor, NY 11743
lisabwolf14@gmail.com

To: [Parent/Guardian Name]
[Parent Email]

Date: [Month Day, Year]
Invoice #: student-[YYYYMMDD]-[initials]

---------------------------------------------

Student: [Student Name]
Subject(s): [subjects from students.json, or "Tutoring" if not specified]
Period: [Month YYYY]

Sessions: [N]
Rate: $[rate]/hour
Total Due: $[amount]

---------------------------------------------

Payment: Please remit via Stripe at the link below.
[Stripe payment link if available]

Thank you for choosing Brightlings!
Please do not hesitate to reach out with any questions.

Warmly,
Lisa Wolf
Brightlings
16 Janes Lane, Lloyd Harbor, NY 11743
```

**Data flow:**
- sessionsOwed from students.json determines the session count
- Rate from students.json (default $150/hr)
- If no parentContact: skip the "To" section and flag to Lisa before creating draft
- After creating draft: set lastInvoiced to today in students.json, log to invoices.json

---

## Harborfields District Invoice

**Subject:** Invoice -- Harborfields [Vertical Display Name] -- [Month YYYY]

**Body:**

```
INVOICE

From: Lisa Wolf
16 Janes Lane, Lloyd Harbor, NY 11743
wolfl@harborfieldscsd.org

To: [Billing Contact Name]
Harborfields Central School District

Date: [Month Day, Year]
Invoice #: hf-[vertical]-[YYYYMMDD]
PO #: [Month#][VerticalCode]

---------------------------------------------

Service: [Vertical Display Name] Consulting
Period: [Month YYYY]

Consulting Days: [N]
Rate: $150/day
Total Due: $[amount]

---------------------------------------------

Please remit payment to:
Lisa Wolf
16 Janes Lane, Lloyd Harbor, NY 11743

Thank you.

Lisa Wolf
```

**Vertical display names:**
- literacy -> "Literacy at WDPS"
- mtss -> "MTSS (Multi-Tiered System of Supports)"
- sped -> "Special Education"

**PO number format:**
- [Month number][VerticalCode]
- April Literacy: 4LIT
- April MTSS: 4MTSS
- April Special Education: 4SpedEd
- May Literacy: 5LIT (and so on)

**Data flow:**
- Days come from Google Sheet (source of truth) or data/consulting-days.json (fallback)
- If billing contact is still TBD: flag to Lisa, do not create the draft
- After creating draft: log to invoices.json with vertical field

---

## Invoice JSON Schema

All invoices written to data/invoices.json:

**Student invoice entry:**
```json
{
  "id": "student-[YYYYMMDD]-[initials]",
  "clientName": "[Student Name]",
  "type": "student",
  "amount": 0,
  "sessions": 0,
  "date": "[YYYY-MM-DD]",
  "status": "draft",
  "gmailDraftId": "[from Gmail]"
}
```

**Harborfields invoice entry:**
```json
{
  "id": "hf-[vertical]-[YYYYMMDD]",
  "clientName": "Harborfields",
  "type": "harborfields-[vertical]",
  "vertical": "[literacy|mtss|sped]",
  "amount": 0,
  "days": 0,
  "date": "[YYYY-MM-DD]",
  "month": "[YYYY-MM]",
  "status": "draft",
  "gmailDraftId": "[from Gmail]"
}
```
