Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFFE1EA0C1
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037664; cv=none; b=FKchMnyo7z9BOXcNRFpZMkuT6fnUm8ujLsJ+LWOXmww/SRIHAhkVttjVz6GUXLuqJ9ut6xOf0ct2SKsiCdeuiQsfSbc/mzlY7dNzNHCqnD6dEDS/9kkD1CidrbVu2Pr7wIce9h5n6ujmOxQE3F/Pz8ZH91C6QNjsN5ZIMJ3t3dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037664; c=relaxed/simple;
	bh=SljXSPEijPkXZscxCecgw1IfcZYZYPtD0OpQXoeilLg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sa6NRDQGDPga605qGSDqHwqunRgTrOFErsLwKpxB0jFTMU+Bak9O2xWBTGeR9+Z2ZeWIngvAPqGdpC4shIfPz7XzqFUUkp8ns0PoTGVoBQ9I9CZr5dFztGah2ti2fIwQC+/ktc5QHHhm3jmsK+tBaISi7TXfaB8JZ3kcPvi7dkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F830NEq2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=64AstUeY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F830NEq2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=64AstUeY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F830NEq2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="64AstUeY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F830NEq2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="64AstUeY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9FCB71FB8E;
	Wed,  7 Aug 2024 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HG0ZyXgp7a+zwGwUlCMZz/PqYOUNCS14ybR9XlSeepk=;
	b=F830NEq2rczjwV0SDdAkhNxDYVVCnmlixEEWAXAH1g9VgNE8QdDLS8d5gftrqK587JHA9n
	EB2mx+CM0alElgCq0zQi4EIFB981wDcUtrH1uS0tXhwKFtorVO+7FpV//hH2o8gQKIBOHW
	3HSUNpTo+K2h1ASTYRpDRGdMRlYj514=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HG0ZyXgp7a+zwGwUlCMZz/PqYOUNCS14ybR9XlSeepk=;
	b=64AstUeYVD2bY2ZDgHo7mRoG3/9QCWJZZFMynQ/MTMDL7e7q7+cp+4NzyI9qMsCSVecnc4
	6aoGwPHdM1gTpWBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=F830NEq2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=64AstUeY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HG0ZyXgp7a+zwGwUlCMZz/PqYOUNCS14ybR9XlSeepk=;
	b=F830NEq2rczjwV0SDdAkhNxDYVVCnmlixEEWAXAH1g9VgNE8QdDLS8d5gftrqK587JHA9n
	EB2mx+CM0alElgCq0zQi4EIFB981wDcUtrH1uS0tXhwKFtorVO+7FpV//hH2o8gQKIBOHW
	3HSUNpTo+K2h1ASTYRpDRGdMRlYj514=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HG0ZyXgp7a+zwGwUlCMZz/PqYOUNCS14ybR9XlSeepk=;
	b=64AstUeYVD2bY2ZDgHo7mRoG3/9QCWJZZFMynQ/MTMDL7e7q7+cp+4NzyI9qMsCSVecnc4
	6aoGwPHdM1gTpWBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8789913B03;
	Wed,  7 Aug 2024 13:34:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0GrrH9p3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 14/54] ALSA: pcsp: Use standard print API
Date: Wed,  7 Aug 2024 15:34:04 +0200
Message-ID: <20240807133452.9424-15-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 9FCB71FB8E
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.01

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/pcsp/pcsp.c       | 21 +++++++++---------
 sound/drivers/pcsp/pcsp_lib.c   | 38 ++++++++++++++++-----------------
 sound/drivers/pcsp/pcsp_mixer.c |  2 +-
 3 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/sound/drivers/pcsp/pcsp.c b/sound/drivers/pcsp/pcsp.c
index 7195cb49e00f..78c9b1c7590f 100644
--- a/sound/drivers/pcsp/pcsp.c
+++ b/sound/drivers/pcsp/pcsp.c
@@ -47,11 +47,12 @@ static int snd_pcsp_create(struct snd_card *card)
 
 	if (!nopcm) {
 		if (resolution > PCSP_MAX_PERIOD_NS) {
-			printk(KERN_ERR "PCSP: Timer resolution is not sufficient "
-				"(%unS)\n", resolution);
-			printk(KERN_ERR "PCSP: Make sure you have HPET and ACPI "
-				"enabled.\n");
-			printk(KERN_ERR "PCSP: Turned into nopcm mode.\n");
+			dev_err(card->dev,
+				"PCSP: Timer resolution is not sufficient (%unS)\n",
+				resolution);
+			dev_err(card->dev,
+				"PCSP: Make sure you have HPET and ACPI enabled.\n");
+			dev_err(card->dev, "PCSP: Turned into nopcm mode.\n");
 			nopcm = 1;
 		}
 	}
@@ -61,8 +62,8 @@ static int snd_pcsp_create(struct snd_card *card)
 	else
 		min_div = MAX_DIV;
 #if PCSP_DEBUG
-	printk(KERN_DEBUG "PCSP: lpj=%li, min_div=%i, res=%u\n",
-	       loops_per_jiffy, min_div, resolution);
+	dev_dbg(card->dev, "PCSP: lpj=%li, min_div=%i, res=%u\n",
+		loops_per_jiffy, min_div, resolution);
 #endif
 
 	div = MAX_DIV / min_div;
@@ -141,14 +142,14 @@ static int alsa_card_pcsp_init(struct device *dev)
 
 	err = snd_card_pcsp_probe(0, dev);
 	if (err) {
-		printk(KERN_ERR "PC-Speaker initialization failed.\n");
+		dev_err(dev, "PC-Speaker initialization failed.\n");
 		return err;
 	}
 
 	/* Well, CONFIG_DEBUG_PAGEALLOC makes the sound horrible. Lets alert */
 	if (debug_pagealloc_enabled()) {
-		printk(KERN_WARNING "PCSP: CONFIG_DEBUG_PAGEALLOC is enabled, "
-		       "which may make the sound noisy.\n");
+		dev_warn(dev,
+			 "PCSP: CONFIG_DEBUG_PAGEALLOC is enabled, which may make the sound noisy.\n");
 	}
 
 	return 0;
diff --git a/sound/drivers/pcsp/pcsp_lib.c b/sound/drivers/pcsp/pcsp_lib.c
index 773db4bf0876..d9bc1ea1b53c 100644
--- a/sound/drivers/pcsp/pcsp_lib.c
+++ b/sound/drivers/pcsp/pcsp_lib.c
@@ -12,6 +12,7 @@
 #include <linux/moduleparam.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <sound/core.h>
 #include <sound/pcm.h>
 #include "pcsp.h"
 
@@ -105,8 +106,8 @@ static void pcsp_pointer_update(struct snd_pcsp *chip)
 	periods_elapsed = chip->playback_ptr - chip->period_ptr;
 	if (periods_elapsed < 0) {
 #if PCSP_DEBUG
-		printk(KERN_INFO "PCSP: buffer_bytes mod period_bytes != 0 ? "
-			"(%zi %zi %zi)\n",
+		dev_dbg(chip->card->dev,
+			"PCSP: buffer_bytes mod period_bytes != 0 ? (%zi %zi %zi)\n",
 			chip->playback_ptr, period_bytes, buffer_bytes);
 #endif
 		periods_elapsed += buffer_bytes;
@@ -136,7 +137,7 @@ enum hrtimer_restart pcsp_do_timer(struct hrtimer *handle)
 	pointer_update = !chip->thalf;
 	ns = pcsp_timer_update(chip);
 	if (!ns) {
-		printk(KERN_WARNING "PCSP: unexpected stop\n");
+		dev_warn(chip->card->dev, "PCSP: unexpected stop\n");
 		return HRTIMER_NORESTART;
 	}
 
@@ -151,10 +152,10 @@ enum hrtimer_restart pcsp_do_timer(struct hrtimer *handle)
 static int pcsp_start_playing(struct snd_pcsp *chip)
 {
 #if PCSP_DEBUG
-	printk(KERN_INFO "PCSP: start_playing called\n");
+	dev_dbg(chip->card->dev, "PCSP: start_playing called\n");
 #endif
 	if (atomic_read(&chip->timer_active)) {
-		printk(KERN_ERR "PCSP: Timer already active\n");
+		dev_err(chip->card->dev, "PCSP: Timer already active\n");
 		return -EIO;
 	}
 
@@ -172,7 +173,7 @@ static int pcsp_start_playing(struct snd_pcsp *chip)
 static void pcsp_stop_playing(struct snd_pcsp *chip)
 {
 #if PCSP_DEBUG
-	printk(KERN_INFO "PCSP: stop_playing called\n");
+	dev_dbg(chip->card->dev, "PCSP: stop_playing called\n");
 #endif
 	if (!atomic_read(&chip->timer_active))
 		return;
@@ -201,7 +202,7 @@ static int snd_pcsp_playback_close(struct snd_pcm_substream *substream)
 {
 	struct snd_pcsp *chip = snd_pcm_substream_chip(substream);
 #if PCSP_DEBUG
-	printk(KERN_INFO "PCSP: close called\n");
+	dev_dbg(chip->card->dev, "PCSP: close called\n");
 #endif
 	pcsp_sync_stop(chip);
 	chip->playback_substream = NULL;
@@ -220,7 +221,7 @@ static int snd_pcsp_playback_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_pcsp *chip = snd_pcm_substream_chip(substream);
 #if PCSP_DEBUG
-	printk(KERN_INFO "PCSP: hw_free called\n");
+	dev_dbg(chip->card->dev, "PCSP: hw_free called\n");
 #endif
 	pcsp_sync_stop(chip);
 	return 0;
@@ -236,14 +237,13 @@ static int snd_pcsp_playback_prepare(struct snd_pcm_substream *substream)
 		snd_pcm_format_physical_width(substream->runtime->format) >> 3;
 	chip->is_signed = snd_pcm_format_signed(substream->runtime->format);
 #if PCSP_DEBUG
-	printk(KERN_INFO "PCSP: prepare called, "
-			"size=%zi psize=%zi f=%zi f1=%i fsize=%i\n",
-			snd_pcm_lib_buffer_bytes(substream),
-			snd_pcm_lib_period_bytes(substream),
-			snd_pcm_lib_buffer_bytes(substream) /
-			snd_pcm_lib_period_bytes(substream),
-			substream->runtime->periods,
-			chip->fmt_size);
+	dev_dbg(chip->card->dev, "PCSP: prepare called, size=%zi psize=%zi f=%zi f1=%i fsize=%i\n",
+		snd_pcm_lib_buffer_bytes(substream),
+		snd_pcm_lib_period_bytes(substream),
+		snd_pcm_lib_buffer_bytes(substream) /
+		snd_pcm_lib_period_bytes(substream),
+		substream->runtime->periods,
+		chip->fmt_size);
 #endif
 	return 0;
 }
@@ -252,7 +252,7 @@ static int snd_pcsp_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_pcsp *chip = snd_pcm_substream_chip(substream);
 #if PCSP_DEBUG
-	printk(KERN_INFO "PCSP: trigger called\n");
+	dev_dbg(chip->card->dev, "PCSP: trigger called\n");
 #endif
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -306,10 +306,10 @@ static int snd_pcsp_playback_open(struct snd_pcm_substream *substream)
 	struct snd_pcsp *chip = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 #if PCSP_DEBUG
-	printk(KERN_INFO "PCSP: open called\n");
+	dev_dbg(chip->card->dev, "PCSP: open called\n");
 #endif
 	if (atomic_read(&chip->timer_active)) {
-		printk(KERN_ERR "PCSP: still active!!\n");
+		dev_err(chip->card->dev, "PCSP: still active!!\n");
 		return -EBUSY;
 	}
 	runtime->hw = snd_pcsp_playback;
diff --git a/sound/drivers/pcsp/pcsp_mixer.c b/sound/drivers/pcsp/pcsp_mixer.c
index da33e5b620a7..c0ae942358b9 100644
--- a/sound/drivers/pcsp/pcsp_mixer.c
+++ b/sound/drivers/pcsp/pcsp_mixer.c
@@ -73,7 +73,7 @@ static int pcsp_treble_put(struct snd_kcontrol *kcontrol,
 	if (treble != chip->treble) {
 		chip->treble = treble;
 #if PCSP_DEBUG
-		printk(KERN_INFO "PCSP: rate set to %li\n", PCSP_RATE());
+		dev_dbg(chip->card->dev, "PCSP: rate set to %li\n", PCSP_RATE());
 #endif
 		changed = 1;
 	}
-- 
2.43.0

