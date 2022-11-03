class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.11.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.1_darwin_arm64.zip"
    sha256 "f8a92f2430f4b129099a63b8c0da16072d4390e7f3f6730492177b5d967948b2"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.1_darwin_amd64.zip"
    sha256 "7fd11319289516815975370de056b7dc9af51bf1fcb4cac3fc41bcf19e4dc3f3"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.1_linux_amd64.zip"
    sha256 "0e47abb86d7d42ccd9ee653a6e75999f11a1bc8b9846411f227c7f5129ca4198"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.1_linux_armv6.zip"
    sha256 "efb8578a095a004c1e0056af5b28bcf386264c093edb6f101f068ab2d383f98f"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.1_linux_arm64.zip"
    sha256 "cc8c47ef9e7027dd3957da8287690fd00e261d698a6fce3c7294ba203fba60ff"
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
