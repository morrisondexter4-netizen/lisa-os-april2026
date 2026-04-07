# Troubleshooting Guide
# Updated: 2026-04-06

This guide is for when something is not working right. You can also just tell Claude what happened and it will try to fix it.

---

## "My emails are not showing up"

This usually means the Gmail connection needs a refresh.

**Try this first:**
1. Close Claude Code completely (press Cmd+Q or right-click the icon and quit)
2. Wait a few seconds, then reopen Claude Code
3. Open your lisa-os project folder
4. Try asking about your emails again

**If that does not fix it:**
1. In Claude Code, go to Settings (click the gear icon or press Cmd+comma)
2. Look for MCP Servers and find Gmail
3. Click Reconnect or Re-authorize
4. Sign in with lisabwolf14@gmail.com when prompted
5. Try again

---

## "My calendar is not working"

Same fix as email — restart Claude Code first. The calendar reconnects automatically when you reopen.

**If restarting does not help:**
1. Go to Settings in Claude Code
2. Find Google Calendar under MCP Servers
3. Click Reconnect or Re-authorize
4. Sign in with lisabwolf14@gmail.com
5. Try again

---

## "I can not see my spreadsheet" or "The consulting days sheet is not loading"

Your Google Sheet needs to be accessible from your Gmail account.

**Quick check:**
- Make sure the sheet is owned by or shared with lisabwolf14@gmail.com
- If you created it on a different account, open the sheet and share it with your personal Gmail

**If the sheet is just temporarily down:**
- Claude will automatically use the local backup data
- The backup might be slightly behind, but it will get you through

---

## "I got an error" (general)

When you see an error message or something just does not look right:

1. **Try the same thing again** — many errors are temporary glitches that go away on retry
2. **If it happens twice**, restart Claude Code (Cmd+Q, then reopen)
3. **If it keeps happening**, describe what you were trying to do and what went wrong — Claude will help figure it out
4. **If nothing works**, just say "Something is broken, I need Dexter to look at it" and Claude will make a note for the support team

---

## "My invoice did not get created"

**Check these things:**
- Is Gmail connected? Try asking "show me my recent emails" to test
- Does the student or consulting day data exist? Try asking "show my students" or "show consulting days this month"
- Try running the invoice command again — it usually works on a second attempt

---

## "I can not find a draft I just created"

Gmail drafts can take a moment to appear. Try:
1. Wait about 30 seconds
2. Open Gmail in your browser (gmail.com)
3. Click on Drafts in the left sidebar
4. Look for the most recent draft

If it is truly missing, ask Claude to create it again.

---

## "Nothing is loading" or "Claude seems stuck"

1. Close Claude Code completely (Cmd+Q)
2. Wait 10 seconds
3. Reopen Claude Code
4. Open your lisa-os project folder
5. Say "hi" to test the connection

This fixes most issues. The connections to Gmail, Calendar, and other services all refresh when Claude Code restarts.

---

## "I want to start over" or "Reset everything"

You do not need to reset anything. Just tell Claude:
- "Let us start fresh" — Claude will re-read your data and pick up from the current state
- "Run /setup again" — if you want to walk through the full setup process

Your data (students, clients, invoices) is always saved and will not be lost.

---

## Quick Reference

| Problem | First thing to try |
|---|---|
| Email not working | Restart Claude Code |
| Calendar not working | Restart Claude Code |
| Spreadsheet not loading | Check it is shared with lisabwolf14@gmail.com |
| Invoice failed | Try again, then restart if needed |
| Draft missing in Gmail | Wait 30 seconds, check Drafts folder |
| General error | Try again, then restart |
| Still broken after restart | Tell Claude "I need Dexter to look at this" |
