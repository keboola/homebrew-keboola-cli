class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.8.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.2_darwin_arm64.zip"
    sha256 "6f0b89a7bf2263c83d8b30be67fe7d12a31f1516b1aec80a192ed3f985df7691"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.2_darwin_amd64.zip"
    sha256 "b04ecf896906f77b4ef16b2d28adfa16b1605daabeba242be2b7dd43d43e0325"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.2_linux_amd64.zip"
    sha256 "dd28c4f6f045e61e8eda6fcc8c1edd5abc594103f17a0f569e2a18347be40822"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.2_linux_armv6.zip"
    sha256 "49daef06390b94db2c8958239671a537422f63e3699df247135821102f45a3b1"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.2_linux_arm64.zip"
    sha256 "3264a2ecdc848cb2b4484c2f1cafadf81e3b162a0fe3d7986fbfb3a7d9a41e77"
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
