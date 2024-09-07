class Bandsnatch < Formula
  desc "CLI batch downloader for your Bandcamp collection"
  homepage "https://github.com/Ovyerus/bandsnatch"
  url "https://github.com/Ovyerus/bandsnatch/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "f1b0fc277605205fc5b4d618554bdf3dd93ed8e6883408a644bd155d8be04a69"
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
