class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.0_darwin_arm64.zip"
    sha256 "c876dee230843a46148cb4d39cc454144f6a76603e1a5fca004555167d14f1bf"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.0_darwin_amd64.zip"
    sha256 "ffe112a850451a39c37bf0af1c179560ee78981c9e4bccf7499f83317c2baf4f"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.0_linux_amd64.zip"
    sha256 "f7be4f7948965f401a17dd0d553b893fd33a4e9984d44f52f8ea5380eb08313f"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.0_linux_armv6.zip"
    sha256 "5e3df64ee5fc9344e77539456a8edff0f6c70a1f4026245aee1ce3974a313553"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.2.0_linux_arm64.zip"
    sha256 "2bf9f2b6d295220a03b08983c65729e498e1f65775d44ee003acb1fe3f62f26a"
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
