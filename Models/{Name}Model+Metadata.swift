//
//  {Name}Model.swift
//  {project}
//
//  Created by {author} on {date}.
//

import FeatherCore

extension {Name}Model: MetadataRepresentable {

    var metadata: Metadata {
        .init(slug: Self.name + "/" + title.slugify(), title: title)
    }
}

