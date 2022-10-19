class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.9.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.9.0_darwin_arm64.zip"
    sha256 "ecdd4ea649c633de00e046103458625f9f8a94fce5901e2ae55e24523e93eeed"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.9.0_darwin_amd64.zip"
    sha256 "cd7a0dcdce1851d1e664abc3cf74f1007ec7ef7fe16eaf229a10175b432418e2"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.9.0_linux_amd64.zip"
    sha256 "2a53867691c0f2bf065213c435fd4bef028042ae18b06cbe8729c8f1c51a3e07"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.9.0_linux_armv6.zip"
    sha256 "1f6ddc7330d404923f11a98f59e21ebfa7fffb60b1665e5960d5a481f42acd02"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.9.0_linux_arm64.zip"
    sha256 "113d61a7e35e921d771e9e4a7b6bd5aadad11d4026f4979a5fccfe00b25c334d"
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
