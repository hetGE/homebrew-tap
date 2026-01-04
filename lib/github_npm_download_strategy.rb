require "download_strategy"

class GitHubNpmDownloadStrategy < CurlDownloadStrategy
  def initialize(url, name, version, **meta)
    super
    @token = ENV["HOMEBREW_GITHUB_PACKAGES_TOKEN"]
  end

  def _curl_args
    args = super
    if @token && !@token.empty?
      args += ["--header", "Authorization: Bearer #{@token}"]
    end
    args
  end
end
