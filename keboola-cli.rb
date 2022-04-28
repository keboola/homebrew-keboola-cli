class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.4.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.1_darwin_arm64.zip"
    sha256 "1c2da507e3a07366c5c91b7e4145e5bc58dba265e37e58178ae87c8d4591de53"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.1_darwin_amd64.zip"
    sha256 "3bbce0d6b43235ae2c5cf822302b96ad5f15b5e3d3bd565da0482f9f2f8d3c74"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.1_linux_amd64.zip"
    sha256 "14f8459996b36a86748fda8201444720808ac789959961e8ce4f2fa2f71dcbf2"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.1_linux_armv6.zip"
    sha256 "073344454c8a705351f64cc872f36407ea7479086172ab7df9dad0e99ef4557c"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.4.1_linux_arm64.zip"
    sha256 "68e38c5e191070070db7d5623ba0f94e74e4a1b639199ede21411101c7c1a3d7"
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
