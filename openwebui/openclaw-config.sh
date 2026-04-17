#!/bin/bash

export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
brew install gh  steipete/tap/goplaces gogcli \
   steipete/tap/gifgrep himalaya \
   steipete/tap/spogo \
   steipete/tap/songsee
brew install --cask 1password-cli
brew upgrade
openclaw config set --json "models.providers.ollama" '{
            "baseUrl": "http://host.docker.internal:11434",
            "apiKey": "ollama-local",
            "api": "ollama", "models": [{
            "id": "gemma4",
            "name": "gemma4",
            "reasoning": false,
            "input": [
              "text"
            ],
            "cost": {
              "input": 0,
              "output": 0,
              "cacheRead": 0,
              "cacheWrite": 0
            },
            "contextWindow": 128000,
            "maxTokens": 8192
          }]}'
openclaw config set --json "agents.defaults.model" '{
"primary": "openrouter/openrouter/free",
"fallbacks": [
"ollama/gemma4"
]}'

openclaw config set --batch-json '[
{"path": "agents.defaults.model.primary", "value":"openrouter/openrouter/free"},
{"path": "gateway.http.endpoints.chatCompletions.enabled", "value": true}
]'

modules=(
    "weather"
    "multi-search-engine"
    "arxiv-watcher"
    "word-docx"
    "powerpoint-pptx"
    "excel-xlsx"
    "baidu-search"
    "google-maps"
    "ontology"
    "playwright-mcp"
    "x-search"
    "self-improving-agent"
    "realtime-crypto-price-api"
    "goplaces"
    "google-maps"
    "baidu"
    "data-analysis"
    "image"
    "productivity"
    "skill-vetter"
)

[[ -n $CLAWHUB_API_KEY ]] && {
    npx clawhub login --token $CLAWHUB_API_KEY
}

for module in "${modules[@]}"; do
    echo "--- Running installation for: $module ---"
    npx clawhub install "$module"
done

openclaw skills update --all
brew cleanup

