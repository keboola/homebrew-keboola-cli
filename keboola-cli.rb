class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.1.0_darwin_arm64.zip"
    sha256 "829854f59acff1c8778934100674a3d64e5a34a48c782510a765f4e08cb8e165"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.1.0_darwin_amd64.zip"
    sha256 "dcf951af104a5e55a612d4a80b7aef87ebb0205b8b474b176b1562fd2b55c2c6"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.1.0_linux_amd64.zip"
    sha256 "8f695bef50c64ebbd33dec82e384b37a9c39634713635840c419148afcd19350"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.1.0_linux_armv6.zip"
    sha256 "5232a19f1ced77c1a04ba7045a7d2382d2af86870a2389acc404172aca461d4e"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.1.0_linux_arm64.zip"
    sha256 "ada50e476117461bb26e5aca2c08ffb7782f7baa002b7d96199e79c5558bd309"
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
