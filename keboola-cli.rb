class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.8.10"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.10_darwin_arm64.zip"
    sha256 "cadc1bab2feef62313f1024002fd36a228ee2681d695d8a0d5d706bd6e1c73fe"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.10_darwin_amd64.zip"
    sha256 "cb8d7592ad3c79205706a19bab966dcac3296541af7d5dd0ebadd3b0818c1675"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.10_linux_amd64.zip"
    sha256 "e6d28616fd8fa84a6a65201a870b490fcca44c7be1bcbe88fef4978643cf24cc"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.10_linux_armv6.zip"
    sha256 "a70daa856d35822beb42c984a95e91c1a46349f3ef98c8f1f279c50944049e04"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.10_linux_arm64.zip"
    sha256 "93eebece892a3c6547dce7e887de9f19a737d3ebfccf330ca67eb4fbd35cc7c3"
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
