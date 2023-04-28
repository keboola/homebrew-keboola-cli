class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://www.keboola.com/product/cli"
  license "MIT"
  version "2.16.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.4_darwin_arm64.zip"
    sha256 "9e11fdd97f1a08a754170117683907bd7d2da3a7f0c7b40b96ff1b5fdf5ebf6f"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.4_darwin_amd64.zip"
    sha256 "b72088015e7b666acccf434608b2739b9c4b7ab6b52a8412cca75f9b0142e05f"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.4_linux_amd64.zip"
    sha256 "44a49b66d00d54f8e043f24e8c0b3f2b5817712a7d930d5448d06737109ace22"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.4_linux_armv6.zip"
    sha256 "db9537b19ec53d0e6abf2c7af710943fdac67addecfed8d465934b80c3aec4d1"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.16.4_linux_arm64.zip"
    sha256 "146eeb889850b3b56be7121e07dd6aa726c56d50ba676eea61f1f985066e5cd0"
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
