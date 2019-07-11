//
//  TiNotificationbannerModule.swift
//  titanium-notification-banner
//
//  Created by Hans Knöchel
//  Copyright (c) 2019-present by Lambus GmbH. All rights reserved.
//

import BRYXBanner
import UIKit
import TitaniumKit

@objc(TiNotificationbannerModule)
class TiNotificationbannerModule: TiModule {

  public let testProperty: String = "Hello World"
  
  func moduleGUID() -> String {
    return "cccc9652-8055-43e0-a933-5cc76acd00be"
  }
  
  override func moduleId() -> String! {
    return "ti.notificationbanner"
  }

  override func startup() {
    super.startup()
    debugPrint("[DEBUG] \(self) loaded")
  }

  @objc(show:)
  func show(arguments: Array<Any>?) {
    guard let arguments = arguments, let params = arguments[0] as? [String: Any] else { return }
   
    let title = params["title"] as? String
    let subtitle = params["subtitle"] as? String
    let duration = params["duration"] as? Double
    let image = params["image"] as? String
    let titleColor = params["titleColor"] as? String
    let backgroundColor = params["backgroundColor"] as? String
    let onClickCallback = params["onClick"] as? KrollCallback
    
    let banner = Banner(title: title, subtitle: subtitle, image: TiUtils.toImage(image, proxy: self), backgroundColor: TiUtils.colorValue(backgroundColor)?.color ?? UIColor.clear) {
      if let onClickCallback = onClickCallback {
        onClickCallback.call([[:]], thisObject: self)
      }
    }
    
    if let titleColor = TiUtils.colorValue(titleColor) {
      banner.textColor = titleColor.color
    }

    banner.dismissesOnTap = true
    banner.dismissesOnSwipe = true

    banner.show(duration: duration)
  }
}
