Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861C215ECE6
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715090117; cv=none; b=tL6+cqPC/93r3tn4Y3yjLkdlOvRWkqG0xI40zCV+q70yu9k49T9lBfVc8JaIVtvbhQGkEwE0yIkqd22tcqnZaVXUsm1Z7yDElb5VgxNSFM/CXXVj9d01Z9No+d0so1u/2s9K+mGMQ/E7gtDlGgrHCRsWsjyB8i43D/RaIgIuYLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715090117; c=relaxed/simple;
	bh=YOZ6/M07op27qYCSvFJDz6GDBIQ6o1K8SDN7fsK7OlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=caoDOwA3eLg0mwXZoMfgALBJSRflRNi+yFi3OSZSiYkZ/3q1o7VaISB4GS3xWDCxGkwNB2UxaFiC9yFZm8zg8fCmEV8kOs0AUCGy1oc6hxjogym6hoRFuv8MZnNn5K6IhM0nGJ5OT4VEtItPzLShlGqGP+qYNebqfZWnaEM1Nkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tdYaqz8e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aVK55FyD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tdYaqz8e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aVK55FyD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tdYaqz8e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aVK55FyD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tdYaqz8e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aVK55FyD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A756C20AE3;
	Tue,  7 May 2024 13:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715090108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YyE6Fh/CIzqexpfAKmbDgay3rUIIn5bx+GuMi9zx4Ck=;
	b=tdYaqz8e3DUGE7fW9Wr6J8BNd32IGSwu3kcUFLxnUCwfRhM+SunXBbieTUKLcC6A5merWo
	rriVHiZL+6qj3X7JBQ5gSwYSgmeWZ561bDWXsfFBG0+y5D2u827XZy2GH9gI8Lk0BurD3c
	LuFGAdmE6Cx7ASHXtywl6+d5QQgPRc4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715090108;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YyE6Fh/CIzqexpfAKmbDgay3rUIIn5bx+GuMi9zx4Ck=;
	b=aVK55FyD/xvP+j1mP7ek6b+yfVjH0oC10AiDyeFFJHT27YsKo7XTvhpF1wJzvX1llu/xae
	xg7mj1GNocOh00Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715090108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YyE6Fh/CIzqexpfAKmbDgay3rUIIn5bx+GuMi9zx4Ck=;
	b=tdYaqz8e3DUGE7fW9Wr6J8BNd32IGSwu3kcUFLxnUCwfRhM+SunXBbieTUKLcC6A5merWo
	rriVHiZL+6qj3X7JBQ5gSwYSgmeWZ561bDWXsfFBG0+y5D2u827XZy2GH9gI8Lk0BurD3c
	LuFGAdmE6Cx7ASHXtywl6+d5QQgPRc4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715090108;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YyE6Fh/CIzqexpfAKmbDgay3rUIIn5bx+GuMi9zx4Ck=;
	b=aVK55FyD/xvP+j1mP7ek6b+yfVjH0oC10AiDyeFFJHT27YsKo7XTvhpF1wJzvX1llu/xae
	xg7mj1GNocOh00Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8535D13A3C;
	Tue,  7 May 2024 13:55:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ANMCILwyOmagMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 13:55:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 2/9] ALSA: pci: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 15:55:02 +0200
Message-ID: <20240507135513.14919-3-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/Makefile           | 48 ++++++++++++++++-----------------
 sound/pci/ali5451/Makefile   |  2 +-
 sound/pci/asihpi/Makefile    |  2 +-
 sound/pci/au88x0/Makefile    |  6 ++---
 sound/pci/aw2/Makefile       |  2 +-
 sound/pci/ca0106/Makefile    |  2 +-
 sound/pci/ctxfi/Makefile     |  2 +-
 sound/pci/echoaudio/Makefile | 28 +++++++++----------
 sound/pci/emu10k1/Makefile   |  6 ++---
 sound/pci/hda/Makefile       | 52 ++++++++++++++++++------------------
 sound/pci/ice1712/Makefile   |  6 ++---
 sound/pci/korg1212/Makefile  |  2 +-
 sound/pci/lx6464es/Makefile  |  2 +-
 sound/pci/mixart/Makefile    |  2 +-
 sound/pci/nm256/Makefile     |  2 +-
 sound/pci/oxygen/Makefile    |  8 +++---
 sound/pci/pcxhr/Makefile     |  2 +-
 sound/pci/riptide/Makefile   |  2 +-
 sound/pci/rme9652/Makefile   |  6 ++---
 sound/pci/trident/Makefile   |  2 +-
 sound/pci/vx222/Makefile     |  2 +-
 sound/pci/ymfpci/Makefile    |  2 +-
 22 files changed, 94 insertions(+), 94 deletions(-)

diff --git a/sound/pci/Makefile b/sound/pci/Makefile
index 04cac7469139..18b673018dfd 100644
--- a/sound/pci/Makefile
+++ b/sound/pci/Makefile
@@ -4,30 +4,30 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-ad1889-objs := ad1889.o
-snd-als300-objs := als300.o
-snd-als4000-objs := als4000.o
-snd-atiixp-objs := atiixp.o
-snd-atiixp-modem-objs := atiixp_modem.o
-snd-azt3328-objs := azt3328.o
-snd-bt87x-objs := bt87x.o
-snd-cmipci-objs := cmipci.o
-snd-cs4281-objs := cs4281.o
-snd-cs5530-objs := cs5530.o
-snd-ens1370-objs := ens1370.o ak4531_codec.o
-snd-ens1371-objs := ens1371.o
-snd-es1938-objs := es1938.o
-snd-es1968-objs := es1968.o
-snd-fm801-objs := fm801.o
-snd-intel8x0-objs := intel8x0.o
-snd-intel8x0m-objs := intel8x0m.o
-snd-maestro3-objs := maestro3.o
-snd-rme32-objs := rme32.o
-snd-rme96-objs := rme96.o
-snd-sis7019-objs := sis7019.o
-snd-sonicvibes-objs := sonicvibes.o
-snd-via82xx-objs := via82xx.o
-snd-via82xx-modem-objs := via82xx_modem.o
+snd-ad1889-y := ad1889.o
+snd-als300-y := als300.o
+snd-als4000-y := als4000.o
+snd-atiixp-y := atiixp.o
+snd-atiixp-modem-y := atiixp_modem.o
+snd-azt3328-y := azt3328.o
+snd-bt87x-y := bt87x.o
+snd-cmipci-y := cmipci.o
+snd-cs4281-y := cs4281.o
+snd-cs5530-y := cs5530.o
+snd-ens1370-y := ens1370.o ak4531_codec.o
+snd-ens1371-y := ens1371.o
+snd-es1938-y := es1938.o
+snd-es1968-y := es1968.o
+snd-fm801-y := fm801.o
+snd-intel8x0-y := intel8x0.o
+snd-intel8x0m-y := intel8x0m.o
+snd-maestro3-y := maestro3.o
+snd-rme32-y := rme32.o
+snd-rme96-y := rme96.o
+snd-sis7019-y := sis7019.o
+snd-sonicvibes-y := sonicvibes.o
+snd-via82xx-y := via82xx.o
+snd-via82xx-modem-y := via82xx_modem.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_AD1889) += snd-ad1889.o
diff --git a/sound/pci/ali5451/Makefile b/sound/pci/ali5451/Makefile
index 8156198fbaeb..e319a4c1d6b2 100644
--- a/sound/pci/ali5451/Makefile
+++ b/sound/pci/ali5451/Makefile
@@ -4,7 +4,7 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-ali5451-objs := ali5451.o
+snd-ali5451-y := ali5451.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_ALI5451) += snd-ali5451.o
diff --git a/sound/pci/asihpi/Makefile b/sound/pci/asihpi/Makefile
index 8351f8f5b523..d558a974fa7e 100644
--- a/sound/pci/asihpi/Makefile
+++ b/sound/pci/asihpi/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-asihpi-objs := asihpi.o hpioctl.o hpimsginit.o\
+snd-asihpi-y := asihpi.o hpioctl.o hpimsginit.o\
 	hpicmn.o hpifunc.o hpidebug.o hpidspcd.o\
 	hpios.o hpi6000.o hpi6205.o hpimsgx.o
 
diff --git a/sound/pci/au88x0/Makefile b/sound/pci/au88x0/Makefile
index 78ab11562f4d..5ec5abdee28d 100644
--- a/sound/pci/au88x0/Makefile
+++ b/sound/pci/au88x0/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
-snd-au8810-objs := au8810.o
-snd-au8820-objs := au8820.o
-snd-au8830-objs := au8830.o
+snd-au8810-y := au8810.o
+snd-au8820-y := au8820.o
+snd-au8830-y := au8830.o
 
 obj-$(CONFIG_SND_AU8810) += snd-au8810.o
 obj-$(CONFIG_SND_AU8820) += snd-au8820.o
diff --git a/sound/pci/aw2/Makefile b/sound/pci/aw2/Makefile
index f9045afb4cda..c246f7c7f2bf 100644
--- a/sound/pci/aw2/Makefile
+++ b/sound/pci/aw2/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-aw2-objs := aw2-alsa.o aw2-saa7146.o
+snd-aw2-y := aw2-alsa.o aw2-saa7146.o
 
 obj-$(CONFIG_SND_AW2) += snd-aw2.o
diff --git a/sound/pci/ca0106/Makefile b/sound/pci/ca0106/Makefile
index 9e51d3df3ee8..693dc4d80925 100644
--- a/sound/pci/ca0106/Makefile
+++ b/sound/pci/ca0106/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-ca0106-objs := ca0106_main.o ca0106_mixer.o ca_midi.o
+snd-ca0106-y := ca0106_main.o ca0106_mixer.o ca_midi.o
 snd-ca0106-$(CONFIG_SND_PROC_FS) += ca0106_proc.o
 
 obj-$(CONFIG_SND_CA0106) += snd-ca0106.o
diff --git a/sound/pci/ctxfi/Makefile b/sound/pci/ctxfi/Makefile
index 70888706a0af..ff2b1cba3a3c 100644
--- a/sound/pci/ctxfi/Makefile
+++ b/sound/pci/ctxfi/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-ctxfi-objs := xfi.o ctatc.o ctvmem.o ctpcm.o ctmixer.o ctresource.o \
+snd-ctxfi-y := xfi.o ctatc.o ctvmem.o ctpcm.o ctmixer.o ctresource.o \
 	ctsrc.o ctamixer.o ctdaio.o ctimap.o cthardware.o cttimer.o \
 	cthw20k2.o cthw20k1.o
 
diff --git a/sound/pci/echoaudio/Makefile b/sound/pci/echoaudio/Makefile
index 4865b8fe7434..96667641c7cf 100644
--- a/sound/pci/echoaudio/Makefile
+++ b/sound/pci/echoaudio/Makefile
@@ -4,20 +4,20 @@
 # Copyright (c) 2003 by Giuliano Pochini <pochini@shiny.it>
 #
 
-snd-darla20-objs := darla20.o
-snd-gina20-objs := gina20.o
-snd-layla20-objs := layla20.o
-snd-darla24-objs := darla24.o
-snd-gina24-objs := gina24.o
-snd-layla24-objs := layla24.o
-snd-mona-objs := mona.o
-snd-mia-objs := mia.o
-snd-echo3g-objs := echo3g.o
-snd-indigo-objs := indigo.o
-snd-indigoio-objs := indigoio.o
-snd-indigodj-objs := indigodj.o
-snd-indigoiox-objs := indigoiox.o
-snd-indigodjx-objs := indigodjx.o
+snd-darla20-y := darla20.o
+snd-gina20-y := gina20.o
+snd-layla20-y := layla20.o
+snd-darla24-y := darla24.o
+snd-gina24-y := gina24.o
+snd-layla24-y := layla24.o
+snd-mona-y := mona.o
+snd-mia-y := mia.o
+snd-echo3g-y := echo3g.o
+snd-indigo-y := indigo.o
+snd-indigoio-y := indigoio.o
+snd-indigodj-y := indigodj.o
+snd-indigoiox-y := indigoiox.o
+snd-indigodjx-y := indigodjx.o
 
 obj-$(CONFIG_SND_DARLA20) += snd-darla20.o
 obj-$(CONFIG_SND_GINA20) += snd-gina20.o
diff --git a/sound/pci/emu10k1/Makefile b/sound/pci/emu10k1/Makefile
index 17d5527be319..1f325abcb3ef 100644
--- a/sound/pci/emu10k1/Makefile
+++ b/sound/pci/emu10k1/Makefile
@@ -4,12 +4,12 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-emu10k1-objs := emu10k1.o emu10k1_main.o \
+snd-emu10k1-y := emu10k1.o emu10k1_main.o \
 		    irq.o memory.o voice.o emumpu401.o emupcm.o io.o \
 		    emumixer.o emufx.o timer.o p16v.o
 snd-emu10k1-$(CONFIG_SND_PROC_FS) += emuproc.o
-snd-emu10k1-synth-objs := emu10k1_synth.o emu10k1_callback.o emu10k1_patch.o
-snd-emu10k1x-objs := emu10k1x.o
+snd-emu10k1-synth-y := emu10k1_synth.o emu10k1_callback.o emu10k1_patch.o
+snd-emu10k1x-y := emu10k1x.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_EMU10K1) += snd-emu10k1.o
diff --git a/sound/pci/hda/Makefile b/sound/pci/hda/Makefile
index 13e04e1f65de..058ca0a289e4 100644
--- a/sound/pci/hda/Makefile
+++ b/sound/pci/hda/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-snd-hda-intel-objs := hda_intel.o
-snd-hda-tegra-objs := hda_tegra.o
+snd-hda-intel-y := hda_intel.o
+snd-hda-tegra-y := hda_tegra.o
 
 snd-hda-codec-y := hda_bind.o hda_codec.o hda_jack.o hda_auto_parser.o hda_sysfs.o
 snd-hda-codec-y += hda_controller.o
@@ -13,32 +13,32 @@ snd-hda-codec-$(CONFIG_SND_HDA_INPUT_BEEP) += hda_beep.o
 CFLAGS_hda_controller.o := -I$(src)
 CFLAGS_hda_intel.o := -I$(src)
 
-snd-hda-codec-generic-objs :=	hda_generic.o
-snd-hda-codec-realtek-objs :=	patch_realtek.o
-snd-hda-codec-cmedia-objs :=	patch_cmedia.o
-snd-hda-codec-analog-objs :=	patch_analog.o
-snd-hda-codec-idt-objs :=	patch_sigmatel.o
-snd-hda-codec-si3054-objs :=	patch_si3054.o
-snd-hda-codec-cirrus-objs :=	patch_cirrus.o
-snd-hda-codec-cs8409-objs :=	patch_cs8409.o patch_cs8409-tables.o
-snd-hda-codec-ca0110-objs :=	patch_ca0110.o
-snd-hda-codec-ca0132-objs :=	patch_ca0132.o
-snd-hda-codec-conexant-objs :=	patch_conexant.o
-snd-hda-codec-via-objs :=	patch_via.o
-snd-hda-codec-hdmi-objs :=	patch_hdmi.o hda_eld.o
+snd-hda-codec-generic-y :=	hda_generic.o
+snd-hda-codec-realtek-y :=	patch_realtek.o
+snd-hda-codec-cmedia-y :=	patch_cmedia.o
+snd-hda-codec-analog-y :=	patch_analog.o
+snd-hda-codec-idt-y :=		patch_sigmatel.o
+snd-hda-codec-si3054-y :=	patch_si3054.o
+snd-hda-codec-cirrus-y :=	patch_cirrus.o
+snd-hda-codec-cs8409-y :=	patch_cs8409.o patch_cs8409-tables.o
+snd-hda-codec-ca0110-y :=	patch_ca0110.o
+snd-hda-codec-ca0132-y :=	patch_ca0132.o
+snd-hda-codec-conexant-y :=	patch_conexant.o
+snd-hda-codec-via-y :=		patch_via.o
+snd-hda-codec-hdmi-y :=		patch_hdmi.o hda_eld.o
 
 # side codecs
-snd-hda-cirrus-scodec-objs :=		cirrus_scodec.o
-snd-hda-cirrus-scodec-test-objs :=	cirrus_scodec_test.o
-snd-hda-scodec-cs35l41-objs :=		cs35l41_hda.o cs35l41_hda_property.o
-snd-hda-scodec-cs35l41-i2c-objs :=	cs35l41_hda_i2c.o
-snd-hda-scodec-cs35l41-spi-objs :=	cs35l41_hda_spi.o
-snd-hda-scodec-cs35l56-objs :=		cs35l56_hda.o
-snd-hda-scodec-cs35l56-i2c-objs :=	cs35l56_hda_i2c.o
-snd-hda-scodec-cs35l56-spi-objs :=	cs35l56_hda_spi.o
-snd-hda-cs-dsp-ctls-objs :=		hda_cs_dsp_ctl.o
-snd-hda-scodec-component-objs :=	hda_component.o
-snd-hda-scodec-tas2781-i2c-objs :=	tas2781_hda_i2c.o
+snd-hda-cirrus-scodec-y :=	cirrus_scodec.o
+snd-hda-cirrus-scodec-test-y :=	cirrus_scodec_test.o
+snd-hda-scodec-cs35l41-y :=	cs35l41_hda.o cs35l41_hda_property.o
+snd-hda-scodec-cs35l41-i2c-y :=	cs35l41_hda_i2c.o
+snd-hda-scodec-cs35l41-spi-y :=	cs35l41_hda_spi.o
+snd-hda-scodec-cs35l56-y :=	cs35l56_hda.o
+snd-hda-scodec-cs35l56-i2c-y :=	cs35l56_hda_i2c.o
+snd-hda-scodec-cs35l56-spi-y :=	cs35l56_hda_spi.o
+snd-hda-cs-dsp-ctls-y :=	hda_cs_dsp_ctl.o
+snd-hda-scodec-component-y :=	hda_component.o
+snd-hda-scodec-tas2781-i2c-y :=	tas2781_hda_i2c.o
 
 # common driver
 obj-$(CONFIG_SND_HDA) := snd-hda-codec.o
diff --git a/sound/pci/ice1712/Makefile b/sound/pci/ice1712/Makefile
index 1196f22a9b45..f406a048374c 100644
--- a/sound/pci/ice1712/Makefile
+++ b/sound/pci/ice1712/Makefile
@@ -4,9 +4,9 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-ice17xx-ak4xxx-objs := ak4xxx.o
-snd-ice1712-objs := ice1712.o delta.o hoontech.o ews.o
-snd-ice1724-objs := ice1724.o amp.o revo.o aureon.o vt1720_mobo.o pontis.o prodigy192.o prodigy_hifi.o juli.o phase.o wtm.o se.o maya44.o quartet.o psc724.o wm8766.o wm8776.o
+snd-ice17xx-ak4xxx-y := ak4xxx.o
+snd-ice1712-y := ice1712.o delta.o hoontech.o ews.o
+snd-ice1724-y := ice1724.o amp.o revo.o aureon.o vt1720_mobo.o pontis.o prodigy192.o prodigy_hifi.o juli.o phase.o wtm.o se.o maya44.o quartet.o psc724.o wm8766.o wm8776.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_ICE1712) += snd-ice1712.o snd-ice17xx-ak4xxx.o
diff --git a/sound/pci/korg1212/Makefile b/sound/pci/korg1212/Makefile
index 42eb287c77af..ab0186ffbd58 100644
--- a/sound/pci/korg1212/Makefile
+++ b/sound/pci/korg1212/Makefile
@@ -4,7 +4,7 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-korg1212-objs := korg1212.o
+snd-korg1212-y := korg1212.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_KORG1212) += snd-korg1212.o
diff --git a/sound/pci/lx6464es/Makefile b/sound/pci/lx6464es/Makefile
index c295f68bac68..2b3047c7a388 100644
--- a/sound/pci/lx6464es/Makefile
+++ b/sound/pci/lx6464es/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-lx6464es-objs := lx6464es.o lx_core.o
+snd-lx6464es-y := lx6464es.o lx_core.o
 obj-$(CONFIG_SND_LX6464ES) += snd-lx6464es.o
diff --git a/sound/pci/mixart/Makefile b/sound/pci/mixart/Makefile
index 16cfeb78a0b6..b803e5e72791 100644
--- a/sound/pci/mixart/Makefile
+++ b/sound/pci/mixart/Makefile
@@ -4,6 +4,6 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-mixart-objs := mixart.o mixart_core.o mixart_hwdep.o mixart_mixer.o
+snd-mixart-y := mixart.o mixart_core.o mixart_hwdep.o mixart_mixer.o
 
 obj-$(CONFIG_SND_MIXART) += snd-mixart.o
diff --git a/sound/pci/nm256/Makefile b/sound/pci/nm256/Makefile
index 3063766ac56b..7d55fe774d20 100644
--- a/sound/pci/nm256/Makefile
+++ b/sound/pci/nm256/Makefile
@@ -4,7 +4,7 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-nm256-objs := nm256.o
+snd-nm256-y := nm256.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_NM256) += snd-nm256.o
diff --git a/sound/pci/oxygen/Makefile b/sound/pci/oxygen/Makefile
index 0dfc4f840992..cc0c24694750 100644
--- a/sound/pci/oxygen/Makefile
+++ b/sound/pci/oxygen/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
-snd-oxygen-lib-objs := oxygen_io.o oxygen_lib.o oxygen_mixer.o oxygen_pcm.o
-snd-oxygen-objs := oxygen.o xonar_dg_mixer.o xonar_dg.o
-snd-se6x-objs := se6x.o
-snd-virtuoso-objs := virtuoso.o xonar_lib.o \
+snd-oxygen-lib-y := oxygen_io.o oxygen_lib.o oxygen_mixer.o oxygen_pcm.o
+snd-oxygen-y := oxygen.o xonar_dg_mixer.o xonar_dg.o
+snd-se6x-y := se6x.o
+snd-virtuoso-y := virtuoso.o xonar_lib.o \
 	xonar_pcm179x.o xonar_cs43xx.o xonar_wm87x6.o xonar_hdmi.o
 
 obj-$(CONFIG_SND_OXYGEN_LIB) += snd-oxygen-lib.o
diff --git a/sound/pci/pcxhr/Makefile b/sound/pci/pcxhr/Makefile
index 5993d86cfb5d..0ea1e5ccb56f 100644
--- a/sound/pci/pcxhr/Makefile
+++ b/sound/pci/pcxhr/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-pcxhr-objs := pcxhr.o pcxhr_hwdep.o pcxhr_mixer.o pcxhr_core.o pcxhr_mix22.o
+snd-pcxhr-y := pcxhr.o pcxhr_hwdep.o pcxhr_mixer.o pcxhr_core.o pcxhr_mix22.o
 obj-$(CONFIG_SND_PCXHR) += snd-pcxhr.o
diff --git a/sound/pci/riptide/Makefile b/sound/pci/riptide/Makefile
index 9a505bae243e..9b4e9595859a 100644
--- a/sound/pci/riptide/Makefile
+++ b/sound/pci/riptide/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-riptide-objs := riptide.o
+snd-riptide-y := riptide.o
 
 obj-$(CONFIG_SND_RIPTIDE) += snd-riptide.o
diff --git a/sound/pci/rme9652/Makefile b/sound/pci/rme9652/Makefile
index a3351447ddc0..cc99ae892211 100644
--- a/sound/pci/rme9652/Makefile
+++ b/sound/pci/rme9652/Makefile
@@ -4,9 +4,9 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-rme9652-objs := rme9652.o
-snd-hdsp-objs := hdsp.o
-snd-hdspm-objs := hdspm.o
+snd-rme9652-y := rme9652.o
+snd-hdsp-y := hdsp.o
+snd-hdspm-y := hdspm.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_RME9652) += snd-rme9652.o
diff --git a/sound/pci/trident/Makefile b/sound/pci/trident/Makefile
index e8975bc37fcb..476d16abcfc9 100644
--- a/sound/pci/trident/Makefile
+++ b/sound/pci/trident/Makefile
@@ -4,7 +4,7 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-trident-objs := trident.o trident_main.o trident_memory.o
+snd-trident-y := trident.o trident_main.o trident_memory.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_TRIDENT) += snd-trident.o
diff --git a/sound/pci/vx222/Makefile b/sound/pci/vx222/Makefile
index dda900e45385..6889137eb438 100644
--- a/sound/pci/vx222/Makefile
+++ b/sound/pci/vx222/Makefile
@@ -4,6 +4,6 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-vx222-objs := vx222.o vx222_ops.o
+snd-vx222-y := vx222.o vx222_ops.o
 
 obj-$(CONFIG_SND_VX222) += snd-vx222.o
diff --git a/sound/pci/ymfpci/Makefile b/sound/pci/ymfpci/Makefile
index 40a1d83e1a9e..2d7856403371 100644
--- a/sound/pci/ymfpci/Makefile
+++ b/sound/pci/ymfpci/Makefile
@@ -4,7 +4,7 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-ymfpci-objs := ymfpci.o ymfpci_main.o
+snd-ymfpci-y := ymfpci.o ymfpci_main.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_YMFPCI) += snd-ymfpci.o
-- 
2.43.0

