### Config files

##### Config files for:

  * Vim/NeoVim
  * Alacritty

##### Requirements:
  * Hack NF font:

  `https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack`

##### Setup ElixirLS

###### Start by building a binary of ElixirLS from its source:

    git clone https://github.com/elixir-lsp/elixir-ls.git ~/.elixir-ls
    cd ~/.elixir-ls
    mix deps.get && mix compile && mix elixir_ls.release -o release

###### Afterwards, create or update your coc-settings file and add this line:

    {
        "elixir.pathToElixirLS": "~/.elixir-ls/release/language_server.sh"
    }
