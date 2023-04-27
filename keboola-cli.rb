class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.16.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.3_darwin_arm64.zip"
    sha256 "4561dc2fef53fc8fe59ef926282eb48603d7442a8b13b9cfa417d0e4cd9b9d97"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.3_darwin_amd64.zip"
    sha256 "bb72e7a6dd7809a76fcb6fe39687706f05bfa3b7438aad3d4f37f6050bbb1db9"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.3_linux_amd64.zip"
    sha256 "919d8b7cf5f2c94bf6785ebc6a8781fde88c12f38ce4bd1e05c8b0ad8bfa6d77"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.3_linux_armv6.zip"
    sha256 "6ccc8f7835ee60f93355328eec1236f58fb36d19d7a9b41b477dd532e758056f"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.3_linux_arm64.zip"
    sha256 "86a6acad9a09d200962d439b6995d14189ee84d662ffb914eefc81f54cce9b72"
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
