cc=sudo dpkg-deb
cflags=--build

packages=add-apt-third-parties-repositories.deb git-extras
packagesUninstall=$(basename $(packages))

all:$(packages)

add-apt-third-parties-repositories.deb:$(shell find add-apt-third-parties-repositories)
	$(cc) $(cflags) add-apt-third-parties-repositories.deb

git-extras.deb:$(shell find git-extras)
	$(cc) $(cflags) git-extras.deb

clean:
	sudo rm *.deb

install:$(packages)
	sudo dpkg -i $(packages)

remove:$(packages)
	sudo dpkg -r $(packagesUninstall)
