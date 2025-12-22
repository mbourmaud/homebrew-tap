class Hive < Formula
  desc "Multi-Agent Claude System for parallel development"
  homepage "https://github.com/mbourmaud/hive"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v0.2.0/hive-darwin-arm64.tar.gz"
      sha256 "8ba9f741df85ea2125e4eb97f3d5dfeac8d541bac34f6e207697477c7c342c17"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v0.2.0/hive-darwin-amd64.tar.gz"
      sha256 "0a20174a2b1aba62bb3a2295e66cc662879e43988a2fbdaaa839c234ecc963b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mbourmaud/hive/releases/download/v0.2.0/hive-linux-arm64.tar.gz"
      sha256 "5a67a8dac65a6d0a40d20d016c6a2f9da73f01c7d7488f1bd4b86e4786475b3f"
    else
      url "https://github.com/mbourmaud/hive/releases/download/v0.2.0/hive-linux-amd64.tar.gz"
      sha256 "d36008c2753821e81d3758f428f51b83889d84b722cd4f10b3bca38bc6a221b6"
    end
  end

  depends_on "docker" => :recommended

  def install
    bin.install Dir["hive-*"].first => "hive"
  end

  test do
    assert_match "hive", shell_output("#{bin}/hive --help")
  end
end
