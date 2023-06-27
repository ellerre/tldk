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
$(error "Please define TLDK_SDK environment variable")
endif

DIRS-y += l4fwd

PKG_CONFIG := pkg-config
DPDK_CFLAGS := $(shell $(PKG_CONFIG) --cflags libdpdk)
DPDK_LIBS := $(shell $(PKG_CONFIG) --libs libdpdk)

export TLDK_ROOT DPDK_CFLAGS DPDK_LIBS

.PHONY: all clean $(DIRS-y)

all: $(DIRS-y)

clean: $(DIRS-y)

$(DIRS-y):
	$(Q)$(MAKE) -C $@ \
		CFLAGS+=$(DPDK_CFLAGS) \
		LDLIBS+=$(DPDK_LIBS) -lpthread
