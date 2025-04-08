# explain.dalibo.com

PEV2 Flask application

# Installation

```shell
pip install -r requirements.txt
```

Create a config file.

```shell
cp config.py instance
```

Modify the `config.py` file in the `instance` directory if needed.

Run a Postgres instance in a docker container:

```shell
docker run -p 5432:5432 --rm --name explain -e POSTGRES_PASSWORD=postgres -d postgres
```

Create the DB:

```
FLASK_APP=app flask db upgrade
```

## Run

```shell
FLASK_APP=app python -m flask run
```

# Run App Using Docker

```shell
docker compose up -d
```

Open [http://0.0.0.0:5000/](http://0.0.0.0:5000/) in your browser.

You can also configure the application through these environment variables:

| Variable                         | Default         | Description                            |
| -------------------------------- | --------------- | -------------------------------------- |
| `HTTP_HOST`                      | `0.0.0.0`       | HTTP server address                    |
| `HTTP_PORT`                      | `5000`          | HTTP server port                       |
| `DB_SERVICE`                     | `0.0.0.0`       | PostgreSQL address                     |
| `DB_PORT`                        | `5432`          | PostgreSQL port                        |
| `DB_USER`                        | `postgres`      | PostgreSQL username                    |
| `DB_PASS`                        | `postgres`      | PostgreSQL password                    |
| `DB_NAME`                        | `postgres`      | PostgreSQL database name               |
| `SECRET_KEY`                     | `aSup3rS33kret` | Application secret key                 |
| `DEBUG_TB_INTERCEPT_REDIRECTS`   | `false`         | Flask debugging: intercept redirects   |
| `DEBUG_TB_PROFILER_ENABLED`      | `false`         | Flask debugging: enable profiler       |
| `SQLALCHEMY_TRACK_MODIFICATIONS` | `false`         | Tracks SQLAlchemy object modifications |
| `GOOGLE_ANALYTICS`               | `null`          | Google Analytics ID                    |

# Build assets

Requires Node > 16

```shell
npm install
npm run build
```

You can also run the app in DEBUG mode. In this case, run the following
commands in two consoles.

```shell
npm run dev
```

```shell
FLASK_DEBUG=1 FLASK_APP=app python -m flask run
```

# Releasing

```shell
git tag -a vx.x.x -m "x.x.x"
git push --tags
```
