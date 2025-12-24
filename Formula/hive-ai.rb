class HiveAi < Formula
  desc "Multi-Agent Claude System for parallel development"
  homepage "https://github.com/mbourmaud/hive"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.1.0/hive-darwin-arm64.tar.gz"
      sha256 "6d5322beb6ff762d4cba04fc2eaa67445368fda638bf4210eb36fe4115132f1e"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.1.0/hive-darwin-amd64.tar.gz"
      sha256 "f97061dc7d44e5bb84fb3cbfa8a7458efb6e282a2ca44b952cf5bdcda7e570f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.1.0/hive-linux-arm64.tar.gz"
      sha256 "0da60799a6b7e9538539cc8b0eeb3b6238cf2dd476be00ca6483d71c525871ec"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.1.0/hive-linux-amd64.tar.gz"
      sha256 "022dd0c625fa42f27b4f3778b4dcfdde23023a0aae94fa097932ec2f0bbb9f92"
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
