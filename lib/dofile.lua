
function dofile(file, ...)
	soap = ...
    if soap then
        core.debug("action", "Loading file: "..file.." with args: "..soap)
    else
        core.debug("action", "Loading file: "..file.." with args: no_arguments")
    end
    local def = assert(loadfile(file, ...))
    return def()
end
