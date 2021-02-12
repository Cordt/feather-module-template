//
//  {Name}Router.swift
//  {project}
//
//  Created by {author} on {date}.
//

import FeatherCore

struct {Name}Router: ViperRouter {

    let admin = {Name}AdminController()

    func adminRoutesHook(args: HookArguments) {
        let routes = args["routes"] as! RoutesBuilder

        let modulePath = routes.grouped({Name}Module.pathComponent)

        admin.setupRoutes(on: modulePath, as: {Name}Model.pathComponent)
    }
}
