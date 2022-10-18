class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.8.13"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.13_darwin_arm64.zip"
    sha256 "cbb2b2b83a10ffd3993b8f8b3c7a3fe34c84708469d5673783c8061cf4e7035b"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.13_darwin_amd64.zip"
    sha256 "68fbe2df030028cb6aa57de07224bb4e5cdd605d49a51f19f17bb2b441aa31bb"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.13_linux_amd64.zip"
    sha256 "4917e0003b803796dd328d05eabe63446bed002c41b16182959c8d6f2b8c5b9a"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.13_linux_armv6.zip"
    sha256 "2b413232edeed62177d793090a84a05c513104aff21cb5ecce89d959b90a1241"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.13_linux_arm64.zip"
    sha256 "a6117a5bbb7e4ae4a21533fca63907fb3232bbe7ba3ce8dc15a843d9bed7d45e"
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
