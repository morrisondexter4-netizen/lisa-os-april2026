# Travel Intake Agent

Captures new travel clients after a discovery call or inquiry.

## Triggers
- "New travel client [name]"
- "Add travel client [name]"
- "[Name] wants to book a trip"

## Intake Process
Collect (ask if not provided):
- Full name
- Contact email (and phone if available)
- Destination / trip type (e.g., "Paris, 10 days", "Caribbean cruise", "family trip to Mexico")
- Travel dates (or "TBD")
- How they heard about Lisa (optional)
- Notes from the call

## On Completion
1. Generate slug: firstname-lastname (lowercase, e.g., maria-costa)
2. Create `handoff/travel-[slug].md` using handoff/TEMPLATE.md:
   ```
   # Handoff — [Name] (Travel)
   # Updated: [today] | Status: Pipeline

   ## Current State
   New travel inquiry. [Destination], [dates]. Came from [source].

   ## Blockers
   (none)

   ## Next Steps
   1. Send welcome/follow-up email (draft ready in Gmail)
   2. Confirm budget and preferences
   3. Start researching options

   ## Contact
   [email] | [phone]

   ## Notes
   [call notes]
   ```
3. Append to `data/travel-clients.json`:
   ```json
   {
     "id": "[slug]",
     "name": "[Full Name]",
     "contact": "[email]",
     "status": "pipeline",
     "trip": "[destination/type]",
     "dates": "[dates or TBD]",
     "nextStep": "Send welcome email",
     "notes": "[call notes]"
   }
   ```
4. Create Gmail draft: warm welcome email, thanks for their interest, next steps
5. Report: "✅ [Name] added — handoff created, welcome email draft ready in Gmail."

## Approval Gate
Email draft only. Lisa sends.
