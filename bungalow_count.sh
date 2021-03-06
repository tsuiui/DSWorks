#!/bin/bash
#Simple design systems metrics
components=(
	"Accordion"
	"Button"
	"Calendar" 
	"DateTimePicker"
	"FormikKeyboardDatePicker"
	"FormikKeyboardDateTimePicker"
	"KeyboardDatePicker"
	"KeyboardDateTimePicker"
	"Chip"
	"UrgentChip"
	"Dialog"
	"Divider"
	"DropZone"
	"Entity"
	"UncaughtErrorHandler"
	"BuboAsleep"
	"BuboCrying"
	"BuboCurious"
	"BuboDown"
	"BuboEmbarrassed"
	"BuboEntertained"
	"BuboInLove"
	"BuboJoyful"
	"BuboJudging"
	"BuboRelaxed"
	"BuboSick"
	"BuboSleepy"
	"BuboSuspicious"
	"BuboThumbsUp"
	"BuboWired"
	"DoNotUse"
	"LabeledField"
	"InternalLink"
	"Link"
	"DetailListItem"
	"HistoryListItem"
	"SummaryListItem"
	"Menu"
	"MenuItem"
	"OverflowMenu"
	"NavigationBar"
	"RailSelection"
	"RailSelectionContent"
	"RailSelectionHeader"
	"ActionList"
	"AuditLogDetails"
	"DetailHeader"
	"DetailItem"
	"EmptyObjectPanel"
	"ClientInformationOverlay"
	"ContactDetailsOverlay"
	"EmailMetadataOveraly"
	"Overlay"
	"OverlayActions"
	"CircularProgress"
	"Loading"
	"Checkbox"
	"CheckboxWithLabel"
	"FormikCheckboxWithLabel"
	"Radio"
	"Switch"
	"Snackbar"
	"SearchResultsCell"
	"TableCell"
	"TableFooter"
	"TableHeader"
	"TableRow"
	"TableRowActions"
	"LeftNavigationTabs"
	"NavigationTabs"
	"RailTabs"
	"TaskTab"
	"ChipTextField"
	"CurrencyField"
	"FormattedNumberField"
	"FormikChipTextField"
	"FormikCurrencyField"
	"FormikFormattedNumberField"
	"FormikInputTextField"
	"InputTextField"
	"PercentageField"
	"SearchTextField"
	"SelectionTextField"
	"SimpleSelectField"
	"TimespanField"
	"Tooltip"
	"button"
	"iframe"
	"img"
	"input type=\"text\""
	"input type=\"number\""
	"input type=\"date\""
	"input type=\"radio\""
	"input type=\"hidden\""
	"input type=\"checkbox\""
	"label"
	"legend"
	"form"
	"ol"
	"select"
	"textarea"
	"ul"
)
FILE_NAME="dscount.csv"
total=0
component_total=0
echo "Looking for ${#components[@]} components..."
echo "component,count" >> $FILE_NAME
for i in "${components[@]}"
do
	matched_files=(`grep --exclude="*.stories.tsx" --exclude-dir="node_modules" --exclude-dir="node_patches" --exclude-dir="ts_shared" -r -l -I "<$i\s*" ./`)
	for mf in "${matched_files[@]}"
	do
		file_count=`grep --exclude="*.stories.tsx" --exclude-dir="node_modules" --exclude-dir="node_patches" --exclude-dir="ts_shared" -r -c -I "<$i\s*" $mf`
		component_total=$((component_total+$file_count))
	done
	echo "<$i/>,$component_total" >> $FILE_NAME
	total=$((total+=$component_total))
	component_total=0
done
echo "Total Component Usage: $total"