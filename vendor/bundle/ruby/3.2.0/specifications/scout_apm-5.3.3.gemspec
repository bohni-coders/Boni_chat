# -*- encoding: utf-8 -*-
# stub: scout_apm 5.3.3 ruby lib data
# stub: ext/allocations/extconf.rb ext/rusage/extconf.rb

Gem::Specification.new do |s|
  s.name = "scout_apm".freeze
  s.version = "5.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze, "data".freeze]
  s.authors = ["Derek Haynes".freeze, "Andre Lewis".freeze]
  s.date = "2022-12-09"
  s.description = "Monitors Ruby apps and reports detailed metrics on performance to Scout.".freeze
  s.email = ["support@scoutapp.com".freeze]
  s.extensions = ["ext/allocations/extconf.rb".freeze, "ext/rusage/extconf.rb".freeze]
  s.files = ["ext/allocations/extconf.rb".freeze, "ext/rusage/extconf.rb".freeze]
  s.homepage = "https://github.com/scoutapp/scout_apm_ruby".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1".freeze)
  s.rubygems_version = "3.4.10".freeze
  s.summary = "Ruby application performance monitoring".freeze

  s.installed_by_version = "3.4.10" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
  s.add_development_dependency(%q<mocha>.freeze, [">= 0"])
  s.add_development_dependency(%q<pry>.freeze, [">= 0"])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake-compiler>.freeze, [">= 0"])
  s.add_development_dependency(%q<addressable>.freeze, [">= 0"])
  s.add_development_dependency(%q<activesupport>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<parser>.freeze, [">= 0"])
  s.add_development_dependency(%q<activerecord>.freeze, [">= 0"])
  s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
  s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
  s.add_development_dependency(%q<guard>.freeze, [">= 0"])
  s.add_development_dependency(%q<guard-minitest>.freeze, [">= 0"])
  s.add_development_dependency(%q<m>.freeze, [">= 0"])
end
