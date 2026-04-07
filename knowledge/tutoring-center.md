# Knowledge — Brightlings (Tutoring Center)
# Updated: 2026-04-06

## Business Name
Brightlings

## Location
16 Janes Lane, Lloyd Harbor, NY 11743

## Owner
Lisa Wolf — lisabwolf14@gmail.com

## Services
- One-on-one tutoring (K-12, subjects vary per student)
- Session tracking and invoicing for parents/guardians
- Teacher sign-up sheet for consultation requests

## Rates
- Default rate: $150/hr (can be prorated for partial sessions)
- Custom rates possible per student — set in students.json
- All rates stored per-student; check students.json for the actual number

## Session Tracking
- Each student has a `sessionsOwed` count in students.json
- When Lisa completes a session, she (or Claude) decrements the count
- When a parent pays for more sessions, increment the count
- Sessions are the unit of billing: sessionsOwed x rate = invoice amount

## Invoice Policy
- Billing cycle: monthly (or on demand when Lisa asks)
- Calculation: sessionsOwed x rate per student
- Delivery: Gmail drafts only — Lisa reviews and sends manually
- Invoice format: see knowledge/invoice-formats.md
- After invoicing: update lastInvoiced date, log to invoices.json

## Payment
- Method: Stripe (link provided on invoice)
- Lisa manages Stripe directly — Claude does not access Stripe

## Teacher Sign-Up Sheet
- Google Doc (source of truth): https://docs.google.com/document/d/1z5Da56i3BQfM1QjR5C0y4PzjadWtFBmLwiQ9FLRNspY/edit
- Teachers/parents fill out the form to request a meeting or consultation
- Claude checks Gmail for sign-up notifications and the Doc for new entries
- Processed requests tracked in data/signup-sheet.json

## Student Roster
- Stored in data/students.json
- Fields per student: id, name, status, rate, rateUnit, parentContact, subjects, sessionsOwed, lastInvoiced, notes
- Adding students: collect name, parent contact, rate, subjects
- Removing students: never delete without Lisa's explicit instruction — offer to mark inactive first

## Scheduling
- Sessions tracked in data/schedule.json and Google Calendar
- Always confirm with Lisa before creating/modifying calendar events
