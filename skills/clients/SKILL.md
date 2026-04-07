# Skill -- /clients

**Trigger:** `/clients`

Shows Lisa's travel clients from Quintessential Travel, grouped by status.

---

## Usage
```
/clients
```

Or natural language: "Show my travel clients", "How are my travel clients doing?", "Client list"

---

## Steps

### 1. Load Data
- Read `data/travel-clients.json`
- If the clients array is empty: "You do not have any travel clients on file yet. Want to add one?"

### 2. Group by Status
Organize clients into these groups (skip any group with no clients):
- **Planning** -- actively working on trip details
- **Booked** -- trip is confirmed
- **Traveling** -- currently on their trip
- **Completed** -- trip is done
- **Pipeline** -- new inquiry, not yet started

### 3. Display

> Here are your travel clients:
>
> **Planning**
> - [Name] -- [destination], [dates or "dates TBD"]
>   Next step: [nextStep]
>
> **Booked**
> - [Name] -- [destination], [dates]
>   Next step: [nextStep]
>
> **Pipeline**
> - [Name] -- [destination or "destination TBD"]
>   Next step: [nextStep]
>
> Total: [N] active clients

If a client has no nextStep, skip that line.

### 4. Offer Actions

> Want me to update any of these, or add a new client?

---

## Rules
- Never show JSON or file paths.
- Group labels should be clear and human-friendly.
- If all clients are in "completed" status: "All your travel clients have completed their trips. Want to add a new one?"
- Keep the display clean and scannable.
