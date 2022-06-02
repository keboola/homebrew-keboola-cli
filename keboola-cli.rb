class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.4.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.5_darwin_arm64.zip"
    sha256 "83c1072007e05ef618562cf1eec5defa5eca76fa3f2ad6a614ec5f43265d6a7d"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.5_darwin_amd64.zip"
    sha256 "7ff47970e66d45e46c8eadd53fde8cf55b74c509946a4388ab081312a37eda88"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.5_linux_amd64.zip"
    sha256 "beee139cefadac2fc3cf4d1f0630b82d99cde4d7f29264cb28967c71e56dc421"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.5_linux_armv6.zip"
    sha256 "fcaea11895ffcc0f04349411da2fb4487b6140182f9aa6e94f1300cc7a1ee4cc"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.5_linux_arm64.zip"
    sha256 "ba1dc776d2964dfda127f05c3ac4d15f364b775e2122b77808f426fdd4ba675c"
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
