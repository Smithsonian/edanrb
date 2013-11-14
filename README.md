# EDAN API Ruby Library

This is for an initial exploration of a Smithsonian API.

Use of this library requires a name & password and is currently for developers who are registered volunteers.

Contact Info:
  Sarah Allen
  allensa@si.edu

## Usage

```
gem install edanrb
export EDANUSER=SECRETNAME
export EDANPASS=SECRETPASS

gem install json
irb
> require 'edan'
> eq = EDANQuery.new('myapp')
> res = eq.request('q=art&wt=json')
> res.code
 => "200"

> require 'json'
> JSON.parse(res.body)
 => {"responseHeader" ...

