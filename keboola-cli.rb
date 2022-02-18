class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.3_darwin_arm64.zip"
    sha256 "23466f7e5866d785f2489c94be6f2e15373266ba15a0100a0e953f390634fd8b"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.3_darwin_amd64.zip"
    sha256 "75a12713f86f7bdfdc56e632b867ed9b926801b61ffcadc79f66a2d0dc3008a2"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.3_linux_amd64.zip"
    sha256 "e038fd6bd9561fcdfa61e7793483690a4ceef16e4f529c5cafc2d3053b4788dc"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.3_linux_armv6.zip"
    sha256 "dbf9eadfe4cca8de6bec2cdcf582141cd4d13f2e87c7284ef2bac5127ae197fc"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.3_linux_arm64.zip"
    sha256 "d82df8af63608064c3e95904aad0ace12a571f9136b094f1a5a32f496e543534"
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
