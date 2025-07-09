Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ADA1F4E57
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077133; cv=none; b=pbsPnBK74AVW/nj8nLMZZ/AW47Sfh7zm3Vu2AEbMHjxZK/+eiufDzLh0maVptBx9OxV+cknIwWvVHPNqTxb8ToBmJvGzY5LOpdMaBmjUdkzW3n6IsQvxWREs8YYuDFQH9qAwsSz+BBsQmCH1XdSnvV4mfZ9vR7D6F0HmJmdthjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077133; c=relaxed/simple;
	bh=J91jjBpdHgFX/Jg2K58rwsp1fws22wfvVa2r2y/kMZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kut0RSJgS9/GtWQwZn2p83kT+4ILV6P3Vw1PAP01x4NxDds2gHB4nTsaapNAyhybAxfX1jJ9QSP4Iu++Gc/4daowNd8uZNRYm2t/rLwZ1mIFPS9Ffg7UVk0uRsl3eW7eKyqqv3khgiqrfrOL5gzDxj07XOA1lBi7GTy0+n9/CF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ux+61QFW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m04fhSXT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ux+61QFW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m04fhSXT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ux+61QFW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m04fhSXT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ux+61QFW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m04fhSXT"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0B0EB1F44F;
	Wed,  9 Jul 2025 16:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4tl/XTxrIzti7AUTNnF1lk+0+K/GYQOdcY3QR7a7shE=;
	b=ux+61QFW6D+x/OQRslZmM1N5kcOQ7ulHPMjExEXmz8APd0Dfgi9hYsGA5ri5OU+ogNt3+h
	7bDhIjgUy8bZWR75qt3xiIMZcJ3kcjqJejhuMwhtUtw252T+P+YKbkachpXcj3rgvyd6gX
	0PAgXaqh4BfE09uOXsx9q+PIIx1QnvY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077086;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4tl/XTxrIzti7AUTNnF1lk+0+K/GYQOdcY3QR7a7shE=;
	b=m04fhSXT0viyghq9D3mUYiNYvkhqRKUBi4x2esPc7LDd50i/t+k7o+qD1GuaYvQhuZzZYA
	DkfbYMINbvu5RnBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4tl/XTxrIzti7AUTNnF1lk+0+K/GYQOdcY3QR7a7shE=;
	b=ux+61QFW6D+x/OQRslZmM1N5kcOQ7ulHPMjExEXmz8APd0Dfgi9hYsGA5ri5OU+ogNt3+h
	7bDhIjgUy8bZWR75qt3xiIMZcJ3kcjqJejhuMwhtUtw252T+P+YKbkachpXcj3rgvyd6gX
	0PAgXaqh4BfE09uOXsx9q+PIIx1QnvY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077086;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4tl/XTxrIzti7AUTNnF1lk+0+K/GYQOdcY3QR7a7shE=;
	b=m04fhSXT0viyghq9D3mUYiNYvkhqRKUBi4x2esPc7LDd50i/t+k7o+qD1GuaYvQhuZzZYA
	DkfbYMINbvu5RnBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA81A136DC;
	Wed,  9 Jul 2025 16:04:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6KtTLB2TbmhDEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Jul 2025 16:04:45 +0000
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
Subject: [PATCH 03/27] ALSA: hda: Move common codec driver into sound/hda/common directory
Date: Wed,  9 Jul 2025 18:04:06 +0200
Message-ID: <20250709160434.1859-4-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RL7bz5f8woybp4997xe1n6ecoy)];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.80

The snd-hda-codec module contains the most of common code used by both
HD-audio controller and codec drivers, and it's basically independent
from PCI.  Let's move the code to sound/hda/common directory as a part
of code reorganization.

The hda_ prefix is dropped from the most of file names as it's rather
superfluous.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/Kconfig                             |  5 ++
 sound/hda/Makefile                            |  1 +
 sound/hda/common/Kconfig                      | 80 +++++++++++++++++++
 sound/hda/common/Makefile                     | 13 +++
 .../common/auto_parser.c}                     |  0
 .../{pci/hda/hda_beep.c => hda/common/beep.c} |  0
 .../{pci/hda/hda_bind.c => hda/common/bind.c} |  0
 .../hda/hda_codec.c => hda/common/codec.c}    |  0
 .../common/controller.c}                      |  2 +-
 .../common/controller_trace.h}                |  2 +-
 .../{pci/hda => hda/common}/hda_auto_parser.h |  0
 sound/{pci/hda => hda/common}/hda_beep.h      |  0
 .../{pci/hda => hda/common}/hda_controller.h  |  0
 sound/{pci/hda => hda/common}/hda_jack.h      |  0
 sound/{pci/hda => hda/common}/hda_local.h     |  0
 .../hda/hda_hwdep.c => hda/common/hwdep.c}    |  0
 .../{pci/hda/hda_jack.c => hda/common/jack.c} |  0
 .../{pci/hda/hda_proc.c => hda/common/proc.c} |  0
 .../hda/hda_sysfs.c => hda/common/sysfs.c}    |  0
 sound/pci/hda/Kconfig                         | 76 ------------------
 sound/pci/hda/Makefile                        | 13 +--
 21 files changed, 103 insertions(+), 89 deletions(-)
 create mode 100644 sound/hda/common/Kconfig
 create mode 100644 sound/hda/common/Makefile
 rename sound/{pci/hda/hda_auto_parser.c => hda/common/auto_parser.c} (100%)
 rename sound/{pci/hda/hda_beep.c => hda/common/beep.c} (100%)
 rename sound/{pci/hda/hda_bind.c => hda/common/bind.c} (100%)
 rename sound/{pci/hda/hda_codec.c => hda/common/codec.c} (100%)
 rename sound/{pci/hda/hda_controller.c => hda/common/controller.c} (99%)
 rename sound/{pci/hda/hda_controller_trace.h => hda/common/controller_trace.h} (97%)
 rename sound/{pci/hda => hda/common}/hda_auto_parser.h (100%)
 rename sound/{pci/hda => hda/common}/hda_beep.h (100%)
 rename sound/{pci/hda => hda/common}/hda_controller.h (100%)
 rename sound/{pci/hda => hda/common}/hda_jack.h (100%)
 rename sound/{pci/hda => hda/common}/hda_local.h (100%)
 rename sound/{pci/hda/hda_hwdep.c => hda/common/hwdep.c} (100%)
 rename sound/{pci/hda/hda_jack.c => hda/common/jack.c} (100%)
 rename sound/{pci/hda/hda_proc.c => hda/common/proc.c} (100%)
 rename sound/{pci/hda/hda_sysfs.c => hda/common/sysfs.c} (100%)

diff --git a/sound/hda/Kconfig b/sound/hda/Kconfig
index e38014656077..2928cb570ec6 100644
--- a/sound/hda/Kconfig
+++ b/sound/hda/Kconfig
@@ -1,2 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "HD-Audio"
+
+source "sound/hda/common/Kconfig"
 source "sound/hda/core/Kconfig"
+
+endmenu
diff --git a/sound/hda/Makefile b/sound/hda/Makefile
index 3fdbc22b1530..e7596bf736a4 100644
--- a/sound/hda/Makefile
+++ b/sound/hda/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y += core/
+obj-$(CONFIG_SND_HDA) += common/
diff --git a/sound/hda/common/Kconfig b/sound/hda/common/Kconfig
new file mode 100644
index 000000000000..d1e2bfd24c11
--- /dev/null
+++ b/sound/hda/common/Kconfig
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config SND_HDA
+	tristate
+	select SND_PCM
+	select SND_VMASTER
+	select SND_JACK
+	select SND_HDA_CORE
+
+if SND_HDA
+
+config SND_HDA_HWDEP
+	bool "Build hwdep interface for HD-audio driver"
+	select SND_HWDEP
+	help
+	  Say Y here to build a hwdep interface for HD-audio driver.
+	  This interface can be used for out-of-band communication
+	  with codecs for debugging purposes.
+
+config SND_HDA_RECONFIG
+	bool "Allow dynamic codec reconfiguration"
+	help
+	  Say Y here to enable the HD-audio codec re-configuration feature.
+	  It allows user to clear the whole codec configuration, change the
+	  codec setup, add extra verbs, and re-configure the codec dynamically.
+
+	  Note that this item alone doesn't provide the sysfs interface, but
+	  enables the feature just for the patch loader below.
+	  If you need the traditional sysfs entries for the manual interaction,
+	  turn on CONFIG_SND_HDA_HWDEP as well.
+
+config SND_HDA_INPUT_BEEP
+	bool "Support digital beep via input layer"
+	depends on INPUT=y || INPUT=SND_HDA
+	help
+	  Say Y here to build a digital beep interface for HD-audio
+	  driver. This interface is used to generate digital beeps.
+
+config SND_HDA_INPUT_BEEP_MODE
+	int "Digital beep registration mode (0=off, 1=on)"
+	depends on SND_HDA_INPUT_BEEP=y
+	default "1"
+	range 0 1
+	help
+	  Set 0 to disable the digital beep interface for HD-audio by default.
+	  Set 1 to always enable the digital beep interface for HD-audio by
+	  default.
+
+config SND_HDA_PATCH_LOADER
+	bool "Support initialization patch loading for HD-audio"
+	select FW_LOADER
+	select SND_HDA_RECONFIG
+	help
+	  Say Y here to allow the HD-audio driver to load a pseudo
+	  firmware file ("patch") for overriding the BIOS setup at
+	  start up.  The "patch" file can be specified via patch module
+	  option, such as patch=hda-init.
+
+config SND_HDA_POWER_SAVE_DEFAULT
+	int "Default time-out for HD-audio power-save mode"
+	depends on PM
+	default 0
+	help
+	  The default time-out value in seconds for HD-audio automatic
+	  power-save mode.  0 means to disable the power-save mode.
+
+config SND_HDA_CTL_DEV_ID
+	bool "Use the device identifier field for controls"
+	depends on SND_HDA_INTEL
+	help
+	  Say Y to use the device identifier field for (mixer)
+	  controls (old behaviour until this option is available).
+
+	  When enabled, the multiple HDA codecs may set the device
+	  field in control (mixer) element identifiers. The use
+	  of this field is not recommended and defined for mixer controls.
+
+	  The old behaviour (Y) is obsolete and will be removed. Consider
+	  to not enable this option.
+endif
diff --git a/sound/hda/common/Makefile b/sound/hda/common/Makefile
new file mode 100644
index 000000000000..3344fa0efe75
--- /dev/null
+++ b/sound/hda/common/Makefile
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+snd-hda-codec-y := bind.o codec.o jack.o auto_parser.o sysfs.o
+snd-hda-codec-y += controller.o
+snd-hda-codec-$(CONFIG_SND_PROC_FS) += proc.o
+
+snd-hda-codec-$(CONFIG_SND_HDA_HWDEP) += hwdep.o
+snd-hda-codec-$(CONFIG_SND_HDA_INPUT_BEEP) += beep.o
+
+# for trace-points
+CFLAGS_controller.o := -I$(src)
+
+# common driver
+obj-$(CONFIG_SND_HDA) := snd-hda-codec.o
diff --git a/sound/pci/hda/hda_auto_parser.c b/sound/hda/common/auto_parser.c
similarity index 100%
rename from sound/pci/hda/hda_auto_parser.c
rename to sound/hda/common/auto_parser.c
diff --git a/sound/pci/hda/hda_beep.c b/sound/hda/common/beep.c
similarity index 100%
rename from sound/pci/hda/hda_beep.c
rename to sound/hda/common/beep.c
diff --git a/sound/pci/hda/hda_bind.c b/sound/hda/common/bind.c
similarity index 100%
rename from sound/pci/hda/hda_bind.c
rename to sound/hda/common/bind.c
diff --git a/sound/pci/hda/hda_codec.c b/sound/hda/common/codec.c
similarity index 100%
rename from sound/pci/hda/hda_codec.c
rename to sound/hda/common/codec.c
diff --git a/sound/pci/hda/hda_controller.c b/sound/hda/common/controller.c
similarity index 99%
rename from sound/pci/hda/hda_controller.c
rename to sound/hda/common/controller.c
index f3330b7e0fcf..84387ed761be 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/hda/common/controller.c
@@ -29,7 +29,7 @@
 #include "hda_local.h"
 
 #define CREATE_TRACE_POINTS
-#include "hda_controller_trace.h"
+#include "controller_trace.h"
 
 /* DSP lock helpers */
 #define dsp_lock(dev)		snd_hdac_dsp_lock(azx_stream(dev))
diff --git a/sound/pci/hda/hda_controller_trace.h b/sound/hda/common/controller_trace.h
similarity index 97%
rename from sound/pci/hda/hda_controller_trace.h
rename to sound/hda/common/controller_trace.h
index bf48304e230a..7f5841f8919e 100644
--- a/sound/pci/hda/hda_controller_trace.h
+++ b/sound/hda/common/controller_trace.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #undef TRACE_SYSTEM
 #define TRACE_SYSTEM hda_controller
-#define TRACE_INCLUDE_FILE hda_controller_trace
+#define TRACE_INCLUDE_FILE controller_trace
 
 #if !defined(_TRACE_HDA_CONTROLLER_H) || defined(TRACE_HEADER_MULTI_READ)
 #define _TRACE_HDA_CONTROLLER_H
diff --git a/sound/pci/hda/hda_auto_parser.h b/sound/hda/common/hda_auto_parser.h
similarity index 100%
rename from sound/pci/hda/hda_auto_parser.h
rename to sound/hda/common/hda_auto_parser.h
diff --git a/sound/pci/hda/hda_beep.h b/sound/hda/common/hda_beep.h
similarity index 100%
rename from sound/pci/hda/hda_beep.h
rename to sound/hda/common/hda_beep.h
diff --git a/sound/pci/hda/hda_controller.h b/sound/hda/common/hda_controller.h
similarity index 100%
rename from sound/pci/hda/hda_controller.h
rename to sound/hda/common/hda_controller.h
diff --git a/sound/pci/hda/hda_jack.h b/sound/hda/common/hda_jack.h
similarity index 100%
rename from sound/pci/hda/hda_jack.h
rename to sound/hda/common/hda_jack.h
diff --git a/sound/pci/hda/hda_local.h b/sound/hda/common/hda_local.h
similarity index 100%
rename from sound/pci/hda/hda_local.h
rename to sound/hda/common/hda_local.h
diff --git a/sound/pci/hda/hda_hwdep.c b/sound/hda/common/hwdep.c
similarity index 100%
rename from sound/pci/hda/hda_hwdep.c
rename to sound/hda/common/hwdep.c
diff --git a/sound/pci/hda/hda_jack.c b/sound/hda/common/jack.c
similarity index 100%
rename from sound/pci/hda/hda_jack.c
rename to sound/hda/common/jack.c
diff --git a/sound/pci/hda/hda_proc.c b/sound/hda/common/proc.c
similarity index 100%
rename from sound/pci/hda/hda_proc.c
rename to sound/hda/common/proc.c
diff --git a/sound/pci/hda/hda_sysfs.c b/sound/hda/common/sysfs.c
similarity index 100%
rename from sound/pci/hda/hda_sysfs.c
rename to sound/hda/common/sysfs.c
diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 745f120a5cee..1dfd56493d39 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -1,13 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menu "HD-Audio"
 
-config SND_HDA
-	tristate
-	select SND_PCM
-	select SND_VMASTER
-	select SND_JACK
-	select SND_HDA_CORE
-
 config SND_HDA_GENERIC_LEDS
        bool
 
@@ -55,53 +48,6 @@ config SND_HDA_ACPI
 
 if SND_HDA
 
-config SND_HDA_HWDEP
-	bool "Build hwdep interface for HD-audio driver"
-	select SND_HWDEP
-	help
-	  Say Y here to build a hwdep interface for HD-audio driver.
-	  This interface can be used for out-of-band communication
-	  with codecs for debugging purposes.
-
-config SND_HDA_RECONFIG
-	bool "Allow dynamic codec reconfiguration"
-	help
-	  Say Y here to enable the HD-audio codec re-configuration feature.
-	  It allows user to clear the whole codec configuration, change the
-	  codec setup, add extra verbs, and re-configure the codec dynamically.
-
-	  Note that this item alone doesn't provide the sysfs interface, but
-	  enables the feature just for the patch loader below.
-	  If you need the traditional sysfs entries for the manual interaction,
-	  turn on CONFIG_SND_HDA_HWDEP as well.
-
-config SND_HDA_INPUT_BEEP
-	bool "Support digital beep via input layer"
-	depends on INPUT=y || INPUT=SND_HDA
-	help
-	  Say Y here to build a digital beep interface for HD-audio
-	  driver. This interface is used to generate digital beeps.
-
-config SND_HDA_INPUT_BEEP_MODE
-	int "Digital beep registration mode (0=off, 1=on)"
-	depends on SND_HDA_INPUT_BEEP=y
-	default "1"
-	range 0 1
-	help
-	  Set 0 to disable the digital beep interface for HD-audio by default.
-	  Set 1 to always enable the digital beep interface for HD-audio by
-	  default.
-
-config SND_HDA_PATCH_LOADER
-	bool "Support initialization patch loading for HD-audio"
-	select FW_LOADER
-	select SND_HDA_RECONFIG
-	help
-	  Say Y here to allow the HD-audio driver to load a pseudo
-	  firmware file ("patch") for overriding the BIOS setup at
-	  start up.  The "patch" file can be specified via patch module
-	  option, such as patch=hda-init.
-
 config SND_HDA_CIRRUS_SCODEC
 	tristate
 
@@ -394,14 +340,6 @@ config SND_HDA_GENERIC
 comment "Set to Y if you want auto-loading the codec driver"
 	depends on SND_HDA=y && SND_HDA_GENERIC=m
 
-config SND_HDA_POWER_SAVE_DEFAULT
-	int "Default time-out for HD-audio power-save mode"
-	depends on PM
-	default 0
-	help
-	  The default time-out value in seconds for HD-audio automatic
-	  power-save mode.  0 means to disable the power-save mode.
-
 config SND_HDA_INTEL_HDMI_SILENT_STREAM
 	bool "Enable Silent Stream always for HDMI"
 	depends on SND_HDA_INTEL
@@ -417,20 +355,6 @@ config SND_HDA_INTEL_HDMI_SILENT_STREAM
 	  This feature can impact power consumption as resources
 	  are kept reserved both at transmitter and receiver.
 
-config SND_HDA_CTL_DEV_ID
-	bool "Use the device identifier field for controls"
-	depends on SND_HDA_INTEL
-	help
-	  Say Y to use the device identifier field for (mixer)
-	  controls (old behaviour until this option is available).
-
-	  When enabled, the multiple HDA codecs may set the device
-	  field in control (mixer) element identifiers. The use
-	  of this field is not recommended and defined for mixer controls.
-
-	  The old behaviour (Y) is obsolete and will be removed. Consider
-	  to not enable this option.
-
 endif
 
 endmenu
diff --git a/sound/pci/hda/Makefile b/sound/pci/hda/Makefile
index a5ab8ee2d7f9..920011bb1b06 100644
--- a/sound/pci/hda/Makefile
+++ b/sound/pci/hda/Makefile
@@ -3,17 +3,11 @@ snd-hda-intel-y := hda_intel.o
 snd-hda-tegra-y := hda_tegra.o
 snd-hda-acpi-y := hda_acpi.o
 
-snd-hda-codec-y := hda_bind.o hda_codec.o hda_jack.o hda_auto_parser.o hda_sysfs.o
-snd-hda-codec-y += hda_controller.o
-snd-hda-codec-$(CONFIG_SND_PROC_FS) += hda_proc.o
-
-snd-hda-codec-$(CONFIG_SND_HDA_HWDEP) += hda_hwdep.o
-snd-hda-codec-$(CONFIG_SND_HDA_INPUT_BEEP) += hda_beep.o
-
 # for trace-points
-CFLAGS_hda_controller.o := -I$(src)
 CFLAGS_hda_intel.o := -I$(src)
 
+subdir-ccflags-y += -I$(src)/../../hda/common
+
 snd-hda-codec-generic-y :=	hda_generic.o
 snd-hda-codec-realtek-y :=	patch_realtek.o
 snd-hda-codec-cmedia-y :=	patch_cmedia.o
@@ -43,9 +37,6 @@ snd-hda-scodec-tas2781-y :=	tas2781_hda.o
 snd-hda-scodec-tas2781-i2c-y :=	tas2781_hda_i2c.o
 snd-hda-scodec-tas2781-spi-y :=	tas2781_hda_spi.o
 
-# common driver
-obj-$(CONFIG_SND_HDA) := snd-hda-codec.o
-
 # codec drivers
 obj-$(CONFIG_SND_HDA_GENERIC) += snd-hda-codec-generic.o
 obj-$(CONFIG_SND_HDA_CODEC_REALTEK) += snd-hda-codec-realtek.o
-- 
2.50.0

