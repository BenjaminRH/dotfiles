#!/usr/bin/env ruby

# shamelessly stolen from https://github.com/tsaleh/dotfiles/blob/master/vim/update_bundles
git_bundles = [

    ## Colourschemes
    "git://github.com/altercation/vim-colors-solarized.git", 
    
    ## Plugins
    "git://github.com/Lokaltog/vim-easymotion.git", # Quick navigation inside a buffer
    "git://github.com/myusuf3/numbers.vim.git", # Relative line numbers in normal mode
    "git://github.com/scrooloose/nerdtree.git", # Tree file viewer
    "git://github.com/kien/ctrlp.vim.git", # Fuzzy matching file opener
    "git://github.com/Raimondi/delimitMate.git", # Smart quote/parethesis closing
    "git://github.com/docunext/closetag.vim.git", # Auto close HTML tags
    "git://github.com/ervandew/supertab.git", # Insert mode tab completion
    "git://github.com/tpope/vim-surround.git", # Easily change surrounding text
    "git://github.com/scrooloose/syntastic.git", # Inline syntax checking
    "git://github.com/tristen/vim-sparkup.git", # Zen-coding-esque expansion
    "git://github.com/stephpy/vim-phpdoc.git", # Easy PHPDocs
    "git://github.com/vim-scripts/bufkill.vim.git", # Buffer closing
    "git://github.com/tpope/vim-sleuth.git", # Autodetect indentation rules
    "git://github.com/kshenoy/vim-signature.git", # Show marks on screen
    "git://github.com/airblade/vim-rooter.git", # Set working dir based on parent .git dir

    ## Syntax files
    "git://github.com/tpope/vim-markdown.git", # Markdown syntax
    "git://github.com/pangloss/vim-javascript.git", # Better Javascript indentation
    "git://github.com/vim-scripts/Better-CSS-Syntax-for-Vim.git", # Better CSS3 highlighting
    "git://github.com/skammer/vim-css-color.git" # Show CSS colours in vim
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.rm_rf(bundles_dir)
FileUtils.mkdir(bundles_dir)
FileUtils.cd(bundles_dir)

git_bundles.each do |url|
  puts url
  `git clone -q #{url}`
end

Dir["*/.git"].each {|f| FileUtils.rm_rf(f) }

