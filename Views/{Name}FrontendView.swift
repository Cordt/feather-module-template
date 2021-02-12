//
//  {name}Model.swift
//  {project}
//
//  Created by {author} on {date}.
//

import FeatherCore

struct {Name}FrontendView {

    let name = "frontend"

    let req: Request

    init(_ req: Request) {
        self.req = req
    }

    private func render(_ name: String, _ context: LeafRenderer.Context) -> EventLoopFuture<View> {
        let template = "\({Name}Module.name.capitalized)/\(self.name.capitalized)/\(name.capitalized)"
        return req.leaf.render(template: template, context: context)
    }

    func example({name}: [{Name}Model], metadata: Metadata) -> EventLoopFuture<View> {
        render("{name}", [
                "metadata": metadata.leafData,
                "{name}": .array({name}.map { $0.leafDataWithJoinedMetadata }),
        ])
    }

    func {name}(_ {name}: LeafData) -> EventLoopFuture<View> {
        render("{name}", ["{name}": {name}])
    }

}
