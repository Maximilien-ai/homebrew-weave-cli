class WeaveCli < Formula
  desc "AI-powered CLI for managing vector databases"
  homepage "https://github.com/maximilien/weave-cli"
  url "https://github.com/maximilien/weave-cli/archive/refs/tags/v0.12.0.tar.gz"
  sha256 "75624ba528f1265b7d9fd5f8fa055046bcb54efce67dc4a71c9fa220825d997d"
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
