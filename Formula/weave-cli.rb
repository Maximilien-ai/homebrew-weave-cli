class WeaveCli < Formula
  desc "AI-powered CLI for managing vector databases"
  homepage "https://github.com/maximilien/weave-cli"
  url "https://github.com/maximilien/weave-cli/archive/refs/tags/v0.12.3.tar.gz"
  sha256 "577f5fff3cb757dad7cabc92c44bec519dc04fef357a7894f8a0d35b7d5bb000"
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
