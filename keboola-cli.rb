class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.11.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.0_darwin_arm64.zip"
    sha256 "b800088cce7e5703109037479cc83fe8d409591d733c145f9fe9baefed108b2e"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.0_darwin_amd64.zip"
    sha256 "738df7f1181acd125cdc1d48f13513898b982949f1d7f14b37135c94d3cf419a"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.0_linux_amd64.zip"
    sha256 "221452b8fa033815acd603681dfbf5fc60062dfcc3cb330d714303feeb6e8b9b"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.0_linux_armv6.zip"
    sha256 "35e3315115ce5c89dae8156306d7ca52ddd2837de6495980723b776edb92b17b"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.0_linux_arm64.zip"
    sha256 "0864d8d65db4d43ba467fbaba25c31411f31fb0b71e2d234490c13b73c5e56da"
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
