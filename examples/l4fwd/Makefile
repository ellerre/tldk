# Copyright (c) 2016 Intel Corporation.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at:
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifeq ($(TLDK_ROOT),)
$(error "Please define TLDK_ROOT environment variable")
endif

APP = l4fwd
SRCS-y += parse.c pkt.c main.c

PKG_CONFIG := pkg-config
DPDK_CFLAGS := $(shell $(PKG_CONFIG) --cflags libdpdk)
DPDK_LIBS := $(shell $(PKG_CONFIG) --libs libdpdk)

CFLAGS += $(WERROR_FLAGS) $(DPDK_CFLAGS)
CFLAGS += -I$(RTE_OUTPUT)/include

LDLIBS += -L$(RTE_OUTPUT)/lib
LDLIBS += $(shell $(PKG_CONFIG) --libs libtle_l4p)
LDLIBS += $(shell $(PKG_CONFIG) --libs libtle_memtank)
LDLIBS += $(shell $(PKG_CONFIG) --libs libtle_timer)

EXTRA_CFLAGS += -O3
CFLAGS_parse.o += -D_GNU_SOURCE
CFLAGS_main.o += -D_GNU_SOURCE

include $(TLDK_ROOT)/mk/tle.app.mk


