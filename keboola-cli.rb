class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "Apache2"
  version "2.20.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.2_darwin_arm64.zip"
    sha256 "1f533eb2b321586f5cfe44a6b42dafd206796cdef1c1c1ee00b83a82683d3b87"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.2_darwin_amd64.zip"
    sha256 "e0c6331c191fa15d010b2ade156c7dacd8060e0b70284ad7936e18ce76fa187c"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.2_linux_amd64.zip"
    sha256 "c59f8d0d6b57a54278f0b94f3b16d5af53c7be0f1f6f07dd4d9dcadc3c6b92c4"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.2_linux_armv6.zip"
    sha256 "83df4df465e99c87d3f3e439275de280a1c89cc6cbb2dd98242a05aaa2287cbf"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.2_linux_arm64.zip"
    sha256 "768969f19f895bcf0d020801b7aa9a620d794bfd87df4c31bcf9315b981e51d7"
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
