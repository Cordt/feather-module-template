//
//  {name}Model.swift
//  {project}
//
//  Created by {author} on {date}.
//

import FeatherCore

struct {Name}FrontendView {

    let req: Request

    init(_ req: Request) {
        self.req = req
    }

    private func render(_ name: String, _ context: LeafRenderer.Context) -> EventLoopFuture<View> {
        let template = "\({Name}Module.name.capitalized)/Frontend/\(name)"
        return req.leaf.render(template: template, context: context)
    }

    func {name}(_ {name}: [{Name}Model], metadata: Metadata) -> EventLoopFuture<View> {
        render("{Name}List", [
            "metadata": metadata.leafData,
            "{name}": .array({name}.map { $0.leafDataWithJoinedMetadata }),
        ])
    }

    func {name}(_ {name}: {Name}Model) -> EventLoopFuture<View> {
        render("{Name}", [
            "{name}": {name}.leafData
        ])
    }

}
