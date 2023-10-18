class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.18.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.1_darwin_arm64.zip"
    sha256 "66d1d6a0c7f3b2987efab9a1885ef38308355a24191915485a919fc8ce48f85f"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.1_darwin_amd64.zip"
    sha256 "1431f2c5baf079511cf2846bb751d2e430b4f9d12b3ceb53d2842fa26859788b"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.1_linux_amd64.zip"
    sha256 "32eeab7d5055fa66e4da6154525cd7228ee59241f11d1316f526c84ba23c6f4e"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.1_linux_armv6.zip"
    sha256 "f930febf59645c4ee9a92f58f342a76897f2044e006caf4b814211b5ff266aaf"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.1_linux_arm64.zip"
    sha256 "d7710af947c42e83e37a071a482f1ed4c192704efd14d2a2eb27be32bc6ec60e"
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
