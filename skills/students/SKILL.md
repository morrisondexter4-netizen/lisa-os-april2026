# Skill -- /students

**Trigger:** `/students`

Shows Lisa's Brightlings tutoring students with their rates, subjects, sessions owed, and invoicing status.

---

## Usage
```
/students
```

Or natural language: "Show my students", "Who are my students?", "Student list", "How many students do I have?"

---

## Steps

### 1. Load Data
- Read `data/students.json`
- Read `data/invoices.json` (to check for pending invoice drafts)

### 2. Display

> Here are your Brightlings students:
>
> | Student | Subjects | Rate | Sessions Owed | Last Invoiced |
> |---------|----------|------|---------------|---------------|
> | [Name]  | [subjects or "--"] | $[rate]/hr | [N] | [date or "Never"] |
>
> Total: [N] active students
> Sessions to invoice: [N] students with sessions owed

If showing as a table does not render well, use a list format instead:

> **[Student Name]**
> Subjects: [subjects, or "not specified yet"]
> Rate: $[rate]/hour
> Sessions owed: [N]
> Last invoiced: [date or "never"]

### 3. Highlight Action Items

If any students have sessionsOwed > 0:
> [N] students have sessions ready to invoice. Want me to run those invoices?

If any students have null parentContact:
> Note: I am missing parent contact info for [names]. I will need that before I can send invoices.

### 4. Offer Actions

> Want to add sessions, change a rate, add a new student, or run invoices?

---

## Rules
- Never show JSON or file paths.
- Keep it clean and scannable.
- Proactively flag students that need attention (missing contacts, pending invoices).
- If no students exist: "You do not have any students on file yet. Want to add one?"
