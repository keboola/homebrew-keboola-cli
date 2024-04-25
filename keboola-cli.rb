class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "Apache2"
  version "2.23.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.23.1_darwin_arm64.zip"
    sha256 "3c91dca14e5a5ee88a8926657683c644f73876796e0b47bc6506e0f978ec68b5"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.23.1_darwin_amd64.zip"
    sha256 "4dba11221e2e4e8955b2fbf6fea4b65ea43f0cfa6d43efd3520fb78326003638"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.23.1_linux_amd64.zip"
    sha256 "f5f402966f1655a9fce608ecbadef89f2213aea121c2734bcf889068909b7757"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.23.1_linux_armv6.zip"
    sha256 "a0e678011e5652bfb0fec4090c9c036c261b0e8e45a70944f22ab5bae73b911a"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.23.1_linux_arm64.zip"
    sha256 "f3de5684c62205df7dd0a0442f4585695c57b4d391d96a5a4644e49226d6984c"
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
