require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
strict = true;
 override_by_filename = {
  [".vue"] = {
    icon = "﵂",
    color = "#428850",
    name = "Vue"
  }
 };

}
