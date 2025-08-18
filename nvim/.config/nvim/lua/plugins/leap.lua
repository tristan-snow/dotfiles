
vim.pack.add({
	{src = 'https://github.com/ggandor/leap.nvim'}
})

require('leap').set_default_mappings()
-- Not currently working
require('leap').opts.keep_conceallevel = true
