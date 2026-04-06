#!/bin/bash
# LisaOS Setup — run once to verify your system is ready.
# To make executable: chmod +x setup.sh

echo ""
echo "========================================"
echo "  LisaOS Setup"
echo "========================================"
echo ""

echo ">>> Step 1: Connect Gmail MCP"
echo "    Claude connects directly to Lisa's personal Gmail (lisabwolf14@gmail.com)."
echo "    Ensure Gmail MCP is configured and authenticated."
echo ""

echo ">>> Step 2: Set up email forwarding"
echo "    Forward Lisa's other email accounts to lisabwolf14@gmail.com:"
echo "    - lisa.wolf2@fora.travel (Quintessential Travel)"
echo "    - wolfl@harborfieldscsd.org (Harborfields district)"
echo ""

echo ">>> Step 3: Get remaining details from Lisa"
echo "    Still needed:"
echo "    - Harborfields district contact name"
echo "    - Per-student subjects for Brightlings tutoring"
echo "    - Travel client list (for data/travel-clients.json)"
echo "    - Any other Google Docs/Sheets to share"
echo ""

echo ">>> Step 4: Populate student data"
echo "    Open data/students.json and verify Brightlings student records are current."
echo "    Each entry needs: id, name, parentContact, rate, sessionsOwed, lastInvoiced, notes."
echo ""

echo ">>> Step 5: Verify travel-clients.json"
echo "    Open data/travel-clients.json and add real Quintessential Travel client records"
echo "    if Lisa has any active clients to track (Fora handles payments, this is for trip tracking only)."
echo ""

echo "========================================"
echo "  Setup checklist complete."
echo "========================================"
echo ""
