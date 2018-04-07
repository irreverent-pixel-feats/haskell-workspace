# Haskell Workspace

An example of a version controlled workspace for persistent config and caching across instances
of one our [Dockerised Haskell dev environments](https://hub.docker.com/r/irreverentpixelfeats/dev-haskell/).

It's not the best solution and is usually only used while getting someones local dev environment setup,
trialing a update to compilers and build tools or experiencing instability in local dev environments.

A more performant alternative that might allow for day to day development might be Nix but we haven't really
looked into it.

Provides config and a place for persistent storage for:

- `emacs`
- `spacemacs`
- `neovim`
- `cabal`
- [`mafia`](https://github.com/haskell-mafia/mafia)
    - We don't use `stack`, for reasons.
