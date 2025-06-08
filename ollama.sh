#!/bin/bash

USER_INPUT=$1

curl -X POST http://localhost:11434/v1/chat/completions \
-H "Content-Type: application/json" \
-H "Authorization: Bearer ollama" \
-s -d "{
  \"model\": \"gemma3:1b-it-qat\",
  \"messages\": [
    {
      \"role\": \"user\",
      \"content\": \"$USER_INPUT\"
    }
  ]
}" | jq
