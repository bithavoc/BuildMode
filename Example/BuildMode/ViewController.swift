//
//  ViewController.swift
//  BuildMode
//
//  Created by bithavoc on 11/06/2019.
//  Copyright (c) 2019 bithavoc. All rights reserved.
//

import UIKit
import BuildMode

class ViewController: UIViewController {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var debugLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    titleLabel.text = "BuildMode: \(BuildMode.main)(\(BuildMode.main.environment))"
    let provisioning = ProvisioningProfile.main
    var entries = [
      "platform": provisioning?.platform as Any,
      "teamName": provisioning?.teamName as Any,
      "teamIdentifier": provisioning?.teamIdentifier as Any,
      "applicationIdentifierPrefix": provisioning?.applicationIdentifierPrefix as Any,
      "appIDName": provisioning?.appIDName as Any,
      "name": provisioning?.name as Any,
      "isXcodeManaged": provisioning?.isXcodeManaged as Any,
      "uuid": provisioning?.uuid as Any,
      "provisionsAllDevices": provisioning?.provisionsAllDevices as Any
      ] as [String : Any]
    
    let entitlements = [
      "applicationIdentifier": provisioning?.entitlements?.applicationIdentifier,
      "getTaskAllow": "\(String(describing: provisioning?.entitlements?.getTaskAllow))",
    ]
    entitlements.forEach { (k,v) in entries["entitlements.\(k)"] = v }
    debugLabel.text = entries.map { (k,v) in "\(k): \(v)" }.joined(separator: "\n--\n")
  }
}

