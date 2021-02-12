//
//  {name}Builder.swift
//  {project}
//
//  Created by {author} on {date}.
//

import FeatherCore

@_cdecl("create{name}Module")
public func create{name}Module() -> UnsafeMutableRawPointer {
    return Unmanaged.passRetained({name}Builder()).toOpaque()
}

final class {name}Builder: ViperBuilder {

    override func build() -> ViperModule {
        {name}Module()
    }
}
