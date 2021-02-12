//
//  {name}Router.swift
//  {project}
//
//  Created by {author} on {date}.
//

import Vapor
import ViperKit

struct {name}Router: ViperRouter {

    let admin = {name}AdminController()

 	func adminRoutesHook(args: HookArguments) {
        let routes = args["routes"] as! RoutesBuilder

        let modulePath = routes.grouped({name}Module.pathComponent)

        admin.setupRoutes(on: modulePath, as: {name}Model.pathComponent)
    }
}


