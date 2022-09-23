class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.7.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.7.0_darwin_arm64.zip"
    sha256 "ffbb2f20ce91aa76ab361b880839da677cc52af79f3a94b86dc3173ea14958d2"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.7.0_darwin_amd64.zip"
    sha256 "975fa965b9809ee9320ba745b2373a4896303b6faabe17de4cd6c498120c600b"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.7.0_linux_amd64.zip"
    sha256 "54b3480eca5aec674a87de4523781cb1aae4683b8c7ca5d01e4447e04ef0cdfa"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.7.0_linux_armv6.zip"
    sha256 "a5f8209ef5afb128820cb19ede81646d3a6607901ea6b2e0d47136a48a12f4ba"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.7.0_linux_arm64.zip"
    sha256 "9e145a65b30922f44d3b30423c83b954ead1d9fa0b86d5f55e076f1659e8cc96"
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
