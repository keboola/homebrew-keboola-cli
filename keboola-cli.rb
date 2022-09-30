class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.8.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.0_darwin_arm64.zip"
    sha256 "cb20acdc99aee20bc4ac4bf77339c447f844dc2d0b108c85c5f3376d4943f405"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.0_darwin_amd64.zip"
    sha256 "b50ed248fb3e6e7efb3243cfa3c8af51ae99b667c59ef85a550f9fd436655c3e"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.0_linux_amd64.zip"
    sha256 "e04bcc35b890e3d4b112cb6c6af473d1307daafb36b8c0df36d0c9ca464b73cc"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.0_linux_armv6.zip"
    sha256 "bbdb2212fbf8863917bb50ad0082601021f43d342a7762c8b09775afb6e9c6f1"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.8.0_linux_arm64.zip"
    sha256 "af620d862171a599668c874bc9ee4d85b407a15f729f56999f457818f23a263d"
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
