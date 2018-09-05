cc=sudo dpkg-deb
cflags=--build

packages=\
	bash-rc.deb \
	eclipse.deb \
	git-extras.deb \
	krita-from-download.deb \
	blender3d.deb \
	tmpfs-varlog-apache2.deb \
	tmpfs-varlog-mysql.deb
packagesUninstall=$(basename $(packages))

all:$(packages)

bash-rc.deb:$(shell find bash-rc)
	$(cc) $(cflags) bash-rc

eclipse.deb:$(shell find eclipse)
	$(cc) $(cflags) eclipse

git-extras.deb:$(shell find git-extras)
	$(cc) $(cflags) git-extras

krita-from-download.deb:$(shell find krita-from-download)
	$(cc) $(cflags) krita-from-download

blender3d.deb:$(shell find blender3d)
	$(cc) $(cflags) git-extras

tmpfs-varlog-apache2.deb:$(shell find tmpfs-varlog-apache2)
	$(cc) $(cflags) tmpfs-varlog-apache2

tmpfs-varlog-mysql.deb:$(shell find tmpfs-varlog-mysql)
	$(cc) $(cflags) tmpfs-varlog-mysql

clean:
	sudo rm *.deb

install:$(packages)
	sudo dpkg -i $(packages)

remove:$(packages)
	sudo dpkg -r $(packagesUninstall)
