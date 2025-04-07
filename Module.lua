return function(basePath)
    return {
        Name = "SW Eventing Module",
        LibsToLink = { "SW.Module.Eventing" },
        IncludeDirs = {
            basePath .. "/src",
        },
    }
end
