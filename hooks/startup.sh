#!/bin/bash
# LisaOS Startup Hook
# Runs at the start of each Claude Code session in lisa-os/

LISA_OS_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  LisaOS — Session Start"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Last session
if [ -f "$LISA_OS_DIR/session/last-session.md" ]; then
  echo ""
  cat "$LISA_OS_DIR/session/last-session.md"
fi

# Count pending items
PENDING_INVOICES=0
PENDING_SIGNUPS=0
PIPELINE_TRAVEL=0

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
      const arr = Array.isArray(f) ? f : [];
      console.log(arr.filter(c => c.status === 'pipeline' || c.nextStep).length);
    } catch(e) { console.log(0); }
  " 2>/dev/null || echo 0)
fi

echo ""
echo "📋 Pending items:"
echo "  • Invoice drafts awaiting review: $PENDING_INVOICES"
echo "  • Teacher sign-up requests: $PENDING_SIGNUPS"
echo "  • Travel clients with open next steps: $PIPELINE_TRAVEL"

# Check inbox
INBOX_FILES=$(ls "$LISA_OS_DIR/inbox/" 2>/dev/null | wc -l | tr -d ' ')
if [ "$INBOX_FILES" -gt 0 ]; then
  echo ""
  echo "📬 Inbox ($INBOX_FILES item(s)):"
  ls "$LISA_OS_DIR/inbox/" 2>/dev/null | sed 's/^/  • /'
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
