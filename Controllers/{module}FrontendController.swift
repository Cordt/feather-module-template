//
//  {module}FrontendController.swift
//  {project}
//
//  Created by {author} on {date}.
//

import Vapor
import Fluent

final class {module}FrontendController {

    func exampleView(req: Request) throws -> EventLoopFuture<View> {
        struct Context: Encodable {
            let foo: String
        }
        let context = Context(foo: "This is just an example")
        return req.view.render("{module}/Frontend/Example", context)
    }

}
