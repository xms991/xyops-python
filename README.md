# xyops-python

Docker image for running Python jobs in [xyOps](https://xyops.io), based on the
official [`xyops-shell-image`](https://github.com/pixlcore/xyops-shell-image).

**Image:** `ghcr.io/xms991/xyops-python:latest`

This is AI slop but I might use it anyways

## What's inside

- the xyOps shell image
- some more stuff

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
To add more packages, edit the `pip3 install` list in the
[Dockerfile](Dockerfile), then rebuild and push as above.

**I probably won't maintain this.**
