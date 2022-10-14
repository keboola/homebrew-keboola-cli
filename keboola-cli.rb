class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.8.6"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.6_darwin_arm64.zip"
    sha256 "9110f789346c46b381603a1e08b781451afde7e50c030d8d6db22fd54662ecb6"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.6_darwin_amd64.zip"
    sha256 "553988fb0bff91db435007affad0f6c6f764fe2603bb21008c4c9628f58ccd17"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.6_linux_amd64.zip"
    sha256 "1b743993542e4a1c09c31559824589188d96d4c7bfbb73d8161a50aa7a449506"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.6_linux_armv6.zip"
    sha256 "c7fef07cc30df1465537c88f7c1fc833fee64eb81acebaf1c44c69c54d4a84ec"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.6_linux_arm64.zip"
    sha256 "1458e8f6eeea6cfd943cd38401871d94b0747eedd477a09fe62a012cf4e5ac7e"
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
