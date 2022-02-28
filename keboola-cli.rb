class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.3.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.1_darwin_arm64.zip"
    sha256 "58feb219b2ba1234afbbf0afa21306fb6849cd75530b4dfd1495dc9cc0d631a7"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.1_darwin_amd64.zip"
    sha256 "d91106525173d2cc1239af68a7ab318a219bbaf1ea1da56d19927975915e5d72"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.1_linux_amd64.zip"
    sha256 "2e9f1b8bf365ea5c35067e140c040218c368eaca87abed96546a497f2901bc87"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.1_linux_armv6.zip"
    sha256 "4fc398f5405817cb3bbeddbd31515d0f0c13ceca7765beab98fe5ca7494ca07c"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.1_linux_arm64.zip"
    sha256 "32466b532cb9158ac5c565deb495ce568609f9a615d7904e7cda6cd65692699a"
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
