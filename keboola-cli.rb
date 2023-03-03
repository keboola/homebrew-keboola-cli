class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.14.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.14.0_darwin_arm64.zip"
    sha256 "81ed579064a61c48f1593c61cbe039195061f8e0c866cce28f6672b03593ce4d"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.14.0_darwin_amd64.zip"
    sha256 "75f3b89448235f92bf660e9781a65877432219e35bfb56b61ec53f743ab7c972"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.14.0_linux_amd64.zip"
    sha256 "ab0ca77aa9381c119fbb23ce852ead20faedd401d253b41ff06526472aaf5ce4"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.14.0_linux_armv6.zip"
    sha256 "d6dc9f1289c1e0094b16ab278de219a5fb48af91dab59a8a3f756ebfa6273960"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.14.0_linux_arm64.zip"
    sha256 "38e21595032960d57790af31db19f1430f2cd878756e6de4160bc992d1317638"
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
