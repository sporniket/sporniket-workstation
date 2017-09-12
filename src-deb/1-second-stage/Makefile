cc=sudo dpkg-deb
cflags=--build

packages=\
	git-extras.deb \
	tmpfs-varlog-apache2.deb \
	tmpfs-varlog-mysql.deb
packagesUninstall=$(basename $(packages))

all:$(packages)

git-extras.deb:$(shell find git-extras)
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