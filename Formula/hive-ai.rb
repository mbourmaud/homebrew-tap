class HiveAi < Formula
  desc "Multi-Agent Claude System for parallel development"
  homepage "https://github.com/mbourmaud/hive"
  version "2.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v2.1.0/hive-darwin-arm64.tar.gz"
      sha256 "3fbd6ae01167ca4642c474819dfaffdb93d0d355bd15ceb84281d4d1d10342b8"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v2.1.0/hive-darwin-amd64.tar.gz"
      sha256 "6b4c48d593a0a8577c4318c4150f0b3e893bf0a1d0527dabcb67bc44d7aa4edc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v2.1.0/hive-linux-arm64.tar.gz"
      sha256 "f20689ab77b13e58ba6f0b533084c8516b6ca7562c8a6b6e4433697e10b65900"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v2.1.0/hive-linux-amd64.tar.gz"
      sha256 "f1e3098c7f2eeda9ff8fc08ef2c327df364a928783453a596a1ad7f7b024fdbc"
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
