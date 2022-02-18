class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.2_darwin_arm64.zip"
    sha256 "107703ae0ddece81f232877c95fb2e16c12cde183844a786a10e912a8bfcf7bd"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.2_darwin_amd64.zip"
    sha256 "cad2a3043885833f21446e8200cd7cb11d24a81bf85ea72d11c2f5d181076032"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.2_linux_amd64.zip"
    sha256 "acf86c92a490c87ba39375b994cf3423a2f793d32a8594b29fae0e1624fd37c7"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.2_linux_armv6.zip"
    sha256 "64edf2b9b110a8503e92be60f895db4e65c4509486b4b787a49cf41d02a739bc"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.2_linux_arm64.zip"
    sha256 "eb52d0140ca1270d63f66d0bc7f5e6e165f03bf53f79c1238887541cbbb4996c"
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
