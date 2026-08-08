# Homebrew tap for builtinctl

Install [builtinctl](https://github.com/d1scolor/builtinctl) on an Apple Silicon Mac running macOS 13 or later:

```sh
brew install d1scolor/tap/builtinctl
```

The formula installs a checksum-verified release binary and does not build with Xcode or Swift on the user's machine.

An installed automation agent picks up Homebrew upgrades at its next start, including the next login or reboot. Run `builtinctl restart-agent` to apply an upgrade immediately while preserving whether automation is enabled or suspended. Agents installed before version 0.1.4 need this command once to migrate to the automatic upgrade launcher.

Before uninstalling, restore the built-in display and remove the managed LaunchAgent:

```sh
builtinctl uninstall-agent
brew uninstall builtinctl
```

Use `builtinctl purge` instead of `uninstall-agent` to remove configuration and logs as well.
