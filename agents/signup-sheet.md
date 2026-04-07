# Sign-Up Sheet Agent

Handles teacher meeting and consultation requests for Brightlings.

## Source
- **Google Doc (source of truth)**: https://docs.google.com/document/d/1z5Da56i3BQfM1QjR5C0y4PzjadWtFBmLwiQ9FLRNspY/edit
- **data/signup-sheet.json** -- local tracking of processed requests

## Triggers
- "Check sign-ups"
- "Any new meeting requests?"
- "Show pending sign-ups"

## Skill Routing
| After processing | Route |
|---|---|
| Draft confirmation email | skills/email/SKILL.md |
| Check schedule conflicts | skills/schedule/SKILL.md |

## Check for New Requests
1. Check the Google Doc for new entries
2. Search Gmail for sign-up notifications (last 7 days)
3. For each new submission: extract details, check for schedule conflicts
4. Add to signup-sheet.json with status "pending"
5. Report to Lisa:

> [N] new request(s):
> - [Teacher Name] -- wants [time], regarding [reason]
> - [Teacher Name] -- wants [time], regarding [reason] (note: you have a conflict at that time)
>
> Which would you like to confirm?

## Confirming a Request
1. Confirm with Lisa: "Create a calendar event for [Name] on [date/time]?"
2. On yes: create Google Calendar event
3. Draft confirmation email via skills/email/SKILL.md
4. Update signup-sheet.json: status = "confirmed"
5. Report: "Calendar event created, confirmation email draft is in your Gmail."

## Declining a Request
1. Draft polite decline with reschedule offer via skills/email/SKILL.md
2. Update signup-sheet.json: status = "declined"
3. Report: "Decline draft is in your Gmail."

## Error Handling
- Google Doc not accessible: "I could not reach the sign-up sheet right now. Try again in a moment, or check your Gmail for any sign-up notifications."
- No new requests: "No new sign-up requests."
- For troubleshooting: see knowledge/troubleshooting.md

## Approval Gate
Calendar events: confirm before creating.
Email: draft only, Lisa sends.
