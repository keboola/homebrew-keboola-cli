class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.3.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.1_darwin_arm64.zip"
    sha256 "e84ff70d773e41b5897b80248126a70728f7d546cad2b8e245f9d1b8fb0f5750"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.1_darwin_amd64.zip"
    sha256 "bfa02016d40289d076705c9dbc9961ece097fe947f523d34798ae380914fd8c6"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.1_linux_amd64.zip"
    sha256 "41684e4ed76d6d408c7d6d212adc9e9863d49fd0208398407edc886f01c0792b"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.1_linux_armv6.zip"
    sha256 "8df60b325be9d6f107a506b61981a0a55b2ac9c0c8eafac6a93598c4c6eb7d02"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.1_linux_arm64.zip"
    sha256 "b06666d99285a53c57e037cfd29e0040a320e45f524e392ea79afa0ec6604635"
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
