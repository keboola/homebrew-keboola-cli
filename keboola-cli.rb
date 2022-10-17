class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.8.12"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.12_darwin_arm64.zip"
    sha256 "36aa70c7b656ef770066a86b4e199c5a780314e3f48480db9995e696b74e420b"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.12_darwin_amd64.zip"
    sha256 "981fdbbcf9519da5ab169fe1d469c45c6bc13de2aa98fa1866e73a6b406b2fd1"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.12_linux_amd64.zip"
    sha256 "54ff6b7e623e6f42250bfb9409e04bb7bfd2d0e3a2bdd884327e18eec5c556cd"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.12_linux_armv6.zip"
    sha256 "897313896e25ff2368bc8f87caba2eb50ad5a19c0ce3a8010c3f9cfd3c2f0077"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.12_linux_arm64.zip"
    sha256 "8efce33c4f5e4b273cb000d0add6fdd5755917bdd8939f698018f866f00e52ab"
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
