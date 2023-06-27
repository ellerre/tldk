TLDK_ROOT := $(CURDIR)
export TLDK_ROOT

RTE_TARGET ?= x86_64-native-linuxapp-gcc

DIRS-y += lib
DIRS-y += examples
# DIRS-y += test

MAKEFLAGS += --no-print-directory

# output directory
O ?= $(TLDK_ROOT)/${RTE_TARGET}
BASE_OUTPUT ?= $(abspath $(O))

DPDK_INCLUDE := $(shell pkg-config --cflags libdpdk)
DPDK_LIBS := $(shell pkg-config --libs libdpdk)

.PHONY: all
all: $(DIRS-y)

.PHONY: clean
clean: $(DIRS-y)

.PHONY: $(DIRS-y)
$(DIRS-y):
	@echo "== $@"
	$(Q)$(MAKE) -C $(@) \
		M=$(CURDIR)/$(@)/Makefile \
		O=$(BASE_OUTPUT) \
		BASE_OUTPUT=$(BASE_OUTPUT) \
		CUR_SUBDIR=$(CUR_SUBDIR)/$(@) \
		S=$(CURDIR)/$(@) \
		RTE_TARGET=$(RTE_TARGET) \
		$(filter-out $(DIRS-y),$(MAKECMDGOALS))

.PHONY: check_dpdk
check_dpdk:
	@pkg-config --print-errors --exists libdpdk || (echo "DPDK library not found. Please install DPDK." && exit 1)

CFLAGS += $(DPDK_INCLUDE)
LDLIBS += $(DPDK_LIBS) -lpthread

