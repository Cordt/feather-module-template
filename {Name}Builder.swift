//
//  {Name}Builder.swift
//  {project}
//
//  Created by {author} on {date}.
//

import FeatherCore

@_cdecl("create{Name}Module")
public func create{Name}Module() -> UnsafeMutableRawPointer {
    return Unmanaged.passRetained({Name}Builder()).toOpaque()
}

final class {Name}Builder: ViperBuilder {

    override func build() -> ViperModule {
        {Name}Module()
    }
}
