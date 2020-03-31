# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = "ghreview"
  s.version = "0.2.0"
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = ">= 2.0.0"
  s.authors = ["Ladislav Slezák"]
  s.description = <<-DESCRIPTION
    The 'ghreview' tool allows doing mass GitHub pull request reviews from
    command line. It is intended for approving simple changes is several
    pull requests even across several repositories.
  DESCRIPTION

  s.files = `git ls-files bin LICENSE README.md`
    .split($RS)
  s.bindir = "bin"
  s.executables = ["ghreview"]
  s.extra_rdoc_files = ["LICENSE", "README.md"]
  s.homepage = "https://github.com/lslezak/ghreview"
  s.licenses = ["GPLv2"]
  s.summary = "Simple script for reviewing GitHub pull requests from command line"

  s.metadata = {
    "homepage_uri"      => "https://github.com/lslezak/ghreview",
    "changelog_uri"     => "https://github.com/lslezak/ghreview/blob/master/CHANGELOG.md",
    "source_code_uri"   => "https://github.com/lslezak/ghreview",
    "documentation_uri" => "https://github.com/lslezak/ghreview",
    "bug_tracker_uri"   => "https://github.com/lslezak/ghreview/issues"
  }

  s.add_runtime_dependency("netrc", ">= 0.11.0", "< 1.0.0")
  s.add_runtime_dependency("octokit", ">= 4.14.0", "< 5.0.0")
  s.add_runtime_dependency("rainbow", ">= 3.0.0", "< 4.0.0")

  s.add_development_dependency("bundler", ">= 1.15.0", "< 3.0")
  s.add_development_dependency("rake", "~> 13")
  s.add_development_dependency("rubocop", "= 0.71.0")
end
