class HiveAi < Formula
  desc "Multi-Agent Claude System for parallel development"
  homepage "https://github.com/mbourmaud/hive"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v0.5.0/hive-darwin-arm64.tar.gz"
      sha256 "3a30d4f78b84e28e4690c0ecb213e6366b5593792b2885ebe71c20260d971c90"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v0.5.0/hive-darwin-amd64.tar.gz"
      sha256 "e8b1eb1cf7a2526592a0af15379fc3073ba2c2ef0bf43682072b5426206d859e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v0.5.0/hive-linux-arm64.tar.gz"
      sha256 "194cae67b429337084b473a8580f998b61df87d57ef6d82bc6f73d1378173f25"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v0.5.0/hive-linux-amd64.tar.gz"
      sha256 "d4f6ef2690e961dc3c1752bcd746e409486a1977563b842de8fe1a829ee0eb85"
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
