class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.4.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.0_darwin_arm64.zip"
    sha256 "226e102a0a1acdf45c1c5204354d73ec02b608cfb6ee52073186183e42562730"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.0_darwin_amd64.zip"
    sha256 "be611a84d7fe1502338570a244f73d45d45c12569693c91c5a983b088f0c67df"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.0_linux_amd64.zip"
    sha256 "9fe6a9d86eb7cf28ff9fea59c4d216d2b1f5af46028c50e05158f638ea75331b"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.0_linux_armv6.zip"
    sha256 "4fcdace8f2037a9a625c4581be6100508bcdf9ab03e8402a8dd2b88204050db4"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.0_linux_arm64.zip"
    sha256 "d72603da98aa5707c329cdf236e3d3f69aaf72f922f5c0d12029d30534b54a93"
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
