class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.5.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.1_darwin_arm64.zip"
    sha256 "15ca5190c4a99b287cac34e907d616f787492f5b0be5b8a844dda52e1614f4d1"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.1_darwin_amd64.zip"
    sha256 "7cfedc650e73018ebe8d4f3486ffe2093dc5f896de72d901a753067de3205063"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.1_linux_amd64.zip"
    sha256 "19d9911ed0f54ad9afea2f563425beb694fce227ce770538b0360a5f022ee1f9"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.1_linux_armv6.zip"
    sha256 "8a1abdfa5f989f6384de80696289a3f0036169c60d10679d74570c5814464ead"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.1_linux_arm64.zip"
    sha256 "8331ff30a92cf4b402694c10f37e8ff1ef33f05e957179281412d4ae96e2b2e9"
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
