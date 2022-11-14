class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version ""

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli__darwin_arm64.zip"
    sha256 "2e475632f6f317fc0730182a93614ee28233b8edb622a74930dd6745266edd22"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli__darwin_amd64.zip"
    sha256 "5c6973c8a8ae3e6e38dd62ef9da00a9d3bb90c48ed5beffa751a98c7445979d0"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli__linux_amd64.zip"
    sha256 "3228ff52041bead07d27c42a5593fb4cc5e2715fa40aeffdb2a077e3b85750db"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli__linux_armv6.zip"
    sha256 "01b8a3a98bc34f9719752798be20c1101b22b2ab26a4dcd6f78e9d222e8e38e6"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli__linux_arm64.zip"
    sha256 "ad50d5bf7b576e1b94f13909c161db115cb5d9b2f4e5cf3d3bff9dc2dac757ca"
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
