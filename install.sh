#!/bin/bash
# Liquid Glass Claude - Installation Script
#
# This script:
# 1. Makes all scripts executable
# 2. Installs the Terminal.app theme
# 3. Optionally creates shell aliases

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🔮 Installing Liquid Glass Claude..."
echo ""

# Make scripts executable
chmod +x "$SCRIPT_DIR/bin/"*
echo "✓ Made scripts executable"

# Install Terminal.app theme
THEME_FILE="$SCRIPT_DIR/themes/Liquid Glass.terminal"
if [ -f "$THEME_FILE" ]; then
    open "$THEME_FILE"
    echo "✓ Terminal theme opened (click 'Keep' in Terminal preferences to save)"
else
    echo "⚠ Theme file not found at $THEME_FILE"
fi

# Ask about creating aliases
echo ""
echo "Would you like to add shell aliases to your profile?"
echo "This adds 'claude-glass' and 'claude-lg' commands."
read -p "Add aliases? [y/N] " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Detect shell
    SHELL_RC=""
    if [ -n "$ZSH_VERSION" ] || [ "$SHELL" = "/bin/zsh" ]; then
        SHELL_RC="$HOME/.zshrc"
    else
        SHELL_RC="$HOME/.bashrc"
    fi

    # Add aliases and PATH
    cat >> "$SHELL_RC" << EOF

# Liquid Glass Claude
export PATH="$SCRIPT_DIR/bin:\$PATH"
alias claude-glass='$SCRIPT_DIR/bin/claude-glass'
alias claude-lg='$SCRIPT_DIR/bin/claude-liquid-glass'
EOF

    echo "✓ Aliases and PATH added to $SHELL_RC"
    echo "  Run 'source $SHELL_RC' or restart terminal to use them."
fi

echo ""
echo "🔮 Installation complete!"
echo ""
echo "Usage:"
echo "  claude --enforce-liquid-glass  # Apply colors then run claude"
echo "  claude -lg                     # Short form"
echo "  claude-glass                   # Opens new Terminal window with theme"
echo "  claude-lg                      # Applies colors to current terminal"
echo "  source bin/liquid-glass-env   # Just apply colors (no claude)"
