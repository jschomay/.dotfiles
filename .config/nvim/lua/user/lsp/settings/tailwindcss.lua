return {
  -- can't figure out how to support elixir without adding it to filetypes (includeLanguages doesn't seem to work)
  filetypes = {"elixir", "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-html", "htmldjango", "edge", "eelixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte" },
  init_options = {
    userLanguages = {
      elixir = "html-eex",
      eelixir = "html-eex",
    }
  },
  -- settings = {
  --   tailwindCSS = {
  --     includeLanguages = {
  --       elixir = "html"
  --     }
  --   }
  -- }
}
