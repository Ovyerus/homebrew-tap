class Bandsnatch < Formula
  desc "CLI batch downloader for your Bandcamp collection"
  homepage "https://github.com/Ovyerus/bandsnatch"
  url "https://github.com/Ovyerus/bandsnatch/archive/v0.2.0.tar.gz"
  sha256 "e4f0c8d901cf454a208951a4e65866eb21d8744ca67514b3d83b2b3d7b24e142"
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
