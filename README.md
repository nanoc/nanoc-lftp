[![Build Status](https://travis-ci.org/nanoc/nanoc-lftp.png)](https://travis-ci.org/nanoc/nanoc-lftp)
[![Code Climate](https://codeclimate.com/github/nanoc/nanoc-lftp.png)](https://codeclimate.com/github/nanoc/nanoc-lftp)
[![Coverage Status](https://coveralls.io/repos/nanoc/nanoc-lftp/badge.png?branch=master)](https://coveralls.io/r/nanoc/nanoc-lftp)

# nanoc-lftp

This provides a [lftp](http://lftp.yar.ru/) deployer for [nanoc](http://nanoc.ws).

Works with nanoc 3.x.

## Installation

`gem install nanoc-lftp`

## Usage

Add the following to _nanoc.yaml_ (or _config.yaml_ on older sites):

```yaml
deploy:
  public:
    kind: lftp
    dst_host: ftp://nanoc.ws
    dst_path: /var/www/nanoc.ws
```

Add the following somewhere in _lib/_ (e.g. _lib/plugins.rb_):

```ruby
require 'nanoc-lftp'
```

You can now deploy with LFTP.

This deployer also reads the `options` attribute in the deployer configuration, which is an array passed to the `lftp` command.
