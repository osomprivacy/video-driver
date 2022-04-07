# SPDX-License-Identifier: GPL-2.0-only

KBUILD_OPTIONS+= VIDEO_ROOT=$(KERNEL_SRC)/$(M)
KBUILD_EXTRA_SYMBOLS := $(M)/../mmrm/Module.symvers

all:
	$(shell cp -r $(shell pwd)/include/uapi/vidc $(KERNEL_SRC)/include/uapi/)
	$(MAKE) -C $(KERNEL_SRC) M=$(M) modules $(KBUILD_OPTIONS) $(KBUILD_EXTRA_SYMBOLS)

modules_install:
	$(MAKE) INSTALL_MOD_STRIP=1 -C $(KERNEL_SRC) M=$(M) modules_install

%:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) $@ $(KBUILD_OPTIONS)

clean:
	rm -f *.o *.ko *.mod.c *.mod.o *~ .*.cmd Module.symvers
	rm -rf .tmp_versions
