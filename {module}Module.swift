//
//  {module}Module.swift
//  {project}
//
//  Created by {author} on {date}.
//

import Vapor
import Fluent
import ViperKit

final class {module}Module: ViperModule {

    static var name: String = "example"

    var router: ViperRouter? { {module}Router() }

    var migrations: [Migration] {
        [
            {module}Migration_v1_0_0(),
        ]
    }
}
