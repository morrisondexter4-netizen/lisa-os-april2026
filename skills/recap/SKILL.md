# Skill -- /recap

**Trigger:** `/recap`

Weekly health check -- summarizes everything across all three businesses and flags anything that needs attention. This is the "are we on track?" command.

---

## Usage
```
/recap
```

Or natural language: "Give me a recap", "What happened this week?", "Catch me up", "Weekly summary", "How are things looking?"

---

## Steps

### 1. Gather Data

Read the following (silently -- do not show file names to Lisa):

- `data/invoices.json` -- recent invoices, pending drafts, unpaid amounts
- `data/travel-clients.json` -- active clients, pipeline items, lastContact dates
- `data/consulting-days.json` -- consulting days logged this month
- `data/students.json` -- check sessionsOwed for pending invoicing
- `data/schedule.json` -- upcoming sessions
- `data/signup-sheet.json` -- pending sign-up requests
- `logs/outputs.md` -- recent activity
- Google Calendar -- upcoming events for the next 7 days (via Calendar MCP)
- Gmail -- check for draft invoices (via Gmail MCP)

### 2. Build the Recap

Present everything in a warm, plain-English summary. Structure it like this:

> Here is your weekly recap:
>
> ---
>
> **Brightlings (Tutoring)**
> - [N] students active
> - Students with sessions to invoice:
>   - [Student Name] -- [N] sessions ($[amount])
>   - [Student Name] -- [N] sessions ($[amount])
>   - [Or "Everyone is billed up to date."]
> - [N] invoices created this week (list if any, with amounts)
> - New sign-up requests: [N] pending (or "none")
>
> ---
>
> **Harborfields (Consulting)**
> - [N] consulting days logged this month so far
>   - Literacy: [N] days
>   - MTSS: [N] days
>   - Special Education: [N] days
> - Days logged but not yet invoiced: [N] (flag if end of month is approaching)
> - Monthly invoices: [sent/pending/not yet due]
>
> ---
>
> **Quintessential Travel**
> - [N] active travel clients
> - By status:
>   - Planning: [names]
>   - Booked: [names]
>   - Traveling: [names]
> - Needs follow-up (no contact in 7+ days):
>   - [Client Name] -- last touched [date], next step: [what]
>   - [Or "All clients are up to date."]
> - New inquiries: [N] (or "none this week")
>
> ---
>
> **Coming Up This Week**
> - [List upcoming calendar events, sessions, deadlines]
> - [Or "Nothing scheduled -- your week is open"]
>
> ---
>
> **Action Items**
> 1. [Most important -- specific and actionable]
> 2. [Second priority]
> 3. [Third priority]
> - [Or "You are all caught up!"]
>
> ---
>
> **Money Snapshot**
> - Unbilled tutoring sessions: $[total across all students]
> - Pending invoice drafts: $[total]
> - Consulting days this month (not yet invoiced): [N] days (~$[estimate])

### 3. Offer Next Steps

After the recap:

> What would you like to tackle? I can start with any of those action items, or dig deeper into any section.

---

## Rules
- Never show file paths, JSON, or technical details.
- Keep it scannable -- use bullet points and bold headings.
- If a section has nothing to report, say so briefly and move on.
- Calendar events come from Google Calendar MCP, not just the local schedule.json.
- This is a read-only summary -- do not make changes unless Lisa asks.
- Flag unbilled sessions by student name and dollar amount -- this is the key health metric.
- Flag stale travel clients (no activity in 7+ days) prominently.
- Flag consulting days logged but not invoiced, especially near end of month.
- The money snapshot at the end helps Lisa see the full financial picture at a glance.
- Always end with prioritized, specific action items.
