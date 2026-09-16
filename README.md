# xyops-python

Docker image for running Python jobs in [xyOps](https://xyops.io), based on the
official [`xyops-shell-image`](https://github.com/pixlcore/xyops-shell-image).

**Image:** `ghcr.io/xms991/xyops-python:latest`

## What's inside

- Debian 12 (bookworm) base, via the xyOps shell image
- Python 3.11 with pip
- Preinstalled Python packages:

| Package | Purpose |
| --- | --- |
| requests, httpx | HTTP clients |
| pandas, numpy, tabulate | Data processing and formatting |
| pyyaml, jinja2 | Config parsing and templating |
| click, rich | CLI and terminal output helpers |
| pydantic, python-dotenv | Settings and environment management |
| boto3 | AWS SDK |
| sqlalchemy | Database toolkit/ORM |

## Usage

Pull on a worker node:

```bash
docker pull ghcr.io/xms991/xyops-python:latest
```

Run a Python one-liner:

```bash
docker run --rm ghcr.io/xms991/xyops-python:latest \
    python3 -c "import pandas; print(pandas.__version__)"
```

Or reference `ghcr.io/xms991/xyops-python:latest` as the container image in
your xyOps job/plugin configuration.

## Building and publishing

```bash
# Log in to GHCR (needs a token with write:packages)
gh auth token | docker login ghcr.io -u xms991 --password-stdin

docker compose build
docker compose push
```

To add more packages, edit the `pip3 install` list in the
[Dockerfile](Dockerfile), then rebuild and push as above.
