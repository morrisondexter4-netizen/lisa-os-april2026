# Skill -- /briefing

**Trigger:** `/briefing`

On-demand deep briefing -- a comprehensive rundown of everything Lisa needs to know right now. More detailed than the startup greeting. This is the "catch me up on everything" command.

---

## Usage
```
/briefing
```

Or natural language: "Briefing", "Catch me up", "What do I need to know?", "Give me the rundown", "What is going on?", "Brief me"

---

## Steps

### 1. Gather Everything (silently)

Read ALL of the following -- do not show file names to Lisa:

- `data/students.json` -- check sessionsOwed for each student
- `data/invoices.json` -- pending drafts, recent invoices, amounts
- `data/travel-clients.json` -- all clients, statuses, lastContact dates
- `data/consulting-days.json` -- days logged this month and last month
- `data/signup-sheet.json` -- pending sign-up requests
- `data/schedule.json` -- upcoming sessions
- `logs/outputs.md` -- recent activity
- Google Calendar -- events for the full week ahead (via Calendar MCP)
- Gmail -- search for draft invoices and any unread important emails (via Gmail MCP)

### 2. Build the Briefing

Present everything in a warm, thorough, plain-English format:

> Here is your full briefing:
>
> ---
>
> **Your Week Ahead (Calendar)**
> - [List all calendar events for the next 7 days, grouped by day]
> - [Include tutoring sessions, meetings, consulting days, travel-related events]
> - [If nothing is scheduled: "Your calendar is clear this week."]
>
> ---
>
> **Invoicing**
> - Draft invoices waiting for review: [N] ([list with amounts if any])
> - Unpaid invoices outstanding: [N] ([list with amounts and who owes])
> - [If none: "No pending invoices."]
>
> ---
>
> **Brightlings (Tutoring)**
> - [N] active students
> - Students with sessions to invoice:
>   - [Student Name] -- [N] sessions ($[amount])
>   - [Student Name] -- [N] sessions ($[amount])
>   - [Or "All students are billed up to date."]
> - New sign-up requests: [N] pending (or "none")
>
> ---
>
> **Harborfields (Consulting)**
> - Days logged this month: [N] total
>   - Literacy: [N] days
>   - MTSS: [N] days
>   - Special Education: [N] days
> - Days logged last month: [N] total (for comparison)
> - Monthly invoice status: [created / pending / not yet due]
> - [Flag any days logged but not yet invoiced]
>
> ---
>
> **Quintessential Travel**
> - [N] active travel clients
> - By status:
>   - Planning: [list names]
>   - Booked: [list names]
>   - Traveling now: [list names]
> - Needs attention (no contact in 7+ days):
>   - [Client Name] -- last contact [date], [status]
>   - [Or "All clients are up to date."]
> - New inquiries: [N] (or "none")
>
> ---
>
> **Suggested Next Steps**
> - [Prioritized list of 3-5 things Lisa should tackle]
> - [Examples: "Invoice James Anthony for 3 sessions", "Follow up with [travel client]", "Review the draft invoice in Gmail", "Log your consulting days for this week"]
>
> ---
>
> What would you like to tackle first?

### 3. Be Ready for Follow-Up

After the briefing, Lisa may want to:
- Dive deeper into one section ("Tell me more about the travel clients")
- Take action ("Invoice James Anthony")
- Ask a question ("When did I last invoice Harborfields?")

Handle these naturally without making her re-ask.

---

## Rules
- Never show file paths, JSON, or technical details.
- Keep it scannable -- use bullet points, bold headings, and clear grouping.
- If a section has nothing to report, say so briefly and move on.
- Calendar events come from Google Calendar MCP, not just local schedule.json.
- Gmail drafts come from Gmail MCP.
- Always end with suggested next steps -- make them specific and actionable.
- This is a read-only summary -- do not make changes unless Lisa asks.
- Flag stale items prominently -- anything older than 7 days with no activity.
- Show dollar amounts when possible so Lisa can see the financial picture.
