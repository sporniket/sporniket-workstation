# Install one or several eclipse IDEs

## Download

* Go to the [official page packages page](https://www.eclipse.org/downloads/packages/), and download what you want there.
* Check the sha512 sum, just to be sure

## Install

* Unarchive into `/opt/share/eclipse/<package-suffix>/<version>`. E.g. : `eclipse-jee-2026-03-R-linux-gtk-x86_64.tar.gz` should be unarchived into a folder named `/opt/share/eclipse/jee/2026-03`.
* Optional : symlink `/opt/share/eclipse/<package-suffix>/current/eclipse` to `/opt/share/eclipse/<package-suffix>/<version>/eclipse`.
* Create a shortcut for easier launch : e.g. add an alias for `/opt/share/eclipse/<package-suffix>/current/eclipse`, e.g. `jeclipse` for eclipse-jee, `ceclipse` for eclipse-cpp.

