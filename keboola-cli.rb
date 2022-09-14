class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.6.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.6.2_darwin_arm64.zip"
    sha256 "c46679c6745a3a5e147a850fd6d658bdb0368f10c983cb506bb471c76a9bd52f"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.6.2_darwin_amd64.zip"
    sha256 "615e7f52ae7854c5e02810bc484c104331a4ee6040cfcada612fe5c03eda97d7"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.6.2_linux_amd64.zip"
    sha256 "68d9f8ceecdd0bdab41eaa9cf546556067a6b3d0d1bc643f37e6d096256cb681"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.6.2_linux_armv6.zip"
    sha256 "b79311581643a9a28dd00a2a3a1049dd1b70c7592309e3381f4e71d33bfa13c4"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.6.2_linux_arm64.zip"
    sha256 "0fd45524a46da643c2bb4929018d6655c7e9115ee5ce2485e09a710a59489be1"
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
