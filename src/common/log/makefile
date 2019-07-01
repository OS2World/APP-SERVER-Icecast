LIB = log.a

SRCS = log.c

CFLAGS = -g -O2 -std=c99 -Wall -Wextra -Wno-unused-parameter \
         -I../ -I../../../ -DHAVE_CONFIG_H=1

OBJS = $(SRCS:.c=.o)

all: $(LIB)

$(LIB): $(OBJS)
	$(AR) rc $(LIB) $(OBJS)

.c.obj: .AUTODEPEND
	$(CC) $(CFLAGS) -c $<

clean:
	@rm -f $(OBJS) $(LIB)
