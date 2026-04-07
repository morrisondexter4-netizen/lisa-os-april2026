# Skill -- /log-day

**Trigger:** `/log-day [vertical]`

Quick consulting day logging for Harborfields. Records a day (or half day) to the local consulting-days.json file.

---

## Usage
```
/log-day literacy
/log-day mtss
/log-day sped
```

Or natural language: "Log a literacy day", "I worked on MTSS today", "Half day for special education yesterday", "Consulting day today for literacy"

---

## Steps

### 1. Parse the Input

Extract:
- **Vertical** -- one of: literacy, mtss, sped (special education). Accept variations:
  - "literacy", "lit", "wdps" -> literacy
  - "mtss" -> mtss
  - "sped", "special education", "special ed" -> sped
- If vertical is missing or unclear, ask: "Which vertical -- Literacy, MTSS, or Special Education?"

### 2. Ask for Details

> What date? (I will assume today unless you say otherwise.)

Accept: "today", "yesterday", a specific date like "April 3", or "last Tuesday". Default to today if Lisa just says "yes" or does not specify.

> Full day or half day?

Default to full day if Lisa does not specify.

### 3. Log the Day

Add an entry to `data/consulting-days.json`:

```json
{
  "id": "cd-YYYYMMDD-vertical",
  "date": "YYYY-MM-DD",
  "vertical": "literacy|mtss|sped",
  "days": 1 or 0.5,
  "notes": ""
}
```

### 4. Count This Month

After logging, count total days for that vertical this month and total across all verticals.

### 5. Confirm

> Logged [1 day / half day] for [Literacy at WDPS / MTSS / Special Education] on [date].
>
> This month so far:
> - [Vertical]: [N] day(s)
> - Total across all verticals: [N] day(s)

### 6. Offer Next Step

If it is near end of month (after the 25th):

> End of the month is coming up -- want me to start the Harborfields invoices?

Otherwise:

> Anything else to log?

---

## Rules
- Never show file paths, JSON, or technical details.
- Default to today and full day unless told otherwise.
- Accept casual date references ("yesterday", "last Friday", "March 28").
- Show the running monthly total after each log.
- Keep it fast -- this should feel like a 5-second interaction.
- The Google Sheet is the source of truth for actual billing -- this is a local convenience tracker.
