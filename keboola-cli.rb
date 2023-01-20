class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.11.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.6_darwin_arm64.zip"
    sha256 "2cb2fd6935f2f267e3af7fdf9181f535be4a17176d2f6afdcde75ad3ef0008c7"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.6_darwin_amd64.zip"
    sha256 "d6cf9cb47a72563ec2816f2b39175c5fcfbdbd276ac9723dd728a55b8d48aea5"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.6_linux_amd64.zip"
    sha256 "e2c99d09982ba3e7fbb9dfcb719ede9fee51a716cabd22a4c773ffd0298d9aad"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.6_linux_armv6.zip"
    sha256 "3f3551f251ff8b070af76d80fd4d13fc718531988f93e9c4e15dc5427e52f766"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.6_linux_arm64.zip"
    sha256 "9559b5279a1eb33ca55b80f6b48f57efeee52362f4466641ae0fbe0e02d59300"
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
