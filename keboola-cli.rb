class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.2_darwin_arm64.zip"
    sha256 "a2d05c9781cff23a0697997ca0e9270db1bc30798706fd419b8ca37dbd122d60"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.2_darwin_amd64.zip"
    sha256 "ad7343c7a8329a65dc9a6f8a9d8a5852447428093ab4c43122688f42097f7f8a"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.2_linux_amd64.zip"
    sha256 "47e78f88cde04adda4114d92bfe94f938d61506453e6f67d79013dd837acfd26"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.2_linux_armv6.zip"
    sha256 "37b71fd5149b39705a58a472b52f5fa8e5c9e69c0867af28548b9512d71c63e9"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.2_linux_arm64.zip"
    sha256 "05dc6f89d989b891d73d810d4fd70a2b3d30437be8641fdd7248c6b2b41cb68b"
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
