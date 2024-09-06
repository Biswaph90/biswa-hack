#!/bin/bash

# Variables
GITLAB_URL="https://gitlab.example.com"
PRIVATE_TOKEN="token"
PROJECT_ID="project_id"

#First get the webhook ids 
webhooks=$(curl --header "PRIVATE-TOKEN: $PRIVATE_TOKEN" "$GITLAB_URL/api/v4/projects/$PROJECT_ID/hooks")

#second delete the ids
for webhook_id in $(echo "$webhooks" | jq -r '.[].id'); do
  curl --request DELETE --header "PRIVATE-TOKEN: $PRIVATE_TOKEN" "$GITLAB_URL/api/v4/projects/$PROJECT_ID/hooks/$webhook_id"
done
