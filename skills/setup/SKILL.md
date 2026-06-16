# Skill -- /setup

**Trigger:** `/setup`

Get Lisa up and running fast. The goal is a working assistant in about 5 minutes, not a long questionnaire. Connect the essentials, confirm what is already on file, show her the dashboard, then let her start. Details get filled in naturally as she works, or in an optional deeper dive only if she wants it.

Warm, plain English, zero jargon. Never show file paths, JSON, or code.

---

## Before You Start (idempotency)

Quietly check what is already done:
- `data/students.json` -- students with subjects/parent contacts means Brightlings detail is in
- `knowledge/harborfields-consulting.md` -- billing contacts not "TBD" means Harborfields detail is in
- `data/travel-clients.json` -- any clients means Travel is started
- `.installed-version` matches `VERSION` means setup ran for this version

If it all looks configured already:
> Looks like you are already set up and everything is connected. If anything has changed, just tell me. Or say "show my dashboard" to see where things stand.

Otherwise, run the fast path below. Skip anything already done.

---

## Step 1: Quick welcome (keep it short)

> Hi Lisa! Let us get you set up. This is quick, about 5 minutes. I will connect your email and calendar, double-check your three businesses, and then show you your new dashboard. You can always add more detail later, so we will not slow down for it now. Ready?

Wait for a yes, then keep moving briskly.

---

## Step 2: Connect the essentials (test first, only guide if needed)

Test the connections quietly in the background before saying anything. Do not make Lisa click through steps that already work.

1. **Email (Gmail):** try a quick inbox search.
2. **Calendar:** try listing today's events.
3. **Drive / Sheets** (for the Harborfields tracker) and **Contacts** (for parent emails): test if available. These are nice-to-have, not blockers.

Then report once, in plain English:
> Here is where your connections stand:
> - Email: [working / needs a quick connect]
> - Calendar: [working / needs a quick connect]
> - Spreadsheets and contacts: [working / optional, can add later]

Only for the ones that failed, give the short version:
> To connect [tool]: open Settings in the menu, find [tool] under Connections, click Connect, sign in with lisabwolf14@gmail.com, and click Allow. Then say "try again." Take your time, I am right here.

If something will not connect after a try, do not get stuck:
> No problem, we can finish that one later. It will not stop you from using everything else. I have made a note.

Permissions are already handled for you (the update set them so you are not interrupted by allow popups). You do not need to do anything here.

---

## Step 3: Confirm the three businesses (fast, with smart defaults)

Show what is already on file and just ask Lisa to confirm or correct. One light question per business. Do NOT go student-by-student or vertical-by-vertical here -- that is the optional deep dive.

> Quick gut-check on your three businesses. Tell me if anything is off.
>
> **Brightlings (tutoring):** 6 students on file, all at $150/hr -- James Anthony, Timothy Mullen, Jack Marino, Edward Eighmey, William Eighmey, Madelyn Stojanovic. Still right? Anyone joined or left?
>
> **Quintessential Travel (Fora):** I track your trips and clients. Fora handles the payments, so no invoicing on this side. Sound right?
>
> **Harborfields Consulting:** three monthly invoices, Literacy at WDPS, MTSS, and Special Education, with PO numbers, pulled from your Google Sheet. Good?

Apply any corrections to the data files silently. Keep it to confirmations, not interrogation.

---

## Step 4: Show her the dashboard

Run the dashboard so the setup pays off immediately:
```
node scripts/build-dashboard.mjs
```
(silently -- do not show the command)

> And here is your dashboard, open in your browser now. Everything in one place: your students, your travel clients, your Harborfields days this month, and your invoices. Say "show my dashboard" anytime to refresh it.

---

## Step 5: Mark setup complete

Write the current `VERSION` into `.installed-version` (silently) so the startup hook knows setup is done for this version.

> You are all set and ready to use. You can talk to me in plain English, no commands to memorize. For example: "invoice James Anthony," "log a literacy day," "show my travel clients," or "catch me up."

---

## Step 6: Offer the optional deeper dive (only if she wants it)

> Want to fill in the finer details now, things like parent email addresses, your PO numbers, and your current travel clients? It makes invoices and emails fully hands-off. We can do it now, in a few minutes, or skip it and I will just learn as we go. Totally your call.

If Lisa says skip: stop here, cheerfully. She is fully operational.

If Lisa says yes, go through these conversationally, saving silently as you go. Ask only for what is missing, and let her stop anytime.

**Brightlings detail (per student, only the gaps):**
- Subjects and grade
- Parent/guardian name and email (for invoices)
- Session length and how often they come
- How parents pay (Stripe link, check, etc.)

**Harborfields detail:**
- Main contact and billing contact per vertical
- PO numbers per vertical, and the billing cycle
- Whether half days are tracked, and any district invoice requirements
- Confirm the Google Sheet link is accessible

**Quintessential Travel detail:**
- Any active clients now: name, destination, dates, status (researching / quoting / booked / traveling / completed), next step
- Intake process and how new clients find her

After the deep dive, give a short plain-English summary of what got filled in and what is still open, then refresh the dashboard.

---

## Rules
- Speed and warmth over completeness. A working assistant in 5 minutes beats a perfect one in 30.
- Test connections before asking Lisa to do anything. Never make her set up what already works.
- Confirmations, not interrogations, in the fast path. Save the detailed questions for the optional deep dive.
- If something cannot be done now, note it and move on cheerfully. Never get stuck.
- Idempotent. If run again, skip what is already done and offer the dashboard.
- Never show file paths, JSON, commands, or code.
- Always end the fast path by showing the dashboard. That is the payoff.
- After setup, write `.installed-version` so Lisa is not re-prompted.
