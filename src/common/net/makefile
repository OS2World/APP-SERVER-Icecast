LIB = net.a

SRCS = resolver.c sock.c

CFLAGS = -g -O2 -std=c99 -Wall -Wextra -Wno-unused-parameter \
         -Wno-unused-function -I../ -I../../../ \
         -I../../os2 \
         -DHAVE_CONFIG_H=1

OBJS = $(SRCS:.c=.o)

all: $(LIB)

$(LIB): $(OBJS)
	$(AR) rc $(LIB) $(OBJS)

.c.obj: .AUTODEPEND
	$(CC) $(CFLAGS) -c $<

clean:
	@rm -f $(OBJS) $(LIB)
