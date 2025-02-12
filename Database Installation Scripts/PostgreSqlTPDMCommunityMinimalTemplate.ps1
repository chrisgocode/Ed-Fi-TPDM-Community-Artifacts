# SPDX-License-Identifier: Apache-2.0
# Licensed to the Ed-Fi Alliance under one or more agreements.
# The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
# See the LICENSE and NOTICES files in the project root for more information.

#requires -modules "path-resolver"

Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\packaging\nuget-helper.psm1')
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath "logistics\scripts\modules\tools\ToolsHelper.psm1")
Import-Module -Force -Scope Global (Get-RepositoryResolvedPath 'logistics\scripts\modules\utility\hashtable.psm1')

$parameters = @{
    packageName     = "EdFi.Suite3.Ods.Minimal.Template.TPDM.Community.PostgreSQL"
    packageVersion  = "5.3.67"
    packageSource   = "https://pkgs.dev.azure.com/ed-fi-alliance/Ed-Fi-Alliance-OSS/_packaging/EdFi/nuget/v3/index.json"
    outputDirectory = "$PSScriptRoot/../Database"
    toolsPath       = (Get-ToolsPath)
}
$packagePath = Get-NuGetPackage @parameters

return Get-ChildItem "$packagePath/*.bak"
