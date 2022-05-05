class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.4.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.3_darwin_arm64.zip"
    sha256 "1022c9a2245ca1693d55cbc0943d0db4c0b5f30590a5d828095e712c3f41fe28"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.3_darwin_amd64.zip"
    sha256 "3c9ee6aa221959896f98ecd560f271e268821c858f926c52305d48d8e2a9a276"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.3_linux_amd64.zip"
    sha256 "d37fd73788a91be355e467f14605b56387a8a47189b2c03f2787859c715ca093"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.3_linux_armv6.zip"
    sha256 "c68912e99d69f8f97204e065bf96058cd320d28921f1a97081796835e0136397"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.3_linux_arm64.zip"
    sha256 "c82b2469da50f261df6828cc1fa937e446c18d200eff894d0805a840f9a912f7"
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
