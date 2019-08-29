lib = File.expand_path("../lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name         = "freckle_io"
  spec.version      = "0.1.2"
  spec.authors      = ["Domenico Giuseppe Garofoli"]
  spec.email        = ["sirion1987@gmail.com"]

  spec.summary      = "Yet another Ruby client for the Freckle API"
  spec.description  = "Yet another Ruby client for the Freckle API"
  spec.homepage     = "https://github.com/sirion1987/freckle-io"
  spec.license      = "MIT"
  spec.require_path = ["lib"]

  spec.required_ruby_version = '>= 2.4.0'

  spec.files        = `git ls-files -z`.split("\x0")
  spec.test_files   = Dir["spec/**/*.rb"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "simplecov-console"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

  spec.add_runtime_dependency "dotenv"
  spec.add_runtime_dependency "dry-validation", "0.13.0"
  spec.add_runtime_dependency "faraday", ">= 0.15.2"
  spec.add_runtime_dependency "faraday_middleware", ">= 0.12"
  spec.add_runtime_dependency "typhoeus"
end
