class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "v2.11.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_v2.11.2_darwin_arm64.zip"
    sha256 "4428524090cd299c2e734de9ac5a857753e4ce5fca4057ca3f1626aeefd9e352"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_v2.11.2_darwin_amd64.zip"
    sha256 "a0263b57d04b100bd8a809d49ad943ce23961d60a6f8f55b6ea09bc3e6b3af8e"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_v2.11.2_linux_amd64.zip"
    sha256 "dc97b4c84a8df422dd18d8c29ced6aa475f2b4900fb87ef19e599ebef12ce60b"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_v2.11.2_linux_armv6.zip"
    sha256 "caf285724fc31c21c586ef2fb9d2d8dd16d5c48cc1b9a79c68ef3da274b0e441"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_v2.11.2_linux_arm64.zip"
    sha256 "118efca41a363140dabb68599ec0454a5c77633e26bffa0fbc948c0077828d81"
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
