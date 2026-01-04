# hetGE Homebrew Tap

Private Homebrew tap for hetGE tools.

## Prerequisites

Before installing, configure npm for GitHub Packages:

```bash
pnpm config set -g @hetge:registry https://npm.pkg.github.com
pnpm config set -g //npm.pkg.github.com/:_authToken "$(gh auth token)"
```

## Installation

```bash
# Add the tap (requires GitHub access)
brew tap hetge/tap git@github.com:hetGE/homebrew-tap.git

# Install hetge-cli
brew install hetge-cli
```

## Available Formulas

| Formula | Description |
|---------|-------------|
| `hetge-cli` | Unified CLI for hetGE projects - env management, Docker builds, and Dokploy deployments |

## Requirements

- Node.js (installed automatically as dependency)
- GitHub CLI (`gh`) - for authentication
- 1Password CLI (`op`) - for secrets management
- env2op CLI (`env2op`, `op2env`) - for 1Password env sync

Install all requirements:

```bash
brew install gh 1password-cli tolgamorf/tap/env2op-cli
```
