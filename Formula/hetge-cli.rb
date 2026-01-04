require "download_strategy"

class HetgeCli < Formula
  desc "Unified CLI for hetGE projects - env management, Docker builds, and Dokploy deployments"
  homepage "https://github.com/hetGE/hetge-cli"
  url "https://github.com/hetGE/hetge-cli/releases/download/v0.1.3/hetge-cli.tgz",
      using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "9cdd7a2dcbe4462691a27d7d6bbf84f149242bca40f5291f0a6e049b1d50391e"
  license "PROPRIETARY"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      hetge-cli requires these tools:
        brew install gh 1password-cli tolgamorf/tap/env2op-cli
    EOS
  end

  test do
    assert_match "hetge", shell_output("#{bin}/hetge help")
  end
end
