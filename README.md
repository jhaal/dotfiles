# Dotfiles

A modern, version-controlled dotfiles repository for reproducible Linux workstation setup.

## About

This repository manages personal configuration for:

- Bash
- Vim
- Emacs
- i3

The goal is to keep configuration **portable**, **reviewable**, and **easy to debug** across machines.

## Standards

This project follows current configuration and scripting best practices:

- Prefer maintained platform versions (Debian 12+, Ubuntu 22.04+, Fedora/RHEL current supported releases).
- Keep changes atomic and commit them with clear messages.
- Use documented defaults and avoid hidden side effects.
- For shell scripts, use strict mode (`set -euo pipefail`) and lint with `shellcheck`.
- Prefer POSIX-compliant shell syntax where feasible; use Bash-specific features only when required and document them.
- Use modern command substitution (`$(...)`) and quote variable expansions to prevent word-splitting bugs.
- Prefer XDG-compatible paths when possible.

## 2026 Repository Audit Summary

Audit date: **2026-04-29**

- The repository currently contains documentation only (`README.md`) and no executable scripts or source-code modules.
- No language-level migrations were required at this time because there is no code to update.
- The documented shell guidance has been tightened to align with current shell scripting best practices.

### Numerical Model Benchmarking Recommendations

When numerical-model code is added, benchmark with:

- **Python:** `pytest-benchmark` (microbenchmarks), `asv` (regression/perf tracking across commits).
- **C/C++:** Google Benchmark for stable CPU microbenchmarks.
- **Rust:** Criterion.rs for statistically robust benchmark runs.

Track at minimum:

- Wall-clock runtime
- Memory usage (peak RSS)
- Throughput (iterations/sec or samples/sec)
- Numerical stability drift versus known reference outputs

### Parallelization Recommendations for Numerically Heavy Workloads

When numerical workloads are introduced:

- Use data parallelism first (independent vectors/matrices/chunks).
- Prefer high-level runtimes:
  - Python: NumPy vectorization, Numba, multiprocessing, or Dask for larger graphs.
  - C/C++: OpenMP/TBB for shared-memory parallel loops.
  - Rust: Rayon for ergonomic parallel iterators.
- Validate scaling with strong- and weak-scaling tests before production rollout.
- Add deterministic test fixtures to confirm parallel and serial outputs match within numeric tolerance.

## Repository Layout

Place dotfiles and supporting scripts using a predictable structure, for example:

```text
.
├── bash/
├── vim/
├── emacs/
├── i3/
└── scripts/
```

## Installation

1. Clone the repository.

   ```bash
   git clone <repo-url> "$HOME/dotfiles"
   cd "$HOME/dotfiles"
   ```

2. Back up existing configuration before applying new files.

   ```bash
   mkdir -p "$HOME/.config-backup"
   ```

3. Link files incrementally to simplify debugging.

   ```bash
   # Example only — adapt to your actual file layout
   ln -sfn "$HOME/dotfiles/bash/.bashrc" "$HOME/.bashrc"
   ```

## Debugging and Validation

Use these checks after updates:

```bash
# Shell script quality
shellcheck scripts/*.sh

# Validate symlinks
find "$HOME" -maxdepth 2 -type l -lname '*dotfiles*'

# Confirm git working tree state
git status --short
```

## Contributing

1. Open an issue for major changes.
2. Keep pull requests scoped and testable.
3. Include rationale and validation steps in every PR.

## License

MIT License.
