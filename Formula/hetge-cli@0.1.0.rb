class HetgeCliAT010 < Formula
  desc "Unified CLI for hetGE projects - env management, Docker builds, and Dokploy deployments"
  homepage "https://github.com/hetGE/hetge-cli"
  url "https://npm.pkg.github.com/@hetge/cli/-/cli-0.1.0.tgz"
  sha256 "50c3cc8a7beb65ec5291e0f9182aa804bb6b82f6b0293d54792746938f468b43"
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
