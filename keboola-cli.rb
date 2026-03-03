class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "Apache2"
  version "2.44.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.44.2_darwin_arm64.zip"
    sha256 ""
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.44.2_darwin_amd64.zip"
    sha256 ""
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.44.2_linux_amd64.zip"
    sha256 "35fa48de056c649cafe558a804d9ebfe17496a109a02fe17cdc0b0694f1d837e"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.44.2_linux_armv6.zip"
    sha256 "9c4327db4bafc9bbf6b355b4b56d7e4e0b206deee96574aff220cf24371c36e6"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.44.2_linux_arm64.zip"
    sha256 "24f34f9f5788b22cf175145cdca9abd4f3eb524314ff4f01dc8c4d6c50ad4797"
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
