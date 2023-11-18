class Gfh < Formula
  desc "Sign your Git commits with multiple resident SSH keys"
  homepage "https://github.com/Ovyerus/gfh"
  url "https://github.com/ovyerus/gfh/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "1167ca9ce0073799d45d46e729517ddef3cf0adaa184e37eab85501a326d25fb"
  license "MIT"
  head "https://github.com/Ovyerus/gfh.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/ovyerus/tap"
    sha256 cellar: :any_skip_relocation, monterey:     "fe02b19e454c2e881a8845c40c395fbb30fe5e9414014dbeb5df37585e3f44f6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c7ccd8eb5d8bcb257f331e38a0b779a373a888772836a5baf366c0e23d943eb4"
  end

  depends_on "rust" => :build
  depends_on "pcsc-lite"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/gfh --help")
    assert_match "Git FIDO helper - use multiple FIDO keys to sign Git commits", output
  end
end
