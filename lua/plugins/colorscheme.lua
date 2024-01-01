return {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("solarized-osaka").setup({
            transparent = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                floats = "transparent",
            }
        })
        require("solarized-osaka")._load("moon")
    end
}
