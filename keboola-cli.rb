class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.6_darwin_arm64.zip"
    sha256 "2a3231f1037f39268be3d70a2afaef4bc5ccb57a0af632a25de49d86799c98dc"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.6_darwin_amd64.zip"
    sha256 "a96255b96891e1da3457f55fe774fe4107b63f576a86f111fc8e2a32d0b5695b"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.6_linux_amd64.zip"
    sha256 "a18117f502ad06fa017883d5c01833fc51e77ffb107d5b18f44b9061d0143326"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.6_linux_armv6.zip"
    sha256 "55f430b8d4673aee6427f9bddf971753edfe2fd4ec787f97654cb33be2152f0c"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.6_linux_arm64.zip"
    sha256 "de99d03aaf5fada1c71e5f7728f28fcad6dc2dbb888b56f035c540faad9759a9"
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
