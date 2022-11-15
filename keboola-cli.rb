class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version ""

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli__darwin_arm64.zip"
    sha256 "aee36a36d08face1ceda326879507855603cfd9a06eaad54f9704bdd70bf7119"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli__darwin_amd64.zip"
    sha256 "02cbbc218edd2df5e6f468a797c42365a37b28374b29c0e23f68478989f72e20"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli__linux_amd64.zip"
    sha256 "0b8f0f7cafc9578cd9d94a3b9c8e2ae7519a7d8ded9b657461d3761c86822130"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli__linux_armv6.zip"
    sha256 "3341309065a158443dbb88b729b4269072bb3e5dba553422f30d28f761f8806a"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli__linux_arm64.zip"
    sha256 "f4606fc6cc0edbef7c62816d7ca086487d44ca56ebc62f861eb250b09afd021c"
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
