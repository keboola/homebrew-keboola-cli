class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.0_darwin_arm64.zip"
    sha256 "d839af5a0c4575564fb45a739042ab1eb9610babd51dd82fa1870669ce063961"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.0_darwin_amd64.zip"
    sha256 "5c0d9a0ea943efca5daa0d81990da3311ce2502b8fa92af1d212dfb3e7a6e050"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.0_linux_amd64.zip"
    sha256 "79aea3a6e20932e0fc0e80e8156c1767a52ac71f70293e4993efb88df0ef191e"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.0_linux_armv6.zip"
    sha256 "14f5d5c5b04ebd8baa88c35003799b2368940155927dbdc181c8473bec3bca67"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.3.0_linux_arm64.zip"
    sha256 "62fb32c1f1ab289b9fa8b7161ae6dd0182bacc83e9edd31c9167f0bef101cebe"
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
