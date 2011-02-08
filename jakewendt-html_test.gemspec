# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jakewendt-html_test}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Peter Marklund", "George 'Jake' Wendt"]
  s.date = %q{2011-02-08}
  s.description = %q{Ruby on Rails plugin for HTML validation and link checking}
  s.email = %q{github@jake.otherinbox.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "init.rb",
    "jakewendt-html_test.gemspec",
    "lib/DTD/xhtml-lat1.ent",
    "lib/DTD/xhtml-special.ent",
    "lib/DTD/xhtml-symbol.ent",
    "lib/DTD/xhtml.soc",
    "lib/DTD/xhtml1-frameset.dtd",
    "lib/DTD/xhtml1-strict.dtd",
    "lib/DTD/xhtml1-transitional.dtd",
    "lib/DTD/xhtml1.dcl",
    "lib/assertions.rb",
    "lib/html_test.rb",
    "lib/jakewendt-html_test.rb",
    "lib/link_validator.rb",
    "lib/url_checker.rb",
    "lib/url_selector.rb",
    "lib/validate_filter.rb",
    "lib/validator.rb",
    "script/validate",
    "test/controller_test.rb",
    "test/integration_test.rb",
    "test/invalid.html",
    "test/link_validator_test.rb",
    "test/public/image.jpg",
    "test/rhtml_template.rhtml",
    "test/rxml_template.rxml",
    "test/test_helper.rb",
    "test/untidy.html",
    "test/valid.html",
    "test/valid_links.html",
    "test/validate_all_test.rb"
  ]
  s.homepage = %q{http://github.com/jakewendt/html_test}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{Ruby on Rails plugin for HTML validation and link checking}
  s.test_files = [
    "test/controller_test.rb",
    "test/integration_test.rb",
    "test/link_validator_test.rb",
    "test/test_helper.rb",
    "test/validate_all_test.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

