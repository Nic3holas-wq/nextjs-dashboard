#!/bin/bash

# Ensure you are logged into Vercel first:
# vercel login

while read line || [[ -n "$line" ]]; do
  # Skip empty lines or comments
  if [[ $line == \#* ]] || [[ -z $line ]]; then
    continue
  fi

  key=$(echo "$line" | cut -d '=' -f 1)
  value=$(echo "$line" | cut -d '=' -f 2-)

  echo "⏫ Uploading $key to Vercel..."

  # Add to Production (auto confirm with newline)
  echo -e "$value\n" | vercel env add "$key" production

  # Add to Preview (auto confirm with newline)
  echo -e "$value\n" | vercel env add "$key" preview

done < .env
