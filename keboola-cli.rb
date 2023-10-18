class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.18.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.1_darwin_arm64.zip"
    sha256 "4cf3314141fca331420be9f9894a94413308039824b45852f0aeba4d9100fa48"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.1_darwin_amd64.zip"
    sha256 "54ebe18727be5ff40b6fcc0d4cc5039f4b6b3b587d861d46580851ebd0f55e2b"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.1_linux_amd64.zip"
    sha256 "fc8fb77966f946b76c5a35e026af7653944de3fb4c42fd00ab7e14c1d7c08726"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.1_linux_armv6.zip"
    sha256 "9e410ff7ed145ef1fe1e7bb88eaec6b21ee65c792663465791fe73f12e443f92"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.18.1_linux_arm64.zip"
    sha256 "167d11dbd3838a77f2b5a20b83a724a67d01b9eba31000cd7a35c2b977c73337"
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
