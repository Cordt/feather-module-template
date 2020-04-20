//
//  {module}Router.swift
//  {project}
//
//  Created by {author} on {date}.
//

import Vapor

final class {module}Router: RouteCollection {

    let controller = {module}FrontendController()

    func boot(routes: RoutesBuilder) throws {

        routes.get("example", use: self.controller.exampleView)
    }
}
