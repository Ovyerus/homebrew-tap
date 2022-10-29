class Bandsnatch < Formula
  desc "CLI batch downloader for your Bandcamp collection"
  homepage "https://github.com/Ovyerus/bandsnatch"
  url "https://github.com/Ovyerus/bandsnatch/archive/v0.1.1.tar.gz"
  sha256 "9b0557c0fe6c3409ad213750e8d0c547ac5469cb54850ba540dd806e64e67ba9"
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
