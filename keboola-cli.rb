class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "Apache2"
  version "2.21.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.21.0_darwin_arm64.zip"
    sha256 "e22943b1419ff5631d41da74313c3471812ee4c6ac72ebbff02a1789c53ced69"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.21.0_darwin_amd64.zip"
    sha256 "1a83e84e99ef8d1bc11847e6795d7045c9f336ad1ad6e76978b9d64c6198f8ad"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.21.0_linux_amd64.zip"
    sha256 "560b9aa75da62d965930ff1c06eeb7621922ded688c5cbf7b9a0004be36b5c5f"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.21.0_linux_armv6.zip"
    sha256 "aecc9c4596e9814f4357c07673f280b61eaed8e99dc52c836b19d80c0972a79a"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.21.0_linux_arm64.zip"
    sha256 "fbd4c9654206b9a55f49c529e212d1202858f4ba5a14c69a1cedaeb81e7e6608"
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
