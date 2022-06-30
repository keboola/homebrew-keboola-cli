class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.5.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.3_darwin_arm64.zip"
    sha256 "3962cf2bcc6f065276e3b84aecbbbea7e34672a957a7834133499f6cd98ebfbb"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.3_darwin_amd64.zip"
    sha256 "e0aabaa3fc0d92bc84679ee4ef4f4f2558ff6205a78421e7cf9a33516600afe5"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.3_linux_amd64.zip"
    sha256 "4f6b35fe874aa7fd1352148882e8024e53116d5c5dbf9c6a280e7b8bb960987e"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.3_linux_armv6.zip"
    sha256 "2e39d048f7874ff654bd9e6d7ed8942721e7592b482bfbd080e0c3c5f92863c0"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.3_linux_arm64.zip"
    sha256 "8b134b453bcf3d5926f6c11369cbb2c218d6f6c73fd87f6cec90c72354337d13"
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
