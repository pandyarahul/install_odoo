#!/bin/bash

# List of repositories
repos=(
  "accounting_addons"
"extra_tools_addons"
"extra_tools_addons2"
"extra_tools_addons3"
"extra_tools_addons4"
"free_apps"
"free_apps2"
"import_addons"
"industry_addons"
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

# Set the branch you want to checkout
branch="19.0"

# Iterate through each repository
for repo in "${repos[@]}"; do
  echo "Processing repository: $repo"

  # Check if the repository directory exists
  if [ ! -d "$repo" ]; then
    echo "Warning: Repository '$repo' does not exist, skipping..."
    continue
  fi

  # Navigate to the repository directory
  cd "$repo" || { echo "Failed to enter '$repo' directory, skipping..."; continue; }

  # Reset changes to the last commit
  echo "Resetting changes in '$repo'..."
  git reset --hard

  # Fetch latest updates and checkout the desired branch
  echo "Fetching latest updates for branch '$branch' in '$repo'..."
  git fetch && git checkout "$branch"

  # Check the branch status
  echo "Current branch in '$repo':"
  git branch

  # Pull latest changes from the remote repository
  echo "Pulling latest changes in '$repo'..."
  git pull

  # Move back to the original directory
  cd ..
  echo "--------------------------------------------"
done

echo "Script execution completed."
