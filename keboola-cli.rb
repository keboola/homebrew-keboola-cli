class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "Apache2"
  version "2.25.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.25.0_darwin_arm64.zip"
    sha256 "7b309278d634c5549090515a76a09e95d0b303cdb1a05a52ab5f6a5e218f24d9"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.25.0_darwin_amd64.zip"
    sha256 "cbfe18b778d8f8c370ee914428a9623915828449a6aa8ca4f92c97ee132574e6"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.25.0_linux_amd64.zip"
    sha256 "eaec2df9155ccd121983b9ffd81f6afee72376499b3ce3472f9c5fbfc9a1e166"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.25.0_linux_armv6.zip"
    sha256 "143c069aa9ef48f6da8014c946ca6d01f59ead06ee176b8664ec5c6dcf0b0cf0"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.25.0_linux_arm64.zip"
    sha256 "b5faccf472fdfcf4995699216256fb8db5a4a1d96a7c972d0d78d68db8e33db7"
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
