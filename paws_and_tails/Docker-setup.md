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

Or, you can also run,

`docker run --rm -p 3000:3000 paws_and_rails-web`

will start the rails app.

## 4. Running Tests

Rspec:

`docker compose run --rm web rails spec`

Cucumber:

`docker compose run --rm web rails cucumber`

## Troubleshoot

If you run into the following issue:

```bash
strconv.Atoi: parsing "": invalid syntax
```

Just run this script:

```bash
sudo docker system prune
```

## Save for future reference

`docker run --rm -p 3000:3000 --env-file .env looouisz/paws_and_tails`