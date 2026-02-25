{ config, pkgs, ... }:

{
  # Required
  system.stateVersion = 4;
  system.primaryUser = "dmytromay";
  users.users.dmytromay = {
    home = "/Users/dmytromay";
  };

  # Verify the actual GID
  # dscl . -read /Groups/nixbld PrimaryGroupID
  ids.gids.nixbld = 350;

  # Allow unfree packages (needed later for some tools)
  nixpkgs.config.allowUnfree = true;

  # Basic system packages (safe test set)
  environment.systemPackages = with pkgs; [
    git
    vim
    curl
  ];

  # Enable Zsh integration
  programs.zsh.enable = true;

  # Enable Homebrew (empty for now)
  homebrew.enable = true;

  # Required for flake builds
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # System defaults
  # docs: https://nix-darwin.github.io/nix-darwin/manual/index.html
  system.defaults = {
    NSGlobalDomain = {
      # Always show scrollbars
      AppleShowScrollBars = "Always";

      # Disable focus ring animation
      NSUseAnimatedFocusRing = false;

      # Toolbar title rollover delay
      # NSToolbarTitleViewRolloverDelay = 0.0;

      # Window resize speed
      NSWindowResizeTime = 0.001;

      # Expand save panel by default
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;

      # Expand print panel by default
      PMPrintingExpandedStateForPrint = true;
      PMPrintingExpandedStateForPrint2 = true;

      # Save to disk (not iCloud) by default
      NSDocumentSaveNewDocumentsToCloud = false;

      # Disable "smart" typing features
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;

      # Full keyboard access (Tab in modal dialogs)
      AppleKeyboardUIMode = 3;

      # Disable press-and-hold in favor of key repeat
      ApplePressAndHoldEnabled = false;

      # Keyboard repeat rates
      KeyRepeat = 10;
      InitialKeyRepeat = 20;

      # Language/locale/units
      # AppleLanguages = [ "en" "fr" "pl" ];
      # AppleLocale = "en_GB@currency=EUR";
      AppleMeasurementUnits = "Centimeters";
      AppleMetricUnits = 1;

      # Font smoothing
      AppleFontSmoothing = 1;
    };

    # Automatically quit printer app once jobs complete
    CustomUserPreferences = {
      "com.apple.print.PrintingPrefs" = {
        "Quit When Finished" = true;
      };

      # Bluetooth audio quality tweak
      "com.apple.BluetoothAudioAgent" = {
        "Apple Bitpool Min (editable)" = 40;
      };
    };

    screencapture = {
      location = "$HOME/Desktop";
      type = "png";
      disable-shadow = true;
    };

    finder = {
      QuitMenuItem = true;
      #DisableAllAnimations = true;

      NewWindowTarget = "Desktop";

      AppleShowAllFiles = true;
      ShowStatusBar = true;
      ShowPathbar = true;
      _FXShowPosixPathInTitle = true;
      _FXSortFoldersFirst = true;
      FXDefaultSearchScope = "SCcf";
      FXEnableExtensionChangeWarning = false;

      # Finder view style (list view)
      FXPreferredViewStyle = "Nlsv";
    };

    dock = {
      mouse-over-hilite-stack = true;
      tilesize = 36;
      mineffect = "scale";
      minimize-to-application = true;
      enable-spring-load-actions-on-all-items = true;
      show-process-indicators = true;
      static-only = true;
      launchanim = false;
      expose-animation-duration = 0.1;
      dashboard-in-overlay = true;
      mru-spaces = false;
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.0;
      showhidden = true;
      show-recents = false;
      showLaunchpadGestureEnabled = false;

      # Hot corners (all disabled)
      wvous-tl-corner = 1;
      wvous-tr-corner = 1;
      wvous-bl-corner = 1;
      wvous-br-corner = 1;
    };

    # DesktopServices (.DS_Store)
    CustomUserPreferences."com.apple.desktopservices" = {
      DSDontWriteNetworkStores = true;
      DSDontWriteUSBStores = true;
    };

    # Disk image verification
    CustomUserPreferences."com.apple.frameworks.diskimages" = {
      skip-verify = true;
      skip-verify-locked = true;
      skip-verify-remote = true;
    };

    # Show all filename extensions
    NSGlobalDomain.AppleShowAllExtensions = true;

    # Finder spring loading
    NSGlobalDomain."com.apple.springing.enabled" = true;
    NSGlobalDomain."com.apple.springing.delay" = 0.0;

    # AirDrop over Ethernet / all interfaces
    CustomUserPreferences."com.apple.NetworkBrowser" = {
      BrowseAllInterfaces = true;
    };
  };
}
