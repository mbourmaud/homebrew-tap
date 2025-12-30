class HiveAi < Formula
  desc "Multi-Agent Claude System for parallel development"
  homepage "https://github.com/mbourmaud/hive"
  version "1.6.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.6.1/hive-darwin-arm64.tar.gz"
      sha256 "6ed2c6817b2a61f7d8cc6f304474e321ff96464d99c999d6ccc2e4feef49af70"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.6.1/hive-darwin-amd64.tar.gz"
      sha256 "109c6dc5267f143bbf641eaf6ee20ed931f347d95724b3c08f78021486963b8c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.6.1/hive-linux-arm64.tar.gz"
      sha256 "a6818d388070e304177d7846e3cc0f38aba71cbd303cc5e7d732c943e6963521"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.6.1/hive-linux-amd64.tar.gz"
      sha256 "482bd02f04154d21f4ee6d4afb484240b0daf1f320867f93293159401991cce6"
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
