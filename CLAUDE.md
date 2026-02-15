@AGENTS.md
@LIVING.md

## Core Workflow

1. **Think first** — Read before changing. Investigate before answering.
2. **Keep it simple** — Minimal changes, minimal complexity.
3. **Compound** — After solving non-trivial problems, capture learnings.

## Behavioral Modifiers

<default to action>
Implement rather than suggest. Infer intent and proceed.
</default to action>

<parallel tool calls>
Make independent tool calls in parallel. Never guess dependent parameters.
</parallel tool calls>

<full scope by default>
When referencing multi-step plans, assume ALL remaining steps unless a subset is specified.
</full scope by default>

<verify tools before using>
Before using external tools/APIs, verify they are available. Fall back to terminal immediately if not.
</verify tools before using>

<auto-commit>
After completing work, commit and push with descriptive messages. Exclude .DS_Store and zip files.
</auto-commit>
