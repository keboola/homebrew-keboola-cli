class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "Apache2"
  version "2.44.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.44.0_darwin_arm64.zip"
    sha256 ""
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.44.0_darwin_amd64.zip"
    sha256 ""
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.44.0_linux_amd64.zip"
    sha256 "d74f2d510eb7d37ce35743e8660ab013accc261f030a3de7db1aef03e10d3806"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.44.0_linux_armv6.zip"
    sha256 "ecba265f4d1715f0eb0f7e408e00bb3fb6273d8a7fbcb3b2e1461d917dbe5ca9"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.44.0_linux_arm64.zip"
    sha256 "f9891d00bf8ff9304e2cc5aa4c432bd88b8c9dedfdb9bf42740fb314ed3e2ba2"
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
