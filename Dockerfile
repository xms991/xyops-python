FROM ghcr.io/pixlcore/xyops-shell-image:latest

# These OCI labels show up on the GitHub Packages page: description becomes
# the package description, and source links the package to the repo so the
# repo README is rendered on the package page.
LABEL org.opencontainers.image.source="https://github.com/xms991/xyops-python" \
      org.opencontainers.image.description="xyOps shell image with Python 3.11 and popular data/utility libraries (pandas, numpy, requests, httpx, boto3, sqlalchemy, and more) preinstalled." \
      org.opencontainers.image.licenses="MIT"

# Base image is Debian 12 (bookworm) with Python 3.11 preinstalled.
# Debian 12 enforces PEP 668, so pip needs --break-system-packages to
# install into the system site-packages (fine inside a container).

RUN apt-get update \
    && apt-get install -y --no-install-recommends python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir --break-system-packages \
    requests \
    httpx \
    pandas \
    numpy \
    pyyaml \
    jinja2 \
    click \
    rich \
    tabulate \
    pydantic \
    python-dotenv \
    boto3 \
    sqlalchemy

# Add any extra packages to the list above, then rebuild.
