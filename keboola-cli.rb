class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.4.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.0_darwin_arm64.zip"
    sha256 "08c5cfc953f5f7b38125a57d08cdd1d1f6abfd3b4657c64bf5bfd74c18fc7fe0"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.0_darwin_amd64.zip"
    sha256 "bdee4bf3eaccb4b86d2fa1b3163087e3db20363c925cae72646faf546b884021"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.0_linux_amd64.zip"
    sha256 "8c7194d821244a3919b3d0216c6e3c0945824aaad0e9a0c7ca2d3f6adb03f250"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.0_linux_armv6.zip"
    sha256 "b87361e92a80ca12a8fe121ef6c50098e1d288deff722d692ece888d4cc1847a"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.0_linux_arm64.zip"
    sha256 "6237a32349f47dc8df89aa2458df214a0e499632f5b1831c8caf686d8f2270b4"
  end

  depends_on "git" => :recommended

  def install
    bin.install "kbc"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/kbc --version"
  end
end
