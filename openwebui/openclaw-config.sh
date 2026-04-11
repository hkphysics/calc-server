
docker compose run openclaw openclaw config set --json "models.providers.ollama" '{"baseUrl": "http://host.docker.internal:11434", "apiKey": "ollama-local", "api": "ollama", "models": [{
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
docker compose run openclaw openclaw config set --json "agents.defaults.model" '{
"primary": "openrouter/openrouter/free",
"fallbacks": [
"ollama/gemma4"
]}'
docker compose run openclaw openclaw config set --batch-json '[{"path": "agents.defaults.model.primary", "value":"openrouter/openrouter/free"}, {"path": "gateway.http.endpoints.chatCompletions.enabled", "value": true}]'
docker compose down openclaw
docker compose up openclaw -d

docker compose run --rm openclaw npx clawhub install weather
docker compose run --rm openclaw openclaw skills install multi-search-engine
docker compose run --rm openclaw openclaw skills install arxiv-watcher
docker compose run --rm openclaw openclaw skills install word-docx
docker compose run --rm openclaw openclaw skills update --all

