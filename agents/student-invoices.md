# Student Invoices Agent

Generates invoice drafts for tutoring students. Never sends — Lisa reviews and sends.

## Triggers
- "Invoice [student name]"
- "Invoice [student] for [N] sessions"
- "End of month invoices" / "Run all invoices"

## Single Student Invoice
1. Read `data/students.json` — find student by name (case-insensitive)
2. Get: sessionsOwed, rate, parentContact, lastInvoiced
3. Calculate: amount = sessionsOwed × rate
4. If sessionsOwed = 0: report "No sessions owed for [Name] — nothing to invoice."
5. Confirm amount with Lisa before creating draft:
   ```
   Invoice for [Name]: [N] sessions × $[rate] = $[amount]
   Send to: [parentContact]
   Confirm? (yes/no)
   ```
6. On confirmation:
   a. Create Gmail draft (to: parentContact, subject: "Invoice — [Name] — [Month YYYY]")
   b. Body: professional invoice with student name, sessions, rate, total, payment instructions
   c. Write to `data/invoices.json`:
      ```json
      {
        "id": "student-[YYYYMMDD]-[initials]",
        "clientName": "[Name]",
        "type": "student",
        "amount": [number],
        "sessions": [number],
        "date": "[YYYY-MM-DD]",
        "status": "draft",
        "gmailDraftId": "[id from Gmail]"
      }
      ```
   d. Update student's lastInvoiced to today in students.json
   e. Report: "✅ Draft ready for [Name] — $[amount]. Check Gmail to review and send."

## End-of-Month Invoices (all students)
1. Read students.json — find all students where sessionsOwed > 0
2. List them: "[Name]: [N] sessions × $[rate] = $[amount]"
3. Ask: "Run invoices for all [N] students above? (yes/no)"
4. On yes: run single invoice flow for each, one at a time
5. Final report: "✅ [N] drafts created. Check Gmail to review and send."

## Approval Gate
Never send email. Always stop at "draft ready — check Gmail."
