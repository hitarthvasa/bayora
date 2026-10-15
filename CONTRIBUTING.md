# Contributing

Thanks for helping make AI systems more robust. Please read [docs/RESPONSIBLE_USE.md](docs/RESPONSIBLE_USE.md) first.

## Setup

```bash
python3 -m venv .venv && . .venv/bin/activate
pip install -e ".[dev]"
make test      # python -m unittest discover -s tests -v
make lint      # ruff check src tests
```

All tests run offline. Network behaviour is tested against local fake servers in `tests/helpers.py`.

## Adding an attack

1. Add it to a YAML file in `src/bayora/attacks/library/` (or your own directory for local use). See [docs/ATTACK_LIBRARY.md](docs/ATTACK_LIBRARY.md).
2. It must ask for a **harmless canary or marker**. No real exploit code, no harmful instructions, no personal data.
3. Run `bayora attacks validate`.
4. Run the demo targets and check the result is what you expect. If the new attack changes the demo scores, update the expectations in `tests/test_runner_scoring.py` and the table in the README.

## Changing the guardrail

- Add a test for every new rule, with at least one input it must catch **and** one benign input it must allow.
- If you close one of the documented gaps, update `test_known_gaps_are_documented_gaps` and `docs/THREAT_MODEL.md`.
- Keep false positives in mind. The benign controls exist for this reason.

## Pull request checklist

- [ ] Tests added or updated, and `make test` passes
- [ ] `make lint` passes
- [ ] No secrets, real personal data, or harmful payloads
- [ ] Docs and the changelog updated if behaviour changed

## Style

Plain Python, standard library first, type hints on public functions, short functions with a docstring where intent is not obvious. Prefer a small, well-tested change over a large one.
