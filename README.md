## SocialSDK
实现sina wechat qq 登录和分享功能
## SDK功能
| 渠道 | 分享 | 登录 | 支付 |
|:--------------------:|:---------------------------:|:----------------------------:|:----------------------------:|
| Sina | ✔️ | ✔️ | ✖️ |
| QQ | ✔️ | ✔️ | ✖️ |
| Wechat | ✔️ | ✔️ | ✖️ |
## 分享平台支持
| 渠道 | 纯文本 | 单图 | 普通链接 | 音频链接 | 视频链接 |
|:--------------------:|:---------------------------:|:----------------------------:|:----------------------------:|:----------------------------:|:-------------------------------------------------------------------------:|
| Sina | ✔️ | ✔️ | ✔️ | ✔️ | ✔️  |
| QQ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️  |
| Qzone | ✔️ | ✔️ | ✔️ | ✔️ | ✔️  |
| WechatSession | ✔️ | ✔️ | ✔️ | ✔️ | ✔️  |
| WechatTimeLine | ✔️ | ✔️ | ✔️ | ✔️ | ✔️  |
## 平台配置
### [SinaWeiBo](#SinaWeiBo)
### [WeChat](#WeChat)
### [QQ](#QQ)
### <a id="SinaWeiBo"></a>SinaWeiBo平台配置
* *1、* 添加URL Schemes 格式"wb"+新浪appKey  
* <img src="Images/sinaGuide/sinaGuide-1.png" width="1000">
* *2、* [适配iOS9+系统](#iOS9+)

### <a id="WeChat"></a>WeChat平台配置
* 添加URL Schemes

### <a id="QQ"></a>QQ/Qzone平台配置
* *1、* 添加URL Schemes  
* 格式"tencent"+QQ的appID + "QQ"+QQ的appID转换成十六进制（不足8位前面补0)  
* 例如: appID:100424468 --> tencent100424468  QQ05fc5b14
* <img src="Images/QQGuide/QQGuide-1.png" width="1000">  
* *2、*[适配iOS9+系统](#iOS9+)


## <a id="iOS9+"></a>iOS9+适配
#### 1. HTTPS传输 在info.plist中加入安全域名白名单(右键info.plist用source code打开)
```objc
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSExceptionDomains</key>
    <dict>
        <key>sina.cn</key>
        <dict>
            <key>NSIncludesSubdomains</key>
            <true/>
            <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
            <false/>
            <key>NSExceptionMinimumTLSVersion</key>
            <string>TLSv1.0</string>
        </dict>
        <key>weibo.cn</key>
        <dict>
            <key>NSIncludesSubdomains</key>
            <true/>
            <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
            <false/>
            <key>NSExceptionMinimumTLSVersion</key>
            <string>TLSv1.0</string>
        </dict>
        <key>weibo.com</key>
        <dict>
            <key>NSIncludesSubdomains</key>
            <true/>
            <key>NSThirdPartyExceptionAllowsInsecureHTTPLoads</key>
            <true/>
            <key>NSExceptionMinimumTLSVersion</key>
            <string>TLSv1.0</string>
            <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
            <false/>
        </dict>
        <key>sinaimg.cn</key>
        <dict>
            <key>NSIncludesSubdomains</key>
            <true/>
            <key>NSThirdPartyExceptionAllowsInsecureHTTPLoads</key>
            <true/>
   			  <key>NSExceptionMinimumTLSVersion</key>
            <string>TLSv1.0</string>
            <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
            <false/>
        </dict>
        <key>sinajs.cn</key>
        <dict>
            <key>NSIncludesSubdomains</key>
            <true/>
            <key>NSThirdPartyExceptionAllowsInsecureHTTPLoads</key>
            <true/>
            <key>NSExceptionMinimumTLSVersion</key>
            <string>TLSv1.0</string>
            <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
            <false/>
        </dict>
        <key>sina.com.cn</key>
        <dict>
            <key>NSIncludesSubdomains</key>
            <true/>
            <key>NSThirdPartyExceptionAllowsInsecureHTTPLoads</key>
            <true/>
            <key>NSExceptionMinimumTLSVersion</key>
            <string>TLSv1.0</string>
            <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
            <false/>
        </dict>
    </dict>
</dict>
```
#### 2.配置ApplicationQueriesSchemes(应用间跳转)
```objc
<key>LSApplicationQueriesSchemes</key>
<array>
    <!-- 微信 URL Scheme 白名单-->
    <string>wechat</string>
    <string>weixin</string>

    <!-- 新浪微博 URL Scheme 白名单-->
    <string>sinaweibohd</string>
    <string>sinaweibo</string>
    <string>weibosdk</string>
    <string>weibosdk2.5</string>

    <!-- QQ、Qzone URL Scheme 白名单-->
    <string>mqqapi</string>
    <string>mqq</string>
    <string>mqqOpensdkSSoLogin</string>
    <string>mqqconnect</string>
    <string>mqqopensdkdataline</string>
    <string>mqqopensdkgrouptribeshare</string>
    <string>mqqopensdkfriend</string>
    <string>mqqopensdkapi</string>
    <string>mqqopensdkapiV2</string>
    <string>mqqopensdkapiV3</string>
    <string>mqqopensdkapiV4</string>
    <string>mqzoneopensdk</string>
    <string>wtloginmqq</string>
    <string>wtloginmqq2</string>
    <string>mqqwpa</string>
    <string>mqzone</string>
    <string>mqzonev2</string>
    <string>mqzoneshare</string>
    <string>wtloginqzone</string>
    <string>mqzonewx</string>
    <string>mqzoneopensdkapiV2</string>
    <string>mqzoneopensdkapi19</string>
    <string>mqzoneopensdkapi</string>
    <string>mqqbrowser</string>
    <string>mttbrowser</string>
</array>
```
## Renderings
纯文本分享：</br>
<img src="Images/新浪纯文本分享.gif" width="200"></br>
单图分享：</br>
<img src="Images/新浪图片分享.gif" width="200"></br>
URL分享：</br>
<img src="Images/新浪URL分享.gif" width="200"></br>
## License
SocialSDK is under [WTFPL](http://www.wtfpl.net/). You can do what the fuck you want with SocialSDK. See [LICENSE](LICENSE) file for more info.
