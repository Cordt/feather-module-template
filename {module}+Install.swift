//
//  {module}Builder.swift
//  {project}
//
//  Created by {author} on {date}.
//

import FeatherCore

extension {module}Module {
    
    func modelInstallHook(args: HookArguments) -> EventLoopFuture<Void> {
        let req = args["req"] as! Request

        return req.eventLoop.flatten([

        ])
    }

    func systemVariablesInstallHook(args: HookArguments) -> [[String: Any]] {
        [
            [
                "key": "{module}.example.page.title",
                "name": "{module} example page title",
                "value": "{module} page title",
                "note": "Title of the example page",
            ],
        ]
    }

    func frontendMainMenuInstallHook(args: HookArguments) -> [[String:Any]] {
        [
            [
                "label": "{module}",
                "url": "/example/",
                "priority": 900,
            ],
        ]
    }
    
    func frontendPageInstallHook(args: HookArguments) -> [[String:Any]] {
        [
            [
                "title": "{module}",
                "content": "[example-page]",
            ],
        ]
    }

    func userPermissionInstallHook(args: HookArguments) -> [[String: Any]] {
        {module}Module.permissions +
        {module}Model.permissions
    }
}
