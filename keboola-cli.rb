class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.11.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.5_darwin_arm64.zip"
    sha256 "0ef0e10f5836feefb89ab87ef0908b98583a4743bd6f796075669b0190cda14f"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.5_darwin_amd64.zip"
    sha256 "c48fed4a13eb732174df7753567ab08ea41e31d779316547229cce15a2a97539"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.5_linux_amd64.zip"
    sha256 "0eadc5e38e62677bfd9999c92f594084b410e196f9c4c65b9c614aec2a10a321"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.5_linux_armv6.zip"
    sha256 "c2786fe2814cd7d1b11817d9a02085e9a45801a6db6aaa790ee79e581b934214"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.5_linux_arm64.zip"
    sha256 "a832df786e3c7e9f47960055b9847af86e0d212fda158d834b964b11f5da45a9"
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
