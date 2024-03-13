class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "Apache2"
  version "2.22.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.22.0_darwin_arm64.zip"
    sha256 "3e504b11cffc25071452c26545caf4bdeef170525da21c0261cc6bda4ef70bdb"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.22.0_darwin_amd64.zip"
    sha256 "a63050115ba46f477541314dfb6d66f8d14c0bd0ec92523f0c5177c9cdea1123"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.22.0_linux_amd64.zip"
    sha256 "42d43046d4f472ece08a0185785b360c885b3cd50667fc3b62dd6982df78fae2"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.22.0_linux_armv6.zip"
    sha256 "f59d466c9084eb6620272cc78e843f11f2f53876995a0caa096433ba4d59a561"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.22.0_linux_arm64.zip"
    sha256 "0da4ee4228d3e17bc90b1b88c1ea271887f6dd27c8afdeac0a2d285960052050"
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
