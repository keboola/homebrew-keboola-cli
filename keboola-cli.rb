class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.12.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.12.1_darwin_arm64.zip"
    sha256 "3ffaf930160da14dbac42cc5be64bf3b4fa4efdf3efc710d5fd08b1d337b520f"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.12.1_darwin_amd64.zip"
    sha256 "11190762ee8fa1d3ddf83c27d18991bf6c336d75f515079d11fdf142d4ded887"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.12.1_linux_amd64.zip"
    sha256 "7970717b16bb63606e829154ec73fe87fe222e8aa14c89fb20109b638f9f2624"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.12.1_linux_armv6.zip"
    sha256 "4af62ef0cbd764892b30b3aa007a4ca34e9f7a1fe02ed86dac4a62d504529452"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.12.1_linux_arm64.zip"
    sha256 "0e307d524fe658f4814202225a5ae7fad63046f9ac90b16b47b9bbb0297386c0"
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
