class HiveAi < Formula
  desc "Multi-Agent Claude System for parallel development"
  homepage "https://github.com/mbourmaud/hive"
  version "1.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.5.0/hive-darwin-arm64.tar.gz"
      sha256 "041072bee25dbf38138218210b94290995b3bcf3563087cafea2fd327fd213d9"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.5.0/hive-darwin-amd64.tar.gz"
      sha256 "bac914b8120545f4b1f134952dd390023086cc4849b05a1408e74f285251fd5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.5.0/hive-linux-arm64.tar.gz"
      sha256 "db4091b86121b2cd8e22bbf4a63a9fe52ad58f74506e298f31d39431bf24c138"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.5.0/hive-linux-amd64.tar.gz"
      sha256 "1bfebfef94b26af148a6b33b7668825cb3e1387405dffcd98d35374bb60644da"
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
