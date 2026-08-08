class Builtinctl < Formula
  desc "Control and automate the Mac built-in display"
  homepage "https://github.com/d1scolor/builtinctl"
  url "https://github.com/d1scolor/builtinctl/releases/download/v0.1.3/builtinctl-0.1.3-macos-arm64.tar.gz"
  sha256 "24be077c1b4ac15b7b98aa218c575e1523e145ed65a8f8cf44498d1636f45139"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  on_macos do
    depends_on macos: :ventura
  end

  def install
    bin.install "builtinctl"
  end

  def caveats
    <<~EOS
      builtinctl uses an undocumented macOS CoreGraphics API. Keep an external
      display connected and run `builtinctl test-off` before enabling automation.

      After hardware testing, install the suspended LaunchAgent with:
        builtinctl install-agent

      Then explicitly enable automation with:
        builtinctl resume

      After upgrading an installed agent, refresh its safety copy with:
        builtinctl install-agent
        builtinctl resume

      Before uninstalling the formula, remove automation safely with:
        builtinctl uninstall-agent

      For complete removal of automation, configuration, and logs, use:
        builtinctl purge
    EOS
  end

  test do
    assert_match "builtinctl 0.1.3", shell_output("#{bin}/builtinctl --version")
  end
end
