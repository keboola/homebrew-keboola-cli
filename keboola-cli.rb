class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.4.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.4_darwin_arm64.zip"
    sha256 "08bb29df6d7cb0d999a6bf17d1e65d4842da71d05b009be5018180a2fa4d1105"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.4_darwin_amd64.zip"
    sha256 "0e89c37d0041e8f32c80e1c9633141dc4f03b898b503c9970490f048a35e6f57"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.4_linux_amd64.zip"
    sha256 "09f17ae5ed95c39cfa781097ca2709cb37e2e8b1c1a04250b4fbfa3455740dd2"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.4_linux_armv6.zip"
    sha256 "1f2bf4f4e6e69f290a0e7a57c6955f80ee5a7a9711748eaf570ac982250b1d93"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.4_linux_arm64.zip"
    sha256 "8901e237e915e2136e2ae89e673a56d5c8ffbd604fd23e1a0352c42d80de669a"
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
