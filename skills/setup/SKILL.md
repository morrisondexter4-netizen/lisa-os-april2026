# Skill — /setup

**Trigger:** `/setup`

First-time onboarding — walks Lisa through connecting her email, sharing documents, and getting all her business information configured. Conversational, warm, zero jargon.

## Idempotency

Before starting, check what's already done:
- Read `data/students.json` — if students have subjects filled in, Phase 3 Brightlings is done
- Read `knowledge/harborfields-consulting.md` — if billing contacts are filled (not "TBD"), Phase 3 Harborfields is done
- Read `data/travel-clients.json` — if clients array is not empty, Phase 3 Travel is done
- Read `MEMORY.md` — check for "setup complete" marker

If everything is already populated, say:
"Looks like we've already been through setup! Everything's configured. If you want to update anything, just tell me what's changed."

If only some phases are done, skip completed ones and pick up where we left off. Tell Lisa: "We got partway through setup last time — let me pick up where we left off."

---

## Phase 1: Welcome

Greet Lisa warmly. This is day one — you're the new assistant getting oriented.

Say something like:

> Hi Lisa! I'm your AI assistant — think of me as a chief of staff for your businesses. I'm here to help you manage:
>
> - **Brightlings** — tracking students, creating invoices, handling sign-up requests
> - **Harborfields consulting** — logging your consulting days and generating monthly invoices for each vertical
> - **Quintessential Travel** — keeping track of your travel clients and trip details
>
> Everything works through conversation — just tell me what you need in plain English and I'll take care of it.
>
> Let's get me set up so I have everything I need. Ready?

Wait for Lisa's response before continuing.

---

## Phase 2: Email Setup

Explain the concept simply:

> First, let's connect your email. I connect directly to your personal Gmail (lisabwolf14@gmail.com), so I can already see everything that comes in there. We just need to set up forwarding from your other two accounts so everything flows into one place.
>
> There are two accounts to connect:

Then walk through each one, **one at a time**:

### 2a. Fora Travel (lisa.wolf2@fora.travel)

> **Your Fora email (lisa.wolf2@fora.travel)** — for Quintessential Travel.
>
> This one depends on how Fora has their email set up. Try the same forwarding steps as Gmail — if it's a Google account, it'll work the same way. If not, you may need to check with Fora's support team about setting up a forwarding rule to **lisabwolf14@gmail.com**.
>
> Want to try it now or save it for later?

If Lisa can't do it now, say: "No problem — I'll add that to our to-do list and we can set it up next time." Record it as a TODO.

### 2b. District email (wolfl@harborfieldscsd.org)

> **Your Harborfields email (wolfl@harborfieldscsd.org)** — for district consulting.
>
> School district email systems are often locked down, so forwarding might need IT approval. If you can, try setting up a forwarding rule to **lisabwolf14@gmail.com**. If it doesn't let you, we can check with the district's IT department.
>
> Want to try it now or save it for later?

Same TODO handling if deferred.

After both, summarize: "Great — [N connected / N saved for later]. Let's move on to the next step."

---

## Phase 3: Fill in the Gaps

This is conversational Q&A. Ask about one business at a time. Wait for Lisa's answers before moving to the next business. Do NOT dump all questions at once.

### 3a. Brightlings (Tutoring)

> Now let me make sure I have the right info for each of your businesses. Let's start with Brightlings.
>
> I already have your 6 students on file: James Anthony, Timothy Mullen, Jack Marino, Edward Eighmey, William Eighmey, and Madelyn Stojanovic — all at $150/hour. Is that still correct? Anyone to add or remove?

Wait for answer. Then:

> What subjects does each student work on? This helps me when I prepare invoices or session notes.

Wait for answer. Then:

> How do you currently schedule sessions — is there a calendar or sheet I should know about?

Wait for answer. Then:

> Who's the parent or guardian I should contact for each student? I'll need a name and email for invoicing.

Wait for answer. Then:

> Do you use any kind of billing hub or form for tracking student billing? If you have one, I can work with it so nothing falls through the cracks.

Wait for answer.

### 3b. Harborfields (District Consulting)

> Let's move to Harborfields. I know you consult for the district across three areas — Literacy at WDPS, MTSS, and Special Education — all at $150/hour. Is that right?

Wait for answer. Then:

> Who should the invoices be addressed to at the district? I need a contact name and email for each of the three areas, or one main contact if they all go to the same person.

Wait for answer. Then:

> I have your consulting days spreadsheet. Is there anything about how you track days that I should know — like how you mark half days, or any days that shouldn't be billed?

Wait for answer.

### 3c. Quintessential Travel

> Last one — your travel business. Do you have active clients right now? If so, can you tell me their names, where they're traveling, and what stage they're at — like planning, booked, traveling, or completed?

Wait for answer. Then:

> Since Fora handles all the payments, is there anything else you need me to track for travel — like follow-up dates, document deadlines, or client preferences?

Wait for answer. Then:

> Do you use an intake form when new travel clients reach out? If you have one you like, I can help keep track of submissions or remind you to send it.

Wait for answer.

---

## Phase 4: Populate Everything

After getting Lisa's answers, update all the data files silently. Do NOT show file paths, JSON, or technical details. Just confirm what you did.

### Updates to make:

1. **data/students.json** — Add subject fields and any notes Lisa provided for each student. Add or remove students as needed. Keep existing schema (id, name, status, rate, rateUnit, parentContact, notes). Add a `subjects` field (array of strings) to each student. Fill in `parentContact` with the parent/guardian name and email Lisa provided (as a string, e.g. "Jane Anthony, jane@email.com"). If Lisa didn't provide one for a student, leave it as `null`.

2. **knowledge/harborfields-consulting.md** — Fill in the "TBD" billing contacts with the names and emails Lisa provided. Accumulate — don't overwrite other content.

3. **data/travel-clients.json** — Add any active travel clients Lisa described. Schema for each client:
   ```json
   {
     "id": "travel-[YYYYMMDD]-[initials]",
     "name": "[client name]",
     "destination": "[destination]",
     "status": "[planning|booked|traveling|completed]",
     "notes": "[any details Lisa provided]",
     "nextStep": "[if any]",
     "dateAdded": "[YYYY-MM-DD]"
   }
   ```

4. **knowledge/travel-agency.md** — Add any new details Lisa shared about her travel business.

5. **knowledge/tutoring-center.md** — Add any new details about scheduling, subjects taught, etc.

6. **MEMORY.md** — Add a line: `- Setup completed: [YYYY-MM-DD]. All businesses configured.` Update any changed details (new students, contacts filled in, etc.). Follow WRITE-RULES.md — volatile state only, pointers to handoff files.

7. **agents/PROTOCOL.md** — If Lisa shared any new Google Docs/Sheets, add them to the Key Shared Documents section.

After all updates, tell Lisa:

> All right, I've saved everything you told me. Let me give you a summary.

---

## Phase 5: Verification

Summarize everything back to Lisa in plain English. No file paths, no JSON, no technical details.

Structure it like this:

> **Here's what I know about your businesses now:**
>
> **Brightlings (Tutoring)**
> - [N] active students: [list names]
> - Subjects: [student → subject for each]
> - Rate: $150/hour for all
> - Scheduling: [whatever Lisa described]
>
> **Harborfields (District Consulting)**
> - Three verticals: Literacy at WDPS, MTSS, Special Education
> - Rate: $150/hour across all three
> - Invoices go to: [contact names/emails Lisa provided]
> - Day tracking: connected to your Google Sheet
>
> **Quintessential Travel**
> - [N] active clients: [list with destinations and status]
> - Fora handles payments — I'll track clients and trip details
>
> **What I can help you with:**
> - Create and send invoices (tutoring + Harborfields)
> - Track your consulting days
> - Manage travel client details
> - Handle teacher sign-up requests
> - Answer questions about your businesses anytime
>
> **Still pending:**
> - [List any TODOs from email forwarding or doc sharing that weren't completed]
>
> Does everything look right? Anything I'm missing?

Wait for Lisa's response. If she has corrections, make them immediately (update the relevant files) and confirm.

---

## Phase 6: What's Next

Once Lisa confirms everything looks good:

> Perfect — you're all set! Here are some things you can ask me anytime:
>
> - **"Invoice James Anthony"** — I'll create a draft invoice for his sessions
> - **"How many consulting days this month?"** — I'll check your spreadsheet
> - **"Add a new student"** — I'll walk you through it
> - **"Show me my travel clients"** — I'll list your active trips
> - **"Run my Harborfields invoices for April"** — I'll generate all 3 district invoices
> - **"Who owes me money?"** — I'll check for any unpaid invoices
>
> You don't need to remember any special commands — just talk to me like you would a real assistant and I'll figure out what you need.
>
> Welcome aboard, Lisa. I'm here whenever you need me.

---

## Rules for This Skill

- **WARM tone throughout.** Lisa is not technical. Think "friendly new hire on day one."
- **Never show file paths, JSON structures, or technical details.** Everything is translated to plain English.
- **One phase at a time.** Wait for Lisa's response before advancing.
- **One business at a time in Phase 4.** Don't dump all questions at once.
- **Don't block on anything.** If Lisa can't do something right now (forwarding, sharing, answering a question), mark it as a TODO and move on gracefully.
- **Confirmation before data changes.** In Phase 5, show the summary and get Lisa's OK before considering setup complete.
- **Idempotent.** If run again, detect what's done and skip it. Don't re-ask questions that are already answered in the data files.
