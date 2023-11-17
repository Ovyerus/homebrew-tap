class Gfh < Formula
  desc "Sign your Git commits with multiple resident SSH keys"
  homepage "https://github.com/Ovyerus/gfh"
  url "https://github.com/ovyerus/gfh/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "1167ca9ce0073799d45d46e729517ddef3cf0adaa184e37eab85501a326d25fb"
  license "MIT"
  head "https://github.com/Ovyerus/gfh.git", branch: "main"

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
