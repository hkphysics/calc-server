1) create hermes.env with

OPENROUTER_API_KEY
API_SERVER_KEY

API_SERVER_ENABLED=true
API_SERVER_HOST=0.0.0.0
GATEWAY_ALLOW_ALL_USERS=true

2)

docker compose run hermes setup
docker compose run hermes chat

3)

Add connection to OpenAI API

URL: http://hermes:8642/v1
API: (your API_SERVER_KEY)

