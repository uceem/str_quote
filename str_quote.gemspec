$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "str_quote/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "str_quote"
  s.version     = StrQuote::VERSION
  s.authors     = ["Doug Wiegley"]
  s.email       = ["doug@uceem.com"]
  s.homepage    = "https://github.com/uceem/str_quote"
  s.summary     = "String quoting"
  s.description = "Quoting/unquoting of strings, including escaping"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile", "README.md", "LICENSE"]
  s.test_files = Dir["test/**/*"]
end
