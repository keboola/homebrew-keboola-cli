class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "Apache2"
  version "2.29.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.29.0_darwin_arm64.zip"
    sha256 ""
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.29.0_darwin_amd64.zip"
    sha256 ""
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.29.0_linux_amd64.zip"
    sha256 "cb9495d6732a434c3b2580bfd8dea879f032c50c781507f9b7a689dc3be2d42f"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.29.0_linux_armv6.zip"
    sha256 "de812160cd0064b46f0465f6ddd05e369847e749e82b9d72ea6ca0243ba66aee"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.29.0_linux_arm64.zip"
    sha256 "1e613622a2760e8078966c06004b6fa4b8c1ec6371c92288714cf64b8822ba09"
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
