class HiveAi < Formula
  desc "Multi-Agent Claude System for parallel development"
  homepage "https://github.com/mbourmaud/hive"
  version "1.4.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.4.2/hive-darwin-arm64.tar.gz"
      sha256 "86ffa535272ecbe9a49cd4b8051013e1525f924bd602289b67b9ac3b8c482848"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.4.2/hive-darwin-amd64.tar.gz"
      sha256 "c9df475b651cb85afe21039eb49fb161a5a1e118de11b400a0d065df83b87e72"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.4.2/hive-linux-arm64.tar.gz"
      sha256 "fa779cd57d3b1be4fa0eacf1ccd170df72d0272e08c39e012f22b5410d782d3e"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.4.2/hive-linux-amd64.tar.gz"
      sha256 "ddbf55986ba200f8d7277fba91e91ce54b7d5068b8d0006011f8acb6c1bbb91f"
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
