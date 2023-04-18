class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.16.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.2_darwin_arm64.zip"
    sha256 "63ad6578b288816b4e4e8ca0d0318a97bcb0d4ef4883382d1f7768745943fa46"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.2_darwin_amd64.zip"
    sha256 "b117a711cccb72d8f376284557c82b1e1ca370495b9ac73efcd5dbe48fd44983"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.2_linux_amd64.zip"
    sha256 "32823afdd64c4cf6da1ad52f2ffaec90c66406a7eb818d3589d5befbdb070b21"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.2_linux_armv6.zip"
    sha256 "4ad5b0e91ccfd687d36d360a583262a4814c32a10e81b7c8fdaf44a010ee89be"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.2_linux_arm64.zip"
    sha256 "3ea93d05ebc6765aacf1eee0f83635ee30084a9950cb6c69c1016c5a5424bc4a"
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
