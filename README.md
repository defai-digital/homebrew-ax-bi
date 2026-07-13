# homebrew-ax-bi

Homebrew tap for **[AX BI](https://github.com/defai-digital/ax-bi)** Desktop (`AX BI.app`).

## Install

```bash
brew install --cask defai-digital/ax-bi/ax-bi
```

Or:

```bash
brew tap defai-digital/ax-bi
brew install --cask ax-bi
```

## Upgrade / uninstall

```bash
brew upgrade --cask ax-bi
brew uninstall --cask ax-bi
brew untap defai-digital/ax-bi
```

## What this installs

- **AX BI.app** — Tauri desktop shell for the AX BI analytics platform
- Runtime formulas: `colima`, `docker`, `docker-compose` (local instance launcher)

The cask is updated automatically by the AX BI Desktop release workflow when a
signed, notarized macOS DMG is published.

## Verify a release asset (optional)

Release assets on GitHub may include detached minisign signatures (`.minisig`).
See [ax-bi-desktop/RELEASE.md](https://github.com/defai-digital/ax-bi/blob/main/ax-bi-desktop/RELEASE.md).

## Source

- App: https://github.com/defai-digital/ax-bi/tree/main/ax-bi-desktop
- Releases: https://github.com/defai-digital/ax-bi/releases
