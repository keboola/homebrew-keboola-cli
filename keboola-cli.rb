class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.5_darwin_arm64.zip"
    sha256 "51bd1b4397dc851cbf4bc1c574d8e2e7fd02945f59fea1ca9c7cb19e8973b639"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.5_darwin_amd64.zip"
    sha256 "04b4572fc9718e725c0e794c48a8624f0cfdc2f133d3e28a175aa28255aac5e6"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.5_linux_amd64.zip"
    sha256 "a22ea73e925e2ed0f84ce81e29611adf1ddd25e4f992ab6949748c021ac449e5"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.5_linux_armv6.zip"
    sha256 "936c0c1da2c9f143a7c291642c8407d2b5ce4113ead7a9796c7e83bc43fa24b4"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.5_linux_arm64.zip"
    sha256 "06e878b03582500aa3d4920448d737288b23a92bc4c3bb80ba820d69378d91c7"
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
