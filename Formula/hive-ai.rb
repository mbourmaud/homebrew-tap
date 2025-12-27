class HiveAi < Formula
  desc "Multi-Agent Claude System for parallel development"
  homepage "https://github.com/mbourmaud/hive"
  version "1.4.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.4.1/hive-darwin-arm64.tar.gz"
      sha256 "0666d9c716d4b51d7eb9192ca28eb9e338d2cfea18281cd785817f5e6be12372"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.4.1/hive-darwin-amd64.tar.gz"
      sha256 "95030fc1e0ff92cff133c5870c7b5316fa30040457ff2b1a1b63e45d476d84f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.4.1/hive-linux-arm64.tar.gz"
      sha256 "c77ff3c56415afd40533444f05e4503bed21359f1125ea2d513fee3dbea61ee4"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.4.1/hive-linux-amd64.tar.gz"
      sha256 "5d57ad0e16185a07b1bb1d09cdd725fcecb9256fa2aaebb7740a82a788cd21de"
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
