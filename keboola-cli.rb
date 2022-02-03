class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.1.1_darwin_arm64.zip"
    sha256 "51e5269ba9549e6d7979c4ede948b464d31bd0b6d9ddfc3f5066472aeaf31c71"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.1.1_darwin_amd64.zip"
    sha256 "7bbcbb97032f4fbe774bccc6321ebe8b494f68a0796448a6e3d45d96575456cb"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.1.1_linux_amd64.zip"
    sha256 "10927016d06d77261311067c98a96fa5d8370b858261a76f6646b9a6b3f4680b"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.1.1_linux_armv6.zip"
    sha256 "34c8ad0f9cafe19f3a6c75353772d73af4187f33c52cbc9261cdadeb6f8873e2"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.1.1_linux_arm64.zip"
    sha256 "a42b5721c9f2f51fa13d26593116e3e8b11b5a8477417d1de7fa87304a661ac0"
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
