class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.4.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.0_darwin_arm64.zip"
    sha256 "8838549326473fdf864e4d323470696076554a93fa83fc2dba3726cc805ca9b8"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.0_darwin_amd64.zip"
    sha256 "0b1c5ab3e6b6686771c50414f95e910673bc97cb289a375630e30a2af262d52e"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.0_linux_amd64.zip"
    sha256 "d7dff8a61da0017e47d0a60887a4d65ab1b9061138305af9ce5bfb3246f8888a"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.0_linux_armv6.zip"
    sha256 "be0f61e69dbd660bd7cad0ed9a5da7188779f9053263744061520e5eac151c3f"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.0_linux_arm64.zip"
    sha256 "07e33afb4599a6fc734805d3d574293aebf16cf6b1b1481ca75504b8fcfec877"
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
