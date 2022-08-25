class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.6.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.6.1_darwin_arm64.zip"
    sha256 "449b87d5f14e6971d8c716fc4ad2fe96e7382d30922bcdb00c7c3ecbfbf43f18"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.6.1_darwin_amd64.zip"
    sha256 "9fdfa0f661f1c1993d1ede2cd941703c448252473a0f2a462963fdbebdc78e01"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.6.1_linux_amd64.zip"
    sha256 "b29eb2cf1fc54263462b6d1edacf5fc4e0a3f81c9d5302f2d75b42b115e83867"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.6.1_linux_armv6.zip"
    sha256 "f9b58a535362e0ae42ad45a5706816e16868c23a41a3b637fe8d1ed2694c89d4"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.6.1_linux_arm64.zip"
    sha256 "eb52f99c53bfb2a02529fee0d7a7a191d8b05f340065a04718d0a4b28baaff67"
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
