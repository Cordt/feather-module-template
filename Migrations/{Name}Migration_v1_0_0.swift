//
//  {name}Migration_v1_0_0.swift
//  {project}
//
//  Created by {author} on {date}.
//

import FeatherCore
import Fluent

struct {name}Migration_v1_0_0: Migration {

    func prepare(on db: Database) -> EventLoopFuture<Void> {
        db.schema({name}Model.schema)
            .id()
            .field({name}Model.FieldKeys.title, .string, .required)
            .create()
        
    }

    func revert(on db: Database) -> EventLoopFuture<Void> {
        db.schema({name}Model.schema).delete()
    }
}
