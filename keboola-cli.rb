class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.8.7"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.7_darwin_arm64.zip"
    sha256 "131cd10db5c3ecbbdff898b11dedb306e1ec16e81305916d6442a3c54a636e90"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.7_darwin_amd64.zip"
    sha256 "27c64a3a4606fd99c3083fd7680ee8f20153d8ddb4fc05068771fcae8b0b0e01"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.7_linux_amd64.zip"
    sha256 "39db1154221b3858df6ee7e4e73805c93bb3826511e60a57dc7bbb4e9c661bf6"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.7_linux_armv6.zip"
    sha256 "bf13b6f06194a27324c56e4ec811fcb19bcd2aef5d2ea3940a24781ff15a7c4d"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.7_linux_arm64.zip"
    sha256 "56089805807d7e7f72d3ba643dac7c6d676f34fce82fc8965faf6728839de701"
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
