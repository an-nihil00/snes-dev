CC=wla-65816

ODIR=obj
SDIR=src

LF = link.proj

_OBJ = main.obj
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.obj: $(SDIR)/%.asm
	$(CC) -o $< $@
	echo $(ODIR)/$@ >> $(LF)

$(LF):
	rm -f $(LF)
	echo "[objects]" > $(LF)

snes-dev.smc: $(LF) $(OBJ)
	$(CC) -vr $(LF) $@ 
