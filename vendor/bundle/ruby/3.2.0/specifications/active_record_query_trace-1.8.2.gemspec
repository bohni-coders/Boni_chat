# -*- encoding: utf-8 -*-
# stub: active_record_query_trace 1.8.2 ruby lib

Gem::Specification.new do |s|
  s.name = "active_record_query_trace".freeze
  s.version = "1.8.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/brunofacca/active-record-query-trace" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Cody Caughlan".freeze, "Bruno Facca".freeze]
  s.date = "2023-07-27"
  s.description = "Print stack trace of all DB queries to the Rails log. Helpful to find where queries are being executed in your application.".freeze
  s.email = "bruno@facca.info".freeze
  s.homepage = "https://github.com/brunofacca/active-record-query-trace".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new([">= 2.7".freeze, "< 3.4".freeze])
  s.rubygems_version = "3.4.10".freeze
  s.summary = "Print stack trace of all DB queries to the Rails log. Helpful to find where queries are being executed in your application.".freeze

  s.installed_by_version = "3.4.10" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<activerecord>.freeze, [">= 6.0.0"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
  s.add_development_dependency(%q<debug>.freeze, ["~> 1.8"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.12"])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.55"])
  s.add_development_dependency(%q<rubocop-performance>.freeze, ["~> 1.18"])
  s.add_development_dependency(%q<rubocop-rails>.freeze, ["~> 2.20"])
  s.add_development_dependency(%q<rubocop-rspec>.freeze, ["~> 2.22"])
  s.add_development_dependency(%q<simplecov>.freeze, [">= 0.22.0"])
end
