Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E1115F400
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715090115; cv=none; b=U/5KqO90Sowi0rkjdC6aiRXfBgRuWd76dykqbfNDfEsZXaKqH0uSuAPf8damULU3rXtZNUZkJXjyr3PsSBJFkz77Mlyz79pjVP6uyqxOAQCj5PSD3LWMjYEhZBQ3/we8idnb+bqpbMZt6HuYaD6mdyjJvN/axg8IpSA1h53H/hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715090115; c=relaxed/simple;
	bh=IIGMIRjgRB5lA2omki2tWjCz3avB95zDPChopSV5ICI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ixBmfArfvRIAg8dYeJW2WjtVx2NRPIDf7bWgtzmo/GXKGjgkjq1nW9WRZUYWezUYaMViVRMj/BjtEvvyF20sxfkfXLrcTqqDKdu1x5hxi9X0Lji48VVP+7RXDORInnay8iIDWrdL94Rq6lw+JTV/dcO2GdOY/CPCyu/BB5JQfjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D7FE833FB8;
	Tue,  7 May 2024 13:55:08 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C87C213A3D;
	Tue,  7 May 2024 13:55:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WPxwMLwyOmagMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 13:55:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 6/9] ALSA: drivers: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 15:55:06 +0200
Message-ID: <20240507135513.14919-7-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: D7FE833FB8
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/Makefile        | 18 +++++++++---------
 sound/drivers/mpu401/Makefile |  4 ++--
 sound/drivers/opl3/Makefile   |  2 +-
 sound/drivers/opl4/Makefile   |  4 ++--
 sound/drivers/pcsp/Makefile   |  2 +-
 sound/drivers/vx/Makefile     |  2 +-
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/drivers/Makefile b/sound/drivers/Makefile
index 2c0c7092d396..a08bdd70ec9c 100644
--- a/sound/drivers/Makefile
+++ b/sound/drivers/Makefile
@@ -4,15 +4,15 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-dummy-objs := dummy.o
-snd-aloop-objs := aloop.o
-snd-mtpav-objs := mtpav.o
-snd-mts64-objs := mts64.o
-snd-pcmtest-objs := pcmtest.o
-snd-portman2x4-objs := portman2x4.o
-snd-serial-u16550-objs := serial-u16550.o
-snd-serial-generic-objs := serial-generic.o
-snd-virmidi-objs := virmidi.o
+snd-dummy-y := dummy.o
+snd-aloop-y := aloop.o
+snd-mtpav-y := mtpav.o
+snd-mts64-y := mts64.o
+snd-pcmtest-y := pcmtest.o
+snd-portman2x4-y := portman2x4.o
+snd-serial-u16550-y := serial-u16550.o
+snd-serial-generic-y := serial-generic.o
+snd-virmidi-y := virmidi.o
 
 # Toplevel Module Dependency
 obj-$(CONFIG_SND_DUMMY) += snd-dummy.o
diff --git a/sound/drivers/mpu401/Makefile b/sound/drivers/mpu401/Makefile
index 3dfd5b374c4f..0a96e238ee92 100644
--- a/sound/drivers/mpu401/Makefile
+++ b/sound/drivers/mpu401/Makefile
@@ -4,8 +4,8 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-mpu401-objs := mpu401.o
-snd-mpu401-uart-objs := mpu401_uart.o
+snd-mpu401-y := mpu401.o
+snd-mpu401-uart-y := mpu401_uart.o
 
 obj-$(CONFIG_SND_MPU401_UART) += snd-mpu401-uart.o
 
diff --git a/sound/drivers/opl3/Makefile b/sound/drivers/opl3/Makefile
index 83bca9f1fbdf..cf4826308365 100644
--- a/sound/drivers/opl3/Makefile
+++ b/sound/drivers/opl3/Makefile
@@ -4,7 +4,7 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-opl3-lib-objs := opl3_lib.o opl3_synth.o
+snd-opl3-lib-y := opl3_lib.o opl3_synth.o
 snd-opl3-synth-y := opl3_seq.o opl3_midi.o opl3_drums.o
 ifneq ($(CONFIG_SND_SEQUENCER_OSS),)
 snd-opl3-synth-y += opl3_oss.o
diff --git a/sound/drivers/opl4/Makefile b/sound/drivers/opl4/Makefile
index 6e86a4092b4c..a841630b45c2 100644
--- a/sound/drivers/opl4/Makefile
+++ b/sound/drivers/opl4/Makefile
@@ -4,9 +4,9 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-opl4-lib-objs := opl4_lib.o opl4_mixer.o
+snd-opl4-lib-y := opl4_lib.o opl4_mixer.o
 snd-opl4-lib-$(CONFIG_SND_PROC_FS) += opl4_proc.o
-snd-opl4-synth-objs := opl4_seq.o opl4_synth.o yrw801.o
+snd-opl4-synth-y := opl4_seq.o opl4_synth.o yrw801.o
 
 obj-$(CONFIG_SND_OPL4_LIB) += snd-opl4-lib.o
 obj-$(CONFIG_SND_OPL4_LIB_SEQ) += snd-opl4-synth.o
diff --git a/sound/drivers/pcsp/Makefile b/sound/drivers/pcsp/Makefile
index 77dc0ee1b598..309c09497261 100644
--- a/sound/drivers/pcsp/Makefile
+++ b/sound/drivers/pcsp/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-pcsp-objs := pcsp.o pcsp_lib.o pcsp_mixer.o pcsp_input.o
+snd-pcsp-y := pcsp.o pcsp_lib.o pcsp_mixer.o pcsp_input.o
 obj-$(CONFIG_SND_PCSP) += snd-pcsp.o
diff --git a/sound/drivers/vx/Makefile b/sound/drivers/vx/Makefile
index d9f9ac670378..ae1b3e09283f 100644
--- a/sound/drivers/vx/Makefile
+++ b/sound/drivers/vx/Makefile
@@ -4,6 +4,6 @@
 # Copyright (c) 2001 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-vx-lib-objs := vx_core.o vx_hwdep.o vx_pcm.o vx_mixer.o vx_cmd.o vx_uer.o
+snd-vx-lib-y := vx_core.o vx_hwdep.o vx_pcm.o vx_mixer.o vx_cmd.o vx_uer.o
 
 obj-$(CONFIG_SND_VX_LIB) += snd-vx-lib.o
-- 
2.43.0

