class HiveAi < Formula
  desc "Multi-Agent Claude System for parallel development"
  homepage "https://github.com/mbourmaud/hive"
  version "1.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.6.0/hive-darwin-arm64.tar.gz"
      sha256 "7f0dadf7f29db782ca69644d57eba261c670db2e5d80d154bc40f1e14b51ef32"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.6.0/hive-darwin-amd64.tar.gz"
      sha256 "e9f4b610ed46d8bbbae61a8d1004109d7899ffd21080cec39f531c707adedcf4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.6.0/hive-linux-arm64.tar.gz"
      sha256 "a4a0513603d2e0c6b107c0a6de14902309ec69282029a3afe2c439e7d2e73552"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.6.0/hive-linux-amd64.tar.gz"
      sha256 "45ffe0a9229cabef962a850d31f76a8061e77d1d4f2e1d770a0e2b67e3b39104"
    end
  end

  depends_on "docker" => :recommended

  def install
    # The tarball contains a binary named hive-{os}-{arch}
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    binary_name = "hive-#{os}-#{arch}"

    bin.install binary_name => "hive"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hive --version")
  end
end
