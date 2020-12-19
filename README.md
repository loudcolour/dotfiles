# .files

## Set up ZSH

1. Make symlink `.zshrc` linked to path to `dotfiles/zshrc/zshrc` by
`ln -s path/to/dotfiles/zshrc/zshrc ~/.zshrc`
1. Install [Oh My ZSH!](https://ohmyz.sh/)
1. Install [Zplug](https://github.com/zplug/zplug), then run `zplug install`
1. Install [FZF](https://github.com/junegunn/fzf) w/ shell extensions for key bindings & fuzzy auto-complete.

Variable for `path/to/dotfiles` is set on `.zshrc`, which means accessing `path/to/dotfiles`
by `$DOTFILES` is available for further steps.

## Set up LaTeX

To use preamble in LaTeX document, make a symlink of preamble file
in working directory, and put `\include{preamble_ko}`.
When using this preamble in English or Japanese document,
use `preamble_en` or `preamble_ja` instead of
`preamble_ko`.

## Set up Vim / Neovim

1. Make symlink `.vimrc` linked to path to `$DOTFILES/vimrc/vimrc` by
`ln -s $DOTFILES/vimrc/vimrc ~/.vimrc` for Vim.
`ln -s $DOTFILES/vimrc/vimrc ~/.config/nvim/init.vim` for Neovim instead.
1. For Neovim, install `pynvim` with pip by `pip install pynvim`.
1. Install [Vim-Plug](https://github.com/junegunn/vim-plug), then run `:PlugInstall`.
1. Install [CoC](https://github.com/neoclide/coc.nvim) extensions.

## Set up iTerm 2

Just import json file to iTerm 2. That's it. 😉

## Set up Hammerspoon

Make symlink `init.lua` linked to path to `$DOTFILES/hammerspoon/init.lua` by
`ln -s $DOTFILES/hammerspoon/init.lua ~/.hammerspoon/init.lua`

## Set up Visual Studio Code

Make symlink `~/.config/Code\ -\ OSS/User/settings.json` linked to path to `$DOTFILES/vscode/settings.json`
by `ln -s $DOTFILES/vscode/settings.json ~/.config/Code\ -\ OSS/User/settings.json`,
and make symlink `~/.config/Code\ -\ OSS/User/snippets` linked to path to
`$DOTFILES/vscode/snippets` by `ln -s $DOTFILES/vscode/snippets ~/.config/Code\ -\ OSS/User/snippets`
Then, install these plug-ins below.

- CodeLLDB
- Python
- Rust (rls)
- Japanese Language Package
- Korean Language Package
- LaTeX Workshop
- markdownlint
- Markdown+Math
- Polacode

## Set up Firefox

- In Firefox, there exists a chance that images and elements rendered have
inaccurate and over-saturated colours.
By configuring from `about:config` on colour management, over-saturated colours
can be corrected. ([Reference](https://cameratico.com/guides/firefox-color-management/))
- Enable [DNS-over-HTTPS](https://support.mozilla.org/en-US/kb/firefox-dns-over-https)
- Enable [Encrypted SNI](https://blog.cloudflare.com/encrypted-sni/)
- Install Add-ons, 1Password/1Password X, DuckDuckGo Privacy Essentials, Enhancer for YouTube,
  Firefox Multi-Account Containers, Grammarly, Mailvelope, Popup Blocker, etc.
- Connect Mailvelope to GnuPG
- Import bookmarks

## Build Iosevka with cherry-picked glyphs

Clone [be5invis/Iosevka](https://github.com/be5invis/Iosevka.git) and create
a symlink to `iosevka/private-build-plans.toml` in root directory of repo.
Then follow the [instructions](https://github.com/be5invis/Iosevka#building-from-source).

## KDE font configuration

Copy `kde/00usersettings.conf` to `/etc/fonts/conf.d`.

