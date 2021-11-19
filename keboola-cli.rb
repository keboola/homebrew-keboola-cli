class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.0.0_darwin_arm64.zip"
    sha256 "4c39e1118724d32787d98b6b6e7ab5bb3ee5102a2ab5523462da4ed42ea8e77e"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.0.0_darwin_amd64.zip"
    sha256 "5193c4b7c58098e2aec5b286b4c8122f540802ff90f521a578980da68eed7b43"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.0.0_linux_amd64.zip"
    sha256 "4e66952c57ac9dd3cc3c62df46c6fef6505506335749a1e9c1aedc0d9048d581"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.0.0_linux_armv6.zip"
    sha256 "1d833e47d0eae1a8fb96b9a4bc1ba508d41e3c7d14a79c1867d3865af16d03a0"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.0.0_linux_arm64.zip"
    sha256 "1458a8078a180ecb17c2361ec285bde47a55aca2257c6a61f97e6c9fc28c9efa"
  end

  def install
    bin.install "kbc"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/kbc --version"
  end
end
