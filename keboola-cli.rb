class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.11.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.2_darwin_arm64.zip"
    sha256 "5b49fa36af8a21dbfbb18baab78738fa933b9bcca72c3b4ea55513c83fd5c120"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.2_darwin_amd64.zip"
    sha256 "f8e3135faba10a1d32dbd21029a1605c90d450262eed41c5bd9a80b2cd536035"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.2_linux_amd64.zip"
    sha256 "88dc68dff980e6ca91e38b14ebc04c84e63d7fcd0087aa6b59a1f59004aa56c9"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.2_linux_armv6.zip"
    sha256 "e6ca11b086870fcfd168148e2ee452e2d4fd4be4aef1ba7309af8d6348384b11"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.2_linux_arm64.zip"
    sha256 "1f69d2da18c973228bf805e7e959a2673711fee80f02beb36c80cdaeff652410"
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
