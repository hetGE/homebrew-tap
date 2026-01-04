class HetgeCli < Formula
  desc "Unified CLI for hetGE projects - env management, Docker builds, and Dokploy deployments"
  homepage "https://github.com/hetGE/hetge-cli"
  url "https://npm.pkg.github.com/@hetge/cli/-/cli-0.1.3.tgz"
  sha256 "f2ef6b267003c8bdfe332eedbe6e03001f7c477d97a7646668933b317bf7d12a"
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
