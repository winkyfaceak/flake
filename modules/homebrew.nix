{
  # https://docs.brew.sh/Manpage#environment
  environment.variables = {
    HOMEBREW_NO_ANALYTICS = "1";
    HOMEBREW_NO_INSECURE_REDIRECT = "1";
    HOMEBREW_NO_EMOJI = "1";
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    taps = [
      "homebrew/cask-fonts"
      "homebrew/services"
      "homebrew/cask-versions"
    ];

    # `brew install`
    brews = [
      # "aria2"  # download tool
      "m-cli"
      "node"
    ];

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = [
      "arc"
      "maccy"
      "rectangle"
      "raycast"
      "linearmouse"
      "drawio"
      "gimp"
      "pycharm-ce"
      "inkscape"
      "discord"
      "windscribe"
      "steam"
      "obsidian"
      "OpenEmu"
      "transmission"
      "zed"
    ];
  };
}
