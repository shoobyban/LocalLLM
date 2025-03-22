#!/bin/bash

# Script to update the development team in Xcode project settings
# Usage: ./update_development_team.sh "TEAM_ID"

set -e  # Exit immediately if a command exits with a non-zero status

# Check if a team ID was provided
if [ $# -eq 0 ]; then
    echo "Error: Please provide a team ID"
    echo "Usage: ./update_development_team.sh \"TEAM_ID\""
    exit 1
fi

TEAM_ID=$1
PROJECT_DIR="$(dirname "$(dirname "$0")")"  # Parent directory of the script's directory
PROJECT_FILE=$(find "$PROJECT_DIR" -name "*.xcodeproj" -depth 1 | head -n 1)

if [ -z "$PROJECT_FILE" ]; then
    echo "Error: Could not find Xcode project file"
    exit 1
fi

echo "Found project at: $PROJECT_FILE"
echo "Updating development team to: $TEAM_ID"

# Update project.pbxproj file
PBXPROJ="$PROJECT_FILE/project.pbxproj"

if [ ! -f "$PBXPROJ" ]; then
    echo "Error: Could not find project.pbxproj file"
    exit 1
fi

# Create a backup
cp "$PBXPROJ" "$PBXPROJ.bak"
echo "Created backup at $PBXPROJ.bak"

# Update DEVELOPMENT_TEAM setting in project.pbxproj
sed -i '' "s/DEVELOPMENT_TEAM = \"*[A-Z0-9]*\"*;/DEVELOPMENT_TEAM = \"$TEAM_ID\";/g" "$PBXPROJ"

# Check if the sed command was successful
if [ $? -eq 0 ]; then
    echo "Successfully updated development team to $TEAM_ID"
    echo "You may need to open the project in Xcode and confirm the changes"
else
    echo "Error: Failed to update development team"
    echo "Restoring backup..."
    mv "$PBXPROJ.bak" "$PBXPROJ"
    exit 1
fi

# Make the script executable
chmod +x "$0"

echo "Done!"
