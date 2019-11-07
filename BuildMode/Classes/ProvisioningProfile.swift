//
//  ProvisioningProfile.swift
//  BuildMode
//
//  Created by Johan Hernandez on 6/11/19.
//

import Foundation

public struct ProvisioningProfile : Decodable {
  public var platform: [String]?
  public var teamName: String?
  public var teamIdentifier: [String]?
  public var applicationIdentifierPrefix: [String]?
  public var appIDName: String?
  public var name: String?
  public var isXcodeManaged: Bool?
  public var uuid: String?
  public var entitlements: Entitlements?
  public var provisionsAllDevices: Bool?
  enum CodingKeys: String, CodingKey {
    case platform = "Platform"
    case teamName = "TeamName"
    case teamIdentifier = "TeamIdentifier"
    case applicationIdentifierPrefix = "ApplicationIdentifierPrefix"
    case appIDName = "AppIDName"
    case name = "Name"
    case isXcodeManaged = "IsXcodeManaged"
    case uuid = "UUID"
    case entitlements = "Entitlements"
    case provisionsAllDevices = "ProvisionsAllDevices"
  }
  
  var isEmpty: Bool {
    return name == nil
  }
}

public extension ProvisioningProfile {
  static var main: Self? {
    return ProvisioningProfileFrom()
  }
}

public func ProvisioningProfileFrom(bundle: Bundle = Bundle.main) -> ProvisioningProfile? {
  guard let provisioningProfilePath = bundle.path(forResource: "embedded", ofType: "mobileprovision") else {
    return nil
  }
  guard let profileContent = try? String(contentsOfFile: provisioningProfilePath, encoding: .isoLatin1) else {
    return nil
  }
  let scanner = Scanner(string: profileContent)
  guard let _ = scanner.scanUpToString("<plist") else {
    return nil
  }
  guard var plistText = scanner.scanUpToString("</plist>") else {
    return nil
  }
  plistText += "</plist>"
  guard let plistData = plistText.data(using: .isoLatin1) else {
    return nil
  }
//  guard let plist = try? PropertyListSerialization.propertyList(from: plistData, format: nil) as! [String:Any] else {
//    return nil
//  }
//  print("plist", plist)
  let profile = try! PropertyListDecoder().decode(ProvisioningProfile.self, from: plistData)
  return profile
}
