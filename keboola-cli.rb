class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "Apache2"
  version "2.39.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.39.1_darwin_arm64.zip"
    sha256 ""
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.39.1_darwin_amd64.zip"
    sha256 ""
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.39.1_linux_amd64.zip"
    sha256 "ce41b56a4a6430df07394496edb045417fe94eaf6131914d3637c979e2236d99"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.39.1_linux_armv6.zip"
    sha256 "f733aa465207215723d0ae116373212ecb08194b404dce2b50df69ebf93f7d44"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.39.1_linux_arm64.zip"
    sha256 "2c716030a2b89620af10ae7cc945c724968a44be9d2dafd54076a28ea03a2f0b"
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
