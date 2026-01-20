# Smart Vulnerability Scanner & Analyzer — Monolithic Edition (SVSA)

Smart Vulnerability Scanner & Analyzer (SVSA) — Monolithic Edition is a single-file Python application that bundles scanning, analysis, storage, reporting, CLI and a small HTTP API into one self-contained tool.

Important Legal Notice
- This tool performs active network and web scanning. You must have explicit written permission from the owner of any system, network, or asset you target. Do NOT scan systems you do not own or have permission to test.
- The tool enforces a consent mechanism: you must pass `--confirm-consent` on the CLI or set the environment variable `SVSA_CONFIRM=1` for programmatic runs. The tool will refuse to run scans otherwise.
- Destructive or exploitative behavior is explicitly disabled. No exploit modules are provided.

Contents
- src/svsa_monolith.py — the whole monolithic app (scanner, analyzer, storage, CLI, API)
- requirements.txt — Python deps
- Dockerfile, docker-compose.yml — for containerized running
- .gitignore, Makefile

Quickstart (local)
1. Create virtualenv (recommended)
   python -m venv .venv
   source .venv/bin/activate

2. Install dependencies
   pip install -r requirements.txt

3. Run a safe scan (consent required)
   python -m src.svsa_monolith scan --target http://example.com --profile safe --confirm-consent

4. Run API server (consent required to allow scans via API)
   export SVSA_CONFIRM=1
   python -m src.svsa_monolith server --host 0.0.0.0 --port 8000

Docker quickstart
1. Build and run:
   docker-compose up --build

2. Use API at http://localhost:8000 (remember env SVSA_CONFIRM is required to allow scan execution)

Security & Usage Notes
- Use non-destructive profiles (`safe`) for public targets.
- Do not use the tool on systems you don't have authorization for.
- The ML model included is a demo (synthetic training). Do not rely on it in production.

Contributing / Next steps
- Break monolith into modules for maintainability.
- Add authentication/RBAC for API.
- Integrate real CVE/NVD sync pipeline and production DB (Postgres).
- Add CI (unit tests, lint) and more realistic ML dataset.


instagram: lz.uf 

discord: f5uk
