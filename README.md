# Homebrew tap for builtinctl

Install [builtinctl](https://github.com/d1scolor/builtinctl) on an Apple Silicon Mac running macOS 13 or later:

```sh
brew install d1scolor/tap/builtinctl
```

The formula installs a checksum-verified release binary and does not build with Xcode or Swift on the user's machine.

Before uninstalling, restore the built-in display and remove the managed LaunchAgent:

```sh
builtinctl uninstall-agent
brew uninstall builtinctl
```

Use `builtinctl purge` instead of `uninstall-agent` to remove configuration and logs as well.
