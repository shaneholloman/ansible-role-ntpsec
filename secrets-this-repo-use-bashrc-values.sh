#!/bin/bash

# Script to Set GitHub Secrets for Docker Hub
# Define the GitHub account or organization name
githubAccount="shaneholloman"  # Change this to your personal account name if needed

# Define an associative array where the key is the name of the secret and the value is the secret value
declare -A secrets
secrets=(
  ["DOCKERHUB_TOKEN"]="$DOCKERHUB_TOKEN"
  ["DOCKERHUB_USERNAME"]="$DOCKERHUB_USERNAME"
  ["GALAXY_API_KEY"]="$GALAXY_API_KEY"
  # Add more secrets here as needed
)

# Check if environment variables exist
missingVars=()
for key in "${!secrets[@]}"
do
  if [ -z "${secrets[$key]}" ]; then
    missingVars+=("$key")
  fi
done

if [ ${#missingVars[@]} -ne 0 ]; then
  echo "The following environment variables are missing:"
  for var in "${missingVars[@]}"
  do
    echo "$var"
  done
  echo "Please add them to your .bashrc file and run 'source ~/.bashrc'"
  exit 1
fi

# Get the name of the current repository
repo=$(basename "$(git rev-parse --show-toplevel)")

# Replace 'shaneholloman.' with 'ansible-role-' in the repository name
repo=${repo/shaneholloman./ansible-role-}

# Loop through each secret to set it for the current repository
for key in "${!secrets[@]}"
do
  value=${secrets[$key]}
  command="echo -n $value | gh secret set $key --repo=$githubAccount/$repo"
  eval "$command"
done
