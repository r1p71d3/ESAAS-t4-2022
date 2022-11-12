# Docker Setup

Follow this instruction to get the project running on Docker!

## 1. Setup Docker

Download Docker here: [https://www.docker.com/](https://www.docker.com/)

Make sure your docker compose version:

```bash
docker compose version
>> Docker Compose version v2.10.2
```

## 2. Project Setup

- [ ] Download `.env` file from me
- [ ] Put the `.env` file under `paws_and_tails/`

## 3. Build Docker 

Run:

```bash 
docker compose build
docker compose run --rm web bin/rails db:test:prepare
```

After that, simply run:

`docker compose up`

will start the rails app.

## 4. Running Tests

Rspec:

`docker compose run --rm web rails spec`

Cucumber:

`docker compose run --rm web rails cucumber`
