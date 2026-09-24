.PHONY: clean fmt dry-run check validate switch build switch-build safe-switch update
HOST=mayb
FLAKE=.\#$(HOST)

clean:
	rm -f result

fmt:
	nix run nixpkgs#nixfmt-tree -- .

dry-run:
	nix build .#darwinConfigurations.$(HOST).system --dry-run

check:
	nix flake check --no-build

validate: check dry-run

switch:
	sudo darwin-rebuild switch --flake $(FLAKE)

build:
	nix build .#darwinConfigurations.$(HOST).system	

switch-build:
	sudo ./result/sw/bin/darwin-rebuild switch --flake $(FLAKE)

safe-switch: build switch-build


update:
	nix flake update

