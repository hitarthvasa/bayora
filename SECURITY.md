# Security policy

## Reporting a vulnerability in Bayora

Please do **not** open a public issue for security problems. Report privately through GitHub's "Report a vulnerability" feature on this repository (Security tab), or email the maintainer address listed on the repository profile. Include:

- what you found and where,
- steps to reproduce,
- the impact you expect,
- your version (`bayora --version`).

You should get an acknowledgement within a few days. Please give a reasonable time to fix before disclosing.

## Scope

In scope: authentication bypass, request forgery, injection in the dashboard or reports, path traversal, secret exposure in logs or storage, denial of service from a single small request, and unsafe defaults.

Out of scope: gaps in the guardrail's detection coverage (those are documented in [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md); improvements are welcome as normal pull requests), and findings that need a malicious administrator.

## Supported versions

Only the latest release receives fixes while the project is in alpha.

## Hardening notes

See [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md) and [docs/DEPLOYMENT.md](docs/DEPLOYMENT.md). Run Bayora behind TLS, set a strong `BAYORA_API_KEY`, and keep the data volume encrypted.
