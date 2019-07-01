PACKAGE = icecast
pkgdatadir = .
localstatedir = .
srcdir = .

edit = sed -e 's,@pkgdatadir\@,$(pkgdatadir),g' \
	-e 's,@localstatedir\@,$(localstatedir),g' \
	-e 's,@PACKAGE\@,$(PACKAGE),g'

all: icecast.xml.dist icecast_minimal.xml.dist icecast_shoutcast_compat.xml.dist

icecast.xml.dist: $(srcdir)/icecast.xml.in
	$(edit) $(srcdir)/icecast.xml.in > icecast.xml.dist

icecast_minimal.xml.dist: $(srcdir)/icecast_minimal.xml.in
	$(edit) $(srcdir)/icecast_minimal.xml.in > icecast_minimal.xml.dist

icecast_shoutcast_compat.xml.dist: $(srcdir)/icecast_shoutcast_compat.xml.in
	$(edit) $(srcdir)/icecast_shoutcast_compat.xml.in > icecast_shoutcast_compat.xml.dist
