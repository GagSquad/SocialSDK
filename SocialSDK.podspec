Pod::Spec.new do |s|
    s.name              = 'SocialSDK'
    s.version           = '0.0.1'
    s.summary           = 'SocialSDK SDK 0.0.1 for iOS'
    s.homepage          = 'https://github.com/GagSquad/SocialSDK'
    s.author            = { 'itlijunjie@gmail.com' => 'https://github.com/itlijunjie', 'LVJIALIN' => 'https://github.com/LVJIALIN' }
    s.license      = { :type => 'WTFPL', :file => 'LICENSE' }
    
    s.platform          = :ios, '8.0'
    s.ios.deployment_target = '8.0'
    
    s.source            = { :git => 'https://github.com/GagSquad/SocialSDK.git', :branch => 'master' }
    
    s.requires_arc = true
    s.source_files = 'SocialSDK/Classes/Core/Logger/**/*.{h,m}', 'SocialSDK/Classes/Core/Util/**/*.{h,m}', 'SocialSDK/Classes/Core/PlatformParamConfig/Base/**/*.{h,m}'
    s.public_header_files = 'SocialSDK/Classes/Core/Logger/**/*.h', 'SocialSDK/Classes/Core/Util/**/*.h', 'SocialSDK/Classes/Core/PlatformParamConfig/Base/**/*.h'
    
    s.subspec 'UI' do |ss|
        ss.source_files = 'SocialSDK/Classes/UI/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/UI/**/*.h'
    end
    
    s.subspec 'QQPlatformParamConfig' do |ss|
        ss.source_files = 'SocialSDK/Classes/Core/PlatformParamConfig/QQ/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Core/PlatformParamConfig/QQ/**/*.h'
#        ss.dependency 'GSTencentOpenApiSDK', '~> 3.1.3'
    end
    
    s.subspec 'SinaPlatformParamConfig' do |ss|
        ss.source_files = 'SocialSDK/Classes/Core/PlatformParamConfig/Sina/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Core/PlatformParamConfig/Sina/**/*.h'
#        ss.dependency 'GSWeiboSDK', '~> 3.1.4'
    end
    
    s.subspec 'WeChatPlatformParamConfig' do |ss|
        ss.source_files = 'SocialSDK/Classes/Core/PlatformParamConfig/WeChat/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Core/PlatformParamConfig/WeChat/**/*.h'
#        ss.dependency 'GSWeChatSDK', '~> 1.7.5'
    end
    
    s.subspec 'ShareBase' do |ss|
        ss.source_files = 'SocialSDK/Classes/Share/Base/**/*.{h,m,mm}'
        ss.public_header_files = 'SocialSDK/Classes/Share/Base/**/*.h'
    end
    
    s.subspec 'QQShare' do |ss|
        ss.source_files = 'SocialSDK/Classes/Share/QQ/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Share/QQ/**/*.h'
        ss.dependency 'SocialSDK/QQPlatformParamConfig'
        ss.dependency 'SocialSDK/ShareBase'
    end
    
    s.subspec 'QzoneShare' do |ss|
        ss.source_files = 'SocialSDK/Classes/Share/Qzone/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Share/Qzone/**/*.h'
        ss.dependency 'SocialSDK/QQPlatformParamConfig'
        ss.dependency 'SocialSDK/ShareBase'
    end
    
    s.subspec 'SinaShare' do |ss|
        ss.source_files = 'SocialSDK/Classes/Share/Sina/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Share/Sina/**/*.h'
        ss.dependency 'SocialSDK/SinaPlatformParamConfig'
        ss.dependency 'SocialSDK/ShareBase'
    end
    
    s.subspec 'WeChatSessionShare' do |ss|
        ss.source_files = 'SocialSDK/Classes/Share/WeChatSession/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Share/WeChatSession/**/*.h'
        ss.dependency 'SocialSDK/WeChatPlatformParamConfig'
        ss.dependency 'SocialSDK/ShareBase'
    end
    
    s.subspec 'WeChatTimeLineShare' do |ss|
        ss.source_files = 'SocialSDK/Classes/Share/WeChatTimeLine/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Share/WeChatTimeLine/**/*.h'
        ss.dependency 'SocialSDK/WeChatPlatformParamConfig'
        ss.dependency 'SocialSDK/ShareBase'
    end

#    s.subspec 'QQSDK' do |ss|
#        ss.source_files = 'AFNetworking/AFURL{Request,Response}Serialization.{h,m}'
#        ss.public_header_files = 'AFNetworking/AFURL{Request,Response}Serialization.h'
#        ss.watchos.frameworks = 'MobileCoreServices', 'CoreGraphics'
#        ss.ios.frameworks = 'MobileCoreServices', 'CoreGraphics'
#    end
#    
#    s.subspec 'SinaSDK' do |ss|
#        ss.source_files = 'AFNetworking/AFURL{Request,Response}Serialization.{h,m}'
#        ss.public_header_files = 'AFNetworking/AFURL{Request,Response}Serialization.h'
#        ss.watchos.frameworks = 'MobileCoreServices', 'CoreGraphics'
#        ss.ios.frameworks = 'MobileCoreServices', 'CoreGraphics'
#    end

end
