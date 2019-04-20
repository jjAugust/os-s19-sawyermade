# -*-Makefile-*-

OBJDIRS		+= $(KERN_OBJDIR)/proc/PProc

KERN_SRCFILES	+= $(KERN_DIR)/proc/PProc/PProc.c

$(KERN_OBJDIR)/proc/PProc/PProc.o: $(KERN_DIR)/proc/PProc/PProc.c
	@echo + $(COMP_NAME)[KERN/proc/PProc] $<
	@mkdir -p $(@D)
# ifdef SOL 
# 	$(V)echo "Copying solution PProc: " + $(notdir $@) 
# 	$(V)cp $(SAMPLE_KERN_DIR)/proc/PProc/$(notdir $@) $@
# else
# 	$(V)$(CCOMP) $(CCOMP_KERN_CFLAGS) -c -o $@ $<
# endif
	$(V)$(CCOMP) $(CCOMP_KERN_CFLAGS) -c -o $@ $<

$(KERN_OBJDIR)/proc/PProc/%.o: $(KERN_DIR)/proc/PProc/%.S
	@echo + as[KERN/proc/PProc] $<
	@mkdir -p $(@D)
ifdef SOL 
	$(V)echo "Copying solution PProc: " + $(notdir $@) 
	$(V)cp $(SAMPLE_KERN_DIR)/proc/PProc/$(notdir $@) $@
else
	$(V)$(CC) $(KERN_CFLAGS) -c -o $@ $<
endif
