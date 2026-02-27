# Changelog

## 1.0.4

- Fix: `embedding.dimensions` is now parsed robustly (number / numeric string / env-var string), so it properly overrides hardcoded model dims (fixes Ollama `nomic-embed-text` dimension mismatch).

## 1.0.3

- Fix: `memory-revised reembed` no longer crashes (missing `clampInt` helper).

## 1.0.2

- Fix: pass through `embedding.dimensions` to the OpenAI-compatible `/embeddings` request payload when explicitly configured.
- Chore: unify plugin version fields (`openclaw.plugin.json` now matches `package.json`).

## 1.0.1

- Fix: CLI command namespace updated to `memory-revised`.

## 1.0.0

- Initial npm release.
