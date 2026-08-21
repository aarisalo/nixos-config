{ 
  environment.sessionVariables = {
    XDG_DATA_DIRS = [
      "var/lib/flatpak/exports/share"
      "$HOME/.local/share/flatpak/exports/share"
    ];
  };

  environment.variables = {
    EDITOR = "micro";
    VISUAL = "micro";
  };
}