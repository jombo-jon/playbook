-- Filetype C
local table = {
    [",bj"] = {'n','<cmd>lua insert("bonjour")<cr>'},
    [",hi"] = {'i','<cmd>lua insert("hello")<cr>'}
} 

-- Special Vim 
require('jombojon.set')

return table
