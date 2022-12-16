class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.11.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.4_darwin_arm64.zip"
    sha256 "64560dcc65f4d2dfb9b2fab451a0b36e4f735751298691e5196b209920df95d5"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.4_darwin_amd64.zip"
    sha256 "419426a5edc5b9c50d4b85aa9bb35783b1fae6e91b47bef7023325ee48d95e84"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.4_linux_amd64.zip"
    sha256 "8d0900a70201fbeb8962a96d558805a25237901b53c99c95a3cfaa9fce6157fb"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.4_linux_armv6.zip"
    sha256 "0d558061d53de1705c944a2a55a5f596b4ab1c9f6af0cdd4deea0243e3f840bd"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.4_linux_arm64.zip"
    sha256 "0b6fed302b88dcb51bbbf54e6a47909d05ae6d0d91b41bed9b3165114488b7e3"
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
