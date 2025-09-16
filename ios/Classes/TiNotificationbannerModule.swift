//
//  TiNotificationbannerModule.swift
//  titanium-notification-banner
//
//  Created by Hans Knöchel
//  Copyright (c) 2019-present by Lambus GmbH. All rights reserved.
//

import UIKit
import TitaniumKit

@objc(TiNotificationbannerModule)
class TiNotificationbannerModule: TiModule {
  
  func moduleGUID() -> String {
    return "cccc9652-8055-43e0-a933-5cc76acd00be"
  }
  
  override func moduleId() -> String! {
    return "ti.notificationbanner"
  }

  @objc(show:)
  func show(arguments: [Any]) {
    guard let params = arguments[0] as? [String: Any] else { return }
   
    let title = params["title"] as? String
    let subtitle = params["subtitle"] as? String
    let duration = params["duration"] as? Double
    let image = params["image"] as? String
    let type = params["type"] as? String
    let titleColor = params["titleColor"]
    let backgroundColor = params["backgroundColor"]
    let onClickCallback = params["onClick"] as? KrollCallback
    
    var nativeIcon: AlertIcon = .done
    var nativeType: AlertHaptic = .none
    if type != nil {
      if type == "info" {
        if let image = UIImage(systemName: "info.circle") {
          nativeIcon = .custom(image)
        }
        nativeType = .none
      } else if type == "warning" {
        if let image = UIImage(systemName: "exclamationmark.triangle") {
          nativeIcon = .custom(image)
        }
        nativeType = .warning
      } else if type == "error" {
        nativeIcon = .error
        nativeType = .error
      } else if type == "success" {
        nativeIcon = .done
        nativeType = .success
      }
    }
    
    if image != nil {
      nativeIcon = .custom(TiUtils.image(image, proxy: self))
    }
    
    logRemovedLogIfSet(duration, propertyName: "duration")
    logRemovedLogIfSet(titleColor, propertyName: "titleColor")
    logRemovedLogIfSet(backgroundColor, propertyName: "backgroundColor")
    logRemovedLogIfSet(duration, propertyName: "duration")
    logRemovedLogIfSet(onClickCallback, propertyName: "onClick")
    
    AlertKitAPI.present(
        title: title,
        subtitle: subtitle,
        icon: nativeIcon,
        style: .iOS17AppleMusic,
        haptic: nativeType,
    )
  }
  
  private func logRemovedLogIfSet(_ value: Any?, propertyName: String) {
    if (value != nil) {
      NSLog("[ERROR] The \"\(propertyName)\" property has been removed in Ti.NotificationBanner v5")
    }
  }
}
