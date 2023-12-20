class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.20.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.0_darwin_arm64.zip"
    sha256 ""
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.0_darwin_amd64.zip"
    sha256 "90c75080ed89467db2f2e034c894559c522c9639f3a18cecdcff09f951178607"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.0_linux_amd64.zip"
    sha256 "bffe36d0d1d58d74326006ee2338e52d356a88df3f5572237f967594c8e0408e"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.0_linux_armv6.zip"
    sha256 "a5d41b7ae1edcb77ae60ea77e1e61bcc347f585b8e546914339068e0baf0e6b8"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.0_linux_arm64.zip"
    sha256 "3c03decbc0cb418293ec9c70e450301267b900fba9fadbea41cde1018b29bc32"
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
