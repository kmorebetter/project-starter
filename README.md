# Project Starter

A template repository for AI-first engineering. Every new project starts with the compound engineering loop and harness engineering patterns baked in from commit zero.

Built on principles from [OpenAI's Harness Engineering](https://openai.com/index/harness-engineering/) and [Compound Engineering](https://every.to/guides/compound-engineering).

---

## Quick Start

```bash
# Create a new project from this template
gh repo create my-project --template kmorebetter/project-starter --clone --private
cd my-project

# Configure review agents for your stack (auto-detects)
# (requires compound-engineering plugin installed)
/workflows:setup
```

That's it. The compound engineering loop is ready.

---

## What's Inside

```
AGENTS.md                  # Universal agent map (~80 lines)
CLAUDE.md                  # Claude Code adapter (refs AGENTS.md)
LIVING.md                  # Session context — what's active now
docs/
  plans/                   # Implementation plans (primary artifacts)
  solutions/               # Solved problems (institutional knowledge)
  brainstorms/             # Ideation output
scripts/
  session-preflight.sh     # Runs at every session start
.claude/
  settings.json            # Session hooks
.gitignore                 # Multi-language defaults
```

### AGENTS.md — The Universal Map

Any agent tool reads this file. It contains the compound engineering loop, workspace shape, workflow commands, solution documentation format, and core principles. ~80 lines that serve as a table of contents — agents start here and look deeper as needed.

**Why a map, not a manual:** OpenAI found that "one big AGENTS.md" fails at scale. Context is scarce, too much guidance becomes non-guidance, and it rots instantly. Instead, keep it short and point to deeper docs.

### CLAUDE.md — Thin Adapter

References `AGENTS.md` and `LIVING.md`, then adds Claude Code-specific behavioral modifiers (action bias, parallel tool calls, auto-commit). ~25 lines. No duplicated content.

### LIVING.md — Session Context

What you're working on right now, recent completions, open issues, architectural decisions, and discovered patterns. Updated each session. This is what gives agents continuity between sessions.

### docs/ — Where Knowledge Compounds

| Directory | Purpose | When |
|-----------|---------|------|
| `docs/plans/` | Implementation plans | Before starting work (`/workflows:plan`) |
| `docs/solutions/` | Solved problems with YAML frontmatter | After solving problems (`/workflows:compound`) |
| `docs/brainstorms/` | Ideation and exploration | During discovery (`/workflows:brainstorm`) |

**The compounding effect:** First time you solve "N+1 query in brief generation" takes 30 minutes of research. Document it in `docs/solutions/`, and the next occurrence takes 2 minutes. Every solution makes the next one faster.

### Session Preflight

A lightweight script runs at every Claude Code session start, reporting:
- Git branch and uncommitted changes
- Active plans count
- Documented solutions count
- Whether compound-engineering is configured

---

## The Compound Engineering Loop

Every piece of work follows: **Plan → Work → Review → Compound → Repeat**

| Step | Command | What Happens |
|------|---------|-------------|
| **Plan** | `/workflows:plan` | Parallel research agents scan your codebase + external docs, then produce a structured plan in `docs/plans/` |
| **Work** | `/workflows:work` | Agent implements from plan in isolated branch, running tests after each change |
| **Review** | `/workflows:review` | 14+ specialized agents review in parallel (security, performance, architecture, code quality) |
| **Compound** | `/workflows:compound` | 6 parallel agents extract learnings into `docs/solutions/` with YAML frontmatter |
| **Full loop** | `/lfg` | Runs all steps end-to-end (50+ agents) |

**Time allocation:** 80% planning and review, 20% work and compounding.

---

## Adding Another Agent Tool

This template is designed for Claude Code but works with any agent tool:

1. Create a thin adapter file (e.g., `.cursor/rules.md`, `.windsurf/rules.md`)
2. Reference `AGENTS.md` at the top
3. Add tool-specific behavior (3-10 lines)
4. Done — the agent reads the universal map

---

## Principles

### From Harness Engineering (OpenAI)

- **AGENTS.md as map** — ~100 lines, pointers to deeper docs
- **Repository = system of record** — if it's not in a file, agents can't use it
- **Enforce architecture, not implementation** — rigid boundaries, local autonomy
- **Progressive disclosure** — small stable entry point, agents look deeper as needed
- **Garbage collection** — periodically review for stale content and drifted patterns

### From Compound Engineering

- **Extract taste into systems** — document conventions, patterns, preferences in CLAUDE.md
- **50/50 rule** — half of engineering time on features, half on system improvement
- **Trust + safety nets** — build guardrails (tests, review agents, monitoring) instead of manual review
- **Plans are the new code** — plans are the primary artifact and source of truth
- **Parallelization** — run multiple agents simultaneously whenever possible

### Three Review Questions

Before approving any AI output:
1. **"What was the hardest decision?"** — Forces AI to reveal tricky parts
2. **"What alternatives were rejected and why?"** — Shows options considered
3. **"What are you least confident about?"** — Gets AI to admit weaknesses

---

## Prerequisites

- [Claude Code](https://claude.com/claude-code) CLI installed
- [Compound Engineering Plugin](https://github.com/EveryInc/compound-engineering-plugin) installed:
  ```
  /plugin marketplace add https://github.com/EveryInc/compound-engineering-plugin
  /plugin install compound-engineering
  ```

---

## Customization

After creating a project from this template:

1. **Update LIVING.md** — Replace placeholder content with your project's actual context
2. **Run `/workflows:setup`** — Auto-detects your stack and configures review agents
3. **Edit CLAUDE.md** — Add project-specific conventions and preferences as you discover them
4. **Start compounding** — After every non-trivial solution, run `/workflows:compound`

The system gets smarter with every documented solution. That's the whole point.
