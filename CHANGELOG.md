# Changelog

## 0.1.0 (alpha)

First release.

- Attack library: 32 attacks in 7 categories plus 8 benign controls, validated at load time
- Canary-based judge with 9 detectors
- Guardrail engine: input and output policy, redaction, protected strings, tool-call policy, custom YAML policies
- Targets: OpenAI-compatible, Anthropic Messages, generic JSON, Python callable, and three offline demo assistants
- Runner with concurrency, retries, repeats and error containment
- Scoring, grade caps, false-positive rate, CI gates and exit codes, run comparison
- SQLite storage with versioned schema
- Reports in Markdown, HTML and JSON
- HTTP server: dashboard, JSON API, guard API, OpenAI-compatible guarded proxy, API-key auth, rate limiting, request limits, timeouts, security headers, Prometheus counters, health endpoints
- CLI: `run`, `attacks`, `guard`, `serve`, `runs`, `report`, `compare`
- Docker image, compose file, GitHub Actions CI
