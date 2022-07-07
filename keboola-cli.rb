class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.5.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.4_darwin_arm64.zip"
    sha256 "5412ca223969debbcd961428d18181db75725746c0755b94c751b8c22fd4f486"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.4_darwin_amd64.zip"
    sha256 "702197eb3a4f779bf1c479174eaa92988f0b39f93c331e5d0a7572ccb75beffd"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.4_linux_amd64.zip"
    sha256 "1bfc25ecc73d5df26e5d8e1ee670463a791faab666fed3738eecf22f036631f8"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.4_linux_armv6.zip"
    sha256 "6ad6f1c332018741dfdde12382dc372380d7edab2a0fa860e3a63ce2fefade25"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.4_linux_arm64.zip"
    sha256 "ff988e3fd2942e4334320e60c29992ec696735c4cfdb8274bcf28f26a32245d8"
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
