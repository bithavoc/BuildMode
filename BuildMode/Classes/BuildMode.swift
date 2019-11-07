//
//  BuildMode.swift
//  BuildMode
//
//  Created by Johan Hernandez on 6/11/19.
//

import Foundation

/// Indicates the build mode of the application
public enum BuildMode {
  /// user is in a build from enterprise distribution
  case enterprise
  
  /// user is in xcode simulator
  case simulator
  
  /// user is in a development build
  case debuggable
  
  /// user is in a build from appstore or adhoc distribution
  case distribution
  
  public static var main: BuildMode {
    return BuildModeFrom(provisioningProfile: ProvisioningProfile.main)
  }
  
  /// Indicates the type of server-side environment to use
  public var environment: Environment {
    switch(self) {
    case .distribution:
      return .production
    case .enterprise:
      return .production
    case .simulator:
      return .sandbox
    case .debuggable:
      return .sandbox
    }
  }
}

public func BuildModeFrom(provisioningProfile: ProvisioningProfile?) -> BuildMode {
  guard let provisioningProfile = provisioningProfile else {
    #if targetEnvironment(simulator)
    return .simulator
    #else
    return .distribution
    #endif
  }
  if provisioningProfile.provisionsAllDevices ?? false {
    return .enterprise
  }
  if provisioningProfile.entitlements?.apsEnvironment == "development" || provisioningProfile.entitlements?.getTaskAllow ?? false {
    return .debuggable
  }
  return .distribution
}
