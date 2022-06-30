class KeboolaCli < Formula
  desc "Keboola CLI tool"
  homepage "https://cli.keboola.com"
  license "MIT"
  version "2.5.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.2_darwin_arm64.zip"
    sha256 "4044ff9ea439d54e07e703cb54c3e569eef99ffd191df50b907c2c3cc429ecb8"
  end
  if OS.mac? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.2_darwin_amd64.zip"
    sha256 "a0521458207084b6ceb27792640063d0cd471bab43beb0a522f211a0caec036d"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.2_linux_amd64.zip"
    sha256 "1bdb94fb498eef9a75083f2ce98395034a37712550fd78b478bd066b72f41298"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.2_linux_armv6.zip"
    sha256 "df0541740d299ea95f29080335c5a069ac09b00c4eb0aa348894122ca435cc36"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli-dist.keboola.com/zip/keboola-cli_2.5.2_linux_arm64.zip"
    sha256 "86adedde0403d216caa70ad357ed80f64089a1728375c3ed4a958c2a64d8d9aa"
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
