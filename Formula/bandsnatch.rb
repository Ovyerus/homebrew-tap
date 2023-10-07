class Bandsnatch < Formula
  desc "CLI batch downloader for your Bandcamp collection"
  homepage "https://github.com/Ovyerus/bandsnatch"
  url "https://github.com/Ovyerus/bandsnatch/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "976c25c1d29e79c6ff8834725b126e9e7a27f3c7c95c88c78647b67c9aaf3f11"
  license "MIT"
  head "https://github.com/Ovyerus/bandsnatch.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/bandsnatch --help")
    assert_match "A CLI batch downloader for your Bandcamp collection", output
  end
end
