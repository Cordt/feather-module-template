//
//  {name}Module.swift
//  {project}
//
//  Created by {author} on {date}.
//

import FeatherCore

final class {Name}Module: ViperModule {

    static var name: String = "{name}"

    var router: ViperRouter? { {Name}Router() }

    var migrations: [Migration] {
        [
            {Name}Migration_v1_0_0(),
        ]
    }

    static var bundleUrl: URL? {
        // Bundle.module.resourceURL?.appendingPathComponent("Bundle")
        URL(fileURLWithPath: Application.Paths.base)
            .appendingPathComponent("Sources")
            .appendingPathComponent("Feather")
            .appendingPathComponent("Modules")
            .appendingPathComponent("{Name}")
            .appendingPathComponent("Bundle")
    }

    func boot(_ app: Application) throws {
        /// frontend middleware
        app.databases.middleware.use(MetadataModelMiddleware<{Name}Model>())

        /// install
        app.hooks.register("model-install", use: modelInstallHook)
        app.hooks.register("system-variables-install", use: systemVariablesInstallHook)
        app.hooks.register("user-permission-install", use: userPermissionInstallHook)
        app.hooks.register("frontend-main-menu-install", use: frontendMainMenuInstallHook)
        app.hooks.register("frontend-page-install", use: frontendPageInstallHook)

        /// routes
        app.hooks.register("admin", use: (router as! {Name}Router).adminRoutesHook)

        /// leaf
        app.hooks.register("leaf-admin-menu", use: leafAdminMenuHook)

        /// pages
        app.hooks.register("frontend-page", use: {name}FrontendPageHook)

        app.hooks.register("{name}-page", use: {name}PageHook)
    }


     func leafAdminMenuHook(args: HookArguments) -> LeafDataRepresentable {
        [
            "name": "{Name}",
            "icon": "feather",
            "permission": "{name}.module.access",
            "items": LeafData.array([
                [
                    "url": "/admin/{name}/{name}/",
                    "label": "{Name}",
                    "permission": "{name}.{name}.list",
                ],
            ])
        ]
    }

    // MARK: - frontend page hooks

    func {name}PageHook(args: HookArguments) -> EventLoopFuture<Response?> {
        let req = args["req"] as! Request
        let metadata = args["page-metadata"] as! Metadata


        return {Name}Model
            .queryJoinPublicMetadata(on: req.db)
            .all()
            .flatMap { {Name}FrontendView(req).{name}($0, metadata: metadata) }
            .encodeOptionalResponse(for: req)
    }


    func {name}FrontendPageHook(args: HookArguments) -> EventLoopFuture<Response?> {
        let req = args["req"] as! Request

        return {Name}Model.queryJoinPublicMetadata(path: req.url.path, on: req.db)
            .first()
            .flatMap { {name} in
                guard let {name} = {name} else {
                    return req.eventLoop.future(nil)
                }
                return {Name}FrontendView(req).{name}({name}).encodeOptionalResponse(for: req)
            }
    }

}
