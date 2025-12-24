class HiveAi < Formula
  desc "Multi-Agent Claude System for parallel development"
  homepage "https://github.com/mbourmaud/hive"
  version "1.0.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.0.2/hive-darwin-arm64.tar.gz"
      sha256 "3b1e12533d9efe9e8400113ee85c6d58b512bd9eff4ac519272c51d47c829588"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.0.2/hive-darwin-amd64.tar.gz"
      sha256 "d0edbd2b9e3574e7545fa2667bf8e58e90d507a2c31f4e950e68038995b020f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.0.2/hive-linux-arm64.tar.gz"
      sha256 "1164c211ae3650002c3b2b595ee01d211ca130c7d42d91b90a7345b624cea343"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.0.2/hive-linux-amd64.tar.gz"
      sha256 "70c406e766b6ce935dbbf8aba10f8dbcedcddcbd9838b1fbacdeee224ab0b657"
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
