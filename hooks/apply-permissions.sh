#!/bin/bash
# LisaOS -- apply Claude Code permission settings (idempotent).
# Writes/merges .claude/settings.json so Lisa is not prompted to approve
# routine actions (saving an invoice, reading her data, running the briefing).
# Preserves any existing settings on the machine (e.g. hooks wiring).
# Safe to run any number of times.

set -e
DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$DIR"
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"
mkdir -p .claude

node -e '
const fs = require("fs"), p = ".claude/settings.json";
let s = {};
try { s = JSON.parse(fs.readFileSync(p, "utf8")); } catch (e) {}
s.permissions = {
  ...(s.permissions || {}),
  defaultMode: "acceptEdits",
  allow: [
    "Read", "Glob", "Grep", "Edit", "Write",
    "Bash(node:*)", "Bash(date)", "Bash(date:*)", "Bash(cat:*)",
    "Bash(ls:*)", "Bash(echo:*)", "Bash(pwd)", "Bash(test:*)",
    "Bash(command -v:*)",
    "Bash(git pull:*)", "Bash(bash hooks/apply-permissions.sh)",
    "Bash(cp VERSION .installed-version)"
  ],
  deny: [
    "Bash(rm:*)", "Bash(sudo:*)", "Bash(curl:*)", "Bash(wget:*)",
    "Bash(git push:*)", "Bash(git commit:*)", "Bash(git reset:*)"
  ]
};
fs.writeFileSync(p, JSON.stringify(s, null, 2) + "\n");
console.log("Permissions applied.");
'
