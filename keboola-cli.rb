class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.15.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.15.0_darwin_arm64.zip"
    sha256 "35e8e43b2752c75c6a67c9820b0017766de676b68a18a63a444c35eba6a2781a"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.15.0_darwin_amd64.zip"
    sha256 "2fe664c7322ab69a786efc704d66cc3f45aca487be89c57571e9dcbd2583052c"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.15.0_linux_amd64.zip"
    sha256 "b0808b7dcbc0cd1ca1ffe3a5f1ab85cf6ce22f45fdd650d1b8c4991e64d3f58a"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.15.0_linux_armv6.zip"
    sha256 "6dcc614c882113bcb79014c87585494fa007c3906f6d246ea9790d3a3124594b"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.15.0_linux_arm64.zip"
    sha256 "9684c08f2073ab41c28bc7a5bb2c18b89df22f5d633822d6b5a44364062786c7"
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
