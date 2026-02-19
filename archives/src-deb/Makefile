packages=\
	0.done \
	1.done \

packagesUninstall=$(basename $(packages))

all:$(packages)

0.done:$(shell find 0-first-stage)
	cd 0-first-stage
	make all
	cd ..
	touch 0.done

1.done:$(shell find 1-second-stage)
	cd 1-second-stage
	make all
	cd ..
	touch 1.done

clean:
	rm 0.done
	cd 0-first-stage
	make clean
	cd ..
	rm 1.done
	cd 1-second-stage
	make clean
	cd ..

install:$(packages)
	cd 0-first-stage
	make install
	cd ..
	sudo apt-get update
	cd 1-second-stage
	make install
	cd ..

remove:$(packages)
	cd 1-second-stage
	make remove
	cd ..
	cd 0-first-stage
	make remove
	cd ..
