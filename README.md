# Nvim config di giovanni


### TODO:
- [ ] riuscire a migliorare come funziona copilot 


## Chatgpt con un po di consigli

Certainly! Below is a list of **useful Neovim commands** along with brief descriptions to help you enhance your productivity and streamline your workflow.

---

### **Basic File Operations**

- **`:e <filename>`**
  - *Description:* Opens the specified file. If the file doesn't exist, it creates a new buffer.
  - *Example:* `:e README.md`

- **`:w`**
  - *Description:* Saves the current buffer (writes changes to the file).
  
- **`:w <filename>`**
  - *Description:* Saves the current buffer to a new file.
  - *Example:* `:w newfile.txt`

- **`:q`**
  - *Description:* Quits the current window. If there are unsaved changes, Neovim will prompt you.

- **`:wq` or `:x`**
  - *Description:* Saves the current buffer and quits Neovim.

- **`:qa`**
  - *Description:* Quits all open windows and exits Neovim. Use `:qa!` to force quit without saving.

---

### **Search and Replace**

- **`:%s/search/replace/g`**
  - *Description:* Replaces all occurrences of "search" with "replace" in the entire file.
  - *Example:* `:%s/foo/bar/g`

- **`:s/search/replace/g`**
  - *Description:* Replaces all occurrences of "search" with "replace" in the current line.
  - *Example:* `:s/foo/bar/g`

- **`:%s/\<old\>/new/gc`**
  - *Description:* Replaces whole word "old" with "new" globally in the file and asks for confirmation before each change.
  - *Example:* `:%s/\<foo\>/bar/gc`

---

### **Navigation**

- **`gg`**
  - *Description:* Moves the cursor to the first line of the file.

- **`G`**
  - *Description:* Moves the cursor to the last line of the file.

- **`:<number>`**
  - *Description:* Jumps to the specified line number.
  - *Example:* `:42` jumps to line 42.

- **`w` / `b`**
  - *Description:* Moves the cursor forward (`w`) or backward (`b`) by one word.

- **`Ctrl + f` / `Ctrl + b`**
  - *Description:* Scrolls forward (`Ctrl + f`) or backward (`Ctrl + b`) by one page.

---

### **Editing**

- **`dd`**
  - *Description:* Deletes the current line.

- **`yy` or `Y`**
  - *Description:* Yanks (copies) the current line.

- **`p`**
  - *Description:* Pastes the yanked or deleted content after the cursor.

- **`u`**
  - *Description:* Undoes the last change.

- **`Ctrl + r`**
  - *Description:* Redoes the last undone change.

- **`>>` / `<<`**
  - *Description:* Indents (`>>`) or unindents (`<<`) the current line.

---

### **Buffers and Windows**

- **`:bnext` or `:bn`**
  - *Description:* Switches to the next buffer.

- **`:bprev` or `:bp`**
  - *Description:* Switches to the previous buffer.

- **`:bd`**
  - *Description:* Deletes (closes) the current buffer.

- **`:split` or `:sp`**
  - *Description:* Splits the current window horizontally.

- **`:vsplit` or `:vsp`**
  - *Description:* Splits the current window vertically.

- **`Ctrl + w + w`**
  - *Description:* Switches focus between split windows.

- **`Ctrl + w + q`**
  - *Description:* Closes the current split window.

---

### **Visual Mode and Selection**

- **`v`**
  - *Description:* Enters visual mode for character-wise selection.

- **`V`**
  - *Description:* Enters visual mode for line-wise selection.

- **`Ctrl + v`**
  - *Description:* Enters visual block mode for block-wise selection.

- **`y`**
  - *Description:* Yanks (copies) the selected text in visual mode.

- **`d`**
  - *Description:* Deletes the selected text in visual mode.

---

### **Searching**

- **`/pattern`**
  - *Description:* Searches forward for "pattern" in the file.
  - *Example:* `/TODO`

- **`?pattern`**
  - *Description:* Searches backward for "pattern" in the file.
  - *Example:* `?FIXME`

- **`n` / `N`**
  - *Description:* Moves to the next (`n`) or previous (`N`) search match.

- **`:noh`**
  - *Description:* Clears the search highlight.

---

### **Settings and Customization**

- **`:set number` or `:set nu`**
  - *Description:* Displays absolute line numbers.

- **`:set relativenumber` or `:set rnu`**
  - *Description:* Displays relative line numbers.

- **`:set tabstop=4`**
  - *Description:* Sets the number of spaces that a `<Tab>` counts for.

- **`:set expandtab`**
  - *Description:* Converts tabs to spaces.

- **`:syntax on`**
  - *Description:* Enables syntax highlighting.

---

### **Clipboard Operations**

- **`"+y`**
  - *Description:* Yanks (copies) the selected text to the system clipboard.

- **`"+p`**
  - *Description:* Pastes from the system clipboard.

- **`"+dd`**
  - *Description:* Cuts (deletes) the current line to the system clipboard.

- **`:set clipboard=unnamedplus`**
  - *Description:* Sets the default register to use the system clipboard.

---

### **External Commands and Shell Integration**

- **`:!<command>`**
  - *Description:* Executes an external shell command.
  - *Example:* `:!ls -la`

- **`:read !<command>`**
  - *Description:* Inserts the output of a shell command below the current line.
  - *Example:* `:r !date`

---

### **Plugins and Advanced Features**

*(Note: These commands may require specific plugins to be installed)*

- **`:LspInfo`**
  - *Description:* Displays information about the active Language Server Protocol (LSP) clients.

- **`:Telescope find_files`**
  - *Description:* Opens Telescope's file finder (requires [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)).

- **`:NvimTreeToggle`**
  - *Description:* Toggles the file explorer tree (requires [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)).

- **`:Lazy`**
  - *Description:* Opens the Lazy.nvim plugin manager interface (requires [lazy.nvim](https://github.com/folke/lazy.nvim)).

---

### **Help and Documentation**

- **`:help <command>`**
  - *Description:* Opens the help documentation for the specified command.
  - *Example:* `:help :w`

- **`K`**
  - *Description:* Shows documentation for the word under the cursor, using the `keywordprg` setting.

---

### **Miscellaneous**

- **`:set wrap` / `:set nowrap`**
  - *Description:* Enables (`wrap`) or disables (`nowrap`) line wrapping.

- **`:set spell`**
  - *Description:* Enables spell checking.

- **`:set paste` / `:set nopaste`**
  - *Description:* Enables (`paste`) or disables (`nopaste`) paste mode to prevent auto-indentation issues when pasting text.

---

### **Example Workflow Commands**

1. **Search and Replace in Entire File:**
   ```vim
   :%s/search_term/replace_term/g
   ```
   *Replaces all occurrences of "search_term" with "replace_term" throughout the file.*

2. **Yank Entire File to Clipboard:**
   ```vim
   :%y+
   ```
   *Yanks (copies) the entire file content to the system clipboard.*

3. **Open a Vertical Split and Edit Another File:**
   ```vim
   :vsp anotherfile.txt
   ```
   *Splits the window vertically and opens "anotherfile.txt" in the new split.*

4. **Navigate Between Split Windows:**
   - Press `Ctrl + w` then `w` to cycle through open split windows.

---

### **Tips for Efficiency**

- **Combine Commands with Counts:**
  - *Example:* `5dd` deletes five lines starting from the current line.

- **Use Marks for Quick Navigation:**
  - **`m<letter>`**
    - *Description:* Sets a mark with the given letter.
    - *Example:* `ma` sets mark 'a'.
  - **`'<letter>`**
    - *Description:* Jumps to the beginning of the marked line.
    - *Example:* `'a` jumps to mark 'a'.

- **Macro Recording:**
  - **`q<letter>`**
    - *Description:* Starts recording a macro into the specified register.
    - *Example:* `qa` starts recording into register 'a'.
  - **`q`**
    - *Description:* Stops recording the macro.
  - **`@<letter>`**
    - *Description:* Plays back the macro stored in the specified register.
    - *Example:* `@a` plays the macro stored in register 'a'.

---

Neovim is highly customizable and powerful. Exploring these commands and integrating them into your daily workflow can significantly improve your text editing and development efficiency. Additionally, leveraging plugins can further extend Neovim's capabilities to suit your specific needs.

If you have any specific tasks or need more advanced commands, feel free to ask!
