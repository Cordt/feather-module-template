//
//  {module}Builder.swift
//  {project}
//
//  Created by {author} on {date}.
//

import Vapor
import ViperKit

@_cdecl("create{module}Module")
public func create{module}Module() -> UnsafeMutableRawPointer {
    return Unmanaged.passRetained({module}Builder()).toOpaque()
}

final class {module}Builder: ViperBuilder {

    override func build() -> ViperModule {
        {module}Module()
    }
}
