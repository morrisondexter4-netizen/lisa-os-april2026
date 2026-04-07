# Skill -- /add-sessions

**Trigger:** `/add-sessions [student name] [number]`

Quick session logging for Brightlings tutoring. Updates the student's sessionsOwed count so invoicing stays accurate.

---

## Usage
```
/add-sessions James Anthony 3
/add-sessions Jack Marino 1
```

Or natural language: "Add 3 sessions for James Anthony", "Log 2 sessions for Jack", "Jack had a session today", "James had 3 sessions this week"

If the student name or number is missing, ask for it conversationally.

---

## Steps

### 1. Parse the Input

Extract:
- **Student name** -- can be first name only, last name only, or full name
- **Number of sessions** -- default to 1 if not specified ("Jack had a session" means 1)

### 2. Find the Student

Read `data/students.json` (silently). Match the name:
- Try exact match first (case-insensitive)
- If no exact match, try partial match (first name or last name)
- If multiple matches: "I found more than one match -- did you mean [Name A] or [Name B]?"
- If no match: "I do not have a student named [name] on file. Did you mean one of these? [list all active students]. Or would you like to add a new student?"

### 3. Update Sessions

Add the specified number to the student's `sessionsOwed` field in `data/students.json`.

Calculate the dollar amount: `sessions * rate`

### 4. Confirm

> Got it -- added [N] session(s) for [Student Full Name]. [He/She] now has [total] session(s) to invoice ($[amount]).

If the student already had sessions owed:

> Got it -- added [N] more session(s) for [Student Full Name]. [He/She] now has [total] session(s) to invoice ($[amount]) -- [previous] from before plus [new] new.

### 5. Offer Next Step

> Want me to create the invoice now, or are there more sessions to log?

---

## Rules
- Never show file paths, JSON, or technical details.
- Always confirm the student name before updating -- if there is any ambiguity, ask.
- Show the running total and dollar amount in the confirmation.
- Default to 1 session if no number is given.
- If Lisa says "sessions" without a student name, ask who.
- Keep it fast -- this should feel like a 5-second interaction.
