class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.1_darwin_arm64.zip"
    sha256 "af1219726f27f5ec87cfb91feb11bdf42ee88c4d10483520a05eee5cf0883ab4"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.1_darwin_amd64.zip"
    sha256 "7ac8511496ead5d35402fd8b64f4ad349b0d1e168919bbf320ff0b683ca5913b"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.1_linux_amd64.zip"
    sha256 "b27c91ecea6421ac5c53e18904bf703532942847020d689c96bee267ee7166ef"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.1_linux_armv6.zip"
    sha256 "08e9d1723f2d5447c22f3292f3a641f259dfeefcafb9b2154671dec762f9551c"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.1_linux_arm64.zip"
    sha256 "6a918bcdca4a24b8f2762f195eb08589c3e7661377a4b67dd313fe64f88f107a"
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
