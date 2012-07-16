# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
Gem::Specification.new do |s|
  s.name        = "userstamp_basic_with_account"
  s.version     = '0.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["bokmann", "xlcrs"]
  s.email       = ["info@xlcrs.com"]
  s.homepage    = "http://github.com/xlcrs/userstamp_basic_with_account"
  s.summary     = "Stamp records with user id and account id."
  s.description = "When creating a new record set the account_id as well as the userstamps."
 
  s.files        = Dir.glob("{lib}/**/*") 
  s.require_path = 'lib'
end