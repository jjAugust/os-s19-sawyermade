# -*-Makefile-*-

OBJDIRS		+= $(KERN_OBJDIR)/thread/PTCBIntro

KERN_SRCFILES	+= $(KERN_DIR)/thread/PTCBIntro/PTCBIntro.c

$(KERN_OBJDIR)/thread/PTCBIntro/PTCBIntro.o: $(KERN_DIR)/thread/PTCBIntro/PTCBIntro.c
	@echo + $(COMP_NAME)[KERN/thread/PTCBIntro] $<
	@mkdir -p $(@D)
ifdef SOL 
	$(V)echo "Copying solution PTCBIntro: " + $(notdir $@) 
	$(V)cp $(SAMPLE_KERN_DIR)/thread/PTCBIntro/$(notdir $@) $@
else
	$(V)$(CCOMP) $(CCOMP_KERN_CFLAGS) -c -o $@ $<
endif
	
$(KERN_OBJDIR)/thread/PTCBIntro/test.o: $(KERN_DIR)/thread/PTCBIntro/test.c
	$(V)$(CCOMP) $(CCOMP_KERN_CFLAGS) -c -o $@ $<

$(KERN_OBJDIR)/thread/PTCBIntro/%.o: $(KERN_DIR)/thread/PTCBIntro/%.S
	@echo + as[KERN/thread/PTCBIntro] $<
	@mkdir -p $(@D)
ifdef SOL 
	$(V)echo "Copying solution PTCBIntro: " + $(notdir $@) 
	$(V)cp $(SAMPLE_KERN_DIR)/thread/PTCBIntro/$(notdir $@) $@
else
	$(V)$(CC) $(KERN_CFLAGS) -c -o $@ $<
endif
