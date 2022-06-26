require "./lib/fast/version"

Gem::Specification.new do |gem|
  gem.name = "fast.rb"
  gem.authors = ["0x1eef"]
  gem.email = ["0x1eef@protonmail.com"]
  gem.homepage = "https://github.com/0x1eef/fast.rb"
  gem.version = Fast::VERSION
  gem.licenses = ["MIT"]
  gem.files = `git ls-files`.split($/)
  gem.require_paths = ["lib"]
  gem.description = "FIXME"
  gem.add_runtime_dependency "xchan.rb", "~> 0.5.1"
  gem.add_development_dependency "yard", "~> 0.9"
  gem.add_development_dependency "redcarpet", "~> 3.5"
  gem.add_development_dependency "rspec", "~> 3.10"
  gem.add_development_dependency "standardrb", "~> 1.0"
end
