# Installation Git
```bash
-fLo ~/.vim/autoload/plug.vim --create-dirs      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

# [idWork](idWork) Querying recents files under the JOURNAL_DIR variable : 
        ```bash
        find "$JOURNAL_DIR" -name "*.md" | sort -r | head -5 | while read file; do
        fname=$(basename "$file" .md)
        echo "- [[$fname]]"
        done
        echo ""
        ```
