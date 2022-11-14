class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version ""

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli__darwin_arm64.zip"
    sha256 "538cefcce8e63973dfd774d97262edbb49b9feefb1bebf06e251b58e36fdf7e1"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli__darwin_amd64.zip"
    sha256 "ff30501922520fac55aeb0c877de07b5166bf7ad424ae314d6b3f0abb4904d82"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli__linux_amd64.zip"
    sha256 "670cb3b982e96fbc7eb6fd8b44d17b50de789682602dd9a3d644fbf773d78a8c"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli__linux_armv6.zip"
    sha256 "ee6065af099953a873ba492d6035b040293f7a2ee11cfded4951e663873f18a6"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli__linux_arm64.zip"
    sha256 "78ba08796cac2d3e0a789f372c7b4271c3b49697ec923ae76a8854adada3d161"
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
