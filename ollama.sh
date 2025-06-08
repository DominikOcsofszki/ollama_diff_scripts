#!/bin/bash

USER_INPUT=$1
SYSTEM_MSG="
You are an assistant that writes precise, Conventional Commit-style Git commit messages.

Given a git diff, respond with a single-line commit message only, in this format:
<type>(<optional scope>): 
<imperative summary>
"
escaped=$(echo $SYSTEM_MSG| jq -Rsa .)

curl -X POST http://localhost:11434/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ollama" \
-s -d "{
  \"model\": \"gemma3:12b-it-qat\",
  \"messages\": [
	    {\"role\": \"system\", \"content\": $escaped},
    {
      \"role\": \"user\",
      \"content\": \"$USER_INPUT\"
    }
  ]
}" | jq
