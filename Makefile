SUBS := $(patsubst %/.,%, $(filter-out common/., $(wildcard */.)))
SUBSCLEAN := $(addsuffix -clean, $(SUBS))

.PHONY: all clean $(SUBS) $(SUBSCLEAN)

all: $(SUBS)

$(SUBS):
	$(MAKE) -C $@
	@echo $@

$(SUBSCLEAN):%-clean:
	@echo $*
	$(MAKE) -C $* clean

clean: $(SUBSCLEAN)
	@echo $(SUBSCLEAN)

