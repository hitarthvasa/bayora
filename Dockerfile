# syntax=docker/dockerfile:1
FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    BAYORA_HOST=0.0.0.0 \
    BAYORA_PORT=8080 \
    BAYORA_DB=/data/bayora.db

WORKDIR /app
COPY pyproject.toml README.md ./
COPY src ./src
RUN pip install . && rm -rf /app/src /app/pyproject.toml /app/README.md /app/build

# Run as an unprivileged user; /data is the only writable path.
RUN useradd --system --uid 10001 --home-dir /nonexistent --shell /usr/sbin/nologin bayora \
    && mkdir /data && chown bayora /data
USER bayora
VOLUME /data
EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8080/healthz', timeout=2)"

# The server refuses to bind a public address without BAYORA_API_KEY.
ENTRYPOINT ["bayora"]
CMD ["serve"]
