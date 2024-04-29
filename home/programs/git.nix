{
  programs.git = {
    enable = true;
    difftastic.enable = true;

    userName = "winkyfaceak";
    userEmail = "42068367+winkyfaceak@users.noreply.github.com";

    ignores = [
      ".DS_Store"
    ];

    lfs = {
      enable = true;
      skipSmudge = true;
    };

    extraConfig = {
      init.defaultBranch = "main";

      merge.conflictstyle = "zdiff3";
      diff.algorithm = "histogram";

      push.autoSetupRemote = true;
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
