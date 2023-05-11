#!/bin/bash

function test_openai_key {
  API_URL="https://api.openai.com/v1/organizations"

  # add openai_tokens in openai_key_store.sh

  local openai_tokens=(${openai_tokens[@]})
  for openai_token in "${openai_tokens[@]}"; do
    local openai_key="${openai_token:0:10}"
    local response=$(curl -s -o /dev/null -w "%{http_code}" -H "Authorization: Bearer ${openai_token}" $API_URL)

    if [[ ${response} == "200" ]]; then
      echo "${openai_key} is right (✓)"
    else
      echo "${openai_key} is not right (✗)"
    fi
  done
}


function test_openai_ip {
  bash <(curl -Ls https://cdn.jsdelivr.net/gh/missuo/OpenAI-Checker/openai.sh)
}
