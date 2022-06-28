class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.5.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.0_darwin_arm64.zip"
    sha256 "17eca956778a10fe66c9a976c1b6eb11bc8a2d82adca87c9036df78052387983"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.0_darwin_amd64.zip"
    sha256 "1d2495de0eaec8d587b9a09d188c6070a58cda996f4113848df901555a7a2639"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.0_linux_amd64.zip"
    sha256 "f4c30d6156bea599a330af09b0be9392f8e054a928af44f43d0f0cb3dc91a21e"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.0_linux_armv6.zip"
    sha256 "1a5a0a51b08fe52d7c5a680773a11212bd79b9efc2dbc18a07140f67f86a09dc"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.0_linux_arm64.zip"
    sha256 "dd9f4e2832ad35a9b1f5e4d23b214936e6991b3c5be6f613f394bb874c721fe1"
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
