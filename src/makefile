#
# Icecast for OS/2 makefile.
# Andrey Vasilkin, 2019.
#

NAME = icecast
DESCRIPTION = Icecast2
VERSION = 2.4.99
AUTOR = Andrey Vasilkin


EXEFILE = $(NAME).exe
DEFFILE = $(NAME).def
RCFILE  = $(NAME).rc
RESFILE = $(NAME).res

SRCS = acl.c admin.c auth.c auth_anonymous.c auth_enforce_auth.c \
	auth_htpasswd.c auth_static.c auth_url.c buffer.c cfgfile.c \
	client.c connection.c curl.c errors.c event.c event_exec.c \
	event_log.c event_url.c fastevent.c format.c format_ebml.c format_flac.c \
	format_kate.c format_midi.c format_mp3.c format_ogg.c format_opus.c \
	format_skeleton.c format_vorbis.c \
	fserve.c global.c listensocket.c logging.c main.c matchfile.c \
	md5.c module.c playlist.c refbuf.c refobject.c reportxml.c \
	resourcematch.c sighandler.c slave.c source.c stats.c tls.c util.c \
	xslt.c yp.c \
        ./common/thread/thread.c


# configtest.c format_speex.c format_theora.c

CFLAGS = -g -O2 -std=c99 -Wall -Wextra -Wno-unused-parameter \
         -I/@unixroot/usr/include/libxml2 \
         -I../ -I./common -DHAVE_CONFIG_H=1 -D_DIGI=1

OBJS = $(SRCS:.c=.o)

export CC := @$(CC)
export AR := @$(AR)
export RC = @rc

LIBS = -llibssl -lcurl_dll -lpthread -lvorbis_dll -logg_dll -llibxml2_dll \
       -lxslt_dll \
       -L./common/avl -lavl \
       -L./common/httpp -lhttpp \
       -L./common/log -llog \
       -L./common/net -lnet \
       -L./common/timing -ltiming
#       -L./common/thread -lthread

LDFLAGS = $(DEFFILE) -Zmap -Zhigh-mem

all: $(EXEFILE)

$(EXEFILE): common/avl/avl.a common/httpp/httpp.a common/log/log.a \
	common/net/net.a common/timing/timing.a \
	$(OBJS) $(DEFFILE) $(RESFILE)
#
	$(CC) $(LDFLAGS) $(OBJS) -o $@ $(LIBS)
	@mapxqs.exe $(NAME).map
	@lxlite /CS "$@" >nul
	$(RC) -n $(RESFILE) $@ >nul

common/avl/avl.a:
	@cd common\\avl && make --no-print-directory

common/httpp/httpp.a:
	@cd common\\httpp && make --no-print-directory

common/log/log.a:
	@cd common\\log && make --no-print-directory

common/net/net.a:
	@cd common\\net && make --no-print-directory

common/timing/timing.a:
	@cd common\\timing && make --no-print-directory

$(DEFFILE):
	@cmd /c %unixroot%\\usr\\libexec\\bin\\date +"DESCRIPTION '@#$(AUTOR):$(VERSION)#@##1## %F               %HOSTNAME%::::::@@$(DESCRIPTION)'" >>$@

$(RESFILE): $(RCFILE)
	$(RC) -r -n $(RCFILE) >nul

.c.obj: .AUTODEPEND
	$(CC) $(CFLAGS) -c $<

clean:
	@rm -f $(OBJS) $(EXEFILE) $(DEFFILE) $(RESFILE) $(NAME).map $(NAME).xqs
	@cd common\\avl && make --no-print-directory clean
	@cd common\\httpp && make --no-print-directory clean
	@cd common\\log && make --no-print-directory clean
	@cd common\\net && make --no-print-directory clean
	@cd common\\timing && make --no-print-directory clean
