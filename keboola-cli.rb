class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola_cli_2.0.0_darwin_arm64.zip"
    sha256 "67f773edea64691174b65e253305b82d739f44a0536a66eb2b86a236843d55bc"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola_cli_2.0.0_darwin_amd64.zip"
    sha256 "fa8d5aa500865ce8b6bc036969bb2ab98b81b1f99ee5e4cacd880bced6239669"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola_cli_2.0.0_linux_amd64.zip"
    sha256 "029f5cff8e1a83ace2259aff2a8176f2f3a89c5d779b27ae80fd63aa99ebf77d"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola_cli_2.0.0_linux_armv6.zip"
    sha256 "0a8dcac47e9cd8461d7c581bb25047c15185f5e31dcbea7f224dc6853d4537cf"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola_cli_2.0.0_linux_arm64.zip"
    sha256 "f3db595a80a5d67fb70fd64b2e7cfadd4f58f829fe912001afc00fac8ecf84e4"
  end

  def install
    bin.install "kbc"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/kbc --version"
  end
end
