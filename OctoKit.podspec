Pod::Spec.new do |s|
  s.name     = 'OctoKit'
  s.version  = '0.7.8'
  s.summary  = 'GitHub API client for Objective-C.'
  s.homepage = 'https://github.com/octokit/octokit.objc'
  s.license  = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author   = { 'GitHub, Inc.' => 'https://github.com/octokit' }
  s.source   = { :git => 'https://github.com/octokit/octokit.objc.git', :tag => s.version.to_s }

  s.platform = :ios, '16.0'

  # All of the dependencies are vendored under `External/` (see the subspecs
  # below), so this pod is completely self contained and needs no other pod.
  s.requires_arc = [
    'OctoKit/**/*.{h,m}',
    'External/Mantle/Mantle/**/*.{h,m}',
    'External/ReactiveCocoa/ReactiveCocoa/**/*.{h,m}',
    'External/AFNetworking/AFNetworking/**/*.{h,m}',
  ]

  s.frameworks = 'Foundation', 'UIKit', 'CoreGraphics', 'CoreData', 'SystemConfiguration', 'MobileCoreServices', 'Security'

  s.pod_target_xcconfig = {
    # Mantle and ReactiveCocoa import their bundled libextobjc headers without
    # a path prefix.
    'HEADER_SEARCH_PATHS' => '$(inherited) ' \
      '"$(PODS_TARGET_SRCROOT)/External/Mantle/Mantle/extobjc" ' \
      '"$(PODS_TARGET_SRCROOT)/External/ReactiveCocoa/ReactiveCocoa/extobjc"',
  }

  s.default_subspecs = 'OctoKit'

  s.subspec 'OctoKit' do |ss|
    ss.source_files = 'OctoKit/**/*.{h,m}'
    ss.private_header_files = 'OctoKit/**/*+Private.h'

    ss.dependency 'OctoKit/Mantle'
    ss.dependency 'OctoKit/ReactiveCocoa'
    ss.dependency 'OctoKit/AFNetworking'
    ss.dependency 'OctoKit/ISO8601DateFormatter'
  end

  s.subspec 'Mantle' do |ss|
    ss.source_files = 'External/Mantle/Mantle/**/*.{h,m}'
    ss.header_mappings_dir = 'External/Mantle'
  end

  s.subspec 'ReactiveCocoa' do |ss|
    ss.source_files = 'External/ReactiveCocoa/ReactiveCocoa/**/*.{h,m}'
    ss.header_mappings_dir = 'External/ReactiveCocoa'

    # AppKit bindings don't exist on iOS.
    ss.ios.exclude_files = 'External/ReactiveCocoa/ReactiveCocoa/*{AppKit,NSControl,NSText}*'
  end

  s.subspec 'AFNetworking' do |ss|
    ss.source_files = 'External/AFNetworking/AFNetworking/**/*.{h,m}'
    ss.header_mappings_dir = 'External/AFNetworking'
  end

  s.subspec 'ISO8601DateFormatter' do |ss|
    ss.source_files = 'External/ISO8601DateFormatter/*.{h,m}'
    ss.header_mappings_dir = 'External'
  end
end
