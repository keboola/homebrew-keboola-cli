class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.11.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.3_darwin_arm64.zip"
    sha256 "d5e8ac8b370457bc48f6a0d835bfb9c73c3d5b4e7c1e7459991ddd47b72626e0"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.3_darwin_amd64.zip"
    sha256 "626085b26042ce09b784cc81dd16ccb3974e7bc2df4ee89c0f3579e7d6408512"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.3_linux_amd64.zip"
    sha256 "9052083bbf51867c6eb894babe36a4c9ea7b01145c51dd3bc2e231892f1d79c2"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.3_linux_armv6.zip"
    sha256 "a7996a815be460cff8f4f02fb8e8dcdd4ac812e29804e6caf3a491abb3d05fa9"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.3_linux_arm64.zip"
    sha256 "a7be187ef5184d75af0c85f1ed9bb1f74a392d0f61d998ebc3de1ca62575c29b"
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
