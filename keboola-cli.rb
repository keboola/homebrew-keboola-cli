class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "Apache2"
  version "2.24.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.24.0_darwin_arm64.zip"
    sha256 "cb5c447b269bdd43b5cff14e280ec3470c39e1bf9a61f522c8e7d5065223b4a3"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.24.0_darwin_amd64.zip"
    sha256 "4245b2dca1bb995d74bab1c5da4c16d44e72d1965a944829fe797e66d9a4e517"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.24.0_linux_amd64.zip"
    sha256 "8101e237990d9cd1844bcc18e24768f3f64d5de6f2d2c284334bfab8650ccebb"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.24.0_linux_armv6.zip"
    sha256 "330ef33ced8b6b5b3d951a89a1f718242e5470a84d0bffaec5955858e1527ce3"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.24.0_linux_arm64.zip"
    sha256 "6e49f5c287e7fa9d7b136980bf9704b1f61c262e6b478033081e5ff357a6b3c1"
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
