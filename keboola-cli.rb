class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.18.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.1_darwin_arm64.zip"
    sha256 "f4b09e7b7627b428e99c1071ac5c8142b6cb4ecd71d874a7501a44856750b035"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.1_darwin_amd64.zip"
    sha256 "8b3535494caa20d21d0b61f33ec06496c6d9d08a2a06e2b8ccfe76ef50030696"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.1_linux_amd64.zip"
    sha256 "d868a7c1f19a2fc7fb31bc9d1a019f858c6cd12c1e8ab76fe9e67efed9554797"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.1_linux_armv6.zip"
    sha256 "e6512d153372a0ffeaae65083e7e543f4e2cfa4e1a52f18b979017aa58037f8f"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.1_linux_arm64.zip"
    sha256 "6057a361d82b3cf7e6f2c87f37689b353d21e818b2499c5df289e9ba572d2f51"
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
