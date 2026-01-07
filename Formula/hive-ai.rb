class HiveAi < Formula
  desc "Multi-Agent Claude System for parallel development"
  homepage "https://github.com/mbourmaud/hive"
  version "2.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v2.0.0/hive-darwin-arm64.tar.gz"
      sha256 "de9e5ee8497b9946571649825eeb6e178d80560a9743997d3c9746b456daa477"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v2.0.0/hive-darwin-amd64.tar.gz"
      sha256 "59ea387d666c214147c44263af3774c56d228e5393f3341d7fe51fc5e298ede4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v2.0.0/hive-linux-arm64.tar.gz"
      sha256 "2d6cb7a6e141a8804198e9d4bb1d41b2bbeb213ce4008e88dddc9a193ac3bffa"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v2.0.0/hive-linux-amd64.tar.gz"
      sha256 "4967b71ab43202b514af2841d36aefc8e6242caba55066e133b4a46239182fbb"
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
