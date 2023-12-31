# -*- encoding: utf-8 -*-
# stub: ddtrace 1.11.1 ruby lib
# stub: ext/ddtrace_profiling_native_extension/extconf.rb ext/ddtrace_profiling_loader/extconf.rb

Gem::Specification.new do |s|
  s.name = "ddtrace".freeze
  s.version = "1.11.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 2.0.0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "changelog_uri" => "https://github.com/DataDog/dd-trace-rb/blob/master/CHANGELOG.md" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Datadog, Inc.".freeze]
  s.date = "1980-01-01"
  s.description = "ddtrace is Datadog's tracing client for Ruby. It is used to trace requests\nas they flow across web servers, databases and microservices so that developers\nhave great visiblity into bottlenecks and troublesome requests.\n".freeze
  s.email = ["dev@datadoghq.com".freeze]
  s.executables = ["ddtracerb".freeze]
  s.extensions = ["ext/ddtrace_profiling_native_extension/extconf.rb".freeze, "ext/ddtrace_profiling_loader/extconf.rb".freeze]
  s.files = ["bin/ddtracerb".freeze, "ext/ddtrace_profiling_loader/extconf.rb".freeze, "ext/ddtrace_profiling_native_extension/extconf.rb".freeze]
  s.homepage = "https://github.com/DataDog/dd-trace-rb".freeze
  s.licenses = ["BSD-3-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new([">= 2.1.0".freeze, "< 3.3".freeze])
  s.rubygems_version = "3.4.10".freeze
  s.summary = "Datadog tracing code for your Ruby applications".freeze

  s.installed_by_version = "3.4.10" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<msgpack>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<debase-ruby_core_source>.freeze, [">= 0.10.16", "<= 3.2.0"])
  s.add_runtime_dependency(%q<libddwaf>.freeze, ["~> 1.8.2.0.0"])
  s.add_runtime_dependency(%q<libdatadog>.freeze, ["~> 2.0.0.1.0"])
end
