class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.3.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.2_darwin_arm64.zip"
    sha256 "37329e225a725954ea53ae9085b933ddd17f3ef675c151e8ddc74ded9d253ccf"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.2_darwin_amd64.zip"
    sha256 "f1212178117730f74075067fae2775f40f00f30ab2bc476ef9791df6742b9e7c"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.2_linux_amd64.zip"
    sha256 "355cb1372040fd21a03abaf69d21bc71bb12c19f97d6d676473a7d108a710f07"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.2_linux_armv6.zip"
    sha256 "a0c9360fc921aafa8bc7932c77957e2fbe5d92c792f087a3a5fa159a5aaefa7b"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.2_linux_arm64.zip"
    sha256 "40650e03ba1c03a791b354e87f34cea564807a656e388ed1d82aa8d04fb316eb"
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
