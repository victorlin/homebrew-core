require "language/node"

class FernApi < Formula
  desc "Stripe-level SDKs and Docs for your API"
  homepage "https://buildwithfern.com/"
  url "https://registry.npmjs.org/fern-api/-/fern-api-0.33.1.tgz"
  sha256 "ee220862872d8b1e9c342727cc4e2bc9b6b9bb94844af72fe6690a586f3f547f"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "d6d0cf9ef920a8215a8dfd5ec23f9b08fc70f18ae5cf7347e7f4a785c6c57693"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "d6d0cf9ef920a8215a8dfd5ec23f9b08fc70f18ae5cf7347e7f4a785c6c57693"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "d6d0cf9ef920a8215a8dfd5ec23f9b08fc70f18ae5cf7347e7f4a785c6c57693"
    sha256 cellar: :any_skip_relocation, sonoma:         "d6d0cf9ef920a8215a8dfd5ec23f9b08fc70f18ae5cf7347e7f4a785c6c57693"
    sha256 cellar: :any_skip_relocation, ventura:        "d6d0cf9ef920a8215a8dfd5ec23f9b08fc70f18ae5cf7347e7f4a785c6c57693"
    sha256 cellar: :any_skip_relocation, monterey:       "d6d0cf9ef920a8215a8dfd5ec23f9b08fc70f18ae5cf7347e7f4a785c6c57693"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "94fb59713e723000b3e32e8850e1ac4d963dac23bf355c1c9be444f8d9104559"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/fern init 2>&1", 1)
    assert_match "Login required", output

    assert_match version.to_s, shell_output("#{bin}/fern --version")
  end
end
