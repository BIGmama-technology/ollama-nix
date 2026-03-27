{pkgs, ...}: {
  # ── System ──────────────────────────────────────────────────────────
  system.stateVersion = "25.11";

  networking.hostName = "ollama";

  time.timeZone = "UTC";

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = ["root" "@wheel"];
  };

  # ── Packages ────────────────────────────────────────────────────────
  environment.systemPackages = with pkgs; [
    vim
    git
    htop
    curl
    jq
    ollama-cuda
  ];

  # ── Ollama (Docker container with GPU) ───────────────────────────
  # Managed by NixOS via oci-containers. The firewall restricts
  # port 11434 to the tailscale0 interface only.
  virtualisation.oci-containers.backend = "docker";
  virtualisation.oci-containers.containers.ollama = {
    image = "ollama/ollama";
    autoStart = true;
    cmd = ["ollama" "run" "nemotron-cascade-2"];
    ports = ["11434:11434"];
    environment = {
      OLLAMA_HOST = "0.0.0.0:11434";
    };
    volumes = [
      "ollama:/root/.ollama"
    ];
    extraOptions = ["--gpus=all"];
  };

  # ── Docker + NVIDIA ─────────────────────────────────────────────
  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };

  # ── Tailscale ───────────────────────────────────────────────────────
  services.tailscale = {
    enable = true;
  };

  # ── Firewall ────────────────────────────────────────────────────────
  # Allow SSH everywhere; restrict Ollama API to the Tailscale interface.
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [22];
    interfaces."tailscale0" = {
      allowedTCPPorts = [11434];
    };
  };

  # ── OpenSSH ─────────────────────────────────────────────────────────
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  # ── Zsh ─────────────────────────────────────────────────────────────
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  # ── User ────────────────────────────────────────────────────────────
  users.users.ollama = {
    isNormalUser = true;
    extraGroups = ["wheel" "video" "render" "docker"];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILXCv2fZAFJFiCYTqx/RXuFva2Tcm9fPqyMI6E8jFJvQ hachem@silver"
    ];
  };

  # Passwordless sudo for wheel group (convenient for remote management)
  security.sudo.wheelNeedsPassword = false;
}
