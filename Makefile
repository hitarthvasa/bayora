.PHONY: install test lint demo serve gate docker clean

install:
	pip install -e ".[dev]"

test:
	python -m unittest discover -s tests -v

lint:
	ruff check src tests

demo:            ## run the suite against the vulnerable demo bot, then the guarded one
	bayora run --target demo:vulnerable --no-store
	bayora run --target demo:vulnerable --guardrail --no-store

serve:           ## dashboard at http://127.0.0.1:8080
	bayora serve

gate:            ## what CI runs: fails if the guarded hardened demo drops below a 90 score
	bayora run --target demo:hardened --guardrail --no-store --quiet --fail-under 90 --fail-on high

docker:
	docker compose up --build

clean:
	rm -rf build dist src/*.egg-info .ruff_cache data
