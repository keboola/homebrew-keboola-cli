class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "Apache2"
  version "2.22.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.22.2_darwin_arm64.zip"
    sha256 "040b22083bc8ccc9e3a86c35f4b6fa1e46f9737df190250a110c5ddd33948c60"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.22.2_darwin_amd64.zip"
    sha256 "1d13ac2891c50662ef90560ef88b9534d7739108f5c7057b910494db0fcce584"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.22.2_linux_amd64.zip"
    sha256 "b4f07d27eda3df145df780860792b5483bb98849df71f227b92fec6ae3403bb0"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.22.2_linux_armv6.zip"
    sha256 "d9ab372660ae5cc56d97affd8dec4739db00f876401da858e6529f5a82265a8b"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.22.2_linux_arm64.zip"
    sha256 "65ebc983e603baa316a5c8b0feb192d94d6174edf16153f92dce181c8d18f759"
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
