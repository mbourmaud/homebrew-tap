class HiveAi < Formula
  desc "Multi-Agent Claude System for parallel development"
  homepage "https://github.com/mbourmaud/hive"
  version "1.5.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.5.1/hive-darwin-arm64.tar.gz"
      sha256 "cbb3828cf3038384eb086e76c3955ee33109b22db9fd6757fd6c8679243d645c"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.5.1/hive-darwin-amd64.tar.gz"
      sha256 "7bae3d6704cdbd030063cc3122cfaa0ed371e391694e133c7c9d3b6e7c2e9744"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.5.1/hive-linux-arm64.tar.gz"
      sha256 "0196e3727fc09fce8c584fe2b8f3988cbb20411c8690ebeccc707529dde7695e"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.5.1/hive-linux-amd64.tar.gz"
      sha256 "718b1dc4cea23ce16a5ad68eebdaccebe5139bb093bd48b4ac5e47d02406ad66"
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
