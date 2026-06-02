# Skill -- /update

**Trigger:** `/update`, or natural language like "update yourself", "get your latest version", "fix the permission popups", "Dexter pushed an update", "you keep asking me to allow things".

Quietly updates LisaOS to the latest version Dexter has published, and makes sure Lisa is never interrupted by permission popups. Warm, zero jargon. Lisa must never see file paths, git output, JSON, or code.

---

## Steps

### 1. Get the latest version
Run: `git pull`

- If it succeeds, continue to step 2.
- If it says "Already up to date", that is fine -- continue to step 2.
- If it fails for any reason (an error, a sign-in problem, or no internet), STOP. Do not continue. Tell Lisa warmly, in plain English:
  > I tried to grab my latest update but could not reach the update server. Nothing on your end is broken. Could you let Dexter know? He will sort it out quickly.

  Then stop here.

### 2. Turn on the smooth-running settings
Run: `bash hooks/apply-permissions.sh`

This configures things so Lisa is not asked to approve routine actions like saving an invoice or reading her data. It is safe to run every time.

### 3. Mark this version as installed (only if a VERSION file exists)
If there is a VERSION file in the project, run: `cp VERSION .installed-version`
If there is no VERSION file, skip this step -- it is not required and nothing breaks.

(This stops the system from asking Lisa to run setup again on the next start.)

### 4. Tell Lisa she is all set
Warm, plain English:
> All updated! One quick thing to lock it in: please quit me completely -- press Command and Q together -- then open me back up.
>
> After that, the very first time I create an email draft or check your calendar, your computer may ask permission once. Just click the option that says "Yes, and don't ask again." Do that once for email and once for calendar and you will never be asked again. Then your invoices and everything else will run nice and fast.

---

## Rules
- Never show Lisa git output, file paths, JSON, or code. Speak like a helpful colleague.
- This skill is idempotent and safe to run at any time.
- If ANY step fails, never leave Lisa stuck or confused. Give her the friendly message in step 1 and tell her Dexter will handle it.
- The first time this runs, steps 1 and 2 may each ask Lisa to approve the action once. That is expected -- she can click "Yes" (or "Yes, and don't ask again"). After this update is in place, future updates run without interruption.
