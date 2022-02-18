class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.4_darwin_arm64.zip"
    sha256 "8001d33432d2bd4b00d6ac271470f9615beb07aeebbd357329ed9e1b169760af"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.4_darwin_amd64.zip"
    sha256 "c224f4a375737e9f6e1c3a110830685b71b579b2b99200a4e0dc1c0b3d47b533"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.4_linux_amd64.zip"
    sha256 "3937c3679c16e75a0b95f532cbeba47e33ffce4b598414aab4a4caee90234fbe"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.4_linux_armv6.zip"
    sha256 "6eef4400f698e28482e1df00a2006f00a1753e6ab40adef0120c58dac405a12c"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.4_linux_arm64.zip"
    sha256 "be61aed5ecc257ee89e3791bba2de75db37e4eae2bd8718dc22ad1f09a064f07"
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
