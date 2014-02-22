[![Build Status](https://travis-ci.org/nanoc/nanoc-lftp.png)](https://travis-ci.org/nanoc/nanoc-lftp)
[![Code Climate](https://codeclimate.com/github/nanoc/nanoc-lftp.png)](https://codeclimate.com/github/nanoc/nanoc-lftp)
[![Coverage Status](https://coveralls.io/repos/nanoc/nanoc-lftp/badge.png?branch=master)](https://coveralls.io/r/nanoc/nanoc-lftp)

# nanoc-lftp

This provides a [lftp](http://lftp.yar.ru/) deployer for [nanoc](http://nanoc.ws).

## Installation

`gem install nanoc-lftp`

## Usage

```yaml
deploy:
  public:
    kind: lftp
    dst_host: ftp://stoneship.org
    dst_path: /var/www/nanoc.ws
```

This deployer also reads the `options` attribute, which is an array passed to
the `lftp` command.
