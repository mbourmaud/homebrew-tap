class HiveAi < Formula
  desc "Multi-Agent Claude System for parallel development"
  homepage "https://github.com/mbourmaud/hive"
  version "1.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.3.0/hive-darwin-arm64.tar.gz"
      sha256 "874bc073814a99a87317af3b198ddaf393df77777c09597701b3bae1865a211d"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.3.0/hive-darwin-amd64.tar.gz"
      sha256 "c6c782e781540f3de6a8db7b5bfe1a116fe24749f623dc8aecce916598ea69a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.3.0/hive-linux-arm64.tar.gz"
      sha256 "8259a8946bdb8091de5025808976973a348c74555987a20b52c31632ebc72c46"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.3.0/hive-linux-amd64.tar.gz"
      sha256 "6cb2b2c4528383fb05799177a5af4370aa30e43dbb067dbde595a024ab397e9c"
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
