#!/bin/bash

NEW_NAME="dhanyabad11"
NEW_EMAIL="dhanyabadbehera@gmail.com"
REPO_PATH="."

# Change to the repository directory
cd "$REPO_PATH" || exit 1

# Run the git filter-branch command
git filter-branch --env-filter '
export GIT_COMMITTER_NAME="'"$NEW_NAME"'"
export GIT_COMMITTER_EMAIL="'"$NEW_EMAIL"'"
export GIT_AUTHOR_NAME="'"$NEW_NAME"'"
export GIT_AUTHOR_EMAIL="'"$NEW_EMAIL"'"
' --tag-name-filter cat -- --branches --tags

echo "Author information has been updated for all commits. Please review the changes and force push if everything looks correct."
echo "To push the changes, use: git push --force --all"