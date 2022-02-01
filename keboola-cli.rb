class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.1.0_darwin_arm64.zip"
    sha256 "acc0dd3e39ef3e9e8acb7715106dee04c50954d9e1867205cf847f7ac5bfba2c"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.1.0_darwin_amd64.zip"
    sha256 "edd175f3465d0c73681369aff27fbf08389995ef8ab4218d4c72abd1910c3ade"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.1.0_linux_amd64.zip"
    sha256 "8692a502f229f7f8b0c494e4af57e1b6d1f9bcdcd72836a0dbd79962c48408d0"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.1.0_linux_armv6.zip"
    sha256 "d1b82b811aff854c93df03bc233b54d986a30747f16c3ac31a5beda0e8043e03"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.1.0_linux_arm64.zip"
    sha256 "7501c8b48a2785b9c4ee77c64d9e0b3feb02c93bf23e4c53d1177f165972bcd1"
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
