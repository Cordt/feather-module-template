//
//  {module}Router.swift
//  {project}
//
//  Created by {author} on {date}.
//

import Vapor
import ViperKit

final class {module}Router: ViperRouter {

    let controller = {module}FrontendController()

    func boot(routes: RoutesBuilder, app: Application) throws {

        routes.get("example", use: self.controller.exampleView)
    }
}
