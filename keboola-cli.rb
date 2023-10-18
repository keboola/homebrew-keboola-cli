class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.18.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.2_darwin_arm64.zip"
    sha256 "544e8b28c6f79fe20085186710b6b9cf240bcd0d3edceb3c94c423b77078a8f6"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.2_darwin_amd64.zip"
    sha256 "7ce6a62f3e654c60f4c5302fead7da38bc07b77495512f848751d547ca68e318"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.2_linux_amd64.zip"
    sha256 "3c2454ba6b1b9c4e7020e179b00bbef40bde8a359c6643d938dda78ae16792f8"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.2_linux_armv6.zip"
    sha256 "d09d14061b2852762434283fcb538e5b85db30434ae47e5ce30dc77fc55bc9d0"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.2_linux_arm64.zip"
    sha256 "cd52c0b4d621923962ed128ce56417ef7220a4a381c2a33e15301abc68019d5f"
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
