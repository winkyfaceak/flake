{
  system.defaults = {
    NSGlobalDomain.AppleICUForce24HourTime = false; # use 12 hour time

    menuExtraClock = {
      Show24Hour = true; # show 12 hour clock
      IsAnalog = false; # show digital clock
      ShowAMPM = true; # show AM/PM

      # Show date can imply the result of ShowDayOfMonth, ShowDayOfWeek, and ShowSeconds.
      ShowDate = 0; # 0 = Show the date 1 = Don’t show 2 = Don’t show (hides date)
      ShowDayOfMonth = true; # show day of month
      ShowDayOfWeek = true; # show day of week
      # ShowSeconds = false; # show seconds
    };
  };
}