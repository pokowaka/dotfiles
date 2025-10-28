# My Modern Shell Setup

This is a personal cheatsheet for setting up a new machine with my preferred modern shell tools.
It assumes `zsh`, `oh-my-zsh`, and `homebrew` (on macOS) are already installed.

## 🧰 Core Tools

* **`fzf`**: (Already installed) Fuzzy finder.
* **`zoxide`**: (Already installed) Fast directory jumper.
* **`eza`**: (Already installed) `ls` replacement.
* **`fd`**: (Already installed) `find` replacement.

---

## 🔍 ripgrep (`rg`)

A blazingly fast `grep` replacement that respects `.gitignore`.

### 🍎 macOS (Homebrew)

```bash
brew install ripgrep
```

### 🐧 Linux (Debian)

```bash
sudo apt update
sudo apt install ripgrep
```

---

##  BAT (`bat`)

A `cat` clone with syntax highlighting and Git integration.

### 🍎 macOS (Homebrew)

```bash
brew install bat
```

### 🐧 Linux (Debian)

The package is named `batcat` on Debian to avoid conflicts.

```bash
sudo apt update
sudo apt install bat
```

**Post-install (Linux only):** Create a symlink to use `bat` instead of `batcat`.

```bash
# Create a local bin directory if it doesn't exist
mkdir -p ~/.local/bin
# Symlink batcat to bat
ln -s /usr/bin/batcat ~/.local/bin/bat
# Make sure ~/.local/bin is in your $PATH (zshrc should do this)
```

---

## 🐙 lazygit

A full terminal UI (TUI) for Git.

### 🍎 macOS (Homebrew)

```bash
brew install lazygit
```

### 🐧 Linux (Debian)

Download the latest `.deb` package from the [lazygit releases page](https://github.com/jesseduffield/lazygit/releases).

```bash
# Check the releases page for the latest version number
curl -Lo lazygit.deb "[https://github.com/jesseduffield/lazygit/releases/download/v0.40.2/lazygit_0.40.2_Linux_x86_64.deb](https://github.com/jesseduffield/lazygit/releases/download/v0.40.2/lazygit_0.40.2_Linux_x86_64.deb)"

sudo dpkg -i lazygit.deb
# Clean up
rm lazygit.deb
```

---

## 🎨 delta (`git-delta`)

A superior `git diff` viewer with syntax highlighting.

### 🍎 macOS (Homebrew)

```bash
brew install git-delta
```

### 🐧 Linux (Debian)

```bash
sudo apt update
sudo apt install git-delta
```

**Post-install (Both):** You must configure `git` to use `delta`. Add this to your `~/.gitconfig`:

```ini
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true    # use n and N to move between diff sections
    side-by-side = true
    line-numbers = true

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default
```

---

##  multiplexer (`zellij`)

A modern, batteries-included terminal multiplexer (like `tmux`).

### 🍎 macOS (Homebrew)

```bash
brew install zellij
```

### 🐧 Linux (Debian)

Download the pre-compiled binary from the [zellij releases page](https://github.com/zellij-owner/zellij/releases).

```bash
# Check the releases page for the latest version
curl -Lo zellij.tar.gz "[https://github.com/zellij-owner/zellij/releases/download/v0.40.1/zellij-x86_64-unknown-linux-musl.tar.gz](https://github.com/zellij-owner/zellij/releases/download/v0.40.1/zellij-x86_64-unknown-linux-musl.tar.gz)"

# Extract and move to local bin
tar -xvf zellij.tar.gz
mkdir -p ~/.local/bin  # create if it doesn't exist
mv zellij ~/.local/bin/

# Clean up
rm zellij.tar.gz
```

---

## 🚀 starship

A fast, cross-shell prompt.

### 🍎 macOS (Homebrew)

```bash
brew install starship
```

### 🐧 Linux (Debian)

Use the official installer script.

```bash
curl -sS [https://starship.rs/install.sh](https://starship.rs/install.sh) | sh
```

**Post-install (Both):** Add the following line to the **end** of your `~/.zshrc` file:

```zsh
eval "$(starship init zsh)"
```

---

## ⌨️ fzf-tab (Oh My Zsh Plugin)

Integrates `fzf` directly into your zsh tab-completion.

### 🍎 macOS & 🐧 Linux

This is an Oh My Zsh plugin, so the installation is the same for both.

1.  **Clone the plugin:**
    ```bash
    git clone [https://github.com/Aloxaf/fzf-tab](https://github.com/Aloxaf/fzf-tab) ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
    ```

2.  **Activate the plugin:**
    Add `fzf-tab` to the `plugins=(...)` list in your `~/.zshrc`. It *must* be loaded after `fzf`.

    ```zsh
    # Example from ~/.zshrc
    plugins=(
        git
        fzf
        zoxide
        # ... other plugins
        fzf-tab
    )
    ```

3.  **Reload your shell:**
    ```bash
    exec zsh
    ```
