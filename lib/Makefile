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

DPDK_INCLUDE := $(shell pkg-config --cflags libdpdk)
DPDK_LIBS := $(shell pkg-config --libs libdpdk)

TLDK_ROOT := $(CURDIR)
export TLDK_ROOT

DIRS := libtle_misc libtle_dring libtle_timer libtle_memtank libtle_l4p

.PHONY: all clean $(DIRS)

all: $(DIRS)

$(DIRS):
	@echo "== $@"
	$(Q)$(MAKE) -C $@ \
		CFLAGS="$(CFLAGS) $(DPDK_INCLUDE)" \
		LDLIBS="$(LDLIBS) $(DPDK_LIBS) -lpthread"

libtle_dring: libtle_misc
libtle_timer: libtle_misc libtle_dring
libtle_memtank: libtle_misc libtle_dring libtle_timer
libtle_l4p: libtle_misc libtle_dring libtle_timer libtle_memtank

clean:
	@for dir in $(DIRS); do \
		$(MAKE) -C $$dir clean; \
	done
