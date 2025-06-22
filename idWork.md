# 2025-06-21
- 06:00 Do the laundry
- 07:00 Shopping
- 10:00 Siestes
- 12:00 Lunch [@Recepies](@Recepies)
- 17:00 Dinner
- 18:00 [@Linux](@Linux) & [@vimwiki](@vimwiki)

# 2025-06-22
- 09:00 [@vimwiki](@vimwiki) 
  - Command Lines learning
  - Automatisation `console.md` scripts logics
  	- Variables:
		- `JOURNAL_DIR` // For having a hyperlink with `Recent Journals`
		- `TODAY` // A script to define the day we open
		- `TODAY_FILE` // The file archived under the hyperlink by the function
	- Creating a file: `mkdir -p "$JOURNAL_DIR"`
	- Querying recents files under the `JOURNAL_DIR` variable : 
	```bash
	find "$JOURNAL_DIR" -name "*.md" | sort -r | head -5 | while read file; do
        fname=$(basename "$file" .md)
        echo "- [[$fname]]"
	done
	echo ""
	```
- 10:00 [@COBOL](@COBOL) practices with personal @SimpleAudit
- :00 [@Linux](@Linux) practice : [@git](@git)
 
