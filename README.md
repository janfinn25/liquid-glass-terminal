# Liquid Glass Terminal

A custom visual theme that applies a "liquid glass" aesthetic to any terminal CLI tool (Claude Code, Codex, etc.).

## Quick Start

```bash
# Install
./install.sh

# Claude Code
claude --enforce-liquid-glass
claude -lg

# OpenAI Codex
codex --enforce-liquid-glass
codex -lg

# Any command
liquid-glass <command> [args...]
```

## What's Included

```
liquid-glass-claude/
├── bin/
│   ├── claude               # Claude wrapper with -lg flag
│   ├── codex                # Codex wrapper with -lg flag
│   ├── liquid-glass         # Universal wrapper for any command
│   ├── claude-glass         # Launches new Terminal.app window with theme
│   ├── claude-liquid-glass  # Applies colors in-place + launches claude
│   └── liquid-glass-env     # Just the color palette (source it)
├── themes/
│   └── Liquid Glass.terminal  # Terminal.app profile
├── install.sh
└── README.md
```

## Usage

### New Terminal Window (Terminal.app only)

```bash
claude-glass [claude args...]
```

Opens a fresh Terminal.app window with the Liquid Glass profile and runs Claude Code.

### In-Place Colors (any terminal)

```bash
claude-lg [claude args...]
```

Applies the color palette to your current terminal session using ANSI escape sequences, then launches Claude. Works with iTerm2, Ghostty, Kitty, etc.

### Just the Colors

```bash
source bin/liquid-glass-env
```

Apply the palette without launching Claude. Useful for combining with other tools.

## Color Palette

The Liquid Glass theme uses a soft, translucent color scheme:

| Color      | Value     | Description      |
|------------|-----------|------------------|
| Black      | `#000000` | True black       |
| Red        | `#ff5f5f` | Soft coral       |
| Green      | `#5fffaf` | Mint             |
| Yellow     | `#ffd75f` | Soft gold        |
| Blue       | `#5fafff` | Sky blue         |
| Magenta    | `#ff5fd7` | Pink             |
| Cyan       | `#5fffff` | Aqua             |
| White      | `#e4e4e4` | Soft white       |

Bright variants follow a similar pattern with increased luminosity.

## Customization

Edit `bin/liquid-glass-env` to customize the ANSI color mappings. The format is:

```bash
printf '\033]4;{color_index};rgb:{RR}/{GG}/{BB}\033\\'
```

Color indices: 0-7 (normal), 8-15 (bright)

## Uninstall

Remove the aliases from your shell rc file and delete this directory:

```bash
rm -rf ~/git/liquid-glass-claude
```
