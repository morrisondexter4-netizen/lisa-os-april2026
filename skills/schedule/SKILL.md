# Skill -- /schedule

**Trigger:** `/schedule`

Shows Lisa's upcoming schedule from both local data and Google Calendar.

---

## Usage
```
/schedule
```

Or natural language: "What is on my schedule?", "What do I have this week?", "Show my calendar", "Am I free on Thursday?"

---

## Steps

### 1. Load Data from Both Sources

**Local schedule:**
- Read `data/schedule.json` -- tutoring sessions, consulting appointments, etc.

**Google Calendar:**
- Use Calendar MCP to fetch events for the next 7 days from lisabwolf14@gmail.com
- If Calendar MCP is not available, note it and show local data only

### 2. Merge and Organize

Combine events from both sources. Sort by date and time. Group by day.

### 3. Display

> Here is your schedule for the next 7 days:
>
> **Monday, April 7**
> - 10:00 AM -- [Event or session name] ([duration])
> - 2:00 PM -- [Event or session name] ([duration])
>
> **Tuesday, April 8**
> - No events scheduled
>
> **Wednesday, April 9**
> - 3:00 PM -- [Event or session name] ([duration])
>
> [Continue for 7 days]

If a day has no events, either skip it or note "No events."

If the entire week is empty:
> Your schedule is clear for the next 7 days. Want to add something?

### 4. Highlight Important Items

Call out anything noteworthy:
- Harborfields consulting days (for day tracking)
- Student tutoring sessions (for session counting)
- Conflicts (overlapping events)

### 5. Offer Actions

> Want to add, reschedule, or cancel anything?

---

## Special Requests

**"Am I free on [day]?"**
- Check both local schedule and Google Calendar for that day
- Report: "You are free on [day]" or "You have [N] things on [day]: [list]"

**"What about next week?"**
- Extend the range to 14 days

---

## Rules
- Never show file paths or technical details.
- Always try Google Calendar first for the most complete picture.
- If Calendar MCP fails, use local data and mention: "I could not reach your calendar right now, so this is from my local records. It might be missing some items."
- Confirm before creating or changing any calendar events.
