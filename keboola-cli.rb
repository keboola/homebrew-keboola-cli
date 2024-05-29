class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "Apache2"
  version "2.26.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.26.0_darwin_arm64.zip"
    sha256 "8f9a020a37a1fc2e787282ff4561d0e5361bd8bc080094fd9ca344d4bc0b1ab5"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.26.0_darwin_amd64.zip"
    sha256 "5093885aaa2efe1b7d3ede3b793910be35cf8f49ecdfce0afa716ef3dc739135"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.26.0_linux_amd64.zip"
    sha256 "9692f4fd0643f70a57f3e824f5b91a9d2f5829d8efeedcdc7139cbdeed5995a9"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.26.0_linux_armv6.zip"
    sha256 "37bc8217c15ea020fbc5b99500a078894c9211cb7c7eecad809d4d967e4c6700"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.26.0_linux_arm64.zip"
    sha256 "9a0b2cd88b7312ffc670163a6740efdd509ca3cb466be7c0482b64f46a8d61b7"
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
