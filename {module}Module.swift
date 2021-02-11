//
//  {module}Module.swift
//  {project}
//
//  Created by {author} on {date}.
//

import FeatherCore

final class {module}Module: ViperModule {

    static var name: String = "{module}"

    var router: ViperRouter? { {module}Router() }

    var migrations: [Migration] {
        [
            {module}Migration_v1_0_0(),
        ]
    }

    static var bundleUrl: URL? {
        Bundle.module.resourceURL?.appendingPathComponent("Bundle")
    }

  	func boot(_ app: Application) throws {
        /// frontend middleware
        app.databases.middleware.use(MetadataModelMiddleware<{module}Model>())
        
        /// install
        app.hooks.register("model-install", use: modelInstallHook)
        app.hooks.register("system-variables-install", use: systemVariablesInstallHook)
        app.hooks.register("user-permission-install", use: userPermissionInstallHook)
        app.hooks.register("frontend-main-menu-install", use: frontendMainMenuInstallHook)
        app.hooks.register("frontend-page-install", use: frontendPageInstallHook)

        /// routes
        app.hooks.register("admin", use: (router as! {module}Router).adminRoutesHook)
        
        /// leaf
        app.hooks.register("leaf-admin-menu", use: leafAdminMenuHook)

        /// pages
        app.hooks.register("frontend-page", use: exampleFrontendPageHook)

        app.hooks.register("example-page", use: examplePageHook)
    }


     func leafAdminMenuHook(args: HookArguments) -> LeafDataRepresentable {
        [
            "name": "{module}",
            "icon": "feather",
            "permission": "{module}.module.access",
            "items": LeafData.array([
                [
                    "url": "/admin/{module}/examples/",
                    "label": "Examples",
                    "permission": "{module}.examples.list",
                ],
            ])
        ]
    }

 	// MARK: - frontend page hooks

 	func examplePageHook(args: HookArguments) -> EventLoopFuture<Response?> {
        let req = args["req"] as! Request
        let metadata = args["page-metadata"] as! Metadata
        
        return {module}Model
            .home(on: req)
            .flatMap { BlogFrontendView(req).home(posts: $0, metadata: metadata) }
            .encodeOptionalResponse(for: req)
    }

    
    func exampleFrontendPageHook(args: HookArguments) -> EventLoopFuture<Response?> {
        let req = args["req"] as! Request

        return {module}Model.queryJoinPublicMetadata(path: req.url.path, on: req.db)
            .first()
            .flatMap { example  in
                guard let example = example else {
                    return req.eventLoop.future(nil)
                }
                /// render the post with the filtered content
                var ctx = post.leafDataWithJoinedMetadata.dictionary!
                ctx["content"] = .string(post.filter(post.content ?? "", req: req))
                return BlogFrontendView(req).post(ctx.leafData).encodeOptionalResponse(for: req)
            }
    }

}
