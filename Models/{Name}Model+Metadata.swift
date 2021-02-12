//
//  {name}Model.swift
//  {project}
//
//  Created by {author} on {date}.
//

import FeatherCore

extension {name}Model: MetadataRepresentable {

    var metadata: Metadata {
        .init(slug: Self.name + "/" + title.slugify(), title: title)
    }
}

