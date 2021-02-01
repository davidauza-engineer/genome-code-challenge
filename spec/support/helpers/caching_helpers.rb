# frozen_string_literal: true

module CachingHelpers
  def file_caching_path
    path = "tmp/test#{ENV['TEST_ENV_NUMBER']}/cache"
    FileUtils.mkdir_p(path)

    path
  end
end
