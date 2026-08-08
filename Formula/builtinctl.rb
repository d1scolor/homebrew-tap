class Builtinctl < Formula
  desc "Control and automate the Mac built-in display"
  homepage "https://github.com/d1scolor/builtinctl"
  url "https://github.com/d1scolor/builtinctl/releases/download/v0.1.0/builtinctl-0.1.0-macos-arm64.tar.gz"
  sha256 "c72436fac62cada849cc2608c05df0dc1f786fb4de4b7d5d7dd5c8d15aa516e8"
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
    EOS
  end

  test do
    assert_match "builtinctl 0.1.0", shell_output("#{bin}/builtinctl --version")
  end
end
