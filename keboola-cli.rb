class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.11.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.7_darwin_arm64.zip"
    sha256 "2273fc7471e84b5e19dbdaebe8cedf0c9c4109e0961bcdcbeb182fd301f8e812"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.7_darwin_amd64.zip"
    sha256 "594ede885ab2857049375a415f95af9a754d17d1c586855b5fbf0f8f89323894"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.7_linux_amd64.zip"
    sha256 "871f943aa9a50d5775df9eb5b565b1fbbb3dde40d56d4c46fbab4e27ecc50d16"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.7_linux_armv6.zip"
    sha256 "49191b6ab63da7916e0a069b7afa6da8543c902660824283f701ff8616ec3b14"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.7_linux_arm64.zip"
    sha256 "3890dda87544babdc65fdff418140cf57a5cde3faf53015deaf26be3e672c892"
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
