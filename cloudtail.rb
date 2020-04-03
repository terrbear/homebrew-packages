class Cloudtail < Formula
  desc "CLI for tailing AWS CloudWatch Logs"
  homepage "https://github.com/terrbear/cloudtail"
  url "https://github.com/terrbear/cloudtail/archive/v0.0.2.tar.gz"
  version "v0.0.2"
  sha256 "e9e50f961b1a7491c46c838a2c9ad0dc9cbe6fc12f46c63d3abda1898633130b"
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/terrbear/cloudtail"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "build", "-o", bin/"cloudtail", "."
    end
  end

  test do
    assert_match "cloudtail version v0.0.2", shell_output("#{bin}/cloudtail version 2>&1", 2)
  end
end
