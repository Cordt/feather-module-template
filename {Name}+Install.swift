//
//  {name}Builder.swift
//  {project}
//
//  Created by {author} on {date}.
//

import FeatherCore

extension {name}Module {
    
    func modelInstallHook(args: HookArguments) -> EventLoopFuture<Void> {
        let req = args["req"] as! Request

        return req.eventLoop.flatten([

        ])
    }

    func systemVariablesInstallHook(args: HookArguments) -> [[String: Any]] {
        [
            [
                "key": "{name}.example.page.title",
                "name": "{name} example page title",
                "value": "{name} page title",
                "note": "Title of the example page",
            ],
        ]
    }

    func frontendMainMenuInstallHook(args: HookArguments) -> [[String:Any]] {
        [
            [
                "label": "{name}",
                "url": "/example/",
                "priority": 900,
            ],
        ]
    }
    
    func frontendPageInstallHook(args: HookArguments) -> [[String:Any]] {
        [
            [
                "title": "{name}",
                "content": "[example-page]",
            ],
        ]
    }

    func userPermissionInstallHook(args: HookArguments) -> [[String: Any]] {
        {name}Module.permissions +
        {name}Model.permissions
    }
}
