# encoding: utf-8

require 'shellwords'
require 'systemu'

module Nanoc::LFTP

  class Deployer < Nanoc::Extra::Deployer

    identifier :lftp

    def run
      # Get params
      src = source_path + '/'
      dst_host = config.fetch(:dst_host) do
        raise Nanoc::Errors::GenericTrivial, 'No dst_host found in deployment configuration'
      end
      dst_path = config.fetch(:dst_path) do
        raise Nanoc::Errors::GenericTrivial, 'No dst_path found in deployment configuration'
      end
      options = config.fetch(:options, [])

      # Build command
      options_esc = options.flatten.map { |e| esc(e) }
      lftp_cmd = [ 'mirror', '--reverse', *options_esc, esc(src), esc(dst_path) ].join(' ') + ' ; quit'
      cmd = [ 'lftp', '-e', lftp_cmd, dst_host ]

      # Run
      if dry_run
        warn 'Performing a dry-run; no actions will actually be performed'
        $stdout.puts(cmd)
      else
        run_shell_cmd(cmd)
      end
    end

  private

    def esc(s)
      Shellwords.escape(s)
    end

    # Runs the given shell command. It will raise an error if execution fails
    # (results in a nonzero exit code).
    def run_shell_cmd(args)
      status = systemu(args, 'stdout' => $stdout, 'stderr' => $stderr)
      raise "command exited with a nonzero status code #{status.exitstatus} (command: #{args})" if !status.success?
    end

  end

end
