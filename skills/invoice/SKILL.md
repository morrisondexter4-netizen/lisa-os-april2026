# Skill -- /invoice

**Trigger:** `/invoice [student-name]`

Creates a Brightlings tutoring invoice for a specific student. Generates a Gmail draft -- never sends.

---

## Usage
```
/invoice James Anthony
/invoice Timothy Mullen
```

Or natural language: "Invoice James Anthony", "bill Jack Marino", "create invoice for Madelyn"

---

## Steps

### 1. Find the Student
- Read `data/students.json`
- Match the student name (case-insensitive, partial match OK)
- If no match: "I could not find a student by that name. Here are your current students: [list]. Who did you mean?"
- If multiple matches: "I found more than one match: [list]. Which one?"

### 2. Check the Data
- Get: name, rate, sessionsOwed, parentContact, subjects, lastInvoiced
- If sessionsOwed is 0: "There are no sessions to invoice for [Name] right now. Would you like to add some sessions first?"
- If parentContact is null or empty: "I do not have a parent or guardian email for [Name] yet. Who should the invoice go to? I need a name and email address."

### 3. Show Lisa the Amount First
Before creating anything, confirm:

> Here is what I have for [Student Name]:
>
> Sessions: [N]
> Rate: $[rate] per hour
> Total: $[amount]
> Subject(s): [subjects or "Tutoring"]
> Invoice to: [parent name and email]
>
> Should I create this invoice draft?

Wait for Lisa's confirmation.

### 4. Create the Invoice Draft
On confirmation:

a. Read `knowledge/invoice-formats.md` for the exact format

b. Create Gmail draft:
   - To: [parentContact email]
   - Subject: Invoice -- [Student Name] -- [Month YYYY]
   - Body: Use the Brightlings Student Invoice format from invoice-formats.md

c. Log to `data/invoices.json` -- append to the array:
   ```json
   {
     "id": "student-[YYYYMMDD]-[initials]",
     "clientName": "[Student Name]",
     "type": "student",
     "amount": [calculated amount],
     "sessions": [sessionsOwed],
     "date": "[YYYY-MM-DD]",
     "status": "draft",
     "gmailDraftId": "[id from Gmail response]"
   }
   ```

d. Update the student's `lastInvoiced` to today's date in students.json

e. Report to Lisa:
> Done! I created an invoice draft for [Student Name] -- $[amount] for [N] sessions.
> It is in your Gmail drafts. Take a look and send it when you are ready.

### 5. Batch Mode
If Lisa says "invoice all students" or "run all invoices":
1. Read students.json, find all students with sessionsOwed > 0
2. List them with amounts
3. Ask: "Want me to create invoices for all [N] students?"
4. On yes: run the single invoice flow for each, one at a time
5. Final report: "[N] invoice drafts created. They are all in your Gmail drafts."

If no students have sessions owed: "All students are current -- no sessions to invoice right now."

---

## Approval Gate
Never send email. Always stop at "draft ready in Gmail."
Always show the amount before creating the draft.
