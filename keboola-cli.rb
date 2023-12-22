class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "Apache2"
  version "2.20.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.1_darwin_arm64.zip"
    sha256 "b6085a9b93684a896f0d72d27ce49e1a362bd168b0cd89990930e95d80c65f29"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.1_darwin_amd64.zip"
    sha256 "436eea3dc84e3e845a538b93eee2e897bec0328dbad33a42dfa4a0dbcb4dbe5d"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.1_linux_amd64.zip"
    sha256 "1eaeb26df54f80f547ecb3dec72dfc7928dab8845ca54371f4b4fb591a23f5e3"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.1_linux_armv6.zip"
    sha256 "c755ae926a204c2a9ac0135bafff73965d4db50be0b23f1ab878a35bd2195273"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.20.1_linux_arm64.zip"
    sha256 "948f3b00b0c1a9a8f5bce10326eb429b367780c3e553f9e1379223233fe99ed9"
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
