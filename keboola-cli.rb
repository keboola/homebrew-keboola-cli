class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "v2.11.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_v2.11.2_darwin_arm64.zip"
    sha256 "fa0f6d6be7873a20f7e34a96d00e56112f6cdd6312c0fbeaa52c929d7fee40f2"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_v2.11.2_darwin_amd64.zip"
    sha256 "2279231b817d43367f15416c4428ac3950ba859c7e06d777fb58df1edc89136a"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_v2.11.2_linux_amd64.zip"
    sha256 "b24d48196641e870842a70ae56e747b05718966f70bd32cb93aab7b968e1d250"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_v2.11.2_linux_armv6.zip"
    sha256 "21260a84837e5f634df80ee9367d658ef6bfb7a0543772777f21dfe19c68c8b8"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_v2.11.2_linux_arm64.zip"
    sha256 "1e578738fe5283b999b71063489aedff79dca9f96135498154f2b5e14f989453"
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
