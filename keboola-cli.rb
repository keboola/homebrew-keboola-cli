class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.11.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.2_darwin_arm64.zip"
    sha256 "848dd285f4e37ac0f88227dfd0d7f4e306e97bd445135ebfe205d5390ed18a38"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.2_darwin_amd64.zip"
    sha256 "1efae8a95090cda9da00205c33ccfd3ae88817a954b28cdd646d5464e3cb5d76"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.2_linux_amd64.zip"
    sha256 "aef3060d09c3777bdfdb042b7e4ab703dd4a82d17ec00aa2d5200bb9ef6a5ab2"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.2_linux_armv6.zip"
    sha256 "6649c5eff0e3fd15ea66df442cf72ec49dae1e6f4c3b50238e28b8d2bedca655"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.11.2_linux_arm64.zip"
    sha256 "2aa7c7faa49263ea64fe092f1c8fb9744754b32bd9a633bdfcdff4d8440d096e"
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
