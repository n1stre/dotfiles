# Dotfiles

Configuration files to define development environment, configure tools, etc.
Heavily inspired and based on https://github.com/rexim/dotfiles

## Requirements

- Emacs 30+
- OpenCode 1.3.13
- LlamaBarn 0.28.0 (llama.cpp local server)
- Unix-based system (see https://github.com/rexim/dotfiles on how to deploy on Windows)

## Deployment

Add entries to the `deploy.manifest` file in the required format:

```txt
filename1|operation|destination1
filename2|operation|destination2
# ...
# comments are supported
```

Where:
| Segment | Description |
|---------|-------------|
| `filename` | Path to file or folder relative to `deploy.sh` script |
| `operation` | Method of copying. Currently only supports `symlink` |
| `destination` | Target path relative to current user's home directory (`$HOME`) |

Finally run the deploy script:

```sh
chmod +x ./deploy.sh
./deploy.sh
```
