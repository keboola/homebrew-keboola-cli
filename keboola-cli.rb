class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.8.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.8_darwin_arm64.zip"
    sha256 "d7dc8428dffa5e64f522e970ac587b1ad98b707c02e576a29d4694677a3600c9"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.8_darwin_amd64.zip"
    sha256 "0241f95241911068fc498576991106547f3bd900a19e45b1f2ff34055b0e413f"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.8_linux_amd64.zip"
    sha256 "330c685b26195615bb9cffa68571bdcbeb7ee7d7352efd1779aa4773c429cd66"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.8_linux_armv6.zip"
    sha256 "c582603933d85026efd1453ed7d599bf56fdcf0fc335c14a8797ffefb6505c72"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.8_linux_arm64.zip"
    sha256 "a36893df3987ff3399359d1e220da1c4be38dbb7ee85878e6051a3e098c31942"
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
