# LisaOS Agent Protocol -- Shared Reference
# Updated: 2026-04-06

## Data Paths
STUDENTS     = data/students.json
TRAVEL       = data/travel-clients.json
SCHEDULE     = data/schedule.json
INVOICES     = data/invoices.json
SIGNUP       = data/signup-sheet.json
CONSULTING   = data/consulting-days.json
LOG          = logs/outputs.md

## Gmail Hub
Central email: lisabwolf14@gmail.com (connected via Gmail MCP)
Forwards from:
- lisa.wolf2@fora.travel (Quintessential Travel)
- wolfl@harborfieldscsd.org (Harborfields district)
All drafts created here. Lisa reviews and sends.

## Key Shared Documents
- Harborfields consulting days: https://docs.google.com/spreadsheets/d/1BInv_snIxbOpSEAHjxxuf0FHw_213pWSIh1o2bDXtok/edit
- Teacher sign-up requests: https://docs.google.com/document/d/1z5Da56i3BQfM1QjR5C0y4PzjadWtFBmLwiQ9FLRNspY/edit

## Slash Commands
| Command | Skill File | Description |
|---|---|---|
| /setup | skills/setup/SKILL.md | First-time onboarding and MCP connection |
| /invoice [name] | skills/invoice/SKILL.md | Brightlings student invoice |
| /invoice-harborfields [vertical] | skills/invoice-harborfields/SKILL.md | Harborfields district invoice |
| /email | skills/email/SKILL.md | Draft any email |
| /recap | skills/recap/SKILL.md | Weekly summary |
| /clients | skills/clients/SKILL.md | Travel clients by status |
| /students | skills/students/SKILL.md | Brightlings student roster |
| /schedule | skills/schedule/SKILL.md | Upcoming schedule + calendar |
| /dashboard | skills/dashboard/SKILL.md | Visual dashboard of all three businesses (opens in browser) |
| /help | skills/help/SKILL.md | All commands and examples |

## Approval Gates -- NEVER skip
- Email: create Gmail drafts only. Never send. Report draft is ready.
- Calendar: confirm before creating or editing any Google Calendar event.
- Invoices: show Lisa the draft + amount. Wait for explicit approval.
- Client/student records: never delete without explicit instruction.

## Invoice ID Format
[type]-[YYYYMMDD]-[identifier]
Examples:
- student-20260406-ja (James Anthony)
- hf-literacy-20260406 (Harborfields Literacy)

## Invoice Formats
See knowledge/invoice-formats.md for exact templates.

## Troubleshooting
See knowledge/troubleshooting.md for error handling and self-healing.

## Logging (outputs.md)
[YYYY-MM-DD HH:MM] [agent/skill] summary of what was done

## Handoff File Per Client
File: handoff/[client-slug].md
Use handoff/TEMPLATE.md. Overwrite on each update.

## Session Wrap (5 steps)
1. Update handoff files for any clients touched
2. Write session/last-session.md (max 20 lines)
3. Append summary to logs/outputs.md
4. Update MEMORY.md if volatile state changed
5. Report to Lisa: brief summary of what changed
