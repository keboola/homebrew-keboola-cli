class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.17.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.17.0_darwin_arm64.zip"
    sha256 "a6a8ddec1e9e3dc4010879ad8da49b6421ab16283602f5231b75d04040f88cfe"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.17.0_darwin_amd64.zip"
    sha256 "448211a4adb5a4bbbeda08bbfc4303b55b73b87edcec83348b3bfa4023aa392f"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.17.0_linux_amd64.zip"
    sha256 "99af36659a3b28c81155590670df3cec4e56dbf2df555322c0d8b39d60623355"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.17.0_linux_armv6.zip"
    sha256 "4b0a7680feacd095797754b763ad241fc67af99641179ecf5cb5a252f613385c"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.17.0_linux_arm64.zip"
    sha256 "dea0377db98dd3625fd4a4304db3b5cb505a120552bb35dd48ea2d42511f603b"
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
