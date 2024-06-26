{ ... }:
{
  programs.git = {
    enable = true;

    userName = "Fabien Taxil";
    userEmail = "me@lixaft.dev";

    extraConfig = {
      advice.statusHints = false;
      color.ui = true;
      core.editor = "nvim";
      core.symlinks = true;
      fetch.prune = true;
      grep.extendedRegexp = true;
      init.defaultBranch = "main";
      pull.rebase = true;

      safe.directory = "*";
    };

    aliases = {
      git = "!git";
      l = "ll -16";
      ll = "log --abbrev-commit --date=relative --pretty='%C(bold red)%h%C(reset) - %s %C(bold yellow)%d%C(reset) %C(bold green)(%cr) %C(bold blue)<%an>%C(reset)'";
      rg = "grep --heading --line-number";
      oops = "commit --amend --no-edit";
      undo = "reset --soft HEAD^";
      fuck = "reset --hard HEAD";
      yolo = "push --force-with-lease origin HEAD";
      norris = "push --force origin HEAD";
      quarante-neuf-trois = "push --force origin HEAD";
      congrat = "blame";
      random = ''"!git commit -m \"$(curl -s https://whatthecommit.com/index.txt)\"'';
    };

    delta = {
      enable = true;
      options = {
        syntax-theme = "tokyonight";

        minus-style = ''syntax "#37222c"'';
        minus-non-emph-style = ''syntax "#37222c"'';
        minus-emph-style = ''syntax "#713137"'';
        minus-empty-line-marker-style = ''syntax "#37222c"'';
        line-numbers-minus-style = "#b2555b";
        plus-style = ''syntax "#20303b"'';
        plus-non-emph-style = ''syntax "#20303b"'';
        plus-emph-style = ''syntax "#2c5a66"'';
        plus-empty-line-marker-style = ''syntax "#20303b"'';
        line-numbers-plus-style = "#266d6a";
        line-numbers-zero-style = "#3b4261";
      };
    };

    includes = [
      {
        condition = "gitdir:~/dev/stim/";
        contents = {
          user.email = "ftaxil@stimstudio.com";
        };
      }
    ];
  };
}
