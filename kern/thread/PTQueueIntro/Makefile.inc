# -*-Makefile-*-

OBJDIRS		+= $(KERN_OBJDIR)/thread/PTQueueIntro

KERN_SRCFILES	+= $(KERN_DIR)/thread/PTQueueIntro/PTQueueIntro.c

$(KERN_OBJDIR)/thread/PTQueueIntro/PTQueueIntro.o: $(KERN_DIR)/thread/PTQueueIntro/PTQueueIntro.c
	@echo + $(COMP_NAME)[KERN/thread/PTQueueIntro] $<
	@mkdir -p $(@D)
ifdef SOL 
	$(V)echo "Copying solution PTQueueIntro: " + $(notdir $@) 
	$(V)cp $(SAMPLE_KERN_DIR)/thread/PTQueueIntro/$(notdir $@) $@
else
	$(V)$(CCOMP) $(CCOMP_KERN_CFLAGS) -c -o $@ $<
endif
	
$(KERN_OBJDIR)/thread/PTQueueIntro/test.o: $(KERN_DIR)/thread/PTQueueIntro/test.c
	$(V)$(CCOMP) $(CCOMP_KERN_CFLAGS) -c -o $@ $<

$(KERN_OBJDIR)/thread/PTQueueIntro/%.o: $(KERN_DIR)/thread/PTQueueIntro/%.S
	@echo + as[KERN/thread/PTQueueIntro] $<
	@mkdir -p $(@D)
ifdef SOL 
	$(V)echo "Copying solution PTQueueIntro: " + $(notdir $@) 
	$(V)cp $(SAMPLE_KERN_DIR)/thread/PTQueueIntro/$(notdir $@) $@
else
	$(V)$(CC) $(KERN_CFLAGS) -c -o $@ $<
endif
	
