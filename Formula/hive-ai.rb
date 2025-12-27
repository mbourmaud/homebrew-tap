class HiveAi < Formula
  desc "Multi-Agent Claude System for parallel development"
  homepage "https://github.com/mbourmaud/hive"
  version "1.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.4.0/hive-darwin-arm64.tar.gz"
      sha256 "cbff348a76f696d1f3bf697a81dad79b4aafcfa5b13d0c04f767d6fae0bdce1d"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.4.0/hive-darwin-amd64.tar.gz"
      sha256 "65acb1b8424e49706749de61d4da47a98005beb0290f931382f58c1de61d2b48"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.4.0/hive-linux-arm64.tar.gz"
      sha256 "230420ae4b2c71b939e9fec608de807dd2a0903a1253b2d37ceb29bc9944f565"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.4.0/hive-linux-amd64.tar.gz"
      sha256 "73eecc50a87351496da56294d8e8efa0d2065db7747fd3a1ef105715be43921b"
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
