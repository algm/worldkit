---
description: Create or update the world foundation from interactive or provided inputs, establishing the core rules and principles of your fictional world
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Output Language Configuration

Before proceeding, check for language configuration:

1. **Load language preference** from `/memory/config.json`:
   - If the file exists and contains a `language` field, use that language for all generated outputs
   - Language codes: `en` (English), `es` (Spanish), `fr` (French), `de` (German), `pt` (Portuguese), `ja` (Japanese), `zh` (Chinese), etc.
   - Default to English if no configuration is found

2. **Apply language to outputs**:
   - Write all foundation descriptions, world rules, and principles in the configured language
   - Keep technical markers and section headers in English for consistency (e.g., `FOUNDATION_VERSION`, dates, file paths)
   - Maintain the template structure while translating the content

## Outline

You are updating the world foundation at `/memory/foundation.md`. This file is a TEMPLATE containing placeholder tokens in square brackets (e.g. `[WORLD_NAME]`, `[FOUNDATION_1_NAME]`). Your job is to (a) collect/derive concrete values, (b) fill the template precisely, and (c) propagate any amendments across dependent artifacts.

Follow this execution flow:

1. Load the existing foundation template at `/memory/foundation.md`.
   - Identify every placeholder token of the form `[ALL_CAPS_IDENTIFIER]`.
   **IMPORTANT**: The user might require less or more foundation elements than the ones used in the template. If a number is specified, respect that - follow the general template. You will update the doc accordingly.

2. Collect/derive values for placeholders:
   - If user input (conversation) supplies a value, use it.
   - Otherwise infer from existing repo context (README, docs, prior foundation versions if embedded).
   - For governance dates: `CREATED_DATE` is the original creation date (if unknown ask or mark TODO), `LAST_UPDATED_DATE` is today if changes are made, otherwise keep previous.
   - `FOUNDATION_VERSION` must increment according to semantic versioning rules:
     - MAJOR: Fundamental world rules changed that affect existing story elements.
     - MINOR: New foundation element/section added or materially expanded.
     - PATCH: Clarifications, wording, typo fixes, non-semantic refinements.
   - If version bump type ambiguous, propose reasoning before finalizing.

3. Draft the updated foundation content:
   - Replace every placeholder with concrete text (no bracketed tokens left except intentionally retained template slots that the world has chosen not to define yet—explicitly justify any left).
   - Preserve heading hierarchy and comments can be removed once replaced unless they still add clarifying guidance.
   - Ensure each Foundation section: succinct name line, paragraph (or bullet list) capturing non‑negotiable rules, explicit rationale if not obvious.
   - Ensure Governance section lists amendment procedure, versioning policy, and consistency review expectations.

4. Consistency propagation checklist (convert prior checklist into active validations):
   - Read `/templates/outline-template.md` and ensure any "Foundation Check" or rules align with updated principles.
   - Read `/templates/world-template.md` for scope/requirements alignment—update if foundation adds/removes mandatory sections or constraints.
   - Read `/templates/chapters-template.md` and ensure chapter categorization reflects new or removed foundation-driven elements (e.g., magic system, physics, culture).
   - Read each command file in `/templates/commands/*.md` (including this one) to verify no outdated references remain when generic guidance is required.
   - Read any runtime guidance docs (e.g., `README.md`, `docs/quickstart.md`, or agent-specific guidance files if present). Update references to foundation elements changed.

5. Produce a Sync Impact Report (prepend as an HTML comment at top of the foundation file after update):
   - Version change: old → new
   - List of modified foundation elements (old title → new title if renamed)
   - Added sections
   - Removed sections
   - Templates requiring updates (✅ updated / ⚠ pending) with file paths
   - Follow-up TODOs if any placeholders intentionally deferred.

6. Validation before final output:
   - No remaining unexplained bracket tokens.
   - Version line matches report.
   - Dates ISO format YYYY-MM-DD.
   - Foundation elements are declarative, testable, and free of vague language ("should" → replace with MUST/SHOULD rationale where appropriate).

7. Write the completed foundation back to `/memory/foundation.md` (overwrite).

8. Output a final summary to the user with:
   - New version and bump rationale.
   - Any files flagged for manual follow-up.
   - Suggested commit message (e.g., `docs: amend world foundation to vX.Y.Z (element additions + governance update)`).

Formatting & Style Requirements:

- Use Markdown headings exactly as in the template (do not demote/promote levels).
- Wrap long rationale lines to keep readability (<100 chars ideally) but do not hard enforce with awkward breaks.
- Keep a single blank line between sections.
- Avoid trailing whitespace.

If the user supplies partial updates (e.g., only one foundation element revision), still perform validation and version decision steps.

If critical info missing (e.g., creation date truly unknown), insert `TODO(<FIELD_NAME>): explanation` and include in the Sync Impact Report under deferred items.

Do not create a new template; always operate on the existing `/memory/foundation.md` file.
