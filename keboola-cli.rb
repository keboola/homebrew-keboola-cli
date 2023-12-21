class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "Apache2"
  version "2.20.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.1_darwin_arm64.zip"
    sha256 "47a0fb7596649f1be9305a9be551bf6b5bd7c354d5e8bd9f399605a8ad3196db"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.1_darwin_amd64.zip"
    sha256 "708319a677d76c87f68d961488ece798b0bb1f5ede0e9c3a12e0f59284c4c123"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.1_linux_amd64.zip"
    sha256 "fe57aaa3040e1c20436904ab6b6a9b2ca3f6834a05cc4fe2959cfab5df95295d"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.1_linux_armv6.zip"
    sha256 "04699953df09cddf22a8f0d9075561aa36f11fe48df3011e1972f32e4984c9f7"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.1_linux_arm64.zip"
    sha256 "f6d3f98f24d11fc5e1a757c5eae5750e2c1904cbb6f5d027fa17920df17d7fdb"
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
