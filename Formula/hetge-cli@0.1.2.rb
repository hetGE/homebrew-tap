class HetgeCliAT012 < Formula
  desc "Unified CLI for hetGE projects - env management, Docker builds, and Dokploy deployments"
  homepage "https://github.com/hetGE/hetge-cli"
  url "https://npm.pkg.github.com/@hetge/cli/-/cli-0.1.2.tgz"
  sha256 "c8d3eae160a892e32837db3dcae515e843e5383fef52b8141940c8bcf8b6d59f"
  license "PROPRIETARY"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      hetge-cli requires GitHub Packages authentication and other tools.

      1. Configure npm for GitHub Packages:
        pnpm config set -g @hetge:registry https://npm.pkg.github.com
        pnpm config set -g //npm.pkg.github.com/:_authToken "$(gh auth token)"

      2. Install required tools:
        brew install gh 1password-cli tolgamorf/tap/env2op-cli
    EOS
  end

  test do
    assert_match "hetge", shell_output("#{bin}/hetge help")
  end
end
