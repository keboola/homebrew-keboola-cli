class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.12.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.12.2_darwin_arm64.zip"
    sha256 "0055160cd622a0bbeeab7157895623024e663af3c2a0f60d9edaf4e3cd5461bb"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.12.2_darwin_amd64.zip"
    sha256 "28c4f67fb5310df5f822e7e466106758beb09043b92c29ae851664883e706453"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.12.2_linux_amd64.zip"
    sha256 "65473d209b5292efaca0a704a955ce19b7cb93a005e4604f8eb6a4cb56ce18e7"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.12.2_linux_armv6.zip"
    sha256 "a10ceeef0ac9e31afff7d4a9ff01e71605cf9ed7c21ffb373f0e49bb26d7a80a"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.12.2_linux_arm64.zip"
    sha256 "8fcd8fa5e169ad95fcd652ca51ccd71a6a2eb7a77e26cec5a6123997923c5b61"
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
