class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.10.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.10.0_darwin_arm64.zip"
    sha256 "63a120e9dbc1a477db5da8a375acdf55c57b0554ff051f50782f969090ec1c49"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.10.0_darwin_amd64.zip"
    sha256 "6ffe2b69aecb15e73a71b18b0d87b1ed445896ff83272c2d2ffd2ee7000f7670"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.10.0_linux_amd64.zip"
    sha256 "bb8b26c9286318f55e40fe5e4b33d2907a0965094e2094e4ec0870e83573d66d"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.10.0_linux_armv6.zip"
    sha256 "d40da627f692be9f4a5e47e25448831d3606bee5916d61414d5ca0c5779724c4"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.10.0_linux_arm64.zip"
    sha256 "98250f6b44919c7239df1aa7d51caec15948c8613e1f4d41540e7d51b0e51062"
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
