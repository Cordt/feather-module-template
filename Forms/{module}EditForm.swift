//
//  {module}Builder.swift
//  {project}
//
//  Created by {author} on {date}.
//

import FeatherCore

final class {module}EditForm: ModelForm {

    typealias Model = {module}CategoryModel

    var modelId: UUID?
    var title = FormField<String>(key: "title").required().length(max: 250)
    var notification: String?

    var metadata: Metadata?
    
    var fields: [FormFieldRepresentable] {
        [title]
    }

    var leafData: LeafData {
        .dictionary([
            "modelId": modelId?.encodeToLeafData() ?? .string(nil),
            "fields": fieldsLeafData,
            "notification": .string(notification),
            "metadata": metadata?.leafData ?? .dictionary(nil),
        ])
    }

    init() {}

    func initialize(req: Request) -> EventLoopFuture<Void> {
        var future = req.eventLoop.future()
        if let id = modelId {
            future = Model.findMetadata(reference: id, on: req.db).map { [unowned self] in metadata = $0 }
        }
        return future
    }

    func read(from input: Model)  {
        title.value = input.title
    }

    func write(to output: Model) {
        output.title = title.value!
    }
}
