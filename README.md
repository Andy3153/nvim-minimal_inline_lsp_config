# Minimal configuration for inline errors/LSP virtual text inside Neovim
## Introduction
This is a minimal configuration for Neovim in order to get inline errors working inside Neovim.

## Why did I make this?
The reason I made this is because, when I wanted to do this, I really wanted something like this to exist. And now that I got it working, I created it for other people to find and use as a starting point.

## How it works
Due to the current way I configured it for now, it'll quit once by itself, then you should **re-run it three times**. Why?

- Once, so that `plug.vim` installs the plugins needed
- A second time, so that `nvim-lsp-installer` installs the LSP servers (check installation progress by using `:LspInstallInfo`)
- And then, if you run it a third time, the LSP servers will load

## Contributing
I am extremely open to suggestions and contributions on this, I know the plugin automation and `plug.vim` bootstrapping is basically held together by electrical tape, if there's anyone who knows how to do any of this better, please inform me.
