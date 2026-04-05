#!/bin/bash
# LisaOS Setup — run once to verify your system is ready.
# To make executable: chmod +x setup.sh

echo ""
echo "========================================"
echo "  LisaOS Setup"
echo "========================================"
echo ""

echo ">>> Step 1: Create Motive Gmail account"
echo "    Create lisa@motive-os.com in Google Workspace (motive-os.com domain)."
echo "    This is the agent's primary email account."
echo ""

echo ">>> Step 2: Set up email forwarding"
echo "    Forward Lisa's 3 email accounts to lisa@motive-os.com:"
echo "    - lisabwolf14@gmail.com (Brightlings / personal)"
echo "    - lisa.wolf2@fora.travel (Quintessential Travel)"
echo "    - wolfl@harborfieldscsd.org (Harborfields district)"
echo ""

echo ">>> Step 3: Share Google Docs/Sheets with Motive Gmail"
echo "    Share the following with lisa@motive-os.com:"
echo "    - Harborfields consulting days Google Sheet:"
echo "      https://docs.google.com/spreadsheets/d/1BInv_snIxbOpSEAHjxxuf0FHw_213pWSIh1o2bDXtok/edit"
echo "    - Teacher sign-up Google Doc:"
echo "      https://docs.google.com/document/d/1z5Da56i3BQfM1QjR5C0y4PzjadWtFBmLwiQ9FLRNspY/edit"
echo "    - Share any other Google Docs/Sheets Lisa uses with this email"
echo ""

echo ">>> Step 4: Get remaining details from Lisa"
echo "    Still needed:"
echo "    - Harborfields district contact name"
echo "    - Per-student subjects for Brightlings tutoring"
echo "    - Travel client list (for data/travel-clients.json)"
echo "    - Any other Google Docs/Sheets to share"
echo ""

echo ">>> Step 5: Populate student data"
echo "    Open data/students.json and verify Brightlings student records are current."
echo "    Each entry needs: id, name, parentContact, rate, sessionsOwed, lastInvoiced, notes."
echo ""

echo ">>> Step 6: Verify travel-clients.json"
echo "    Open data/travel-clients.json and add real Quintessential Travel client records"
echo "    if Lisa has any active clients to track (Fora handles payments, this is for trip tracking only)."
echo ""

echo "========================================"
echo "  Setup checklist complete."
echo "========================================"
echo ""
