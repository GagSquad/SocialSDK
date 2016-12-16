Pod::Spec.new do |s|
    s.name              = "SocialSDK"
    s.version           = "0.0.1"
    s.summary           = "SocialSDK SDK 0.0.1 for iOS"
    s.homepage          = "https://github.com/GagSquad/SocialSDK"
    s.author            = { "itlijunjie@gmail.com" => "https://github.com/itlijunjie" }
    s.license      = { :type => 'WTFPL', :file => 'LICENSE' }
    
    s.platform          = :ios, '8.0'
    s.ios.deployment_target = '8.0'
    
    s.source            = { :git => "https://github.com/GagSquad/SocialSDK.git", :branch => "master" }
    
    s.requires_arc = true
    s.public_header_files = 'SocialSDK/SocialSDK.h'
    s.source_files = 'SocialSDK/SocialSDK.h'
    
    s.subspec 'QQSDK' do |ss|
        ss.source_files = 'AFNetworking/AFURL{Request,Response}Serialization.{h,m}'
        ss.public_header_files = 'AFNetworking/AFURL{Request,Response}Serialization.h'
        ss.watchos.frameworks = 'MobileCoreServices', 'CoreGraphics'
        ss.ios.frameworks = 'MobileCoreServices', 'CoreGraphics'
    end
    
    s.subspec 'SinaSDK' do |ss|
        ss.source_files = 'AFNetworking/AFURL{Request,Response}Serialization.{h,m}'
        ss.public_header_files = 'AFNetworking/AFURL{Request,Response}Serialization.h'
        ss.watchos.frameworks = 'MobileCoreServices', 'CoreGraphics'
        ss.ios.frameworks = 'MobileCoreServices', 'CoreGraphics'
    end
    
end
