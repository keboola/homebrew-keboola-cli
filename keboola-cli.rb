class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.16.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.1_darwin_arm64.zip"
    sha256 "4f76d8c10bfff547f928810735bbe679ba6d627402a4ca236dd5b9d5512498dd"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.1_darwin_amd64.zip"
    sha256 "8145af556faaeb7ce1cbfd5e4f21238b1d99dd59d8f24b44108d6cee1bab1abc"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.1_linux_amd64.zip"
    sha256 "489a6dc7a412989ac6060b2f3ba051baeaedeba15fd3d74e228c0fcc92ca5adc"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.1_linux_armv6.zip"
    sha256 "9d58e0d94df1a3c9ef59ea4856d3c0532c57884a42195a1c48f0293cfbdbc57a"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.1_linux_arm64.zip"
    sha256 "681d4c124dad86b2bb032f37a04b32c9003a231a04f6ba65feac3a822167da4b"
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
