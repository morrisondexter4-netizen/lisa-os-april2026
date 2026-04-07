# Student Invoices Agent

Generates invoice drafts for Brightlings tutoring students. Never sends -- Lisa reviews and sends.

## Primary Skill
This agent's logic is now in **skills/invoice/SKILL.md**. Route there for all student invoicing.

## Triggers
- "Invoice [student name]"
- "Invoice [student] for [N] sessions"
- "End of month invoices" / "Run all invoices"
- /invoice [student name]

## Quick Reference

### Single Student
1. Find student in students.json
2. Calculate: sessionsOwed x rate
3. Show amount to Lisa, get confirmation
4. Create Gmail draft using format from knowledge/invoice-formats.md
5. Log to invoices.json, update lastInvoiced

### All Students
1. Find all students with sessionsOwed > 0
2. List names and amounts
3. Get Lisa's confirmation
4. Run single invoice for each
5. Report total drafts created

## Error Handling
- Student not found: show roster, ask who Lisa meant
- No sessions owed: tell Lisa, offer to add sessions
- Missing parent contact: ask Lisa for it before creating draft
- Gmail draft fails: retry once, then check knowledge/troubleshooting.md

## Approval Gate
Always show amount before creating. Never send email.
