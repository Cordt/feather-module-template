//
//  {name}Model.swift
//  {project}
//
//  Created by {author} on {date}.
//

import FeatherCore

extension {name}Model: LeafDataRepresentable {

    var leafData: LeafData {
        .dictionary([
            "id": id,
            "title": title,
        ])
    }
}
