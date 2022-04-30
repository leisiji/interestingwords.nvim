vim.api.nvim_create_user_command("Interestingwords", function(input)
  require("interestingwords.command").command(input.fargs[1], input.fargs[2])
end, { nargs = "+" })
