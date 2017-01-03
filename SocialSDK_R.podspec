Pod::Spec.new do |s|
    s.name              = 'SocialSDK_R'
    s.version           = '0.0.3'
    s.summary           = 'SocialSDK_R SDK for iOS'
    s.homepage          = 'https://github.com/GagSquad/SocialSDK'
    s.author            = { 'itlijunjie@gmail.com' => 'https://github.com/itlijunjie', 'LVJIALIN' => 'https://github.com/LVJIALIN' }
    s.license      = { :type => 'WTFPL', :file => 'LICENSE' }
    
    s.platform          = :ios, '8.0'
    s.ios.deployment_target = '8.0'
    
    s.source            = { :git => 'https://github.com/GagSquad/SocialSDK.git', :tag => s.version }
    
    s.requires_arc = true

    s.subspec 'TencentOpenApiSDK_R' do |ss|
        ss.resources = 'SDK/TencentOpenApi/TencentOpenApi_IOS_Bundle.bundle'
    end
    
    s.subspec 'WeiboSDK_R' do |ss|
        ss.resources     = 'SDK/libWeiboSDK/WeiboSDK.bundle'
    end

    s.subspec 'SocialSDK_R' do |ss|
        ss.resources     = 'SocialSDK/Rrources/GSSocialSDKResources.bundle'
    end
    
    s.default_subspecs = 'TencentOpenApiSDK_R', 'WeiboSDK_R', 'SocialSDK_R'

end
