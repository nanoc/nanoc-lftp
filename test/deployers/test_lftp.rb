# encoding: utf-8

require 'helper'

class Nanoc::LFTP::FilterTest < Minitest::Test

  def test_deploy
    rsync = Nanoc::LFTP::Deployer.new(
      'output',
      dst_host: 'ftp://example.com:123',
      dst_path: '/foo/path with spaces/subdir')

    def rsync.run_shell_cmd(args)
      @shell_cms_args = args
    end

    rsync.run
    assert_equal(
      [ 'lftp', '-e', 'mirror --reverse output/ /foo/path\ with\ spaces/subdir ; quit', 'ftp://example.com:123' ],
      rsync.instance_eval { @shell_cms_args }
    )
  end

end
