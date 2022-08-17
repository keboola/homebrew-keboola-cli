class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.6.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.6.0_darwin_arm64.zip"
    sha256 "e8d0cceeaace3fbcd4a67c15f88d3ae47cd533153decb18a8299cb1719ecbbc7"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.6.0_darwin_amd64.zip"
    sha256 "cf1a54bca92a31bdcc2de500241f80966c52db2693f9bea11f36a33988e1289b"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.6.0_linux_amd64.zip"
    sha256 "7aede7d535bf4198a7d437a64d594b7983b8b73fba8a536f80b51f6801daa630"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.6.0_linux_armv6.zip"
    sha256 "008060cbdfb0cc327ea30bd4c123f615d2640f0715da57677776384648778208"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.6.0_linux_arm64.zip"
    sha256 "37c1825e755449dff7586fb6cc4b1d7b68c2a7895e84b1becd8420a0f7e4f205"
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
