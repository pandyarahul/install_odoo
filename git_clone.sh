#!/bin/bash

# Base URL for cloning
BASE_URL="git@bitbucket.org:browseinfo"

# List of repositories to clone
REPOSITORIES=(
"accounting_addons"
"extra_tools_addons"
"extra_tools_addons2"
"extra_tools_addons3"
"extra_tools_addons4"
"free_apps"
"free_apps2"
"import_addons"
"industry_addons"
"industry_addons2"
"integration_addons"
"integration_addons2"
"manufacturing_addons"
"marvel_addons"
"marvel_addons2"
"marvel_addons3"
"morpho_addons"
"morpho_addons2"
"pos_addons"
"pos_addons2"
"pos_addons3"
"pos_addons4"
"pos_addons5"
"project_hr_addons"
"project_hr_addons2"
"project_hr_addons3"
"project_hr_addons4"
"sale_purchase_addons"
"warehouse_addons"
"website_addons"
"website_addons2"
"website_addons3"

)

# Total number of repositories
TOTAL_REPOS=${#REPOSITORIES[@]}

# Function to display the progress bar
show_progress() {
    local current=$1
    local total=$2
    local percent=$(( (current * 100) / total ))
    local progress_bar=""

    for ((i=0; i<$percent/2; i++)); do
        progress_bar="${progress_bar}#"
    done
    printf "\rCloning Progress: [%-50s] %d%% (%d/%d)" "$progress_bar" "$percent" "$current" "$total"
}

# Clone each repository and update progress
for i in "${!REPOSITORIES[@]}"; do
    REPO_NAME="${REPOSITORIES[$i]}"
    
    # Check if the directory already exists
    if [ -d "$REPO_NAME" ]; then
        echo -e "\nRepository '$REPO_NAME' already exists. Skipping..."
        # Update progress bar even if skipped
        show_progress $((i + 1)) $TOTAL_REPOS
        continue
    fi

    echo -e "\nCloning repository: $REPO_NAME"
    
    # Try cloning the repository
    git clone "${BASE_URL}/${REPO_NAME}.git" 2>/dev/null
    if [ $? -ne 0 ]; then
        echo -e "Warning: Failed to clone repository '$REPO_NAME'. Skipping..."
    fi
    
    # Display separator line after each repository is processed
    echo "--------------------------------------------"

    # Update progress bar
    show_progress $((i + 1)) $TOTAL_REPOS
done

echo -e "\n\nCloning process completed!"
