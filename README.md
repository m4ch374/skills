# skills

Hand-written personal agent skills, in the standard `skills/<name>/SKILL.md` layout.

Run `./link.sh` to symlink every skill into `~/.agents/skills` (Codex, Cursor) and `~/.claude/skills` (Claude Code). It is safe to rerun.

| Skill | What it does |
|---|---|
| `to-artifact` | Content rules for any artifact or HTML report: verdict first, sourced claims, low text density, render check |

## What goes where

| The skill… | Goes to |
|---|---|
| You wrote it, and it is about how you work | This repo |
| Someone else wrote it | `npx skills add <repo> -g`, not copied here |
| It names a repo's paths or services | That repo's `.agents/skills` |
| You adapted a third-party skill | This repo under a new name, citing the source |
