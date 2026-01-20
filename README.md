# code-cli-tunnel
Prepare your remote Compute Instance with code-cli tunneling capability 

## Install micromamba

Recommended install method (official docs): https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html

Run this in your remote instance (bash):

```bash
"${SHELL}" <(curl -L https://micro.mamba.pm/install.sh)
# accept defaults (bin: ~/.local/bin, init shell: yes, root prefix: ~/micromamba, conda-forge: yes)
source ~/.bashrc
micromamba --version
```

If you skipped shell init (or need to re-run it):

```bash
~/.local/bin/micromamba shell init --shell bash --root-prefix ~/micromamba
source ~/.bashrc
```

## Web Search in Codex

> web_search is deprecated; use the web_search_request feature flag instead.

in the `~/.codex/config.toml`

```toml
[features]
web_search_request = true        # allow the model to request web searches
```
