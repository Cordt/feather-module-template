//
//  {module}Module.swift
//  {project}
//
//  Created by {author} on {date}.
//

import Vapor
import Fluent

final class {module}Module: Module {

    static var name: String = "example"

    var routes: RouteCollection? {
        {module}Router()
    }

    var migrations: [Migration] {
        [
            {module}Migration_v1_0_0(),
        ]
    }
}