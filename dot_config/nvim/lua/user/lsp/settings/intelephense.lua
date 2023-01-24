return  {
      cmd = { 'intelephense', '--stdio' };
      filetypes = { 'php' };
      root_dir = function()
        return vim.loop.cwd()
      end;
      settings = {
        intelephense = {
          files = {
            maxSize = 1000000;
          };
          environment = {
            includePaths = {
            }
          }
        }
      }
    }
