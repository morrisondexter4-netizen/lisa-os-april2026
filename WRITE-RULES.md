# LisaOS Write Rules — What Goes Where
# Read this before writing to ANY context file.

## The Taxonomy

| Content type | File | Limit |
|---|---|---|
| Behavioral rules, routing, approval gates | `CLAUDE.md` | < 50 lines. No state. No IDs. |
| Current state 1-liners, gotchas, pending items | `MEMORY.md` | < 60 lines. Pointers to handoff/. |
| Full client/student state, blockers, next steps | `handoff/[slug].md` | Overwrite each session. Use template. |
| Business context, rates, policies, service types | `knowledge/[name].md` | Accumulates. Read before acting. |
| Exactly where we left off | `session/last-session.md` | < 20 lines. Use template. |
| Actionable flags only | `logs/outputs.md` | Append-only. |

## Rules
- CLAUDE.md: behavioral rules ONLY. Nothing else.
- MEMORY.md: volatile state only. Things that change session to session.
- Handoff files: OVERWRITE (don't append). Latest state is what matters.
- Knowledge files: ACCUMULATE — add, don't overwrite.
- Session file: max 20 lines. Overwrite each session end.
- outputs.md: append-only. Format: [YYYY-MM-DD HH:MM] summary

## The Test
Before writing, ask:
1. Is this a behavioral rule? → CLAUDE.md
2. Is this a 1-liner pointer to something bigger? → MEMORY.md
3. Is this client current state? → handoff/[slug].md
4. Is this business context or policy? → knowledge/
5. Is this where we left off? → session/last-session.md
