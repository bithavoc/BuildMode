//
//  Entitlements.swift
//  BuildMode
//
//  Created by Johan Hernandez on 6/11/19.
//

import Foundation

public struct Entitlements : Decodable {
  public var applicationIdentifier: String?
  public var getTaskAllow: Bool?
  public var apsEnvironment: String?
  enum CodingKeys: String, CodingKey {
    case applicationIdentifier = "application-identifier"
    case getTaskAllow = "get-task-allow"
    case apsEnvironment = "aps-environment"
  }
}
