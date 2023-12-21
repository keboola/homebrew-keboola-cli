class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "Apache2"
  version "2.20.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.1_darwin_arm64.zip"
    sha256 "0d907b36fc9db98e09644e7df1cffd9b3d61d404bc059bd81e433bd951174d99"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.1_darwin_amd64.zip"
    sha256 "3f70eac658b773f37fb34507695fe2df7393b28c2ccdbdbed905b9fb98114d54"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.1_linux_amd64.zip"
    sha256 "4a1c007fa86a4ed3734a7dfc86c1b349fd7dc7368038f0b2070bfef462a3f271"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.1_linux_armv6.zip"
    sha256 "a4df1b89b6c39f4704aedb77aea33c11468ed5f43f484797f9097d627b8162ae"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.1_linux_arm64.zip"
    sha256 "fa37ff798175dbaa20e4a9d19b04fce3b72813027d70b3b7d009516abc5efc55"
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
