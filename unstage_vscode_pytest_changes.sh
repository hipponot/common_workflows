#!/bin/bash
if git rev-parse --verify HEAD >/dev/null 2>&1; then
   against=HEAD
else
   # Initial commit: diff against an empty tree object
   against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi

# Find files to be committed
(
# IFS='
# '
# SETTINGS=$(git diff-index --cached $against --name-only | grep -a '\.vscode\/settings\.json$' | uniq)
mapfile -t SETTINGS < <(git diff-index --cached "$against" --name-only | grep -a '\.vscode\/settings\.json$' | uniq)
if [ -z "$SETTINGS" ]; then
    exit 0
fi
echo "Found settings files: $SETTINGS"
for SETTING in $SETTINGS ; do
    echo "--- Checking $SETTING"
    Settings_change=$(git diff --cached --unified=0 "$SETTING" | grep -Po '(?<=^\+)(?!\+\+).*')
   if echo "$Settings_change" | grep -q 'pytestEnabled": true' ; then
      echo "------ python.testing.pytestEnabled: true found in $SETTING"
      echo -e "\033[33m------ Unstaging $SETTING. If this is not what you want, run commit with SKIP=stage_vscode_pytest_changes git commit ...\033[0m"
      git reset "$SETTING"
   fi
done
exit 0
)

exec git diff-index --check --cached $against --
