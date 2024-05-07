Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFC3161B7C
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715090119; cv=none; b=G8hKYsoRr+H/+DYvXGRMeyH9VY5gEdRdmxfXtj77ActtidkO/e/c3s43C2bEcIhftJmUbYsQFx4IegKDrpqVP7xmHSK+moLoFcd+X59X2HqCXtcVPUbef722qFT5JRfoLZeBkvAWDJlJCHwqbgAJ/C562UwUKwk+t+sYuPyTZTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715090119; c=relaxed/simple;
	bh=MDfrpJkvci72u+S22/AfgbHxIbkO7NCwcKIT7vwg/ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iq3YvkERV5HuaUb8PKQ2uFMecX+p+XEzTDgCkdP6ttqS1yQ1ckMdVaDkzbdrGjX8FC0xMROY1+O2yDFMl88VbjFnxNLM0uQcLMPSHh2dBV9aUUcaeLBplLiYJCd78OEEQDinnNYkX27Iyt4YRiCUkpmGjumohokthqdObzlWA2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sur55NoT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YqEEnTca; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sur55NoT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YqEEnTca; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sur55NoT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YqEEnTca";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sur55NoT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YqEEnTca"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1671933FBE;
	Tue,  7 May 2024 13:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715090109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z0pjImNcSZ/61lf4sVP+3XUoc7BoaSJWw7FUmBROJkY=;
	b=sur55NoTGQOk74kQtAzCzdFnkuzHAb880iWQIFIC6gMbNpyB8XenZbdVDec+T5qF+sW0/y
	A/xW65Hj45QrorTMwyLNLZrakmOyPbFZAUO45Yj7AyaSfPCNxljEm6C8C1kPl63tnGOoJO
	BU7CyAwG/HbgskxAXZ4h3hNaqkq03gY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715090109;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z0pjImNcSZ/61lf4sVP+3XUoc7BoaSJWw7FUmBROJkY=;
	b=YqEEnTca6K/RymCCLsW9CqmmGLXF/IO1iyFyi1R/P8y+7MAaKXXCj+klIt+dzd5N0M1AOV
	jQ07ROA44huUK1CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715090109; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z0pjImNcSZ/61lf4sVP+3XUoc7BoaSJWw7FUmBROJkY=;
	b=sur55NoTGQOk74kQtAzCzdFnkuzHAb880iWQIFIC6gMbNpyB8XenZbdVDec+T5qF+sW0/y
	A/xW65Hj45QrorTMwyLNLZrakmOyPbFZAUO45Yj7AyaSfPCNxljEm6C8C1kPl63tnGOoJO
	BU7CyAwG/HbgskxAXZ4h3hNaqkq03gY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715090109;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z0pjImNcSZ/61lf4sVP+3XUoc7BoaSJWw7FUmBROJkY=;
	b=YqEEnTca6K/RymCCLsW9CqmmGLXF/IO1iyFyi1R/P8y+7MAaKXXCj+klIt+dzd5N0M1AOV
	jQ07ROA44huUK1CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 06CD513A3C;
	Tue,  7 May 2024 13:55:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aFIhAb0yOmagMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 13:55:09 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 9/9] ALSA: misc: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 15:55:09 +0200
Message-ID: <20240507135513.14919-10-tiwai@suse.de>
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
 sound/arm/Makefile              |  4 ++--
 sound/atmel/Makefile            |  2 +-
 sound/i2c/Makefile              |  6 +++---
 sound/i2c/other/Makefile        | 10 +++++-----
 sound/mips/Makefile             |  4 ++--
 sound/parisc/Makefile           |  2 +-
 sound/pcmcia/pdaudiocf/Makefile |  2 +-
 sound/pcmcia/vx/Makefile        |  2 +-
 sound/ppc/Makefile              |  2 +-
 sound/sh/Makefile               |  4 ++--
 sound/sparc/Makefile            |  6 +++---
 sound/spi/Makefile              |  2 +-
 sound/synth/Makefile            |  2 +-
 sound/synth/emux/Makefile       |  2 +-
 sound/virtio/Makefile           |  2 +-
 sound/x86/Makefile              |  2 +-
 sound/xen/Makefile              |  2 +-
 17 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/sound/arm/Makefile b/sound/arm/Makefile
index 34c769489877..899edb4bb278 100644
--- a/sound/arm/Makefile
+++ b/sound/arm/Makefile
@@ -4,11 +4,11 @@
 #
 
 obj-$(CONFIG_SND_ARMAACI)	+= snd-aaci.o
-snd-aaci-objs			:= aaci.o
+snd-aaci-y			:= aaci.o
 
 obj-$(CONFIG_SND_PXA2XX_LIB)	+= snd-pxa2xx-lib.o
 snd-pxa2xx-lib-y		:= pxa2xx-pcm-lib.o
 snd-pxa2xx-lib-$(CONFIG_SND_PXA2XX_LIB_AC97)	+= pxa2xx-ac97-lib.o
 
 obj-$(CONFIG_SND_PXA2XX_AC97)	+= snd-pxa2xx-ac97.o
-snd-pxa2xx-ac97-objs		:= pxa2xx-ac97.o
+snd-pxa2xx-ac97-y		:= pxa2xx-ac97.o
diff --git a/sound/atmel/Makefile b/sound/atmel/Makefile
index 57bc6f65be19..a8917d1854c7 100644
--- a/sound/atmel/Makefile
+++ b/sound/atmel/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-atmel-ac97c-objs		:= ac97c.o
+snd-atmel-ac97c-y		:= ac97c.o
 
 obj-$(CONFIG_SND_ATMEL_AC97C)	+= snd-atmel-ac97c.o
diff --git a/sound/i2c/Makefile b/sound/i2c/Makefile
index 09978855e08e..c827f9f70a33 100644
--- a/sound/i2c/Makefile
+++ b/sound/i2c/Makefile
@@ -4,9 +4,9 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-i2c-objs := i2c.o
-snd-cs8427-objs := cs8427.o
-snd-tea6330t-objs := tea6330t.o
+snd-i2c-y := i2c.o
+snd-cs8427-y := cs8427.o
+snd-tea6330t-y := tea6330t.o
 
 obj-$(CONFIG_SND) += other/
 
diff --git a/sound/i2c/other/Makefile b/sound/i2c/other/Makefile
index 1a4ce1236146..0a2c0d147ab8 100644
--- a/sound/i2c/other/Makefile
+++ b/sound/i2c/other/Makefile
@@ -4,11 +4,11 @@
 # Copyright (c) 2003 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-ak4114-objs := ak4114.o
-snd-ak4117-objs := ak4117.o
-snd-ak4113-objs := ak4113.o
-snd-ak4xxx-adda-objs := ak4xxx-adda.o
-snd-pt2258-objs := pt2258.o
+snd-ak4114-y := ak4114.o
+snd-ak4117-y := ak4117.o
+snd-ak4113-y := ak4113.o
+snd-ak4xxx-adda-y := ak4xxx-adda.o
+snd-pt2258-y := pt2258.o
 
 # Module Dependency
 obj-$(CONFIG_SND_PDAUDIOCF) += snd-ak4117.o
diff --git a/sound/mips/Makefile b/sound/mips/Makefile
index 7c86268b2bf3..bfbf3bda487b 100644
--- a/sound/mips/Makefile
+++ b/sound/mips/Makefile
@@ -3,8 +3,8 @@
 # Makefile for ALSA
 #
 
-snd-sgi-o2-objs := sgio2audio.o ad1843.o
-snd-sgi-hal2-objs := hal2.o
+snd-sgi-o2-y := sgio2audio.o ad1843.o
+snd-sgi-hal2-y := hal2.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_SGI_O2) += snd-sgi-o2.o
diff --git a/sound/parisc/Makefile b/sound/parisc/Makefile
index 10891c3b7d91..84c71490fb72 100644
--- a/sound/parisc/Makefile
+++ b/sound/parisc/Makefile
@@ -3,7 +3,7 @@
 # Makefile for ALSA
 #
 
-snd-harmony-objs := harmony.o
+snd-harmony-y := harmony.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_HARMONY) += snd-harmony.o
diff --git a/sound/pcmcia/pdaudiocf/Makefile b/sound/pcmcia/pdaudiocf/Makefile
index ea0d67576df9..34a288c1eebd 100644
--- a/sound/pcmcia/pdaudiocf/Makefile
+++ b/sound/pcmcia/pdaudiocf/Makefile
@@ -4,6 +4,6 @@
 # Copyright (c) 2004 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-pdaudiocf-objs := pdaudiocf.o pdaudiocf_core.o pdaudiocf_irq.o pdaudiocf_pcm.o
+snd-pdaudiocf-y := pdaudiocf.o pdaudiocf_core.o pdaudiocf_irq.o pdaudiocf_pcm.o
 
 obj-$(CONFIG_SND_PDAUDIOCF) += snd-pdaudiocf.o
diff --git a/sound/pcmcia/vx/Makefile b/sound/pcmcia/vx/Makefile
index b25006e4d25a..abd187544946 100644
--- a/sound/pcmcia/vx/Makefile
+++ b/sound/pcmcia/vx/Makefile
@@ -4,6 +4,6 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-vxpocket-objs := vxpocket.o vxp_ops.o vxp_mixer.o
+snd-vxpocket-y := vxpocket.o vxp_ops.o vxp_mixer.o
 
 obj-$(CONFIG_SND_VXPOCKET) += snd-vxpocket.o
diff --git a/sound/ppc/Makefile b/sound/ppc/Makefile
index 0188ce3e30b8..655bcffba843 100644
--- a/sound/ppc/Makefile
+++ b/sound/ppc/Makefile
@@ -4,7 +4,7 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-powermac-objs := powermac.o pmac.o awacs.o burgundy.o daca.o tumbler.o keywest.o beep.o
+snd-powermac-y := powermac.o pmac.o awacs.o burgundy.o daca.o tumbler.o keywest.o beep.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_POWERMAC)	+= snd-powermac.o
diff --git a/sound/sh/Makefile b/sound/sh/Makefile
index c0bbc500c17c..6871dece28a5 100644
--- a/sound/sh/Makefile
+++ b/sound/sh/Makefile
@@ -3,8 +3,8 @@
 # Makefile for ALSA
 #
 
-snd-aica-objs := aica.o
-snd-sh_dac_audio-objs := sh_dac_audio.o
+snd-aica-y := aica.o
+snd-sh_dac_audio-y := sh_dac_audio.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_AICA) += snd-aica.o
diff --git a/sound/sparc/Makefile b/sound/sparc/Makefile
index e1f596571d7f..0a03123933c6 100644
--- a/sound/sparc/Makefile
+++ b/sound/sparc/Makefile
@@ -4,9 +4,9 @@
 # Copyright (c) 2002 by David S. Miller <davem@redhat.com>
 #
 
-snd-sun-amd7930-objs := amd7930.o
-snd-sun-cs4231-objs := cs4231.o
-snd-sun-dbri-objs := dbri.o
+snd-sun-amd7930-y := amd7930.o
+snd-sun-cs4231-y := cs4231.o
+snd-sun-dbri-y := dbri.o
 
 obj-$(CONFIG_SND_SUN_AMD7930) += snd-sun-amd7930.o
 obj-$(CONFIG_SND_SUN_CS4231) += snd-sun-cs4231.o
diff --git a/sound/spi/Makefile b/sound/spi/Makefile
index a3834919b0f6..d6a198a44917 100644
--- a/sound/spi/Makefile
+++ b/sound/spi/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for SPI drivers
 
-snd-at73c213-objs		:= at73c213.o
+snd-at73c213-y		:= at73c213.o
 
 obj-$(CONFIG_SND_AT73C213)	+= snd-at73c213.o
diff --git a/sound/synth/Makefile b/sound/synth/Makefile
index b9f71d5dbc8c..369f3be2cd17 100644
--- a/sound/synth/Makefile
+++ b/sound/synth/Makefile
@@ -4,7 +4,7 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-util-mem-objs := util_mem.o
+snd-util-mem-y := util_mem.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_EMU10K1) += snd-util-mem.o
diff --git a/sound/synth/emux/Makefile b/sound/synth/emux/Makefile
index ed28c81ac12e..59357da6d1ef 100644
--- a/sound/synth/emux/Makefile
+++ b/sound/synth/emux/Makefile
@@ -4,7 +4,7 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-emux-synth-objs := emux.o emux_synth.o emux_seq.o emux_nrpn.o \
+snd-emux-synth-y := emux.o emux_synth.o emux_seq.o emux_nrpn.o \
 		       emux_effect.o emux_hwdep.o soundfont.o
 snd-emux-synth-$(CONFIG_SND_PROC_FS) += emux_proc.o
 ifneq ($(CONFIG_SND_SEQUENCER_OSS),)
diff --git a/sound/virtio/Makefile b/sound/virtio/Makefile
index a839f8c8b5e6..3ca41b3c8b95 100644
--- a/sound/virtio/Makefile
+++ b/sound/virtio/Makefile
@@ -2,7 +2,7 @@
 
 obj-$(CONFIG_SND_VIRTIO) += virtio_snd.o
 
-virtio_snd-objs := \
+virtio_snd-y := \
 	virtio_card.o \
 	virtio_chmap.o \
 	virtio_ctl_msg.o \
diff --git a/sound/x86/Makefile b/sound/x86/Makefile
index 6b5ffb329d47..44d2a339615d 100644
--- a/sound/x86/Makefile
+++ b/sound/x86/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-hdmi-lpe-audio-objs += \
+snd-hdmi-lpe-audio-y += \
 	intel_hdmi_audio.o
 
 obj-$(CONFIG_HDMI_LPE_AUDIO) += snd-hdmi-lpe-audio.o
diff --git a/sound/xen/Makefile b/sound/xen/Makefile
index 24031775b715..5dab1616eac0 100644
--- a/sound/xen/Makefile
+++ b/sound/xen/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0 OR MIT
 
-snd_xen_front-objs := xen_snd_front.o \
+snd_xen_front-y := xen_snd_front.o \
 		      xen_snd_front_cfg.o \
 		      xen_snd_front_evtchnl.o \
 		      xen_snd_front_alsa.o
-- 
2.43.0

