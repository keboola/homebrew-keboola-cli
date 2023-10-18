class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.18.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.3_darwin_arm64.zip"
    sha256 "32ce3e2fbad1e719cf71d793dddffb669a86e6a21297259131d2d259d11775f3"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.3_darwin_amd64.zip"
    sha256 "8a38603417c580bc1fc0907089ff12faa7cf5fc843fa776128ab4457e4ceb577"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.3_linux_amd64.zip"
    sha256 "2aff04448521c1b68e7d008e8731db4d111603119396842b9d7758b60899acd7"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.3_linux_armv6.zip"
    sha256 "c13fc33799bc9c6a06575278d92f8ba0b2182bd3bc7aaaf9584c961fcabb596e"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.3_linux_arm64.zip"
    sha256 "3437f6d6ff4a63827dc2677f0810b5596c8605428ab1fe36b8bda4c28fe3ec93"
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
