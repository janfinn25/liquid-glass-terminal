# Liquid Glass Terminal

A monochrome "liquid glass" theme for Terminal.app. White text on a translucent deep blue background with blur.

Works with Claude Code, Codex, or any CLI tool.

## How it works

The `.terminal` profile maps **all 16 ANSI color slots to white**. CLI tools like Claude Code use named ANSI colors (`.red`, `.green`, `.cyan`, etc.) — by mapping them all to white, everything renders as clean monochrome text on a blurred glass background.

```
Terminal.app profile does:
  - Background:  deep blue (#25288b)
  - Blur:        77%
  - Opacity:     ~47% (inactive windows)
  - ANSI 1-15:   all → white (#feffff)
  - Foreground:  soft white (#f5f1f1)
```

## Setup

**Double-click** `themes/Liquid Glass.terminal`

That's it. Terminal.app will import the profile. Set it as default if you want.

## For other terminals (iTerm2, Ghostty, Kitty)

These don't support `.terminal` files. Use the ANSI fallback script instead:

```bash
source bin/liquid-glass-env
```

This replicates the same effect using OSC escape sequences.

## Wrapper scripts (optional)

Run `./install.sh` to get convenience commands:

```bash
claude --enforce-liquid-glass   # apply glass then run claude
codex --enforce-liquid-glass    # apply glass then run codex
liquid-glass <any-command>      # apply glass then run anything
```

These are only useful with non-Terminal.app terminals. If you're already in a Terminal.app window with the Liquid Glass profile, you don't need them.
