class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/kbc_2.0.0_darwin_arm64.zip"
    sha256 "5ca783324dd947376cfe4509735ee42de67457730c0259cf98c411aa8d52154f"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/kbc_2.0.0_darwin_amd64.zip"
    sha256 "939e2e36681e9fb22ede51f2090995d95a6e7852d23fb647814fd883cec94379"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/kbc_2.0.0_linux_amd64.zip"
    sha256 "28ffde6faa047264d49a7d0cc80f2ad92bded30c98d5d2855e99df2d206341fa"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/kbc_2.0.0_linux_armv6.zip"
    sha256 "00386753bba5c0d1a0af51a082558a55d251d508bf41ba29fed1de636fdff921"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/kbc_2.0.0_linux_arm64.zip"
    sha256 "3a787044d41790051f8f9830d6e80c595a186933286fa9ff1865d68b69a8d936"
  end

  def install
    bin.install "kbc"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/kbc --version"
  end
end
