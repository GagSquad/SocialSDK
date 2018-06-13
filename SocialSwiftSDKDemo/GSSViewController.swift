//
//  GSSViewController.swift
//  SocialSDKSwiftDemo
//
//  Created by lijunjie on 2018/6/13.
//  Copyright © 2018年 GagSquad. All rights reserved.
//

import UIKit
import SocialSDK;

class GSSViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func selectSharePlan(_ sender: Any) {
        GSActionSheetSelectView.showShareView(withChannels: [
            NSNumber.init(value:GSShareChannelTypeSina.rawValue),
            NSNumber.init(value:GSShareChannelTypeQQ.rawValue),
            NSNumber.init(value:GSShareChannelTypeWechatSession.rawValue)
        ]) { (isCancel, resourcesType) in
            if isCancel {
               NSLog("用户点击了取消")
            } else {
//                self.testPay(resourcesType: resourcesType)
//                self.testLogin(resourcesType: resourcesType)
                self.testShare(resourcesType: resourcesType)
            }
        }
    }
    
    func testPay(resourcesType: GSLogoReourcesType) {
        
    }
    
    func testLogin(resourcesType: GSLogoReourcesType) {
        let login = GSLoginManager.share().getShareProtocol(with: GSLoginManager.getShareChannelType(with: resourcesType))
        login?.setLoginCompletionBlock({ (result) in
            
        })
        login?.doLogin()
    }
    
    func testShare(resourcesType: GSLogoReourcesType) {
        let share = GSShareManager.share().getShareProtocol(with: GSShareManager.getShareChannelType(with: resourcesType))
        share?.setShareCompletionBlock({ (result) in
            
        })
        
        //分享纯文本
        share?.shareSimpleText("分享纯文本")
//        //分享图片
//        share?.shareSingleImage(UIImage.init(named: "default"), title: "分享图片title", description: "分享图片description")
//        //分享url
//        share?.shareURL("https://github.com/GagSquad/SocialSDK", title: "分享链接title", description: "分享链接description", thumbnail: UIImage.init(named: "default"))
//        share?.shareMusicURL("http://i.y.qq.com/v8/playsong.html?hostuin=0&songid=&songmid=002x5Jje3eUkXT&_wv=1&source=qq&appshare=iphone&media_mid=002x5Jje3eUkXT", musicLowBandURL: nil, musicDataURL: nil, musicLowBandDataURL: nil, title: "Wish You Were Here", description: "Avril Lavigne", thumbnail: UIImage.init(named: "default"))
//        share?.shareVideoURL("http://www.tudou.com/programs/view/_cVM3aAp270/", videoLowBandURL: nil, videoStreamURL: nil, videoLowBandStreamURL: nil, title: "腾讯暗黑风动作新游《天刹》国服视频曝光", description: "你觉得正在玩的动作游戏的打击感不够好？战斗不够真实缺乏技巧？PVP索然无味完全是比谁装备好？那么现在有款新游戏或许能满足你的胃口！ 《天刹》是由韩国nse公司开发，腾讯全球代理中国首发的3D锁视角动作游戏，是一款有着暗黑写实风格、东方奇幻题材的游戏，具备打击感十足的动作体验、策略多变的战斗方式，游戏操作不难但有足够的深度，在动作游戏领域首次引入了手动格挡格斗机制，构建快速攻防转换体系。 官方网站：tian.qq.com 官方微博：http://t.qq.com/tiancha001", thumbnail: UIImage.init(named: "default"))
    }
}
