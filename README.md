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

## Non-interactive bash (CI / scripts / `bash -c`)

Non-interactive `bash` does **not** source `~/.bashrc`, so `~/.local/bin` may be missing from `PATH`.

Use `BASH_ENV` to source a small env patch:

```bash
BASH_ENV="$(pwd)/noninteractive-bash-env.sh" bash -c 'command -v micromamba && micromamba --version'
```

If you control the command being executed, you can also wrap it:

```bash
./with-micromamba micromamba --version
./with-micromamba micromamba run -n base python --version
```

### Downgrade base to Python 3.12 and register a Jupyter kernel

```bash
micromamba install -n base -c conda-forge "python=3.12" ipykernel -y
micromamba run -n base python --version
micromamba run -n base python -m ipykernel install --user --name micromamba-base --display-name "Python (micromamba base)"
jupyter kernelspec list
```

## Web Search in Codex

> web_search is deprecated; use the web_search_request feature flag instead.

in the `~/.codex/config.toml`

```toml
[features]
web_search_request = true        # allow the model to request web searches
```
