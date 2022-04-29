class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.4.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.2_darwin_arm64.zip"
    sha256 "2f9fa13db93608bb633ca3b9480d78350dbe86fa7da41ec2166f6e0da5eefca6"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.2_darwin_amd64.zip"
    sha256 "10dc4256b86aec6d9383a381da17bcddedbcb9a6bfc802612f0ab74778801b56"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.2_linux_amd64.zip"
    sha256 "c0c68ca6ea6cb5243b16ce5840037c55c2480dc09964e17f7c12491548676b97"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.2_linux_armv6.zip"
    sha256 "7f37157cb394fc995b81b4723950282c47e1c7f0e0b86aabe6db2880fbef813e"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.2_linux_arm64.zip"
    sha256 "bdf42e196d04ce32bed6faaba75175c10422cc3be18f635ca59afc0912111e70"
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
