# Makefile for disk9scver.r

ifeq ($(notdir $(CURDIR)),src)
  $(error do not execute make in src directory.)
endif

SRCDIR_TXT = ../srcdir.txt

AS = has060
ASFLAGS = -w2 -c3
LD = hlkx
LDFLAGS =

TARGET = disk9scver.r

SRCS = disk9scver.s
XKPCHK = _X_KPCHK.O
OBJS = $(SRCS:.s=.o) $(XKPCHK)


.PHONY: all clean
.PRECIOUS: %.o

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LD) $(LDFLAGS) -r -o$@ $^

%.x: %.s  # cancel default rule
$(TARGET:.r=.x): $(OBJS)
	$(LD) $(LDFLAGS) -o$@ $^

%.o: %.s
	$(AS) $(ASFLAGS) -o$@ $^

$(XKPCHK): SRC_DIR = $(if $(wildcard $(SRCDIR_TXT)),$(shell cat $(SRCDIR_TXT)),../src)
$(XKPCHK):
	lx -e $(SRC_DIR)/../archives/9SCSET.LZH 9SCCALL2/$(XKPCHK)


clean:
	rm -f $(TARGET) $(OBJS)
