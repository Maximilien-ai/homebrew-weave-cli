class WeaveCli < Formula
  desc "AI-powered CLI for managing vector databases"
  homepage "https://github.com/maximilien/weave-cli"
  url "https://github.com/maximilien/weave-cli/archive/refs/tags/v0.11.6.tar.gz"
  sha256 "1831b3d0361875a644e710dc22634cc37fcffe5f98a9c7f9fa26a24738df252c"
  license "MIT"
  head "https://github.com/maximilien/weave-cli.git", branch: "main"

  depends_on "go" => :build
  depends_on "tesseract"
  depends_on "leptonica"

  def install
    ldflags = %W[
      -s -w
      -X github.com/maximilien/weave-cli/src/pkg/version.Version=#{version}
      -X github.com/maximilien/weave-cli/src/pkg/version.GitCommit=#{tap.user}
      -X github.com/maximilien/weave-cli/src/pkg/version.BuildTime=#{time.iso8601}
    ]

    system "go", "build",
      *std_go_args(ldflags:, output: bin/"weave"),
      "./src/main.go"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/weave --version")
  end
end
