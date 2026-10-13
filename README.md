# Mi Vim Personal — A Modern Vim Development Environment

A personalized Vim development environment designed to make editing code more accessible, organized, and efficient. This project enhances the traditional Vim experience with a custom interface, keyboard shortcuts, file management, code execution, syntax highlighting, and development tools powered by plugins.

The configuration was developed and tested in a Linux terminal environment running Ubuntu through Windows Subsystem for Linux (WSL).

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technologies and Plugins](#technologies-and-plugins)
- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration Structure](#configuration-structure)
- [Keyboard Shortcuts](#keyboard-shortcuts)
- [Available Commands](#available-commands)
- [How the Code Works](#how-the-code-works)
- [Supported Languages](#supported-languages)
- [Troubleshooting](#troubleshooting)
- [Future Improvements](#future-improvements)

## Overview

Vim is a powerful text editor, but its traditional interface and keyboard-driven workflow can be difficult for new users.

Mi Vim Personal addresses this challenge by introducing familiar editing shortcuts, a custom status bar, a startup dashboard, an integrated file explorer, and a terminal workflow for executing code.

The goal is to preserve Vim's speed and flexibility while creating an environment that feels more intuitive to use.

This project focuses on Vimscript, terminal integration, plugin management, and workflow customization.

## Features

- **Custom interface:** A dark color scheme inspired by Catppuccin, with personalized syntax highlighting.
- **Startup dashboard:** A welcome screen with shortcuts to common actions.
- **File explorer:** Browse directories and manage files using netrw.
- **File creation:** Create new files with predefined templates for supported languages.
- **Integrated terminal:** Execute code without leaving the editor.
- **Code navigation:** Move between buffers, windows, and sections of code using keyboard shortcuts.
- **Search tools:** Find files and search for text throughout a project.
- **Code completion:** Language-aware suggestions, navigation, and symbol renaming through CoC.
- **Git integration:** Display Git change indicators alongside line numbers.
- **Persistent undo:** Preserve undo history between editing sessions.
- **Custom scrollbar:** Display a visual indicator of the current position in long files.
- **Conventional shortcuts:** Use familiar combinations such as `Ctrl+C`, `Ctrl+V`, `Ctrl+Z`, and `Ctrl+S`.
- **Automatic formatting support:** Configure indentation and remove trailing whitespace when saving supported files.

## Technologies and Plugins

### Technologies

| Technology | Purpose |
|---|---|
| Vimscript | Configure the editor, functions, commands, and key mappings. |
| Vim | Core text editor. |
| Ubuntu | Linux environment used for development. |
| WSL | Run Ubuntu within Windows. |
| Git | Version control and change tracking. |
| vim-plug | Install and manage Vim plugins. |
| Bash | Execute commands in the integrated terminal. |

### Plugins

| Plugin | Purpose |
|---|---|
| [coc.nvim](https://github.com/neoclide/coc.nvim) | Code completion, diagnostics, navigation, and language features. |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy-search engine for finding files and other items. |
| [fzf.vim](https://github.com/junegunn/fzf.vim) | Integrates fzf search functionality into Vim. |
| [vim-commentary](https://github.com/tpope/vim-commentary) | Comment and uncomment code. |
| [vim-sneak](https://github.com/justinmk/vim-sneak) | Quickly navigate to character combinations. |
| [vim-gitgutter](https://github.com/airblade/vim-gitgutter) | Show Git changes in the sign column. |
| [Catppuccin](https://github.com/catppuccin/vim) | Color theme support. |
| [vim-which-key](https://github.com/liuchengxu/vim-which-key) | Display available key mappings. |
| [vim-startify](https://github.com/mhinz/vim-startify) | Provide a customizable startup screen. |
| [auto-pairs](https://github.com/jiangmiao/auto-pairs) | Automatically insert matching brackets and delimiters. |
| [undotree](https://github.com/mbbill/undotree) | Visualize undo history. |

The configuration also uses Vim's built-in features, including netrw, buffers, windows, quickfix, terminal support, syntax highlighting, and autocommands.

## Requirements

Before installing the configuration, make sure the following components are available.

- Ubuntu running through WSL, or another compatible Linux environment.
- Vim with support for terminal buffers, popup windows, and text properties.
- Git.
- curl.
- Node.js and npm for coc.nvim.
- ripgrep (`rg`) for project-wide text search.
- fzf and vim-plug for plugin installation.
- Language interpreters or compilers for the languages you want to execute.

For the custom terminal, scrollbar, and cursor behavior, a sufficiently recent Vim build is recommended. Check the available features before proceeding.

## Installation

### 1. Install or open Ubuntu through WSL

If Ubuntu is already installed, open it from Windows Terminal, CMD, or PowerShell.

If WSL is not installed, open PowerShell as an administrator and run:

```powershell
wsl --install -d Ubuntu
```

Restart Windows if prompted, then complete Ubuntu's initial setup.

Verify the environment:

```bash
uname -a
lsb_release -a
```

### 2. Update Ubuntu

Inside the Ubuntu terminal, run:

```bash
sudo apt update
sudo apt upgrade -y
```

### 3. Install the basic dependencies

```bash
sudo apt install -y \
    vim \
    git \
    curl \
    ripgrep \
    fzf \
    build-essential \
    python3 \
    nodejs \
    npm \
    lua5.4
```

These packages provide Vim, Git, search utilities, C/C++ compilers, Python, Node.js, and Lua.

Depending on your Ubuntu version, the installed Node.js version might be too old for the current CoC release. If that happens, install a compatible supported Node.js version before continuing.

### 4. Verify Vim's capabilities

Run:

```bash
vim --version
```

Look for features such as:

- `+terminal`
- `+popupwin`
- `+textprop`
- `+timers`
- `+job`

The custom terminal and scrollbar depend on features that might not be present in every Vim build.

### 5. Back up your existing configuration

If you already have a `.vimrc`, create a backup before replacing it:

```bash
[ ! -f ~/.vimrc ] || cp ~/.vimrc ~/.vimrc.backup
```

This preserves your previous configuration.

### 6. Install vim-plug

Run:

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

This installs the plugin manager used by the configuration.

### 7. Add the project configuration

Create or open the Vim configuration file:

```bash
vim ~/.vimrc
```

Copy the project's Vimscript configuration into this file and save it.

In Vim, press `Esc`, then type:

```vim
:wq
```

Press `Enter` to save and exit.

**Important:** The configuration must be saved as `~/.vimrc` inside Ubuntu, not as a Windows-side configuration file, if you intend to run it in WSL.

### 8. Install the plugins

Open Vim:

```bash
vim
```

Execute:

```vim
:PlugInstall
```

Wait until the plugin installation finishes, then restart Vim.

### 9. Install CoC language extensions

Open Vim and execute:

```vim
:CocInstall coc-pyright coc-clangd coc-tsserver coc-sh coc-json
```

These extensions provide language features for Python, C/C++, JavaScript/TypeScript, shell scripts, and JSON.

Some extensions require additional language servers or compilers. For example, `clangd` may need to be installed separately for C/C++ support.

### 10. Verify the configuration

Run the following checks inside Vim:

```vim
:echo $MYVIMRC
:MiEditorInfo
:PlugStatus
```

Confirm that the configuration file is loaded and the plugins are available.

Test the following features:

1. Open the file explorer with `,e`.
2. Create a file with `,n`.
3. Save a file with `Ctrl+S`.
4. Execute a supported program with `F5`.
5. Close the execution terminal with `F6`.
6. Search for files with `Ctrl+P`.

If the features work correctly, the basic installation is complete.

## Configuration Structure

The `.vimrc` file is divided into functional sections.

| Section | Responsibility |
|---|---|
| Initialization | Set encoding, compatibility, leader key, syntax, and filetype detection. |
| Plugin management | Declare plugins and initialize vim-plug. |
| General options | Configure numbering, indentation, search, scrolling, and editing behavior. |
| Undo persistence | Create the undo directory and preserve undo history. |
| Colors and interface | Customize syntax highlighting, menus, separators, and interface elements. |
| File explorer | Configure netrw and its behavior. |
| Status bar | Display the current mode, filename, modification state, line, column, and progress. |
| Navigation | Define shortcuts for windows, buffers, folds, and moving lines. |
| File management | Implement file creation, templates, opening, and saving. |
| Code execution | Select an execution command based on the current filetype and manage the terminal. |
| Project search | Search file contents and display results through quickfix. |
| Dashboard | Display the welcome screen and its shortcuts. |
| Custom scrollbar | Render a popup scrollbar and support mouse navigation. |
| CoC integration | Configure completion, definitions, references, and symbol renaming. |
| Buffer tabline | Display open buffers and allow users to switch between them. |
| Cursor behavior | Change the cursor shape according to the editing mode. |

## Keyboard Shortcuts

The leader key is configured as a comma (`,`). For example, `,e` means pressing the comma key followed by `e` in Normal mode.

### File Management

| Shortcut | Action |
|---|---|
| `,e` | Open the file explorer. |
| `,n` | Create a new file, optionally with a language template. |
| `,f` | Open a file by entering its path. |
| `,w` | Save the current file. |
| `Ctrl+S` | Save the current file. |
| `,x` | Close the current buffer. |
| `Tab` | Switch to the next buffer. |
| `Shift+Tab` | Switch to the previous buffer. |
| `,b` | Open the fzf buffer picker. |
| `,q` | Close the current window. |

### Editing

| Shortcut | Action |
|---|---|
| `Ctrl+C` | Copy the current visual selection. |
| `Ctrl+X` | Cut the current visual selection. |
| `Ctrl+V` | Paste clipboard content in Insert or Command mode. |
| `Ctrl+Z` | Undo the most recent change. |
| `Ctrl+Y` | Redo a change, with special handling for completion in Insert mode. |
| `Ctrl+A` | Select the entire file. |
| `,d` | Duplicate the current line. |
| `, +` | Increment the number under the cursor. |
| `, -` | Decrement the number under the cursor. |
| `,v` | Enter Visual Block mode. |
| `Alt+J` | Move the current line or selection down. |
| `Alt+K` | Move the current line or selection up. |
| `Shift+Left/Right/Up/Down` | Extend a selection using the arrow keys. |
| `<` / `>` in Visual mode | Indent or unindent the selection while keeping it selected. |

### Navigation and Windows

| Shortcut | Action |
|---|---|
| `Ctrl+H` | Move to the window on the left. |
| `Ctrl+J` | Move to the window below. |
| `Ctrl+K` | Move to the window above. |
| `Ctrl+L` | Move to the window on the right. |
| `Alt+Left` | Reduce window width. |
| `Alt+Right` | Increase window width. |
| `Alt+Up` | Increase window height. |
| `Alt+Down` | Reduce window height. |
| `,z` | Toggle the fold under the cursor. |
| `,zo` | Open all folds in the current window. |
| `,zc` | Close all folds in the current window. |
| `,h` | Clear search highlighting. |
| `,s` | Toggle the custom scrollbar. |

### Code Execution and Search

| Shortcut | Action |
|---|---|
| `F5` | Execute the current supported file. |
| `F6` | Close the execution terminal. |
| `Ctrl+P` | Search for files using fzf. |
| `Ctrl+T` | Open the fzf.vim text search interface. |
| `,/` | Open the `Rg` search interface. |
| `,o` | Open the quickfix window. |
| `,c` | Close the quickfix window. |
| `]q` | Move to the next quickfix result. |
| `[q` | Move to the previous quickfix result. |

### Code Intelligence

| Shortcut | Action |
|---|---|
| `K` | Display documentation or hover information for a symbol. |
| `,gd` | Go to a symbol's definition. |
| `,gr` | Find references to a symbol. |
| `,gi` | Go to a symbol's implementation. |
| `,rn` | Rename a symbol using CoC. |
| `Tab` in Insert mode | Confirm a completion when the CoC completion menu is visible; otherwise handle indentation or completion refresh. |

### Dashboard

When Vim opens without a filename, the dashboard displays these actions:

| Key | Action |
|---|---|
| `e` | Open the file explorer. |
| `n` | Create a new file. |
| `f` | Open a file by path. |
| `h` | Open Vim's built-in help index. |
| `q` | Quit all Vim windows. |

**Note:** Some shortcuts depend on terminal support, plugin availability, and the active Vim mode. The mappings are defined by the configuration and may behave differently from their counterparts in graphical editors.

## Available Commands

These are commands that can be entered directly in Vim's command line. Press `Esc`, type the command, and press `Enter`.

| Command | Description |
|---|---|
| `:PlugInstall` | Install the declared plugins. |
| `:PlugStatus` | Display plugin installation status. |
| `:Lexplore` | Open the built-in file explorer. |
| `:Files` | Search for files through fzf.vim. |
| `:Buffers` | Display open buffers through fzf.vim. |
| `:Rg` | Search text using ripgrep through fzf.vim. |
| `:copen` | Open the quickfix results window. |
| `:cclose` | Close the quickfix results window. |
| `:cnext` | Move to the next quickfix result. |
| `:cprevious` | Move to the previous quickfix result. |
| `:MiEditorInfo` | Display Vim's version, configuration path, current file, and filetype. |
| `:w` | Save the current file. |
| `:q` | Quit the current window when possible. |
| `:qa` | Quit all windows. |
| `:help index` | Open Vim's built-in help index. |
| `:UndotreeToggle` | Toggle the undo history interface provided by undotree. |
| `:Commentary` | Comment or uncomment text using vim-commentary. |

Some commands require their corresponding plugins to be installed. For example, `:Rg` depends on fzf.vim and ripgrep, while `:UndotreeToggle` depends on undotree.

## How the Code Works

### 1. Initialization and editor options

The configuration begins by setting Vim's compatibility mode, encoding, terminal colors, and leader key.

```vim
set nocompatible
set encoding=utf-8
set termguicolors
set background=dark
let mapleader = ","
syntax enable
filetype plugin indent on
```

These settings establish the environment before the rest of the configuration is applied.

The general options then configure line numbering, indentation, search behavior, scrolling, folds, and other editing preferences.

### 2. Plugin management

The configuration uses vim-plug to declare and install external plugins.

```vim
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()
```

Each `Plug` declaration identifies a plugin repository. The plugin manager downloads and maintains these plugins in the configured directory.

The actual project configuration contains additional plugins for navigation, Git integration, colors, completion, and editing.

### 3. Custom interface

The `highlight` commands define foreground colors, background colors, and text styles for Vim's interface.

The status bar is built from a custom Vimscript function:

```vim
function! MiModo()
    let l:modo = mode()

    if l:modo ==# 'n'
        return ' NORMAL '
    elseif l:modo ==# 'i'
        return ' INSERT '
    elseif l:modo ==# 'v'
        return ' VISUAL '
    else
        return ' VIM '
    endif
endfunction
```

The actual configuration includes additional mode checks. The statusline calls this function to display the current editing mode.

Other functions construct the dashboard, buffer tabline, and scrollbar.

### 4. Keyboard mappings

Commands such as `nnoremap`, `inoremap`, `vnoremap`, and `tnoremap` assign actions to keyboard combinations in different modes.

For example:

```vim
nnoremap <leader>e :Lexplore<CR>
nnoremap <leader>w :call MiGuardar()<CR>
nnoremap <F5> :call MiEjecutar()<CR>
```

These mappings allow users to perform common operations without repeatedly typing full Vim commands.

The `<leader>` notation represents the configured comma key.

### 5. File creation and templates

The `g:mi_plantillas` dictionary stores starter code for supported file extensions.

When `MiNuevoArchivo()` runs, it:

1. Requests a filename.
2. Requests a language if the filename has no extension.
3. Converts recognized aliases, such as `python` to `py`.
4. Creates missing parent directories.
5. Opens the file.
6. Inserts the corresponding template if the file is new and a template exists.

The function `MiBuscarArchivo()` opens a file by path, while `MiGuardar()` saves the current buffer or requests a destination for an unnamed file.

### 6. Code execution and terminal management

The `g:mi_runners` dictionary associates Vim filetypes with execution commands.

For example:

```vim
let g:mi_runners = {
    \ 'python': 'python3 %s',
    \ 'sh': 'bash %s',
    \ 'javascript': 'node %s',
    \ 'lua': 'lua %s',
    \ }
```

The `%s` placeholder is replaced with the current file's escaped absolute path.

When the user presses `F5`, `MiEjecutar()` saves the current file, checks whether its filetype has a registered runner, prepares the execution command, and sends it to a terminal buffer.

The function keeps track of the most recent command, working directory, and terminal buffer. This allows subsequent executions to reuse the terminal instead of creating a new one every time.

`MiCerrarResultado()` closes the tracked terminal buffer when the user presses `F6`.

### 7. Project search and quickfix

The configuration combines fzf.vim with Vim's quickfix system.

fzf provides interactive file and text search. Quickfix provides a separate window for displaying and navigating search results.

The custom `MiBuscarProyecto()` function uses `vimgrep` to search files and populate quickfix. The configured key mappings also provide access to the plugin's `:Rg` interface.

### 8. Custom scrollbar

The scrollbar is implemented using Vim popup windows and text properties.

The code calculates the visible window height, total number of lines, scrollbar thumb size, and the current scroll position.

The thumb is displayed as a block within a vertical track. Mouse events allow the user to click or drag the scrollbar to navigate through the file.

The `MiScrollbarToggle()` function enables or disables this feature.

This implementation depends on Vim builds that support popup windows and text properties.

### 9. Completion and code navigation

CoC integrates language servers and completion extensions into Vim.

The configuration provides shortcuts for definitions, references, implementations, hover documentation, and symbol renaming.

The Insert-mode `Tab` mapping checks whether the completion menu is visible. If it is, the selected completion is confirmed. Otherwise, the mapping handles indentation or requests updated completion suggestions.

### 10. Buffer tabline

The `MiTabline()` function reads the list of listed buffers, skips terminal buffers, and displays each remaining buffer's filename.

It also marks modified buffers and highlights the active one.

The `MiTabClick()` function handles clicks on buffer labels and switches to the selected buffer.

### 11. Startup dashboard

An autocommand runs when Vim starts.

If no file was supplied and the current buffer is empty, `MiDashboard()` creates a non-file editing buffer and displays a welcome screen.

Buffer-local mappings let the user open files, create new ones, access help, or quit Vim directly from that screen.

## Supported Languages

The execution system currently defines runners for the following Vim filetypes:

| Language | Filetype | Execution command |
|---|---|---|
| Python | `python` | `python3` |
| Bash | `sh` | `bash` |
| JavaScript | `javascript` | `node` |
| Lua | `lua` | `lua` |
| C | `c` | `gcc` |
| C++ | `cpp` | `g++` |

For C and C++, the configuration compiles the current file into `/tmp/mi_a.out` and executes the resulting program.

To use these runners, the appropriate interpreters or compilers must be installed and available in the terminal's `PATH`.

The presence of a runner does not guarantee that every project will execute correctly. Projects with external dependencies, multiple source files, or special build configurations may require their own commands.

## Troubleshooting

### Plugins do not load

Open Vim and run:

```vim
:PlugStatus
```

If necessary, run:

```vim
:PlugInstall
```

Restart Vim after installation.

### The `:Rg` command does not work

Verify that ripgrep is installed:

```bash
rg --version
```

Also confirm that fzf and fzf.vim are installed.

### CoC completion does not work

Check Node.js:

```bash
node --version
npm --version
```

Then check CoC's status:

```vim
:CocInfo
```

Verify that the relevant language extensions and language servers are installed.

### F5 does not execute a program

Check that the file is saved, its filetype is recognized, and the appropriate interpreter or compiler is installed.

Inside Vim, run:

```vim
:set filetype?
```

For example, a Python file should normally report `filetype=python`.

### The custom scrollbar does not appear

Check whether Vim supports the required features:

```vim
:echo has('popupwin')
:echo has('textprop')
```

Both commands should return `1`.

### Clipboard integration does not work

Check:

```vim
:echo has('clipboard')
```

Clipboard support also depends on the terminal environment and how Vim was built. WSL may require additional Windows/Linux clipboard integration.

## Future Improvements

Potential areas for future development include:

- Expand the set of language templates and execution runners.
- Improve terminal lifecycle management and execution error handling.
- Add project-specific execution profiles.
- Refine compatibility with different Vim versions and terminal environments.
- Improve documentation and automated configuration checks.
- Add screenshots and demonstrations of the interface.

## Project Goals

This project demonstrates how Vimscript can be used to customize a traditional text editor into a more approachable development environment.

It combines configuration management, plugin integration, terminal automation, keyboard-driven navigation, and interface customization into a single Vim configuration.

The main objective is to improve usability while preserving the flexibility and efficiency that make Vim valuable as a development tool.

---

**Author:** [Your Name](https://github.com/YOUR_USERNAME)

**Environment:** Vim · Ubuntu · WSL · Vimscript

**License:** Add a license file if you intend to distribute the project publicly.
