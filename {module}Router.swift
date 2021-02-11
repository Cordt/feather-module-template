//
//  {module}Router.swift
//  {project}
//
//  Created by {author} on {date}.
//

import Vapor
import ViperKit

struct {module}Router: ViperRouter {

    let admin = {module}AdminController()

 	func adminRoutesHook(args: HookArguments) {
        let routes = args["routes"] as! RoutesBuilder

        let modulePath = routes.grouped({module}Module.pathComponent)

        admin.setupRoutes(on: modulePath, as: {module}Model.pathComponent)
    }
}


