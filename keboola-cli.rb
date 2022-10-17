class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.8.9"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.9_darwin_arm64.zip"
    sha256 "4752950c56d1674d68597c3b0d50b80e08ecd5655920b2ea588a2e8162fd6c9b"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.9_darwin_amd64.zip"
    sha256 "74cf693baae7403f50af753411ae316feafe960c496e985e2f3318fc1405ade8"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.9_linux_amd64.zip"
    sha256 "7d0db0ad7a48876131fe2072c062dcf8007a67a0c664840642627ca19d7b46d0"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.9_linux_armv6.zip"
    sha256 "31e5256ee1af6bc5b28181a9159ed81d68b0f1b5376f0e3c1a73b14e8cfce346"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.9_linux_arm64.zip"
    sha256 "e39d20ff658e82184472bc8f4198926b3d04fdc61d137172dd1f5f318c6adedc"
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
