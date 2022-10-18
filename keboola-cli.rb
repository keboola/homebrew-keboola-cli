class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.8.14"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.14_darwin_arm64.zip"
    sha256 "e364d54c25f6675c6d33b9cc0a6348d745109c1971eef8ea8685b6cd8204065b"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.14_darwin_amd64.zip"
    sha256 "abef2edcf932bc7e1aadaaa392dfb77d88113b29e772a1cfd8d026db4b997a92"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.14_linux_amd64.zip"
    sha256 "e5b14d4690c3ea6a3e07ec9aab0e8b62f1b06f3b6ffaa5dd0e7220729c86415d"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.14_linux_armv6.zip"
    sha256 "e3773dcb569ef3c26c749020328783d6179edf40491bb0f687a621015b9bf91f"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.14_linux_arm64.zip"
    sha256 "c4205ba57c985fbb1ca5d066c82a4ff08bce6d8f816c776c009561994a98b22b"
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
