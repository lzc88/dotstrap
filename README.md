# dotstrap

### Overview

Personal repository for dotfile management and personal environment bootstrapping.

```
.dotfiles/
│
├── bootstrap.zsh              # entry point that runs components in setup/
├── Brewfile                   # Homebrew formulae and casks
│
├── setup/                     # bootstrap components (in order)
│   ├── brew.zsh               #   install Homebrew and everything in Brewfile
│   ├── zsh.zsh                #   install oh-my-zsh
│   ├── fonts.zsh              #   install MesloLGS NF
│   └── dotfiles.zsh           #   stow every package in home/
│
├── home/                      # stow packages, each package mirrors ~
│   ├── .stowrc                # --target=~ --no-folding
│   ├── git/
│   └── zsh/
│
└── direnv/                    # not stowed, linked by hand
    └── personal/.envrc        # env variables for personal repos
```

### Dotfile Management with GNU Stow

```zsh
cd "$DOTFILES/home"

stow *(/)        # link every package
stow zsh         # link one package
stow -D zsh      # unlink one package
stow -R zsh      # re-link after adding or removing files in a package
```

- Each folder in `home/` is a Stow package whose contents mirror `~`

- Nothing outside `home/` is linked

- `home/.stowrc` sets `--target=~` and `--no-folding`, allowing the above commands to run from `home/`

### Bootstrapping Environment

```zsh
git clone https://github.com/lzc88/macos-setup.git <path_to_repo>

cd <path_to_repo>

./bootstrap.zsh              # run everything
./bootstrap.zsh brew fonts   # run only some components (brew, fonts)
```

- Homebrew is always installed or checked first, whichever components are chosen

- Each component of the bootstrap process lives in `setup/` and is run in this order:

    - `brew` (apps from `Brewfile`)
    
    - `zsh` (oh-my-zsh)
    
    - `fonts` (MesloLGS NF)
    
    - `dotfiles` (stow)

### Directory Environment (direnv)

```zsh
mkdir -p ~/<path_to_personal_repository>

ln -s "$DOTFILES/direnv/personal/.envrc" ~/<path_to_personal_repository>/.envrc

direnv allow ~/<path_to_personal_repository>
```

- Project-specific environment variables such as `AWS_PROFILE` are not set globally

- `direnv/personal/.envrc` sets the personal profile and applies it to projects under whichever folder you link it into

- A project with its own `.envrc` should start with `source_up` so that it picks up the folder's settings

### Notes

- After running `./bootstrap.zsh`, in a new terminal tab, run this command once to make Homebrew's zsh the default login shell:

```zsh
sudo sh -c "echo $HOMEBREW_PREFIX/bin/zsh >> /etc/shells" && chsh -s "$HOMEBREW_PREFIX/bin/zsh"
```

- The `fonts` component installs MesloLGS NF but does not select it in iTerm2; select it manually:

    - iTerm2 → Settings → Profiles → Text → Font → **MesloLGS NF**