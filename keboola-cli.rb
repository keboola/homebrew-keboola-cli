class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.15.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.15.1_darwin_arm64.zip"
    sha256 "bacf3f8ea0c8ce29f6e6e9f6ac396ed4992632dac7b728961fd40727895e6f65"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.15.1_darwin_amd64.zip"
    sha256 "379ffe69666dcc1ba236b89586a5586e71373950275487d640bb85951d5975d3"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.15.1_linux_amd64.zip"
    sha256 "3ebc2e55bdc7ae273ba56cc7547acf5cdbb83d303e4556b7750da933a4532514"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.15.1_linux_armv6.zip"
    sha256 "451146575f506db24e8b5d5001b2dcdee1bbcb1080c9222dcacef51fb0b79561"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.15.1_linux_arm64.zip"
    sha256 "ead0af393614b40daf2fce6d17c1a3ea0952ab985f9ce57fedd38f32c04acda8"
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
