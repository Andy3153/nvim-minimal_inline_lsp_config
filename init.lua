-- vim:fileencoding=utf-8:foldmethod=marker
--
-- Minimal working configuration to get working inline errors/LSP virtual text in Neovim
-- by Andy3153
--

-- Add here all the LSPs you want, see :LspInstallInfo or github.com/williamboman/nvim-lsp-installer#available-lsps
lspservers_to_install =
{
  -- Examples:
  'clangd',     -- C/C++
  'pylsp',      -- Python
  'sumneko_lua' -- Lua
}

-- {{{ Setting the environment up
vim.fn.setenv("NVIM_DATA_FOLDER", vim.fn.stdpath('data'))
vim.fn.setenv("AUTOLOAD_FOLDER",  vim.fn.getenv('NVIM_DATA_FOLDER') .. "/site/autoload/")
vim.fn.setenv("PLUG_FOLDER",      vim.fn.getenv('AUTOLOAD_FOLDER')  .. "/plugged/")

-- {{{ Installing plugins
-- Feel free to do this however you please, with whatever package manager you like
vim.cmd [[
  " Bootstraps plug.vim
  if empty(glob('$AUTOLOAD_FOLDER/plug.vim'))
    silent !curl -fLo $AUTOLOAD_FOLDER/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    silent !touch $AUTOLOAD_FOLDER/.setup-needed
    autocmd VimEnter * q
  endif

  " Plugin list
  call plug#begin('$PLUG_FOLDER')
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
  call plug#end()

  " Installs plugins after plug.vim was downloaded
  if empty(glob('$AUTOLOAD_FOLDER/.setup-needed'))
  else
    autocmd VimEnter * PlugInstall
    silent !rm $AUTOLOAD_FOLDER/.setup-needed
  endif
]]
-- }}}
-- }}}

-- {{{ Setting up plugins
require("nvim-lsp-installer").setup({ ensure_installed = lspservers_to_install })

-- Forloop that enables all LSPs mentioned in the lspservers_to_install array
for _, lsp in ipairs(lspservers_to_install) do
  require('lspconfig')[lsp].setup{sdf="sdf"} -- don't even ask me why anything is required in there, it won't work without it
end
-- }}}
