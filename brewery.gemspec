# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{brewery}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["BJ Clark"]
  s.date = %q{2011-03-12}
  s.default_executable = %q{brewery}
  s.description = %q{FIXME (describe your package)}
  s.email = %q{bjclark@scidept.com}
  s.executables = ["brewery"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "bin/brewery"]
  s.files = [".gitignore", "CHANGELOG", "History.txt", "Isolate", "Manifest.txt", "README.md", "Rakefile", "bin/brewery", "lib/brewery.rb", "lib/brewery/beer.rb", "spec/brewery/beer_spec.rb", "spec/brewery_spec.rb", "spec/spec_helper.rb", "version.txt"]
  s.homepage = %q{http://github.com/BJClark/brewery}
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{brewery}
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{FIXME (describe your package)}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bones>, [">= 3.6.5"])
    else
      s.add_dependency(%q<bones>, [">= 3.6.5"])
    end
  else
    s.add_dependency(%q<bones>, [">= 3.6.5"])
  end
end
