Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8917515F41D
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715090118; cv=none; b=RfJkepzszOEsTEqg4zMpWsEWloqSQW3mjHrkzZ1yUQuC5H0161xL6CDZdu5KkiMDAhh6dapeoAR5JStZafQykmmizFxBIuZNnbv++8qlWC2RPCtNWYEjKTJnbPFpAZE7VwpjBzBrhHnIFHo3yfSHvsrmuuhL1vgtaewesO9OzQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715090118; c=relaxed/simple;
	bh=PCz84+haG4Oo9MwAQVT54EeWIrGZS+CFYwtKc6VfThY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SC+O3OLucjWHlt/mAEFXST/5j0LMmPsFMMLwL8J+aaWDEHMOnlRCSrqCs0Toz5IdHErt7q/dMW2Suw1l3q1vjgyRtM4vWA3A7elu1gbORB+yJlFemwPxDfj93CEA3of/1WKS6AjLGIniAgjKspuyfuhcbtcBUcju4nwdwBi/ads=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B733020AE4;
	Tue,  7 May 2024 13:55:08 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A82D113A3D;
	Tue,  7 May 2024 13:55:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +BVMKLwyOmagMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 13:55:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 4/9] ALSA: isa: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 15:55:04 +0200
Message-ID: <20240507135513.14919-5-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507135513.14919-1-tiwai@suse.de>
References: <20240507135513.14919-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: B733020AE4

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/Makefile           | 18 +++++++++---------
 sound/isa/ad1816a/Makefile   |  2 +-
 sound/isa/ad1848/Makefile    |  2 +-
 sound/isa/cs423x/Makefile    |  4 ++--
 sound/isa/es1688/Makefile    |  4 ++--
 sound/isa/galaxy/Makefile    |  4 ++--
 sound/isa/gus/Makefile       | 12 ++++++------
 sound/isa/msnd/Makefile      |  6 +++---
 sound/isa/opti9xx/Makefile   |  8 ++++----
 sound/isa/sb/Makefile        | 18 +++++++++---------
 sound/isa/wavefront/Makefile |  2 +-
 sound/isa/wss/Makefile       |  2 +-
 12 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/sound/isa/Makefile b/sound/isa/Makefile
index 5eaddbf4a712..2135d68a15ac 100644
--- a/sound/isa/Makefile
+++ b/sound/isa/Makefile
@@ -4,15 +4,15 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-adlib-objs := adlib.o
-snd-als100-objs := als100.o
-snd-azt2320-objs := azt2320.o
-snd-cmi8328-objs := cmi8328.o
-snd-cmi8330-objs := cmi8330.o
-snd-es18xx-objs := es18xx.o
-snd-opl3sa2-objs := opl3sa2.o
-snd-sc6000-objs := sc6000.o
-snd-sscape-objs := sscape.o
+snd-adlib-y := adlib.o
+snd-als100-y := als100.o
+snd-azt2320-y := azt2320.o
+snd-cmi8328-y := cmi8328.o
+snd-cmi8330-y := cmi8330.o
+snd-es18xx-y := es18xx.o
+snd-opl3sa2-y := opl3sa2.o
+snd-sc6000-y := sc6000.o
+snd-sscape-y := sscape.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_ADLIB) += snd-adlib.o
diff --git a/sound/isa/ad1816a/Makefile b/sound/isa/ad1816a/Makefile
index 93def7f16933..573325228534 100644
--- a/sound/isa/ad1816a/Makefile
+++ b/sound/isa/ad1816a/Makefile
@@ -4,7 +4,7 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-ad1816a-objs := ad1816a.o ad1816a_lib.o
+snd-ad1816a-y := ad1816a.o ad1816a_lib.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_AD1816A) += snd-ad1816a.o
diff --git a/sound/isa/ad1848/Makefile b/sound/isa/ad1848/Makefile
index 4eab89bbc845..5fdfc1c9f059 100644
--- a/sound/isa/ad1848/Makefile
+++ b/sound/isa/ad1848/Makefile
@@ -4,7 +4,7 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-ad1848-objs := ad1848.o
+snd-ad1848-y := ad1848.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_AD1848) += snd-ad1848.o
diff --git a/sound/isa/cs423x/Makefile b/sound/isa/cs423x/Makefile
index 91c6b8d64424..013a777d23fa 100644
--- a/sound/isa/cs423x/Makefile
+++ b/sound/isa/cs423x/Makefile
@@ -4,8 +4,8 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-cs4231-objs := cs4231.o
-snd-cs4236-objs := cs4236.o cs4236_lib.o
+snd-cs4231-y := cs4231.o
+snd-cs4236-y := cs4236.o cs4236_lib.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_CS4231) += snd-cs4231.o
diff --git a/sound/isa/es1688/Makefile b/sound/isa/es1688/Makefile
index c683ac36c50e..7d6c44a8eaad 100644
--- a/sound/isa/es1688/Makefile
+++ b/sound/isa/es1688/Makefile
@@ -4,8 +4,8 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-es1688-lib-objs := es1688_lib.o
-snd-es1688-objs := es1688.o
+snd-es1688-lib-y := es1688_lib.o
+snd-es1688-y := es1688.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_ES1688) += snd-es1688.o snd-es1688-lib.o
diff --git a/sound/isa/galaxy/Makefile b/sound/isa/galaxy/Makefile
index ff861f238093..2dbd519860a6 100644
--- a/sound/isa/galaxy/Makefile
+++ b/sound/isa/galaxy/Makefile
@@ -4,8 +4,8 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@suse.cz>
 #
 
-snd-azt1605-objs := azt1605.o
-snd-azt2316-objs := azt2316.o
+snd-azt1605-y := azt1605.o
+snd-azt2316-y := azt2316.o
 
 obj-$(CONFIG_SND_AZT1605) += snd-azt1605.o
 obj-$(CONFIG_SND_AZT2316) += snd-azt2316.o
diff --git a/sound/isa/gus/Makefile b/sound/isa/gus/Makefile
index c6f32ffd3420..4924c1904fa4 100644
--- a/sound/isa/gus/Makefile
+++ b/sound/isa/gus/Makefile
@@ -4,18 +4,18 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-gus-lib-objs := gus_main.o \
+snd-gus-lib-y := gus_main.o \
 		    gus_io.o gus_irq.o gus_timer.o \
 		    gus_mem.o gus_mem_proc.o gus_dram.o gus_dma.o gus_volume.o \
 		    gus_pcm.o gus_mixer.o \
 		    gus_uart.o \
 		    gus_reset.o
 
-snd-gusclassic-objs := gusclassic.o
-snd-gusextreme-objs := gusextreme.o
-snd-gusmax-objs := gusmax.o
-snd-interwave-objs := interwave.o
-snd-interwave-stb-objs := interwave-stb.o
+snd-gusclassic-y := gusclassic.o
+snd-gusextreme-y := gusextreme.o
+snd-gusmax-y := gusmax.o
+snd-interwave-y := interwave.o
+snd-interwave-stb-y := interwave-stb.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_GUSCLASSIC) += snd-gusclassic.o snd-gus-lib.o
diff --git a/sound/isa/msnd/Makefile b/sound/isa/msnd/Makefile
index ec231a7b1d5e..5f8d6b472722 100644
--- a/sound/isa/msnd/Makefile
+++ b/sound/isa/msnd/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
-snd-msnd-lib-objs := msnd.o msnd_midi.o msnd_pinnacle_mixer.o
-snd-msnd-pinnacle-objs := msnd_pinnacle.o
-snd-msnd-classic-objs := msnd_classic.o
+snd-msnd-lib-y := msnd.o msnd_midi.o msnd_pinnacle_mixer.o
+snd-msnd-pinnacle-y := msnd_pinnacle.o
+snd-msnd-classic-y := msnd_classic.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_MSND_PINNACLE) += snd-msnd-pinnacle.o snd-msnd-lib.o
diff --git a/sound/isa/opti9xx/Makefile b/sound/isa/opti9xx/Makefile
index a9dcdeb502bd..44a2fb220456 100644
--- a/sound/isa/opti9xx/Makefile
+++ b/sound/isa/opti9xx/Makefile
@@ -4,10 +4,10 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-opti92x-ad1848-objs := opti92x-ad1848.o
-snd-opti92x-cs4231-objs := opti92x-cs4231.o
-snd-opti93x-objs := opti93x.o
-snd-miro-objs := miro.o
+snd-opti92x-ad1848-y := opti92x-ad1848.o
+snd-opti92x-cs4231-y := opti92x-cs4231.o
+snd-opti93x-y := opti93x.o
+snd-miro-y := miro.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_OPTI92X_AD1848) += snd-opti92x-ad1848.o
diff --git a/sound/isa/sb/Makefile b/sound/isa/sb/Makefile
index f174a5b3c8e4..96a926feb17a 100644
--- a/sound/isa/sb/Makefile
+++ b/sound/isa/sb/Makefile
@@ -4,15 +4,15 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-sb-common-objs := sb_common.o sb_mixer.o
-snd-sb8-dsp-objs := sb8_main.o sb8_midi.o
-snd-sb16-dsp-objs := sb16_main.o
-snd-sb16-csp-objs := sb16_csp.o
-snd-sb8-objs := sb8.o
-snd-sb16-objs := sb16.o
-snd-sbawe-objs := sbawe.o emu8000.o
-snd-emu8000-synth-objs := emu8000_synth.o emu8000_callback.o emu8000_patch.o emu8000_pcm.o
-snd-jazz16-objs := jazz16.o
+snd-sb-common-y := sb_common.o sb_mixer.o
+snd-sb8-dsp-y := sb8_main.o sb8_midi.o
+snd-sb16-dsp-y := sb16_main.o
+snd-sb16-csp-y := sb16_csp.o
+snd-sb8-y := sb8.o
+snd-sb16-y := sb16.o
+snd-sbawe-y := sbawe.o emu8000.o
+snd-emu8000-synth-y := emu8000_synth.o emu8000_callback.o emu8000_patch.o emu8000_pcm.o
+snd-jazz16-y := jazz16.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_SB_COMMON) += snd-sb-common.o
diff --git a/sound/isa/wavefront/Makefile b/sound/isa/wavefront/Makefile
index b8406dce81f5..3ba85fb2e6cd 100644
--- a/sound/isa/wavefront/Makefile
+++ b/sound/isa/wavefront/Makefile
@@ -4,7 +4,7 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-wavefront-objs := wavefront.o wavefront_fx.o wavefront_synth.o wavefront_midi.o
+snd-wavefront-y := wavefront.o wavefront_fx.o wavefront_synth.o wavefront_midi.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_WAVEFRONT) += snd-wavefront.o
diff --git a/sound/isa/wss/Makefile b/sound/isa/wss/Makefile
index 34d0636b3dc3..f23e71d0d5d4 100644
--- a/sound/isa/wss/Makefile
+++ b/sound/isa/wss/Makefile
@@ -4,7 +4,7 @@
 # Copyright (c) 2008 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-wss-lib-objs := wss_lib.o
+snd-wss-lib-y := wss_lib.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_WSS_LIB) += snd-wss-lib.o
-- 
2.43.0

