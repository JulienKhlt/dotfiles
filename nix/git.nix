{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "JulienKhlt";
    userEmail = "julien.khlaut@gmail.com";

    lfs.enable = true;

    delta = {
      enable = true;
      options = {
        navigate = true;
      };
    };

    aliases = {
      autofixup = "!f() { COMMIT_HASH=$(git log --pretty=oneline | fzf | awk '{print $1}'); git commit --fixup $COMMIT_HASH; GIT_SEQUENCE_EDITOR=: git rebase --autostash --autosquash -i $COMMIT_HASH^; }; f";
    };

    extraConfig = {
      interactive.diffFilter = "delta --color-only";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      push = {
        autoSetupRemote = true;
        default = "current";
      };
      init.defaultBranch = "main";
      page = {
        diff = "delta";
        show = "delta";
        log = "delta";
        blame = "delta";
        reflog = "delta";
        merge = "delta";
      };
    };
  };
}
