# Liquid Glass Terminal

A translucent "liquid glass" theme for your terminal. Works with Claude Code, Codex, or any CLI tool.

## Setup (one time)

**Step 1** - Import the terminal profile:

Double-click `themes/Liquid Glass.terminal`. This gives you the glass window (blur, transparency, dark blue background).

**Step 2** - Install the color scripts:

```bash
./install.sh
```

This adds commands to your shell so you can use them from anywhere.

## How to use

### Claude Code with glass colors

```bash
claude --enforce-liquid-glass
```

or short:

```bash
claude -lg
```

### Codex with glass colors

```bash
codex --enforce-liquid-glass
```

### Any command with glass colors

```bash
liquid-glass <command>
```

For example: `liquid-glass vim`, `liquid-glass python3`

### Just apply colors (no app)

```bash
source liquid-glass-env
```

This changes the colors in your current terminal window. Everything you run after this will use the glass palette.

## Why two steps?

The `.terminal` file sets the **window effects** (blur, transparency, background). But Terminal.app doesn't reliably override ANSI text colors when importing profiles - it keeps them white.

The scripts fix that by injecting the actual color palette via ANSI escape codes at runtime.

```
.terminal file  -->  glass window (blur + opacity + blue bg)
ANSI scripts    -->  text colors  (coral, mint, gold, aqua, etc.)
```

## Customization

Edit `bin/liquid-glass-env` to change colors. Each line looks like:

```bash
printf '\033]4;1;rgb:ff/77/77\033\\'   # Red - soft coral
```

Change the `ff/77/77` hex values to whatever you want.

## Uninstall

Remove the aliases from `~/.zshrc` (or `~/.bashrc`) and delete this folder.
