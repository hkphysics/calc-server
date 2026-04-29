#!/bin/bash


export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
brew install gh  steipete/tap/goplaces gogcli \
   steipete/tap/gifgrep himalaya \
   steipete/tap/spogo \
   steipete/tap/songsee
brew install --cask 1password-cli
brew upgrade
brew cleanup --prune=all

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
{"path": "agents.defaults.model.primary", "value":"openrouter/free"},
{"path": "gateway.http.endpoints.chatCompletions.enabled", "value": true},
{"path": "gateway.http.endpoints.responses.enabled", "value": true}
]'

modules=(
    "weather"
    "multi-search-engine"
    "word-docx"
    "powerpoint-pptx"
    "excel-xlsx"
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
    "zhipu-web-search"
    "baidu-ai-map"
)

install_module() {
    local module_name=$1
    local max_retries=$2
    local attempts=0
    local backoff=1
    local max_backoff=30
    local success=false

    echo "========================================================="
    echo "--> Installing module: ${module_name}"

    while [ $attempts -lt $max_retries ]; do
        attempts=$((attempts + 1))
        echo -e "\n[Attempt $attempts of $max_retries] "

        if eval "$module_name"; then
            success=true
            break
        else
            echo "FAILURE: Installation failed for module $module_name (Exit code: $?)"

            if [ $attempts -eq $max_retries ]; then
                echo "No more retries available."
                break
            fi

            local sleep_time=$backoff
            if [ $sleep_time -gt $max_backoff ]; then
                sleep_time=$max_backoff
            fi

            echo "Waiting $sleep_time seconds before retry..."
            sleep $sleep_time

            backoff=$((backoff * 2))
        fi
    done

    if [ "$success" = true ]; then
        echo "SUCCESS"
        echo "========================================================="
        return 0
    else
        echo "FAILURE: Failed to install module '${module_name}' after ${max_retries} attempts."
        echo "========================================================="
        return 1
    fi

}

[[ -n $CLAWHUB_API_KEY ]] && {
    npx clawhub login --token $CLAWHUB_API_KEY
}
for module in "${modules[@]}"; do
    rm -rf "${module##*/}"
    install_module "npx clawhub install --force ${module}" "5"
done

modules=(
    "vercel-labs/find-skills"
    "anisafifi/academic-research-hub"
    "claude-office-skills/academic-search"
    "Ractorrr/arxiv"
    "ajanraj/yahoo-finance"
    "evgyur/crypto-price"
    "anthropics/pdf"
    "raulsimpetru/pdf-form-filler"
    "byteroverinc/byterover"
)

cd /app/skills
for module in "${modules[@]}"; do
    rm -rf "${module##*/}"
    install_module "npx sundial-hub add -y ${module}" "5"
done
mv .agents/skills/* .
rm -rf .agents

openclaw skills update --all
# load in npm libraries
openclaw doctor
npm cache clean --force
