# -*-Makefile-*-

OBJDIRS		+= $(KERN_OBJDIR)/thread/PThread

KERN_SRCFILES	+= $(KERN_DIR)/thread/PThread/PThread.c
ifdef TEST
KERN_SRCFILES	+= $(KERN_DIR)/thread/PThread/test.c
endif

$(KERN_OBJDIR)/thread/PThread/PThread.o: $(KERN_DIR)/thread/PThread/PThread.c
	@echo + $(COMP_NAME)[KERN/thread/PThread] $<
	@mkdir -p $(@D)
ifdef SOL 
	$(V)echo "Copying solution PThread: " + $(notdir $@) 
	$(V)cp $(SAMPLE_KERN_DIR)/thread/PThread/$(notdir $@) $@
else
	$(V)$(CCOMP) $(CCOMP_KERN_CFLAGS) -c -o $@ $<
endif
	
$(KERN_OBJDIR)/thread/PThread/test.o: $(KERN_DIR)/thread/PThread/test.c
	$(V)$(CCOMP) $(CCOMP_KERN_CFLAGS) -c -o $@ $<

$(KERN_OBJDIR)/thread/PThread/%.o: $(KERN_DIR)/thread/PThread/%.S
	@echo + as[KERN/thread/PThread] $<
	@mkdir -p $(@D)
ifdef SOL 
	$(V)echo "Copying solution PThread: " + $(notdir $@) 
	$(V)cp $(SAMPLE_KERN_DIR)/thread/PThread/$(notdir $@) $@
else
	$(V)$(CC) $(KERN_CFLAGS) -c -o $@ $<
endif
	
