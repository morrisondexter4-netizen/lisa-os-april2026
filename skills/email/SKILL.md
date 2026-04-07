# Skill -- /email

**Trigger:** `/email`

Drafts an email for Lisa. Always creates a Gmail draft -- never sends.

---

## Usage
```
/email
```

Or natural language: "Draft an email to Sarah", "Write an email about rescheduling", "Email the Johnsons about next week"

---

## Steps

### 1. Gather the Details

If Lisa did not provide all the details, ask one question at a time:

**Who is it to?**
> Who should this email go to?

Accept a name (try to find the email from students.json or travel-clients.json) or an email address directly.

If a name is given but no email found: "I do not have an email on file for [Name]. What is their email address?"

**What is it about?**
> What would you like the email to say? Give me the main points and I will write it up for you.

**What tone?**
> What tone works best for this -- professional, friendly, or casual?

If Lisa gives enough context in her initial request, skip the questions you already have answers to.

### 2. Draft the Email

Write a clear, well-structured email in Lisa's voice:
- Use the tone Lisa requested (default: warm and professional)
- Keep it concise -- Lisa's style is friendly but to-the-point
- Sign off as "Lisa" or "Lisa Wolf" depending on the formality
- Do not include any technical details or file references

### 3. Show Lisa the Draft

> Here is what I have:
>
> **To:** [recipient]
> **Subject:** [subject line]
>
> [email body]
>
> Want me to save this as a draft in your Gmail? I can also make changes first.

Wait for Lisa's response.

### 4. Create the Gmail Draft

On confirmation:
- Create the Gmail draft via Gmail MCP
- To: [email address]
- Subject: [subject line]
- Body: [the email text]

Report:
> Done! The draft is in your Gmail -- just open it, review, and hit send when you are ready.

### 5. If Lisa Wants Changes

If Lisa asks for edits: make them, show the updated version, and ask again.
Keep iterating until Lisa is happy, then create the draft.

---

## Special Cases

**Reply to an existing email:**
If Lisa says "reply to [email/person]":
1. Search Gmail for the most recent email from/to that person
2. Show Lisa the email being replied to: "Found this email from [person] about [subject]. Is this the one?"
3. Draft a reply in context
4. Create as a Gmail draft reply (using threadId if available)

**Follow-up emails:**
If Lisa says "follow up with [person]":
1. Check travel-clients.json and students.json for context on that person
2. Draft a warm follow-up referencing their last interaction
3. Show and confirm before saving as draft

---

## Rules
- NEVER send an email. Draft only.
- Always show the full draft to Lisa before saving.
- Write in Lisa's voice -- warm, professional, personal.
- No jargon, no technical language in the email body.
