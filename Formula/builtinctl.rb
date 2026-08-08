class Builtinctl < Formula
  desc "Control and automate the Mac built-in display"
  homepage "https://github.com/d1scolor/builtinctl"
  url "https://github.com/d1scolor/builtinctl/releases/download/v0.1.4/builtinctl-0.1.4-macos-arm64.tar.gz"
  sha256 "62cef03b43a7d5ffdf2aa4f69ce2245fc152c6f03b81e1064451c04176b7cb27"
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

      Homebrew upgrades apply to an installed agent at its next start, such as
      the next login or reboot. To apply one immediately while preserving its
      enabled or suspended state, run:
        builtinctl restart-agent

      Agents installed before builtinctl 0.1.4 need one `restart-agent` to
      migrate; later upgrades require no agent reinstall.

      Before uninstalling the formula, remove automation safely with:
        builtinctl uninstall-agent

      For complete removal of automation, configuration, and logs, use:
        builtinctl purge
    EOS
  end

  test do
    assert_match "builtinctl 0.1.4", shell_output("#{bin}/builtinctl --version")
  end
end
