-- clientmods/notes/init.lua
-- =================
-- See README.txt for licensing and other information.

local mod_storage = minetest.get_mod_storage()

if mod_storage:get_string("note") == "" then
  mod_storage:set_string("note", "Write down your notice here")
end

minetest.register_chatcommand("notes", {
    description = "Ingame notes",
    func = function()
      local input = mod_storage:get_string("note")
      minetest.show_formspec("note:note",
        "size[10,10]" ..
        "label[4.5,0;Notes]"..
        "textarea[0.3,1;10,9;note;;".. input .."]"..
        "button_exit[4.5,9.2;1.4,1;e;Save]")
  end})

minetest.register_on_formspec_input(function(formname, fields)
    if not fields.note then return end
    if formname == "note:note" then
      mod_storage:set_string("note", fields.note)
    end
  end)
