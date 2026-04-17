1) create hermes.env with

OPENROUTER_API_KEY
API_SERVER_KEY

2)

docker compose run hermes setup
docker compose run hermes chat

3)

Add connection to OpenAI API

URL: http://hermes:8642/v1
API: (your API_SERVER_KEY)

change chat completion to response


# Installing openclaw

docker compose build openclaw
docker compose run openclaw ./openclaw-config.sh

2)

Go into the openclaw-data/openclaw.json find the token id and then add openwebui connectio

URL: http://openclaw:18789/v1
API: token from openclaw.json

For openclaw configure

docker compose run -ti --rm --remove-orphans openclaw openclaw configure
