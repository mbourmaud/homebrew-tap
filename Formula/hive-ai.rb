class HiveAi < Formula
  desc "Multi-Agent Claude System for parallel development"
  homepage "https://github.com/mbourmaud/hive"
  version "1.6.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.6.2/hive-darwin-arm64.tar.gz"
      sha256 "8499cc82f5884219cd870bc8c3a59d7d8c0e146ea515af8dd937d88a4aa91d2d"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.6.2/hive-darwin-amd64.tar.gz"
      sha256 "fb8ddc4e22a9a5bf25a12448069f1a9a06d81374fe4f12bdcbad8f5d35f1eb4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.6.2/hive-linux-arm64.tar.gz"
      sha256 "675482e8e3a008b1018ef271f9b45d64946067af9564b793a0845f7bb9a21d83"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.6.2/hive-linux-amd64.tar.gz"
      sha256 "0edc9326c08e53a3dcb007268f2f360512f30d8bd28b2c43ce480088c70a2e4c"
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
