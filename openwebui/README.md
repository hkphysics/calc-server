## Installing Hermes

1) add to.env with
```
OPENROUTER_API_KEY
API_SERVER_KEY
```

2) initialize with hermes
```
docker compose run hermes setup
docker compose run hermes chat
```

3) Add connection to OpenAI API in openwebui
```
URL: http://hermes:8642/v1
API: (your API_SERVER_KEY)
```
change chat completion to response

In the list of Settings -> Admin Settings -> Models

Search for all of the models and change the function call to True

## Installing openclaw

1) Add CLAWHUB_API_KEY to allow loading of clawhub

2) initialize

```
docker compose build openclaw
```

3) Go into the openclaw-data/openclaw.json find the token id and then add openwebui connectio

```
URL: http://openclaw:18789/v1
API: token from openclaw.json
```
change chat completion to response

In the list of Settings -> Admin Settings -> Models

Search for all of the models and change the function call to True

4) To configure openclaw configure
```
docker compose run -ti --rm --remove-orphans openclaw openclaw configure
```

4) To connect to openclaw diagnostics put in a tunnel to the host machine and connect with the token

```
ssh user@remote.example.com -N -L 18789:localhost:18789
```
