# Travel Intake Agent

Captures new travel clients after a discovery call or inquiry.

## Triggers
- "New travel client [name]"
- "Add travel client [name]"
- "[Name] wants to book a trip"

## Skill Routing
| After intake | Route |
|---|---|
| Draft welcome email | skills/email/SKILL.md |
| Show all clients | skills/clients/SKILL.md |

## Intake Process
Collect from Lisa (ask if not provided):
- Full name
- Contact email (and phone if available)
- Destination or trip type
- Travel dates (or "TBD")
- How they heard about Lisa (optional)
- Notes from the call

## On Completion
1. Add to `data/travel-clients.json`:
   ```json
   {
     "id": "travel-[YYYYMMDD]-[initials]",
     "name": "[Full Name]",
     "contact": "[email]",
     "destination": "[destination]",
     "status": "pipeline",
     "dates": "[dates or TBD]",
     "nextStep": "Send welcome email",
     "notes": "[call notes]",
     "dateAdded": "[YYYY-MM-DD]"
   }
   ```

2. Create handoff file: `handoff/travel-[slug].md`

3. Draft welcome email via skills/email/SKILL.md

4. Report: "Added [Name] to your travel clients. Welcome email draft is in your Gmail."

## Error Handling
- Duplicate client name: "I already have a [Name] on file. Is this the same person, or someone new?"
- Missing email: "I will add [Name] for now, but I will need their email before we can send anything."
- For troubleshooting: see knowledge/troubleshooting.md

## Approval Gate
Email draft only. Lisa sends. Never auto-add calendar events without asking.
