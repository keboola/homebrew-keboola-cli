class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "Apache2"
  version "2.39.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.39.4_darwin_arm64.zip"
    sha256 ""
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.39.4_darwin_amd64.zip"
    sha256 ""
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.39.4_linux_amd64.zip"
    sha256 "7d5a3e9d2b42249f553aeb4b968e0f562dcc061010338edee0d5b75046e94137"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.39.4_linux_armv6.zip"
    sha256 "bc83448d7ed05ef694ff46a6c675e6ea2a6216239c9134a7170c39dfc93ff714"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.39.4_linux_arm64.zip"
    sha256 "41386a2f87fce7e661016ae59edc71145cc52ac485a384d97840c9f797023173"
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
