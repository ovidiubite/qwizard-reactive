# -*- encoding: utf-8 -*-
# stub: view_components 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "view_components".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Brian J. Cardiff".freeze, "Santiago Palladino".freeze]
  s.date = "2015-10-05"
  s.description = "Simple library for building view components in Ruby on Rails. A view component is defined by sections and attributes, and its structure is defined once in a partial view in the `app/views/components` folder, and can be invoked by a simple helper method.".freeze
  s.email = ["bcardiff@manas.com.ar".freeze, "spalladino@manas.com.ar".freeze]
  s.homepage = "https://github.com/manastech/rails-view_components".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Simple library for building view components in Ruby on Rails".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<haml-rails>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rails>.freeze, [">= 0"])
      s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
      s.add_dependency(%q<haml-rails>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
    s.add_dependency(%q<haml-rails>.freeze, [">= 0"])
  end
end
