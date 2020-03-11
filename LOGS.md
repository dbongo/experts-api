# Logs

## Wed Mar 11 2020
- [setback] Unable to install `http` gem with ruby `2.6.2` on a macOS Catalina `10.15.2`
```
Fetching http-parser 1.2.1
Installing http-parser 1.2.1 with native extensions
Gem::Ext::BuildError: ERROR: Failed to build gem native extension.

    current directory: /Users/dbongo/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/http-parser-1.2.1/ext
/Users/dbongo/.rbenv/versions/2.6.2/bin/ruby -rrubygems /Users/dbongo/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/rake-13.0.1/exe/rake
RUBYARCHDIR\=/Users/dbongo/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/extensions/x86_64-darwin-17/2.6.0-static/http-parser-1.2.1
RUBYLIBDIR\=/Users/dbongo/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/extensions/x86_64-darwin-17/2.6.0-static/http-parser-1.2.1
rake aborted!
LoadError: dlopen(/Users/dbongo/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/ffi-1.12.2/lib/ffi_c.bundle, 9): Symbol not found: _ffi_type_double
  Referenced from: /Users/dbongo/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/ffi-1.12.2/lib/ffi_c.bundle
  Expected in: flat namespace
in /Users/dbongo/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/ffi-1.12.2/lib/ffi_c.bundle -
/Users/dbongo/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/ffi-1.12.2/lib/ffi_c.bundle


Caused by:
LoadError: cannot load such file -- 2.6/ffi_c


Caused by:
LoadError: cannot load such file -- ffi-compiler/compile_task

(See full trace by running task with --trace)

rake failed, exit code 1

Gem files will remain installed in /Users/dbongo/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/gems/http-parser-1.2.1 for inspection.
Results logged to /Users/dbongo/.rbenv/versions/2.6.2/lib/ruby/gems/2.6.0/extensions/x86_64-darwin-17/2.6.0-static/http-parser-1.2.1/gem_make.out

An error occurred while installing http-parser (1.2.1), and Bundler cannot continue.
Make sure that `gem install http-parser -v '1.2.1' --source 'https://rubygems.org/'` succeeds before bundling.

In Gemfile:
  http was resolved to 4.3.0, which depends on
    http-parser
```
- [resolution] Switching to `httparty` gem resolved the issue
