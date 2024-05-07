Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8782615F3F3
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715090115; cv=none; b=lxxZBDSiD7s3kBacwJj7Gb3ip9DdjJo2CSMQgNoqRTr6UuMu+JbLlblGAHQF38SoR5MIfQa8fF1HX63r5pUqnc3Zt4P3p8bT+HnwrmF7p5mYq4NwN5mrAlXRk7uydjTEUE0AuQEHU09jUVTYeAmt10u3D6LhC2TFb07voEspMgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715090115; c=relaxed/simple;
	bh=2hrgdssFmHyH+JzE5X4EeLIUH9JtShT3ORkgzHE/YMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CrqXjU3PpUZJw/ExIxabmNHgsd32BbuJRaDLUptkAIeDXhmYlJJ2ANp/2jeRG4Y9gkYsAzEABe/ExYXUCIdjN2hujUgjPD43xzYUZ96ApssrNZyvqGtC0t88e9QdBXSLIP8pSkZcdqYwsxU8bblPM13q7u3G0PosTdGC5CCTKS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Uey6+hOD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3l5N78qY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Uey6+hOD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3l5N78qY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Uey6+hOD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3l5N78qY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Uey6+hOD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3l5N78qY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8FE0A20AE2;
	Tue,  7 May 2024 13:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715090108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sg9qYFoXGQ2oTKZbfCnVENqHAvJK/qLVcr4vd7KK9zI=;
	b=Uey6+hODrn3Qv6YnFf1SDQ7a2s6UU38KMTkEH+wk8eLrvgu6wtj/dSN//2To+FeapH7c6y
	okP2eBgmc7hrfH2pC849SmD/Qze6zHU0bXmmTwruFMkU1LAUOfEzyeksgEJPP5GCUZycVE
	JorzqJFHpD9jghN/ihl2uSuvJ6H1Se4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715090108;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sg9qYFoXGQ2oTKZbfCnVENqHAvJK/qLVcr4vd7KK9zI=;
	b=3l5N78qYbE+7kU2mmC38f8DDwu02eluy43U5TqS6BgjW4fMaifG2LcpSZmMjdzNYJjj37M
	fqbNdrvq6AeM1YDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715090108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sg9qYFoXGQ2oTKZbfCnVENqHAvJK/qLVcr4vd7KK9zI=;
	b=Uey6+hODrn3Qv6YnFf1SDQ7a2s6UU38KMTkEH+wk8eLrvgu6wtj/dSN//2To+FeapH7c6y
	okP2eBgmc7hrfH2pC849SmD/Qze6zHU0bXmmTwruFMkU1LAUOfEzyeksgEJPP5GCUZycVE
	JorzqJFHpD9jghN/ihl2uSuvJ6H1Se4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715090108;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sg9qYFoXGQ2oTKZbfCnVENqHAvJK/qLVcr4vd7KK9zI=;
	b=3l5N78qYbE+7kU2mmC38f8DDwu02eluy43U5TqS6BgjW4fMaifG2LcpSZmMjdzNYJjj37M
	fqbNdrvq6AeM1YDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7527013A3A;
	Tue,  7 May 2024 13:55:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MIQRHLwyOmagMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 13:55:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 1/9] ALSA: core: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 15:55:01 +0200
Message-ID: <20240507135513.14919-2-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Spam-Score: -6.80
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

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/Makefile              |  2 +-
 sound/core/Makefile         | 18 +++++++++---------
 sound/core/oss/Makefile     |  2 +-
 sound/core/seq/Makefile     | 14 +++++++-------
 sound/core/seq/oss/Makefile |  2 +-
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/Makefile b/sound/Makefile
index 04ef04b1168f..5942311a4232 100644
--- a/sound/Makefile
+++ b/sound/Makefile
@@ -17,4 +17,4 @@ ifeq ($(CONFIG_SND),y)
   obj-y += last.o
 endif
 
-soundcore-objs  := sound_core.o
+soundcore-y  := sound_core.o
diff --git a/sound/core/Makefile b/sound/core/Makefile
index b8aa886198ab..31a0623cc89d 100644
--- a/sound/core/Makefile
+++ b/sound/core/Makefile
@@ -24,18 +24,18 @@ snd-pcm-$(CONFIG_SND_PCM_IEC958) += pcm_iec958.o
 CFLAGS_pcm_lib.o := -I$(src)
 CFLAGS_pcm_native.o := -I$(src)
 
-snd-pcm-dmaengine-objs := pcm_dmaengine.o
+snd-pcm-dmaengine-y := pcm_dmaengine.o
 
-snd-ctl-led-objs  := control_led.o
-snd-rawmidi-objs  := rawmidi.o
-snd-ump-objs      := ump.o
+snd-ctl-led-y  := control_led.o
+snd-rawmidi-y  := rawmidi.o
+snd-ump-y      := ump.o
 snd-ump-$(CONFIG_SND_UMP_LEGACY_RAWMIDI) += ump_convert.o
-snd-timer-objs    := timer.o
-snd-hrtimer-objs  := hrtimer.o
-snd-hwdep-objs    := hwdep.o
-snd-seq-device-objs := seq_device.o
+snd-timer-y    := timer.o
+snd-hrtimer-y  := hrtimer.o
+snd-hwdep-y    := hwdep.o
+snd-seq-device-y := seq_device.o
 
-snd-compress-objs := compress_offload.o
+snd-compress-y := compress_offload.o
 
 obj-$(CONFIG_SND) 		+= snd.o
 obj-$(CONFIG_SND_CTL_LED)	+= snd-ctl-led.o
diff --git a/sound/core/oss/Makefile b/sound/core/oss/Makefile
index ae25edcc3b42..d5f48ae6ba96 100644
--- a/sound/core/oss/Makefile
+++ b/sound/core/oss/Makefile
@@ -4,7 +4,7 @@
 # Copyright (c) 1999 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-mixer-oss-objs := mixer_oss.o
+snd-mixer-oss-y := mixer_oss.o
 
 snd-pcm-oss-y := pcm_oss.o
 snd-pcm-oss-$(CONFIG_SND_PCM_OSS_PLUGINS) += pcm_plugin.o \
diff --git a/sound/core/seq/Makefile b/sound/core/seq/Makefile
index 990eec7c83ad..0904aa48d88b 100644
--- a/sound/core/seq/Makefile
+++ b/sound/core/seq/Makefile
@@ -4,17 +4,17 @@
 # Copyright (c) 1999 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-seq-objs := seq.o seq_lock.o seq_clientmgr.o seq_memory.o seq_queue.o \
+snd-seq-y := seq.o seq_lock.o seq_clientmgr.o seq_memory.o seq_queue.o \
                 seq_fifo.o seq_prioq.o seq_timer.o \
                 seq_system.o seq_ports.o
 snd-seq-$(CONFIG_SND_PROC_FS) += seq_info.o
 snd-seq-$(CONFIG_SND_SEQ_UMP) += seq_ump_convert.o
-snd-seq-midi-objs := seq_midi.o
-snd-seq-midi-emul-objs := seq_midi_emul.o
-snd-seq-midi-event-objs := seq_midi_event.o
-snd-seq-dummy-objs := seq_dummy.o
-snd-seq-virmidi-objs := seq_virmidi.o
-snd-seq-ump-client-objs := seq_ump_client.o
+snd-seq-midi-y := seq_midi.o
+snd-seq-midi-emul-y := seq_midi_emul.o
+snd-seq-midi-event-y := seq_midi_event.o
+snd-seq-dummy-y := seq_dummy.o
+snd-seq-virmidi-y := seq_virmidi.o
+snd-seq-ump-client-y := seq_ump_client.o
 
 obj-$(CONFIG_SND_SEQUENCER) += snd-seq.o
 obj-$(CONFIG_SND_SEQUENCER_OSS) += oss/
diff --git a/sound/core/seq/oss/Makefile b/sound/core/seq/oss/Makefile
index f1a60878549a..4e4741834208 100644
--- a/sound/core/seq/oss/Makefile
+++ b/sound/core/seq/oss/Makefile
@@ -4,7 +4,7 @@
 # Copyright (c) 1999 by Jaroslav Kysela <perex@perex.cz>
 #
 
-snd-seq-oss-objs  := seq_oss.o seq_oss_init.o seq_oss_timer.o seq_oss_ioctl.o \
+snd-seq-oss-y  := seq_oss.o seq_oss_init.o seq_oss_timer.o seq_oss_ioctl.o \
 		     seq_oss_event.o seq_oss_rw.o seq_oss_synth.o \
 		     seq_oss_midi.o seq_oss_readq.o seq_oss_writeq.o
 
-- 
2.43.0

