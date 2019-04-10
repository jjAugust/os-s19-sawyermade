# -*-Makefile-*-

OBJDIRS		+= $(KERN_OBJDIR)/thread/PTCBInit

KERN_SRCFILES	+= $(KERN_DIR)/thread/PTCBInit/PTCBInit.c
ifdef TEST
KERN_SRCFILES	+= $(KERN_DIR)/thread/PTCBInit/test.c
endif

$(KERN_OBJDIR)/thread/PTCBInit/PTCBInit.o: $(KERN_DIR)/thread/PTCBInit/PTCBInit.c
	@echo + $(COMP_NAME)[KERN/thread/PTCBInit] $<
	@mkdir -p $(@D)
ifdef SOL 
	$(V)echo "Copying solution PTCBInit: " + $(notdir $@) 
	$(V)cp $(SAMPLE_KERN_DIR)/thread/PTCBInit/$(notdir $@) $@
else
	$(V)$(CCOMP) $(CCOMP_KERN_CFLAGS) -c -o $@ $<
endif
	
$(KERN_OBJDIR)/thread/PTCBInit/test.o: $(KERN_DIR)/thread/PTCBInit/test.c
	$(V)$(CCOMP) $(CCOMP_KERN_CFLAGS) -c -o $@ $<

$(KERN_OBJDIR)/thread/PTCBInit/%.o: $(KERN_DIR)/thread/PTCBInit/%.S
	@echo + as[KERN/thread/PTCBInit] $<
	@mkdir -p $(@D)
ifdef SOL 
	$(V)echo "Copying solution PTCBInit: " + $(notdir $@) 
	$(V)cp $(SAMPLE_KERN_DIR)/thread/PTCBInit/$(notdir $@) $@
else
	$(V)$(CC) $(KERN_CFLAGS) -c -o $@ $<
endif
	