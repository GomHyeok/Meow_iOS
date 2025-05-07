//
//  workspace.swift
//  Manifests
//
//  Created by 최재혁 on 5/5/25.
//

@preconcurrency import ProjectDescription

let workspace = Workspace(
    name: "MeowWorkspace",
    projects: ["Projects/**"]
)
