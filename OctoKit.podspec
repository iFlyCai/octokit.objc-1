Pod::Spec.new do |s|
  s.name         = 'OctoKit'
  s.version      = '0.7.8'
  s.summary      = 'A Cocoa and Cocoa Touch framework for interacting with the GitHub API.'
  s.description  = <<-DESC
                   OctoKit is a framework for interacting with the GitHub API,
                   built using AFNetworking, Mantle and ReactiveCocoa.
                   DESC
  s.homepage     = 'https://github.com/octokit/octokit.objc'
  s.license      = { :type => 'MIT', :file => 'LICENSE.md' }
  s.authors      = { 'GitHub' => 'opensource@github.com' }

  s.platform     = :ios, '16.0'

  s.source       = { :git => 'https://github.com/octokit/octokit.objc.git', :tag => s.version.to_s }
  s.source_files = 'OctoKit/**/*.{h,m}'
  s.private_header_files = 'OctoKit/**/*+Private.h'

  s.requires_arc = true

  s.dependency 'AFNetworking', '~> 1.3.2'
  s.dependency 'Mantle', '~> 1.5.4'
  s.dependency 'ReactiveCocoa', '~> 2.5'
  s.dependency 'ISO8601DateFormatter', '~> 0.8'

  s.frameworks = 'SystemConfiguration', 'MobileCoreServices', 'Security'
end
