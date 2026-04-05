# LisaOS Agent Protocol — Shared Reference

## Paths
STUDENTS     = lisa-os/data/students.json
TRAVEL       = lisa-os/data/travel-clients.json
SCHEDULE     = lisa-os/data/schedule.json
INVOICES     = lisa-os/data/invoices.json
SIGNUP       = lisa-os/data/signup-sheet.json
LOG          = lisa-os/logs/outputs.md

## Google Workspace (Motive Gmail)
The agent operates from a dedicated Google Workspace account:
- Motive Gmail: lisa@motive-os.com
- Lisa's personal emails forward here so the agent has full visibility:
  - lisabwolf14@gmail.com (Brightlings / personal)
  - lisa.wolf2@fora.travel (Quintessential Travel)
  - wolfl@harborfieldscsd.org (Harborfields district)
- Google Sheets and Docs shared with lisa@motive-os.com for live data access

### Key Shared Documents
- Harborfields consulting days: https://docs.google.com/spreadsheets/d/1BInv_snIxbOpSEAHjxxuf0FHw_213pWSIh1o2bDXtok/edit
- Teacher sign-up requests: https://docs.google.com/document/d/1z5Da56i3BQfM1QjR5C0y4PzjadWtFBmLwiQ9FLRNspY/edit
- (More docs will be added as Lisa shares them)

## Approval Gates — NEVER skip
- Email: create Gmail drafts only. Never send. Report draft is ready.
- Calendar: confirm before creating or editing any Google Calendar event.
- Invoices: show Lisa the draft + amount. Wait for explicit approval.
- Client/student records: never delete without explicit "delete [name]" instruction.

## Invoice ID Format
Use timestamp-based ID: [type]-[YYYYMMDD]-[initials]
Example: student-20260330-sm (Sarah M.), travel-20260330-jb (John B.)

## Logging (outputs.md)
[YYYY-MM-DD HH:MM] [agent] summary of what was done

## Handoff File Per Client
File: handoff/[client-slug].md
Slug format: firstname-lastname (e.g., sarah-miller, maria-costa)
Overwrite on each update. Use handoff/TEMPLATE.md.

## Session Wrap (5 steps)
1. Update handoff files for any clients touched this session
2. Write session/last-session.md (max 20 lines)
3. Append summary to logs/outputs.md
4. Update MEMORY.md if any volatile state changed
5. Report: "Session wrapped. Here's what changed: [list]"
