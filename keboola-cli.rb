class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.8.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.1_darwin_arm64.zip"
    sha256 "133d307afb7be524f762b5417d054e6b63c947d262d98940146116d470a60bbd"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.1_darwin_amd64.zip"
    sha256 "58c5bbd7af9d21b291cf31a6de0e3dea351db75a29d1705e07056c57ee5b3eb9"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.1_linux_amd64.zip"
    sha256 "411b38766be1accb7f8735b5db75854635bd6afa0ec0f82116a5e1aefdab1771"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.1_linux_armv6.zip"
    sha256 "bfed98afeaec44beaa1203b79745bd822d919ad67052f25710325b602f64ab2f"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.1_linux_arm64.zip"
    sha256 "428418018e27aded9d5af757f173631dbd5bdffb0a7912e60e87adf6aa15452a"
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
