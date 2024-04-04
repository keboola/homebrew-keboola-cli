class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "Apache2"
  version "2.23.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.23.0_darwin_arm64.zip"
    sha256 "155a4165e125744fc6cde93d7b079798f06b6f328b30d30a7878331cd01b516b"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.23.0_darwin_amd64.zip"
    sha256 "157954e7c500e6214b2b63d616358aa5f58551481f956f7dd1ff2c5cdb22dee4"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.23.0_linux_amd64.zip"
    sha256 "10381cddbc1b056b76ce92e6f5d8a2b2f509b32c784c62740fb0bb6507c660e6"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.23.0_linux_armv6.zip"
    sha256 "5b2fe87a4e95619497fdbe1c4bc37294cb2eff5be96b6f38ed27fa901e39cc80"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.23.0_linux_arm64.zip"
    sha256 "ec94578e1fd9e32e0497c5dd2af6860cbcad512f6abecf9ef9255696e931db16"
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
