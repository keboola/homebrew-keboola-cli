class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.13.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.13.0_darwin_arm64.zip"
    sha256 "6e4387bb8531104e3fe9531b3a54256c1a10055d1c5e47d64976239efb1fbc32"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.13.0_darwin_amd64.zip"
    sha256 "76ea40ab12bb18e5077eb1dfc53f503810d5ac5ac5427d74279977561e8538c1"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.13.0_linux_amd64.zip"
    sha256 "df5926dc0d194eb603a6f6fdd4f98d57ac9e92e2cfb0e65ffb97d292a8127904"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.13.0_linux_armv6.zip"
    sha256 "7a8fa789ee602ba8d7812142e4130d839db110708ad19fa1a6880254a5f09683"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.13.0_linux_arm64.zip"
    sha256 "464196839c465a20983db91b22e5ce0d1910b1a804e6e9224e0006bd4420eb5f"
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
