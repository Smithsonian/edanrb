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
```

## Using the Gem with Rails 3.x+
### Add edanrb gem to your Gemfile:
```
gem 'edanrb'
```
Then, run the 'bundle install' command.

### Add authentication settings:
There are two ways to do this, you can create a file in your /config/initializer directory:
```
config/initializer/edanrb_settings.rb:

# specify the username and password for the EDAN API:
ENV['EDANUSER'] = "this_is_my_username"
ENV['EDANPASS'] = "this_is_my_password"
```

Alternatively, you can do this from the command line when you start your rails server if you do not want to commit auth info for security reasons.
```
> EDANUSER="this_is_my_username" EDANPASS="this_is_my_password" rails server
```

## That's it! Now you're ready to rock with EDAN.
Don't forget to add the 'require' statement to your controllers or other locations where you'll be calling edanrb methods:
```
require 'edan'

def hello_edan_world
   eq = EDANQuery.new('myapp')
   res = eq.request('q=art&wt=json')
   json_res = JSON.parse(res.body)
end
```
