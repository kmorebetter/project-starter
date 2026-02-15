#!/bin/bash
# Session preflight — runs at every Claude Code session start

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "── Preflight ──"

# Git status
BRANCH=$(git -C "$PROJECT_ROOT" rev-parse --abbrev-ref HEAD 2>/dev/null)
if [ -z "$BRANCH" ]; then
  echo "Git: not initialized"
else
  CHANGES=$(git -C "$PROJECT_ROOT" status --porcelain 2>/dev/null | wc -l | tr -d ' ')
  if [ "$CHANGES" -gt 0 ]; then
    echo "Git: $BRANCH ($CHANGES uncommitted changes)"
  else
    echo "Git: $BRANCH (clean)"
  fi
fi

# Active plans
ACTIVE_PLANS=$(find "$PROJECT_ROOT/docs/plans" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
if [ "$ACTIVE_PLANS" -gt 0 ]; then
  echo "Plans: $ACTIVE_PLANS active"
fi

# Solutions count
SOLUTIONS=$(find "$PROJECT_ROOT/docs/solutions" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
if [ "$SOLUTIONS" -gt 0 ]; then
  echo "Knowledge: $SOLUTIONS documented solution(s)"
fi

# Check for compound-engineering config
if [ ! -f "$PROJECT_ROOT/compound-engineering.local.md" ]; then
  echo "NOTE: Run /workflows:setup to configure review agents"
fi
