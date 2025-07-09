Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F822557A
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077140; cv=none; b=at0yaIiYLHeaGHwNVQIbXUcNvx4YEOoZ6h5P1NaSN439svBPxyjscLDcZrnE3PRbF14CHUcG0nWR3bMTtZSDDbpXr8r8kYrVXA79mLMKLjMjtTVyC3T+5CxAyCP9ezK7MpmxS5c8ZuO06RJ4MJsRDMGAWhg3HjX/2SJ/iYM6dOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077140; c=relaxed/simple;
	bh=g2ohH2J9N4tU6d5x5gbPkHE1LWoUf0Q77rTcSuSPi+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XU2w5FNDgwhOjvJb4+bkMLzWLR9+cEk4FArR/9/QlsEqKmrB8S9Tgr444uTYHApiaAPBXsaIhcRjSHNmdks8CXH8ApkGgvjHuLGVCYvF0w3yZ3OdwKi0benywD378GIUPi28h3b+c3rW5C3Xx0uHSgRfEsoCiHYs8GWYAAGcUNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a//1wHOy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WsPIna4K; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a//1wHOy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WsPIna4K; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a//1wHOy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WsPIna4K";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a//1wHOy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WsPIna4K"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AABCF1F451;
	Wed,  9 Jul 2025 16:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=krKfy5DfEPE2ms8AYYyJoJMHtvETfkOGeSvQtt0AExg=;
	b=a//1wHOyPYOOIiBF67hxeDL6b0T6vLfEKTB6z0uQ/5+Nk9MU5xvK1XljgU9yAD1YK4PvK7
	Y2wRtxcrfIwoTXCIM4si0B802prY1X99WUnBCZnc+fEoQUa4EGMQT/EJWMTDd0qi7N4Jy1
	2xFHXGfTAYeYxbllG5qyaVFxzcBjuTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077087;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=krKfy5DfEPE2ms8AYYyJoJMHtvETfkOGeSvQtt0AExg=;
	b=WsPIna4K4fRaCJ/BlYydaCJWfSGw0Ss9qeOjCciVrR+/Pf25ufBGvidJHZ1KXjJXWLJijo
	q0xhUSs4cGnH6PCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="a//1wHOy";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WsPIna4K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=krKfy5DfEPE2ms8AYYyJoJMHtvETfkOGeSvQtt0AExg=;
	b=a//1wHOyPYOOIiBF67hxeDL6b0T6vLfEKTB6z0uQ/5+Nk9MU5xvK1XljgU9yAD1YK4PvK7
	Y2wRtxcrfIwoTXCIM4si0B802prY1X99WUnBCZnc+fEoQUa4EGMQT/EJWMTDd0qi7N4Jy1
	2xFHXGfTAYeYxbllG5qyaVFxzcBjuTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077087;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=krKfy5DfEPE2ms8AYYyJoJMHtvETfkOGeSvQtt0AExg=;
	b=WsPIna4K4fRaCJ/BlYydaCJWfSGw0Ss9qeOjCciVrR+/Pf25ufBGvidJHZ1KXjJXWLJijo
	q0xhUSs4cGnH6PCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62D17136DC;
	Wed,  9 Jul 2025 16:04:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4CnfFh+TbmhDEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Jul 2025 16:04:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Kailang <kailang@realtek.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	patches@opensource.cirrus.com,
	Baojun Xu <baojun.xu@ti.com>,
	bo liu <bo.liu@senarytech.com>
Subject: [PATCH 05/27] ALSA: hda: Move controller drivers into sound/hda/controllers directory
Date: Wed,  9 Jul 2025 18:04:08 +0200
Message-ID: <20250709160434.1859-6-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709160434.1859-1-tiwai@suse.de>
References: <20250709160434.1859-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL53w3f6h5bdz1qypc3i64rty7)];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: AABCF1F451
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Now HD-audio controller drivers are moved into sound/hda/controllers
directory as a part of HD-audio code reorganization.  Most of drivers
are independent from PCI bus, hence it makes more sense to put under
sound/hda.

The hda_ prefix is dropped from most of files at moving, as it's
more or less superfluous.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/Kconfig                             |  1 +
 sound/hda/Makefile                            |  4 ++
 sound/hda/controllers/Kconfig                 | 42 +++++++++++++++++++
 sound/hda/controllers/Makefile                | 13 ++++++
 .../hda/hda_acpi.c => hda/controllers/acpi.c} |  0
 .../hda_intel.c => hda/controllers/intel.c}   |  5 +--
 .../hda_intel.h => hda/controllers/intel.h}   |  0
 .../controllers/intel_trace.h}                |  2 +-
 .../hda_tegra.c => hda/controllers/tegra.c}   |  0
 sound/pci/hda/Kconfig                         | 42 -------------------
 sound/pci/hda/Makefile                        | 14 -------
 11 files changed, 63 insertions(+), 60 deletions(-)
 create mode 100644 sound/hda/controllers/Kconfig
 create mode 100644 sound/hda/controllers/Makefile
 rename sound/{pci/hda/hda_acpi.c => hda/controllers/acpi.c} (100%)
 rename sound/{pci/hda/hda_intel.c => hda/controllers/intel.c} (99%)
 rename sound/{pci/hda/hda_intel.h => hda/controllers/intel.h} (100%)
 rename sound/{pci/hda/hda_intel_trace.h => hda/controllers/intel_trace.h} (95%)
 rename sound/{pci/hda/hda_tegra.c => hda/controllers/tegra.c} (100%)

diff --git a/sound/hda/Kconfig b/sound/hda/Kconfig
index 2928cb570ec6..d360c884bd6d 100644
--- a/sound/hda/Kconfig
+++ b/sound/hda/Kconfig
@@ -2,6 +2,7 @@
 menu "HD-Audio"
 
 source "sound/hda/common/Kconfig"
+source "sound/hda/controllers/Kconfig"
 source "sound/hda/core/Kconfig"
 
 endmenu
diff --git a/sound/hda/Makefile b/sound/hda/Makefile
index e7596bf736a4..fc76086a1f5e 100644
--- a/sound/hda/Makefile
+++ b/sound/hda/Makefile
@@ -1,3 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y += core/
 obj-$(CONFIG_SND_HDA) += common/
+# this must be the last entry after codec drivers;
+# otherwise the codec patches won't be hooked before the PCI probe
+# when built in kernel
+obj-$(CONFIG_SND_HDA) += controllers/
diff --git a/sound/hda/controllers/Kconfig b/sound/hda/controllers/Kconfig
new file mode 100644
index 000000000000..34721f50b055
--- /dev/null
+++ b/sound/hda/controllers/Kconfig
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config SND_HDA_INTEL
+	tristate "HD Audio PCI"
+	depends on SND_PCI
+	select SND_HDA
+	select SND_INTEL_DSP_CONFIG
+	help
+	  Say Y here to include support for Intel "High Definition
+	  Audio" (Azalia) and its compatible devices.
+
+	  This option enables the HD-audio controller.  Don't forget
+	  to choose the appropriate HD-audio codec options.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called snd-hda-intel.
+
+config SND_HDA_TEGRA
+	tristate "NVIDIA Tegra HD Audio"
+	depends on ARCH_TEGRA
+	select SND_HDA
+	select SND_HDA_ALIGNED_MMIO
+	help
+	  Say Y here to support the HDA controller present in NVIDIA
+	  Tegra SoCs
+
+	  This options enables support for the HD Audio controller
+	  present in some NVIDIA Tegra SoCs, used to communicate audio
+	  to the HDMI output.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called snd-hda-tegra.
+
+config SND_HDA_ACPI
+	tristate "HD Audio ACPI"
+	depends on ACPI
+	select SND_HDA
+	help
+	  Say Y here to include support for Azalia-compatible HDA controllers
+	  which are advertised via ACPI objects.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called snd-hda-acpi.
diff --git a/sound/hda/controllers/Makefile b/sound/hda/controllers/Makefile
new file mode 100644
index 000000000000..a4bcd055e9ae
--- /dev/null
+++ b/sound/hda/controllers/Makefile
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+snd-hda-intel-y := intel.o
+snd-hda-tegra-y := tegra.o
+snd-hda-acpi-y := acpi.o
+
+subdir-ccflags-y += -I$(src)/../common
+
+# for trace-points
+CFLAGS_intel.o := -I$(src)
+
+obj-$(CONFIG_SND_HDA_INTEL) += snd-hda-intel.o
+obj-$(CONFIG_SND_HDA_TEGRA) += snd-hda-tegra.o
+obj-$(CONFIG_SND_HDA_ACPI) += snd-hda-acpi.o
diff --git a/sound/pci/hda/hda_acpi.c b/sound/hda/controllers/acpi.c
similarity index 100%
rename from sound/pci/hda/hda_acpi.c
rename to sound/hda/controllers/acpi.c
diff --git a/sound/pci/hda/hda_intel.c b/sound/hda/controllers/intel.c
similarity index 99%
rename from sound/pci/hda/hda_intel.c
rename to sound/hda/controllers/intel.c
index 439cf1bda6e6..ebfc999156f4 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/hda/controllers/intel.c
@@ -54,11 +54,10 @@
 #include <linux/apple-gmux.h>
 #include <linux/firmware.h>
 #include <sound/hda_codec.h>
-#include "hda_controller.h"
-#include "hda_intel.h"
+#include "intel.h"
 
 #define CREATE_TRACE_POINTS
-#include "hda_intel_trace.h"
+#include "intel_trace.h"
 
 /* position fix mode */
 enum {
diff --git a/sound/pci/hda/hda_intel.h b/sound/hda/controllers/intel.h
similarity index 100%
rename from sound/pci/hda/hda_intel.h
rename to sound/hda/controllers/intel.h
diff --git a/sound/pci/hda/hda_intel_trace.h b/sound/hda/controllers/intel_trace.h
similarity index 95%
rename from sound/pci/hda/hda_intel_trace.h
rename to sound/hda/controllers/intel_trace.h
index 2775fa81a500..fb10ab9e7e55 100644
--- a/sound/pci/hda/hda_intel_trace.h
+++ b/sound/hda/controllers/intel_trace.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #undef TRACE_SYSTEM
 #define TRACE_SYSTEM hda_intel
-#define TRACE_INCLUDE_FILE hda_intel_trace
+#define TRACE_INCLUDE_FILE intel_trace
 
 #if !defined(_TRACE_HDA_INTEL_H) || defined(TRACE_HEADER_MULTI_READ)
 #define _TRACE_HDA_INTEL_H
diff --git a/sound/pci/hda/hda_tegra.c b/sound/hda/controllers/tegra.c
similarity index 100%
rename from sound/pci/hda/hda_tegra.c
rename to sound/hda/controllers/tegra.c
diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 1dfd56493d39..a5d345514cf3 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -4,48 +4,6 @@ menu "HD-Audio"
 config SND_HDA_GENERIC_LEDS
        bool
 
-config SND_HDA_INTEL
-	tristate "HD Audio PCI"
-	depends on SND_PCI
-	select SND_HDA
-	select SND_INTEL_DSP_CONFIG
-	help
-	  Say Y here to include support for Intel "High Definition
-	  Audio" (Azalia) and its compatible devices.
-
-	  This option enables the HD-audio controller.  Don't forget
-	  to choose the appropriate codec options below.
-
-	  To compile this driver as a module, choose M here: the module
-	  will be called snd-hda-intel.
-
-config SND_HDA_TEGRA
-	tristate "NVIDIA Tegra HD Audio"
-	depends on ARCH_TEGRA
-	select SND_HDA
-	select SND_HDA_ALIGNED_MMIO
-	help
-	  Say Y here to support the HDA controller present in NVIDIA
-	  Tegra SoCs
-
-	  This options enables support for the HD Audio controller
-	  present in some NVIDIA Tegra SoCs, used to communicate audio
-	  to the HDMI output.
-
-	  To compile this driver as a module, choose M here: the module
-	  will be called snd-hda-tegra.
-
-config SND_HDA_ACPI
-	tristate "HD Audio ACPI"
-	depends on ACPI
-	select SND_HDA
-	help
-	  Say Y here to include support for Azalia-compatible HDA controllers
-	  which are advertised via ACPI objects.
-
-	  To compile this driver as a module, choose M here: the module
-	  will be called snd-hda-acpi.
-
 if SND_HDA
 
 config SND_HDA_CIRRUS_SCODEC
diff --git a/sound/pci/hda/Makefile b/sound/pci/hda/Makefile
index 920011bb1b06..79de0af71ad4 100644
--- a/sound/pci/hda/Makefile
+++ b/sound/pci/hda/Makefile
@@ -1,11 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-snd-hda-intel-y := hda_intel.o
-snd-hda-tegra-y := hda_tegra.o
-snd-hda-acpi-y := hda_acpi.o
-
-# for trace-points
-CFLAGS_hda_intel.o := -I$(src)
-
 subdir-ccflags-y += -I$(src)/../../hda/common
 
 snd-hda-codec-generic-y :=	hda_generic.o
@@ -66,10 +59,3 @@ obj-$(CONFIG_SND_HDA_SCODEC_COMPONENT) += snd-hda-scodec-component.o
 obj-$(CONFIG_SND_HDA_SCODEC_TAS2781) += snd-hda-scodec-tas2781.o
 obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_I2C) += snd-hda-scodec-tas2781-i2c.o
 obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_SPI) += snd-hda-scodec-tas2781-spi.o
-
-# this must be the last entry after codec drivers;
-# otherwise the codec patches won't be hooked before the PCI probe
-# when built in kernel
-obj-$(CONFIG_SND_HDA_INTEL) += snd-hda-intel.o
-obj-$(CONFIG_SND_HDA_TEGRA) += snd-hda-tegra.o
-obj-$(CONFIG_SND_HDA_ACPI) += snd-hda-acpi.o
-- 
2.50.0

