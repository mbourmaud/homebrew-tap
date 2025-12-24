class HiveAi < Formula
  desc "Multi-Agent Claude System for parallel development"
  homepage "https://github.com/mbourmaud/hive"
  version "1.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.2.0/hive-darwin-arm64.tar.gz"
      sha256 "ea69cb6f8b8e774528c7416fdd781ac8c1a6033ae370fad6888c71762824df5f"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.2.0/hive-darwin-amd64.tar.gz"
      sha256 "119f0100ce008384b6f5840e6706bc8a5f635c0aaa421943d6b2ae42d01439cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v1.2.0/hive-linux-arm64.tar.gz"
      sha256 "4f958840134cf76d894b692be36df6a490c8b070f7d56695327e624b5367bf7d"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v1.2.0/hive-linux-amd64.tar.gz"
      sha256 "bb999ff190ce059c3ec3b8666f0707b1dc64ae04179971e0d43a620c9169a5b7"
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
