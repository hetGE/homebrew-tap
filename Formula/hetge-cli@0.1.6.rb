class HetgeCliAT016 < Formula
  desc "Unified CLI for hetGE projects - env management, Docker builds, and Dokploy deployments"
  homepage "https://github.com/hetGE/hetge-cli"
  url "https://npm.pkg.github.com/@hetge/cli/-/cli-0.1.6.tgz"
  sha256 "39d431d420d3bd438276fe85e6d88fcbccfaff82929ab847478e6a93c246bce7"
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
