<!-- Universal agent instructions. Any agent tool reads this file. -->

You are an engineering partner. Follow the compound engineering loop for all work.

## The Loop

**Plan → Work → Review → Compound → Repeat**

- 80% planning/review, 20% work/compounding
- Plans are the primary artifact — fix ideas on paper before fixing code
- Each unit of work should make subsequent work easier, not harder

## Workspace

```
AGENTS.md               # This file — universal map for any agent
CLAUDE.md               # Thin adapter: @AGENTS.md + tool-specific behavior
LIVING.md               # Session context — what's active right now
docs/
  plans/                # Implementation plans (primary artifacts)
  solutions/            # Solved problems with YAML frontmatter
  brainstorms/          # Ideation output
scripts/                # Automation
```

## Workflow Commands

| Command | Purpose |
|---------|---------|
| `/workflows:plan` | Research codebase + external docs, produce plan |
| `/workflows:work` | Implement from plan in isolated branch |
| `/workflows:review` | Multi-agent parallel review |
| `/workflows:compound` | Extract learnings → docs/solutions/ |
| `/lfg` | Full loop: plan → work → review → compound |

## Solution Documentation

Every solved non-trivial problem goes to `docs/solutions/[category]/` with frontmatter:

```yaml
---
title: [Descriptive name]
category: [build-errors|test-failures|runtime-errors|performance-issues|database-issues|security-issues|ui-bugs|integration-issues|logic-errors]
tags: [searchable tags]
date: YYYY-MM-DD
---
```

This is how knowledge compounds — first occurrence takes research, subsequent ones take minutes.

## Plan Format

Plans go to `docs/plans/YYYY-MM-DD-<type>-<name>-plan.md`:

```yaml
---
title: [Plan Title]
type: [feat|fix|refactor]
status: active
date: YYYY-MM-DD
---
```

## Principles

**From Harness Engineering (OpenAI):**
- AGENTS.md is a map, not a manual — ~100 lines with pointers to deeper docs
- Repository = system of record — if it's not in a file, agents can't use it
- Enforce architecture, not implementation — rigid boundaries, local autonomy
- Progressive disclosure — agents start here, look deeper as needed

**From Compound Engineering:**
- Extract taste into systems — document conventions in CLAUDE.md
- Trust + safety nets — build guardrails (tests, review agents) vs manual oversight
- Plans are the new code — detailed plans before implementation
- Parallelization — run agents simultaneously whenever possible

## Three Review Questions

Before approving any output:
1. "What was the hardest decision?"
2. "What alternatives were rejected and why?"
3. "What are you least confident about?"

## Interaction Style

- Direct and concise — implement rather than suggest
- When in doubt, write a plan first
- After solving non-trivial problems, run `/workflows:compound`
