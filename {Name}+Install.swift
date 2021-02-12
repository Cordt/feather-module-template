//
//  {Name}Builder.swift
//  {project}
//
//  Created by {author} on {date}.
//

import FeatherCore

extension {Name}Module {

    func modelInstallHook(args: HookArguments) -> EventLoopFuture<Void> {
        let req = args["req"] as! Request

        return req.eventLoop.flatten([

        ])
    }

    func systemVariablesInstallHook(args: HookArguments) -> [[String: Any]] {
        [
            [
                "key": "{name}.{name}.page.title",
                "name": "{name} {name} page title",
                "value": "{name} page title",
                "note": "Title of the {name} page",
            ],
        ]
    }

    func frontendMainMenuInstallHook(args: HookArguments) -> [[String:Any]] {
        [
            [
                "label": "{Name}",
                "url": "/{name}/",
                "priority": 900,
            ],
        ]
    }

    func frontendPageInstallHook(args: HookArguments) -> [[String:Any]] {
        [
            [
                "title": "{name}",
                "content": "[{name}-page]",
            ],
        ]
    }

    func userPermissionInstallHook(args: HookArguments) -> [[String: Any]] {
        {Name}Module.permissions +
        {Name}Model.permissions
    }
}
