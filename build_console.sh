#!/bin/bash

NOTEBOOK_DIR=~/Documents/B/BB
CONSOLE_FILE="$NOTEBOOK_DIR/console.md"
JOURNAL_DIR="$NOTEBOOK_DIR/journal"
TODAY=$(date '+%Y-%m-%d')
TODAY_FILE="$JOURNAL_DIR/$TODAY.md"

# 📁 Créer le dossier journal s'il n'existe pas
mkdir -p "$JOURNAL_DIR"

# 📝 Créer un fichier journal pour aujourd'hui s'il n'existe pas
if [ ! -f "$TODAY_FILE" ]; then
    echo "# Journal - $TODAY" > "$TODAY_FILE"
    echo "" >> "$TODAY_FILE"
    echo "Créé automatiquement le $(date '+%Y-%m-%d à %H:%M')" >> "$TODAY_FILE"
fi

# 🔄 (Re)générer le fichier console.md
{
    echo "# Console - $TODAY"
    echo ""

    # Quick links
    echo "## 🔗 Quick Access"
    echo "- [[idWork]]"
    echo "- [[idPlace]]"
    echo "- [[idPieces]]"
    echo ""

    # Recent journal entries (liens cliquables)
    echo "## 📖 Recent Journals"
    find "$JOURNAL_DIR" -name "*.md" | sort -r | head -5 | while read file; do
        fname=$(basename "$file" .md)
        echo "- [[$fname]]"
    done
    echo ""

    # Open tasks
    echo "## 📋 Open Tasks"
    grep -r "\- \[ \]" "$NOTEBOOK_DIR" --exclude="console.md" 2>/dev/null | sed "s|$NOTEBOOK_DIR/||" | while read line; do
        file=$(echo "$line" | cut -d: -f1)
        task=$(echo "$line" | cut -d: -f2-)
        echo "- [$file] $task"
    done

} > "$CONSOLE_FILE"

