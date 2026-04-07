#!/bin/bash
# LisaOS Startup Hook
# Comprehensive daily briefing for Lisa when she opens Claude Code.

LISA_OS_DIR="$(cd "$(dirname "$0")/.." && pwd)"
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"

# Get day of week and date for greeting
DAY_OF_WEEK=$(date +%A)
MONTH_DAY=$(date +"%B %-d")

# Pick a warm greeting based on day
case "$DAY_OF_WEEK" in
  Monday)    GREETING="Happy Monday, Lisa! Let us start the week strong." ;;
  Tuesday)   GREETING="Good morning, Lisa! Happy Tuesday." ;;
  Wednesday) GREETING="Hey Lisa! Happy hump day." ;;
  Thursday)  GREETING="Good morning, Lisa! Almost Friday." ;;
  Friday)    GREETING="Happy Friday, Lisa! Let us wrap up the week." ;;
  Saturday)  GREETING="Hey Lisa! Working on a Saturday -- let us make it quick." ;;
  Sunday)    GREETING="Hi Lisa! Enjoy the weekend. I am here if you need me." ;;
  *)         GREETING="Hi Lisa! Welcome back." ;;
esac

echo ""
echo "$GREETING"
echo "Today is $DAY_OF_WEEK, $MONTH_DAY."
echo ""

# Count pending items silently
PENDING_INVOICES=0
PENDING_SIGNUPS=0
PIPELINE_TRAVEL=0
SESSIONS_OWED=0
STUDENTS_WITH_SESSIONS=""
STALE_TRAVEL=0

if command -v node &>/dev/null; then
  PENDING_INVOICES=$(node -e "
    try {
      const f = require('$LISA_OS_DIR/data/invoices.json');
      const arr = Array.isArray(f) ? f : [];
      console.log(arr.filter(i => i.status === 'draft').length);
    } catch(e) { console.log(0); }
  " 2>/dev/null || echo 0)

  PENDING_SIGNUPS=$(node -e "
    try {
      const f = require('$LISA_OS_DIR/data/signup-sheet.json');
      const arr = Array.isArray(f) ? f : [];
      console.log(arr.filter(i => i.status === 'pending').length);
    } catch(e) { console.log(0); }
  " 2>/dev/null || echo 0)

  PIPELINE_TRAVEL=$(node -e "
    try {
      const f = require('$LISA_OS_DIR/data/travel-clients.json');
      const c = f.clients || [];
      console.log(c.filter(c => c.status === 'pipeline' || c.nextStep).length);
    } catch(e) { console.log(0); }
  " 2>/dev/null || echo 0)

  SESSIONS_OWED=$(node -e "
    try {
      const f = require('$LISA_OS_DIR/data/students.json');
      const s = f.students || [];
      const withSessions = s.filter(x => x.sessionsOwed > 0);
      console.log(withSessions.length);
    } catch(e) { console.log(0); }
  " 2>/dev/null || echo 0)

  STUDENTS_WITH_SESSIONS=$(node -e "
    try {
      const f = require('$LISA_OS_DIR/data/students.json');
      const s = f.students || [];
      const withSessions = s.filter(x => x.sessionsOwed > 0);
      if (withSessions.length > 0) {
        console.log(withSessions.map(x => x.name + ' (' + x.sessionsOwed + ')').join(', '));
      } else {
        console.log('');
      }
    } catch(e) { console.log(''); }
  " 2>/dev/null || echo "")

  STALE_TRAVEL=$(node -e "
    try {
      const f = require('$LISA_OS_DIR/data/travel-clients.json');
      const c = f.clients || [];
      const now = Date.now();
      const sevenDays = 7 * 24 * 60 * 60 * 1000;
      const stale = c.filter(cl => {
        if (!cl.lastContact) return true;
        return (now - new Date(cl.lastContact).getTime()) > sevenDays;
      });
      console.log(stale.length);
    } catch(e) { console.log(0); }
  " 2>/dev/null || echo 0)

  # Check consulting days logged this month but not invoiced
  CONSULTING_THIS_MONTH=$(node -e "
    try {
      const f = require('$LISA_OS_DIR/data/consulting-days.json');
      const entries = f.entries || [];
      const now = new Date();
      const thisMonth = now.getMonth();
      const thisYear = now.getFullYear();
      const monthEntries = entries.filter(e => {
        const d = new Date(e.date);
        return d.getMonth() === thisMonth && d.getFullYear() === thisYear;
      });
      const totalDays = monthEntries.reduce((sum, e) => sum + (e.days || 0), 0);
      console.log(totalDays);
    } catch(e) { console.log(0); }
  " 2>/dev/null || echo 0)
fi

# Build the briefing
HAS_ITEMS=false

if [ "$PENDING_INVOICES" -gt 0 ] || [ "$PENDING_SIGNUPS" -gt 0 ] || [ "$PIPELINE_TRAVEL" -gt 0 ] || [ "$SESSIONS_OWED" -gt 0 ] || [ "$STALE_TRAVEL" -gt 0 ]; then
  echo "Here is what needs your attention:"
  echo ""
  HAS_ITEMS=true
fi

if [ "$PENDING_INVOICES" -gt 0 ]; then
  echo "  - $PENDING_INVOICES invoice draft(s) waiting for your review in Gmail"
fi

if [ "$SESSIONS_OWED" -gt 0 ]; then
  echo "  - $SESSIONS_OWED student(s) with sessions ready to invoice: $STUDENTS_WITH_SESSIONS"
fi

if [ "$STALE_TRAVEL" -gt 0 ]; then
  echo "  - $STALE_TRAVEL travel client(s) you have not touched in over a week"
fi

if [ "$PIPELINE_TRAVEL" -gt 0 ]; then
  echo "  - $PIPELINE_TRAVEL travel client(s) need follow-up"
fi

if [ "$PENDING_SIGNUPS" -gt 0 ]; then
  echo "  - $PENDING_SIGNUPS new sign-up request(s) to review"
fi

if [ "$CONSULTING_THIS_MONTH" -gt 0 ] 2>/dev/null; then
  echo "  - $CONSULTING_THIS_MONTH consulting day(s) logged this month"
fi

if [ "$HAS_ITEMS" = false ]; then
  echo "Everything looks good -- no pending items right now."
fi

echo ""
echo "Tip: Check your calendar and say /briefing for a full rundown, or /recap for the weekly view."
echo "Try: /help, /students, /add-sessions, /log-day, /schedule"
echo ""
