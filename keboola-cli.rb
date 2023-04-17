class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.16.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.0_darwin_arm64.zip"
    sha256 "62d1687a3bb249c5a4c8e88282bf1c18f5c8e8ca51ccf64268019aeb6f488c1e"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.0_darwin_amd64.zip"
    sha256 "eba9cc2c90b435f1088d59f66cd5d3a2df928e4ed0893b37b782c8b325be5fab"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.0_linux_amd64.zip"
    sha256 "7cbc3b1e007941cbcd9f8c2ab954b8b5069614bdc6e366046b1e4f794a609ed9"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.0_linux_armv6.zip"
    sha256 "db001b479333c7897be0a133397685378486913cb235f2aadc9f8859d97fa992"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.0_linux_arm64.zip"
    sha256 "79eb1a50bf85091fb98d05f31880fc24e976af32ec0d57ae8532f694e153ab50"
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
