class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.19.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.19.0_darwin_arm64.zip"
    sha256 "0af32018b10b33295c43014f3240f5d391275bb2b722a6d1a2f64de11d7edbc1"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.19.0_darwin_amd64.zip"
    sha256 "c35da3e7a111313254e30a95eba1f5c38657ce392ce77caa4e5c083c68c73953"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.19.0_linux_amd64.zip"
    sha256 "3d8be0059a7734b87ba52af3761dfd1b6c50aab86537954080e8b7590fbd1bf5"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.19.0_linux_armv6.zip"
    sha256 "e29611d76d76f28f08b88f358b317d94ceb0cc039a598f4dc289ad11ed84c98a"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.19.0_linux_arm64.zip"
    sha256 "5d7f1c255da47d6220fdaa0c5890edfadb061f02b95b6d3d5e845c924d3a81ae"
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
