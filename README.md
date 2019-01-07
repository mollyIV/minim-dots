# minim-dots
macOS development environment setup dedicated mostly to iOS developers. 

# Introduction
The goal of `minim-dots` is to simplify development setup on new machine which can be very time consumption and manual process. I was trying to keep overall minimalist setup - mostly for iOS developer. 

You are more than welcome to fork this repository and adjust the apps, tools and settings to your needs. 

Feel free to give your feedback, let's make this project better together! :muscles:

# Usage
```
$ ./.install bootstrap osxprep brew macos gems
```

# Scripts

* install.sh
    * Runs specified scripts
* bootstrap.sh
    * Syncs dot files and scripts to your local home directory `~`
* osxprep.sh
    * Updates OS X and installs Xcode command line tools
* brew.sh
    * Installs Homebrew and apps
* osx.sh
    * Sets up OS X defaults 
* gems.sh
    * Installs gems


# Tools and Applications 
* Homebrew
* Homebrew Cask
* Python
* Ruby and rbenv
* Docker
* Carthage
* Swiftlint
* Mitmproxy
* Cocoapods
* Bundler
* Fastlane
* iTerm2
* Google chrome
* Java
* Slack
* Visual Studio Code
* Sourcetree
* Tidal
* Bear


# iTerm2 Customisation 

<img src="screenshots/iTerm2_customisation.png" width="500">

1. Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
2. Install [powerline-shell](https://github.com/b-ryan/powerline-shell) to support path bars
3. Create a powerline [Config File](https://github.com/b-ryan/powerline-shell#config-file) and remove `username` and `host`
4. Set a Solarized Dark for the terminal colors
4. Install and set [Meslo LG M Regular for Powerline.ttf](https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf) font as you need that to support the directory characters for powerline
5. Set Keys to Natural Text Editing
6. Install [z](https://github.com/rupa/z) tool to quickly jump between projects


# [Visual Studio Code](https://code.visualstudio.com/) zshell Integration 

<img src="screenshots/vsc_zshell_integration.png" width="500">

1. Modify user's settings

``` User Settings.json
"terminal.integrated.shell.osx": "/bin/zsh",
"terminal.integrated.fontFamily": "Meslo LG M for Powerline"
```

2. `code` alias support

If you hit `$ code: command not found`, launch VS Code, open the Command Palette (⇧⌘P) and type shell command to find the Shell Command: Install 'code' command in PATH command.


# Credits 
This repository builds on amazing work from:
* [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
* [Donne Martin](https://github.com/donnemartin/dev-setup)
* [Felix Krause](https://github.com/KrauseFx/what-terminal-is-felix-using)
* [Maciek Grzybowski](https://github.com/ncreated/dotfiles)

Thank you so much for your effort guys :pray:


# License
The MIT License (MIT)
