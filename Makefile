HOST=mayb
FLAKE=.\#$(HOST)

build-mac:
	nix build .#darwinConfigurations.$(HOST).system	

switch-mac:
	sudo ./result/sw/bin/darwin-rebuild switch --flake $(FLAKE)

fmt:
	nix run nixpkgs#nixfmt-tree -- .

clean:
	rm -f result
