Pod::Spec.new do |s|
    s.name              = 'SocialSDK_UF'
    s.version           = '0.0.4'
    s.summary           = 'SocialSDK_UF SDK for iOS'
    s.homepage          = 'https://github.com/GagSquad/SocialSDK'
    s.author            = { 'itlijunjie@gmail.com' => 'https://github.com/itlijunjie', 'LVJIALIN' => 'https://github.com/LVJIALIN' }
    s.license      = { :type => 'WTFPL', :file => 'LICENSE' }
    
    s.platform          = :ios, '8.0'
    s.ios.deployment_target = '8.0'
    
    s.source            = { :git => 'https://github.com/GagSquad/SocialSDK.git', :tag => s.version }
    
    s.requires_arc = true
    
    
    s.subspec 'TencentOpenApiSDK' do |ss|
        ss.source_files = 'SDK/TencentOpenApi/TencentOpenAPI.framework/Headers/*.{h,m}'
        ss.public_header_files = 'SDK/TencentOpenApi/TencentOpenAPI.framework/Headers/*.h'
        ss.vendored_frameworks = 'SDK/TencentOpenApi/TencentOpenAPI.framework'

        the_frameworks =  [
        '"SystemConfiguration"',
        '"CoreTelephony"'
        ]
        the_ldflags    = '$(inherited) -lz -lsqlite3 -liconv -lstdc++ -framework ' + the_frameworks.join(' -framework ') + ''
        
        ss.xcconfig = { 'OTHER_LDFLAGS' => the_ldflags }
    end
    
    s.subspec 'WeiboSDK' do |ss|
        ss.source_files = 'SDK/libWeiboSDK/*.{h,m}'
        ss.public_header_files = 'SDK/libWeiboSDK/*.h'
        ss.vendored_libraries  = 'SDK/libWeiboSDK/libWeiboSDK.a'

        ss.frameworks   = 'ImageIO', 'SystemConfiguration', 'CoreText', 'QuartzCore', 'Security', 'UIKit', 'Foundation', 'CoreGraphics','CoreTelephony'
        ss.libraries = 'sqlite3', 'z'
    end
    
    s.subspec 'WeChatSDK' do |ss|
        ss.source_files = 'SDK/WeChatSDK/*.{h,m}'
        ss.public_header_files = 'SDK/WeChatSDK/*.h'
        ss.vendored_libraries = 'SDK/WeChatSDK/libWeChatSDK.a'
        
        ss.frameworks = 'Foundation', 'SystemConfiguration', 'CoreTelephony', 'CFNetwork'
        ss.libraries = 'z', 'c++', 'sqlite3'
    end
    
    s.subspec 'Core' do |ss|
        ss.source_files = 'SocialSDK/Classes/Core/Logger/**/*.{h,m}', 'SocialSDK/Classes/Core/Util/**/*.{h,m}', 'SocialSDK/Classes/Core/SocialManager/**/*.{h,m}', 'SocialSDK/Classes/Core/PlatformParamConfig/Base/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Core/Logger/**/*.h', 'SocialSDK/Classes/Core/Util/**/*.h', 'SocialSDK/Classes/Core/SocialManager/**/*.h', 'SocialSDK/Classes/Core/PlatformParamConfig/Base/**/*.h'
    end
    
    s.subspec 'UI' do |ss|
        ss.source_files = 'SocialSDK/Classes/UI/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/UI/**/*.h'
        ss.dependency 'SocialSDK_UF/Core'
    end
    
    s.subspec 'QQPlatformParamConfig' do |ss|
        ss.source_files = 'SocialSDK/Classes/Core/PlatformParamConfig/QQ/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Core/PlatformParamConfig/QQ/**/*.h'
        ss.dependency 'SocialSDK_UF/TencentOpenApiSDK'
        ss.dependency 'SocialSDK_UF/Core'
    end
    
    s.subspec 'SinaPlatformParamConfig' do |ss|
        ss.source_files = 'SocialSDK/Classes/Core/PlatformParamConfig/Sina/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Core/PlatformParamConfig/Sina/**/*.h'
        ss.dependency 'SocialSDK_UF/WeiboSDK'
        ss.dependency 'SocialSDK_UF/Core'
    end
    
    s.subspec 'WeChatPlatformParamConfig' do |ss|
        ss.source_files = 'SocialSDK/Classes/Core/PlatformParamConfig/WeChat/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Core/PlatformParamConfig/WeChat/**/*.h'
        ss.dependency 'SocialSDK_UF/WeChatSDK'
        ss.dependency 'SocialSDK_UF/Core'
    end
    
    s.subspec 'ShareBase' do |ss|
        ss.source_files = 'SocialSDK/Classes/Share/Base/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Share/Base/**/*.h'
        ss.dependency 'SocialSDK_UF/Core'
    end
    
    s.subspec 'QQShare' do |ss|
        ss.source_files = 'SocialSDK/Classes/Share/QQ/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Share/QQ/**/*.h'
        ss.dependency 'SocialSDK_UF/QQPlatformParamConfig'
        ss.dependency 'SocialSDK_UF/ShareBase'
    end
    
    s.subspec 'QzoneShare' do |ss|
        ss.source_files = 'SocialSDK/Classes/Share/Qzone/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Share/Qzone/**/*.h'
        ss.dependency 'SocialSDK_UF/QQPlatformParamConfig'
        ss.dependency 'SocialSDK_UF/ShareBase'
    end
    
    s.subspec 'SinaShare' do |ss|
        ss.source_files = 'SocialSDK/Classes/Share/Sina/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Share/Sina/**/*.h'
        ss.dependency 'SocialSDK_UF/SinaPlatformParamConfig'
        ss.dependency 'SocialSDK_UF/ShareBase'
    end
    
    s.subspec 'WeChatSessionShare' do |ss|
        ss.source_files = 'SocialSDK/Classes/Share/WeChatSession/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Share/WeChatSession/**/*.h'
        ss.dependency 'SocialSDK_UF/WeChatPlatformParamConfig'
        ss.dependency 'SocialSDK_UF/ShareBase'
    end
    
    s.subspec 'WeChatTimeLineShare' do |ss|
        ss.source_files = 'SocialSDK/Classes/Share/WeChatTimeLine/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Share/WeChatTimeLine/**/*.h'
        ss.dependency 'SocialSDK_UF/WeChatPlatformParamConfig'
        ss.dependency 'SocialSDK_UF/ShareBase'
    end

    s.subspec 'LoginBase' do |ss|
        ss.source_files = 'SocialSDK/Classes/Login/Base/**/*.{h,m,mm}'
        ss.public_header_files = 'SocialSDK/Classes/Login/Base/**/*.h'
        ss.dependency 'SocialSDK_UF/Core'
    end

    s.subspec 'QQLogin' do |ss|
        ss.source_files = 'SocialSDK/Classes/Login/QQ/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Login/QQ/**/*.h'
        ss.dependency 'SocialSDK_UF/QQPlatformParamConfig'
        ss.dependency 'SocialSDK_UF/LoginBase'
    end

    s.subspec 'SinaLogin' do |ss|
        ss.source_files = 'SocialSDK/Classes/Login/Sina/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Login/Sina/**/*.h'
        ss.dependency 'SocialSDK_UF/SinaPlatformParamConfig'
        ss.dependency 'SocialSDK_UF/LoginBase'
    end

    s.subspec 'WeChatLogin' do |ss|
        ss.source_files = 'SocialSDK/Classes/Login/WeChat/**/*.{h,m}'
        ss.public_header_files = 'SocialSDK/Classes/Login/WeChat/**/*.h'
        ss.dependency 'SocialSDK_UF/WeChatPlatformParamConfig'
        ss.dependency 'SocialSDK_UF/LoginBase'
    end
    
    s.subspec 'QQ' do |ss|
        ss.dependency 'SocialSDK_UF/TencentOpenApiSDK'
        ss.dependency 'SocialSDK_UF/UI'
        ss.dependency 'SocialSDK_UF/QQShare'
        ss.dependency 'SocialSDK_UF/QzoneShare'
        ss.dependency 'SocialSDK_UF/QQLogin'
    end
    
    s.subspec 'Sina' do |ss|
        ss.dependency 'SocialSDK_UF/WeiboSDK'
        ss.dependency 'SocialSDK_UF/SinaShare'
        ss.dependency 'SocialSDK_UF/SinaLogin'
    end
    
    s.subspec 'WeChat' do |ss|
        ss.dependency 'SocialSDK_UF/WeChatSDK'
        ss.dependency 'SocialSDK_UF/WeChatSessionShare'
        ss.dependency 'SocialSDK_UF/WeChatTimeLineShare'
        ss.dependency 'SocialSDK_UF/WeChatLogin'
    end
    
    s.xcconfig = { 'OTHER_LDFLAGS' => ' -all_load' }

    s.default_subspecs = 'UI', 'QQ', 'Sina', 'WeChat'
end
