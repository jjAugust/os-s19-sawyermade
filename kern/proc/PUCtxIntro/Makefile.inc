# -*-Makefile-*-

OBJDIRS		+= $(KERN_OBJDIR)/proc/PUCtxIntro

KERN_SRCFILES	+= $(KERN_DIR)/proc/PUCtxIntro/PUCtxIntro.c

$(KERN_OBJDIR)/proc/PUCtxIntro/PUCtxIntro.o: $(KERN_DIR)/proc/PUCtxIntro/PUCtxIntro.c
	@echo + $(COMP_NAME)[KERN/proc/PUCtxIntro] $<
	@mkdir -p $(@D)
ifdef SOL 
	$(V)echo "Copying solution PUCtxIntro: " + $(notdir $@) 
	$(V)cp $(SAMPLE_KERN_DIR)/proc/PUCtxIntro/$(notdir $@) $@
else
	$(V)$(CCOMP) $(CCOMP_KERN_CFLAGS) -c -o $@ $<
endif

$(KERN_OBJDIR)/proc/PUCtxIntro/%.o: $(KERN_DIR)/proc/PUCtxIntro/%.S
	@echo + as[KERN/proc/PUCtxIntro] $<
	@mkdir -p $(@D)
ifdef SOL 
	$(V)echo "Copying solution PUCtxIntro: " + $(notdir $@) 
	$(V)cp $(SAMPLE_KERN_DIR)/proc/PUCtxIntro/$(notdir $@) $@
else
	$(V)$(CC) $(KERN_CFLAGS) -c -o $@ $<
endif
