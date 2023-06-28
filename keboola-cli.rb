class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.16.5"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.5_darwin_arm64.zip"
    sha256 "1da58836fce0d86bd3e055f10d677be21c4ab231c4008dbb4c04607dcd1b5de6"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.5_darwin_amd64.zip"
    sha256 "f9af7f66094acd30b84692a9062a93f145014e9779dc358f0957e754725c8957"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.5_linux_amd64.zip"
    sha256 "97aab42512dfd90a2b076fa36ad7a6daf30f84761a23b8d7d9502bceb370f98c"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.5_linux_armv6.zip"
    sha256 "8fc51d0aa5dd087d71f34d2df1f8a0ad7ad3c91e3a9677d302d4efcfc7cedf09"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.5_linux_arm64.zip"
    sha256 "710b1fd83ef2e7ebcf43a872c53a9eb24e1b47364195fe3b3d0e6bcf2cc66ca3"
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
