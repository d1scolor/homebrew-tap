class Builtinctl < Formula
  desc "Control and automate the Mac built-in display"
  homepage "https://github.com/d1scolor/builtinctl"
  url "https://github.com/d1scolor/builtinctl/releases/download/v0.1.2/builtinctl-0.1.2-macos-arm64.tar.gz"
  sha256 "d0a4eb357d0fe5c7955208b61ff40c0a4633fa9f3b06f413f5c077464cf60fc1"
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
    assert_match "builtinctl 0.1.2", shell_output("#{bin}/builtinctl --version")
  end
end
