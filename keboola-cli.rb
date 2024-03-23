class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "Apache2"
  version "2.22.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.22.1_darwin_arm64.zip"
    sha256 "587f18d7e867434491b612f502c2103a000bcdbac785988b5f37b622d1aec98b"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.22.1_darwin_amd64.zip"
    sha256 "9119a2687b4f5d49484323f78617d00d849415cf140feb631655c580ecb5287d"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.22.1_linux_amd64.zip"
    sha256 "396a03fdab3ed43fb89709dd4c448eecf3eb813114965e58ed581d63bd76adde"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.22.1_linux_armv6.zip"
    sha256 "98bd4535f872b54f6cc61010710660c2342e15f5691171c1e372c9919222dd61"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.22.1_linux_arm64.zip"
    sha256 "dea2d2ebfca52d81108c1a40c1719b41e01cb049a65d8c35712c1c0d5d984a2b"
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
