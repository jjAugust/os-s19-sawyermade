# -*-Makefile-*-

OBJDIRS		+= $(KERN_OBJDIR)/thread/PTQueueInit

KERN_SRCFILES	+= $(KERN_DIR)/thread/PTQueueInit/PTQueueInit.c
ifdef TEST
KERN_SRCFILES	+= $(KERN_DIR)/thread/PTQueueInit/test.c
endif

$(KERN_OBJDIR)/thread/PTQueueInit/PTQueueInit.o: $(KERN_DIR)/thread/PTQueueInit/PTQueueInit.c
	@echo + $(COMP_NAME)[KERN/thread/PTQueueInit] $<
	@mkdir -p $(@D)
ifdef SOL 
	$(V)echo "Copying solution PTQueueInit: " + $(notdir $@) 
	$(V)cp $(SAMPLE_KERN_DIR)/thread/PTQueueInit/$(notdir $@) $@
else
	$(V)$(CCOMP) $(CCOMP_KERN_CFLAGS) -c -o $@ $<
endif
	
$(KERN_OBJDIR)/thread/PTQueueInit/test.o: $(KERN_DIR)/thread/PTQueueInit/test.c
	$(V)$(CCOMP) $(CCOMP_KERN_CFLAGS) -c -o $@ $<

$(KERN_OBJDIR)/thread/PTQueueInit/%.o: $(KERN_DIR)/thread/PTQueueInit/%.S
	@echo + as[KERN/thread/PTQueueInit] $<
	@mkdir -p $(@D)
ifdef SOL 
	$(V)echo "Copying solution PTQueueInit: " + $(notdir $@) 
	$(V)cp $(SAMPLE_KERN_DIR)/thread/PTQueueInit/$(notdir $@) $@
else
	$(V)$(CC) $(KERN_CFLAGS) -c -o $@ $<
endif
	
