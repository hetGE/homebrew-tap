# hetGE Homebrew Tap

Homebrew tap for hetGE tools.

## Installation

```bash
export HOMEBREW_GITHUB_API_TOKEN=$(gh auth token)
brew install hetge/tap/hetge-cli
```

## Available Formulas

| Formula                                           | Description                                                                             |
|---------------------------------------------------|-----------------------------------------------------------------------------------------|
| [`hetge-cli`](https://github.com/hetGE/hetge-cli) | Unified CLI for hetGE projects - env management, Docker builds, and Dokploy deployments |

## Requirements

- Node.js (installed automatically as dependency)
- GitHub CLI (`gh`) - for authentication
- 1Password CLI (`op`) - for secrets management
- env2op CLI (`env2op`, `op2env`) - for 1Password env sync

Install all requirements:

```bash
brew install gh 1password-cli tolgamorf/tap/env2op-cli
```
