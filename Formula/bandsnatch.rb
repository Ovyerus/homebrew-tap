class Bandsnatch < Formula
  desc "CLI batch downloader for your Bandcamp collection"
  homepage "https://github.com/Ovyerus/bandsnatch"
  url "https://github.com/Ovyerus/bandsnatch/archive/v0.2.1.tar.gz"
  sha256 "f497f1b7367f1d5ca0cff66bd1e60a605477a73cec38cb649b3a92c847798ba9"
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
