//
//  {Name}Model.swift
//  {project}
//
//  Created by {author} on {date}.
//

import FeatherCore

extension {Name}Model: LeafDataRepresentable {

    var leafData: LeafData {
        .dictionary([
            "id": id,
            "title": title,
        ])
    }
}
