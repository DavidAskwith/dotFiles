local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
    return
end

-- Break if no theme
onedark.setup {
    style = 'darker'
}

onedark.load()
