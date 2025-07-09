Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CDE1F3BA4
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077089; cv=none; b=QHZFg14zuLFZfNVBdpKtw6TcyNYt29ThZCvJMcMKSBBjJ03ONWg6IyoGb13Pv4hZb5ZzqdZ5GkqWoMGGt5PclcKg2sbhL8+4cpbqOgsG+XUKQVNYLsiTF+8/wPwuqR9prchHJVCT/a9NtIcSufmiz0ck6x4y3B/54hnJrH3jSE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077089; c=relaxed/simple;
	bh=Jvo+OSdtTZw18tPwCcl1mbAZx4DlAfi2kQGuvcwlnW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzBlGBrMKDIFnwJpTAvKYUNEWKdlgsB1Yz1GCEg66BoZ4/CBjAHjupOV/Way7+iPTkDgjs3o9u4dTt/YozRPz8cy+kFhx2mycCPooJLPRK7gfxPnSDJct7n9PV6qcyP6k0UCMqUkn2UVPj1d1MbWexosptyfH7JuvPgXlVg2LLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r5WV0Hom; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F/1qJac9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r5WV0Hom; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F/1qJac9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r5WV0Hom";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F/1qJac9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r5WV0Hom";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F/1qJac9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F38BC21169;
	Wed,  9 Jul 2025 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=60vieq96PKkuQPVz9rAJOKWgwBBUIIqTjbo+pIjUgwQ=;
	b=r5WV0Homa/ivj4SSZArsZqnHde5Xj6H366iTI0tQlB6T4umqwWP9czHadIT94hZ0rwyjcm
	wYeS/Dv+r7/moLTjegOE5Z1bhL+nOi/fxD/7UEnTHg3pZYWkBL9t2CMnB5ECtURlLW8Rm9
	LerEGE1FXXuX8TZEWRIHGKuQeKXJKcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077085;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=60vieq96PKkuQPVz9rAJOKWgwBBUIIqTjbo+pIjUgwQ=;
	b=F/1qJac9LLjyUWXWGcyeh0rLMxZMYKXzwKBqiJMEMxer4EAgXesmbFYllCXJaLjLyFdl5X
	ZYgcmidsM03RiWCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=r5WV0Hom;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="F/1qJac9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=60vieq96PKkuQPVz9rAJOKWgwBBUIIqTjbo+pIjUgwQ=;
	b=r5WV0Homa/ivj4SSZArsZqnHde5Xj6H366iTI0tQlB6T4umqwWP9czHadIT94hZ0rwyjcm
	wYeS/Dv+r7/moLTjegOE5Z1bhL+nOi/fxD/7UEnTHg3pZYWkBL9t2CMnB5ECtURlLW8Rm9
	LerEGE1FXXuX8TZEWRIHGKuQeKXJKcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077085;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=60vieq96PKkuQPVz9rAJOKWgwBBUIIqTjbo+pIjUgwQ=;
	b=F/1qJac9LLjyUWXWGcyeh0rLMxZMYKXzwKBqiJMEMxer4EAgXesmbFYllCXJaLjLyFdl5X
	ZYgcmidsM03RiWCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AEC64136DC;
	Wed,  9 Jul 2025 16:04:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kHcBKRyTbmhDEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Jul 2025 16:04:44 +0000
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
Subject: [PATCH 02/27] ALSA: hda: Move HD-audio core stuff into sound/hda/core
Date: Wed,  9 Jul 2025 18:04:05 +0200
Message-ID: <20250709160434.1859-3-tiwai@suse.de>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: F38BC21169
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

This is a part of HD-audio code restructuring.
Simply move the current code of sound/hda/* into the subdirectory
sound/hda/core, so that more stuff can be moved into sound/hda cleanly
later.

Most of file names with hdac_ and hdac_ext_ prefix are renamed without
the prefix, since they can be identified well in the directory name
and superfluous.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/Kconfig                             | 67 +------------------
 sound/hda/Makefile                            | 22 +-----
 sound/hda/core/Kconfig                        | 67 +++++++++++++++++++
 sound/hda/core/Makefile                       | 22 ++++++
 sound/hda/{ => core}/array.c                  |  0
 sound/hda/{hdac_bus.c => core/bus.c}          |  0
 .../{hdac_component.c => core/component.c}    |  0
 .../{hdac_controller.c => core/controller.c}  |  0
 sound/hda/{hdac_device.c => core/device.c}    |  0
 sound/hda/{ => core}/ext/Makefile             |  2 +-
 .../{ext/hdac_ext_bus.c => core/ext/bus.c}    |  0
 .../ext/controller.c}                         |  0
 .../hdac_ext_stream.c => core/ext/stream.c}   |  0
 sound/hda/{ => core}/hda_bus_type.c           |  0
 sound/hda/{ => core}/hdmi_chmap.c             |  0
 sound/hda/{hdac_i915.c => core/i915.c}        |  0
 sound/hda/{ => core}/intel-dsp-config.c       |  0
 sound/hda/{ => core}/intel-nhlt.c             |  0
 sound/hda/{ => core}/intel-sdw-acpi.c         |  0
 sound/hda/{ => core}/local.h                  |  0
 sound/hda/{hdac_regmap.c => core/regmap.c}    |  0
 sound/hda/{hdac_stream.c => core/stream.c}    |  0
 sound/hda/{hdac_sysfs.c => core/sysfs.c}      |  0
 sound/hda/{ => core}/trace.c                  |  0
 sound/hda/{ => core}/trace.h                  |  0
 25 files changed, 92 insertions(+), 88 deletions(-)
 create mode 100644 sound/hda/core/Kconfig
 create mode 100644 sound/hda/core/Makefile
 rename sound/hda/{ => core}/array.c (100%)
 rename sound/hda/{hdac_bus.c => core/bus.c} (100%)
 rename sound/hda/{hdac_component.c => core/component.c} (100%)
 rename sound/hda/{hdac_controller.c => core/controller.c} (100%)
 rename sound/hda/{hdac_device.c => core/device.c} (100%)
 rename sound/hda/{ => core}/ext/Makefile (54%)
 rename sound/hda/{ext/hdac_ext_bus.c => core/ext/bus.c} (100%)
 rename sound/hda/{ext/hdac_ext_controller.c => core/ext/controller.c} (100%)
 rename sound/hda/{ext/hdac_ext_stream.c => core/ext/stream.c} (100%)
 rename sound/hda/{ => core}/hda_bus_type.c (100%)
 rename sound/hda/{ => core}/hdmi_chmap.c (100%)
 rename sound/hda/{hdac_i915.c => core/i915.c} (100%)
 rename sound/hda/{ => core}/intel-dsp-config.c (100%)
 rename sound/hda/{ => core}/intel-nhlt.c (100%)
 rename sound/hda/{ => core}/intel-sdw-acpi.c (100%)
 rename sound/hda/{ => core}/local.h (100%)
 rename sound/hda/{hdac_regmap.c => core/regmap.c} (100%)
 rename sound/hda/{hdac_stream.c => core/stream.c} (100%)
 rename sound/hda/{hdac_sysfs.c => core/sysfs.c} (100%)
 rename sound/hda/{ => core}/trace.c (100%)
 rename sound/hda/{ => core}/trace.h (100%)

diff --git a/sound/hda/Kconfig b/sound/hda/Kconfig
index eb488a522572..e38014656077 100644
--- a/sound/hda/Kconfig
+++ b/sound/hda/Kconfig
@@ -1,67 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config SND_HDA_CORE
-	tristate
-	select REGMAP
-
-config SND_HDA_DSP_LOADER
-	bool
-
-config SND_HDA_ALIGNED_MMIO
-	bool
-
-config SND_HDA_COMPONENT
-	bool
-
-config SND_HDA_I915
-	bool
-	select SND_HDA_COMPONENT
-
-config SND_HDA_EXT_CORE
-       tristate
-       select SND_HDA_CORE
-
-config SND_HDA_PREALLOC_SIZE
-	int "Pre-allocated buffer size for HD-audio driver"
-	range 0 32768
-	default 0 if SND_DMA_SGBUF
-	default 64 if !SND_DMA_SGBUF
-	help
-	  Specifies the default pre-allocated buffer-size in kB for the
-	  HD-audio driver.  A larger buffer (e.g. 2048) is preferred
-	  for systems using PulseAudio.  The default 64 is chosen just
-	  for compatibility reasons.
-	  On x86 systems, the default is zero as S/G allocation works
-	  and no preallocation is needed in most cases.
-
-	  Note that the pre-allocation size can be changed dynamically
-	  via a proc file (/proc/asound/card*/pcm*/sub*/prealloc), too.
-
-config SND_INTEL_NHLT
-	bool
-	# this config should be selected only for Intel ACPI platforms.
-	# A fallback is provided so that the code compiles in all cases.
-
-config SND_INTEL_DSP_CONFIG
-	tristate
-	select ACPI_NHLT if ACPI
-	select SND_INTEL_NHLT if ACPI
-	select SND_INTEL_SOUNDWIRE_ACPI if ACPI
-	# this config should be selected only for Intel DSP platforms.
-	# A fallback is provided so that the code compiles in all cases.
-
-config SND_INTEL_SOUNDWIRE_ACPI
-	tristate
-
-config SND_INTEL_BYT_PREFER_SOF
-	bool "Prefer SOF driver over SST on BY/CHT platforms"
-	depends on SND_SST_ATOM_HIFI2_PLATFORM_ACPI && SND_SOC_SOF_BAYTRAIL
-	default n
-	help
-	  The kernel has 2 drivers for the Low Power Engine audio-block on
-	  Bay- and Cherry-Trail SoCs. The old SST driver and the new SOF
-	  driver. If both drivers are enabled then the kernel will default
-	  to using the old SST driver, unless told otherwise through the
-	  snd_intel_dspcfg.dsp_driver module-parameter.
-
-	  Set this option to Y to make the kernel default to the new SOF
-	  driver instead.
+source "sound/hda/core/Kconfig"
diff --git a/sound/hda/Makefile b/sound/hda/Makefile
index 83cceafe0d4c..3fdbc22b1530 100644
--- a/sound/hda/Makefile
+++ b/sound/hda/Makefile
@@ -1,22 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-snd-hda-core-y := hda_bus_type.o hdac_bus.o hdac_device.o hdac_sysfs.o \
-	hdac_regmap.o hdac_controller.o hdac_stream.o array.o hdmi_chmap.o
-
-snd-hda-core-y += trace.o
-CFLAGS_trace.o := -I$(src)
-
-# for sync with i915 gfx driver
-snd-hda-core-$(CONFIG_SND_HDA_COMPONENT) += hdac_component.o
-snd-hda-core-$(CONFIG_SND_HDA_I915) += hdac_i915.o
-
-obj-$(CONFIG_SND_HDA_CORE) += snd-hda-core.o
-
-#extended hda
-obj-$(CONFIG_SND_HDA_EXT_CORE) += ext/
-
-snd-intel-dspcfg-y := intel-dsp-config.o
-snd-intel-dspcfg-$(CONFIG_SND_INTEL_NHLT) += intel-nhlt.o
-obj-$(CONFIG_SND_INTEL_DSP_CONFIG) += snd-intel-dspcfg.o
-
-snd-intel-sdw-acpi-y := intel-sdw-acpi.o
-obj-$(CONFIG_SND_INTEL_SOUNDWIRE_ACPI) += snd-intel-sdw-acpi.o
+obj-y += core/
diff --git a/sound/hda/core/Kconfig b/sound/hda/core/Kconfig
new file mode 100644
index 000000000000..eb488a522572
--- /dev/null
+++ b/sound/hda/core/Kconfig
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config SND_HDA_CORE
+	tristate
+	select REGMAP
+
+config SND_HDA_DSP_LOADER
+	bool
+
+config SND_HDA_ALIGNED_MMIO
+	bool
+
+config SND_HDA_COMPONENT
+	bool
+
+config SND_HDA_I915
+	bool
+	select SND_HDA_COMPONENT
+
+config SND_HDA_EXT_CORE
+       tristate
+       select SND_HDA_CORE
+
+config SND_HDA_PREALLOC_SIZE
+	int "Pre-allocated buffer size for HD-audio driver"
+	range 0 32768
+	default 0 if SND_DMA_SGBUF
+	default 64 if !SND_DMA_SGBUF
+	help
+	  Specifies the default pre-allocated buffer-size in kB for the
+	  HD-audio driver.  A larger buffer (e.g. 2048) is preferred
+	  for systems using PulseAudio.  The default 64 is chosen just
+	  for compatibility reasons.
+	  On x86 systems, the default is zero as S/G allocation works
+	  and no preallocation is needed in most cases.
+
+	  Note that the pre-allocation size can be changed dynamically
+	  via a proc file (/proc/asound/card*/pcm*/sub*/prealloc), too.
+
+config SND_INTEL_NHLT
+	bool
+	# this config should be selected only for Intel ACPI platforms.
+	# A fallback is provided so that the code compiles in all cases.
+
+config SND_INTEL_DSP_CONFIG
+	tristate
+	select ACPI_NHLT if ACPI
+	select SND_INTEL_NHLT if ACPI
+	select SND_INTEL_SOUNDWIRE_ACPI if ACPI
+	# this config should be selected only for Intel DSP platforms.
+	# A fallback is provided so that the code compiles in all cases.
+
+config SND_INTEL_SOUNDWIRE_ACPI
+	tristate
+
+config SND_INTEL_BYT_PREFER_SOF
+	bool "Prefer SOF driver over SST on BY/CHT platforms"
+	depends on SND_SST_ATOM_HIFI2_PLATFORM_ACPI && SND_SOC_SOF_BAYTRAIL
+	default n
+	help
+	  The kernel has 2 drivers for the Low Power Engine audio-block on
+	  Bay- and Cherry-Trail SoCs. The old SST driver and the new SOF
+	  driver. If both drivers are enabled then the kernel will default
+	  to using the old SST driver, unless told otherwise through the
+	  snd_intel_dspcfg.dsp_driver module-parameter.
+
+	  Set this option to Y to make the kernel default to the new SOF
+	  driver instead.
diff --git a/sound/hda/core/Makefile b/sound/hda/core/Makefile
new file mode 100644
index 000000000000..89cb46143050
--- /dev/null
+++ b/sound/hda/core/Makefile
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0
+snd-hda-core-y := hda_bus_type.o bus.o device.o sysfs.o \
+	regmap.o controller.o stream.o array.o hdmi_chmap.o
+
+snd-hda-core-y += trace.o
+CFLAGS_trace.o := -I$(src)
+
+# for sync with i915 gfx driver
+snd-hda-core-$(CONFIG_SND_HDA_COMPONENT) += component.o
+snd-hda-core-$(CONFIG_SND_HDA_I915) += i915.o
+
+obj-$(CONFIG_SND_HDA_CORE) += snd-hda-core.o
+
+#extended hda
+obj-$(CONFIG_SND_HDA_EXT_CORE) += ext/
+
+snd-intel-dspcfg-y := intel-dsp-config.o
+snd-intel-dspcfg-$(CONFIG_SND_INTEL_NHLT) += intel-nhlt.o
+obj-$(CONFIG_SND_INTEL_DSP_CONFIG) += snd-intel-dspcfg.o
+
+snd-intel-sdw-acpi-y := intel-sdw-acpi.o
+obj-$(CONFIG_SND_INTEL_SOUNDWIRE_ACPI) += snd-intel-sdw-acpi.o
diff --git a/sound/hda/array.c b/sound/hda/core/array.c
similarity index 100%
rename from sound/hda/array.c
rename to sound/hda/core/array.c
diff --git a/sound/hda/hdac_bus.c b/sound/hda/core/bus.c
similarity index 100%
rename from sound/hda/hdac_bus.c
rename to sound/hda/core/bus.c
diff --git a/sound/hda/hdac_component.c b/sound/hda/core/component.c
similarity index 100%
rename from sound/hda/hdac_component.c
rename to sound/hda/core/component.c
diff --git a/sound/hda/hdac_controller.c b/sound/hda/core/controller.c
similarity index 100%
rename from sound/hda/hdac_controller.c
rename to sound/hda/core/controller.c
diff --git a/sound/hda/hdac_device.c b/sound/hda/core/device.c
similarity index 100%
rename from sound/hda/hdac_device.c
rename to sound/hda/core/device.c
diff --git a/sound/hda/ext/Makefile b/sound/hda/core/ext/Makefile
similarity index 54%
rename from sound/hda/ext/Makefile
rename to sound/hda/core/ext/Makefile
index 05883fb28d28..85190a7eb5de 100644
--- a/sound/hda/ext/Makefile
+++ b/sound/hda/core/ext/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-hda-ext-core-y := hdac_ext_bus.o hdac_ext_controller.o hdac_ext_stream.o
+snd-hda-ext-core-y := bus.o controller.o stream.o
 
 obj-$(CONFIG_SND_HDA_EXT_CORE) += snd-hda-ext-core.o
diff --git a/sound/hda/ext/hdac_ext_bus.c b/sound/hda/core/ext/bus.c
similarity index 100%
rename from sound/hda/ext/hdac_ext_bus.c
rename to sound/hda/core/ext/bus.c
diff --git a/sound/hda/ext/hdac_ext_controller.c b/sound/hda/core/ext/controller.c
similarity index 100%
rename from sound/hda/ext/hdac_ext_controller.c
rename to sound/hda/core/ext/controller.c
diff --git a/sound/hda/ext/hdac_ext_stream.c b/sound/hda/core/ext/stream.c
similarity index 100%
rename from sound/hda/ext/hdac_ext_stream.c
rename to sound/hda/core/ext/stream.c
diff --git a/sound/hda/hda_bus_type.c b/sound/hda/core/hda_bus_type.c
similarity index 100%
rename from sound/hda/hda_bus_type.c
rename to sound/hda/core/hda_bus_type.c
diff --git a/sound/hda/hdmi_chmap.c b/sound/hda/core/hdmi_chmap.c
similarity index 100%
rename from sound/hda/hdmi_chmap.c
rename to sound/hda/core/hdmi_chmap.c
diff --git a/sound/hda/hdac_i915.c b/sound/hda/core/i915.c
similarity index 100%
rename from sound/hda/hdac_i915.c
rename to sound/hda/core/i915.c
diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/core/intel-dsp-config.c
similarity index 100%
rename from sound/hda/intel-dsp-config.c
rename to sound/hda/core/intel-dsp-config.c
diff --git a/sound/hda/intel-nhlt.c b/sound/hda/core/intel-nhlt.c
similarity index 100%
rename from sound/hda/intel-nhlt.c
rename to sound/hda/core/intel-nhlt.c
diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/core/intel-sdw-acpi.c
similarity index 100%
rename from sound/hda/intel-sdw-acpi.c
rename to sound/hda/core/intel-sdw-acpi.c
diff --git a/sound/hda/local.h b/sound/hda/core/local.h
similarity index 100%
rename from sound/hda/local.h
rename to sound/hda/core/local.h
diff --git a/sound/hda/hdac_regmap.c b/sound/hda/core/regmap.c
similarity index 100%
rename from sound/hda/hdac_regmap.c
rename to sound/hda/core/regmap.c
diff --git a/sound/hda/hdac_stream.c b/sound/hda/core/stream.c
similarity index 100%
rename from sound/hda/hdac_stream.c
rename to sound/hda/core/stream.c
diff --git a/sound/hda/hdac_sysfs.c b/sound/hda/core/sysfs.c
similarity index 100%
rename from sound/hda/hdac_sysfs.c
rename to sound/hda/core/sysfs.c
diff --git a/sound/hda/trace.c b/sound/hda/core/trace.c
similarity index 100%
rename from sound/hda/trace.c
rename to sound/hda/core/trace.c
diff --git a/sound/hda/trace.h b/sound/hda/core/trace.h
similarity index 100%
rename from sound/hda/trace.h
rename to sound/hda/core/trace.h
-- 
2.50.0

