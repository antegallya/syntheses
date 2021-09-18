SUBS := $(filter-out common/., $(wildcard */.))
SUBSCLEAN := $(addsuffix -clean, $(SUBS))

.PHONY: all clean $(SUBS) $(SUBSCLEAN)

all: $(SUBS)

hop:
	@echo $(SUBS)

$(SUBS):
	$(MAKE) -C $@

%-clean:
	$(MAKE) -C $* clean

clean: $(SUBSCLEAN)
