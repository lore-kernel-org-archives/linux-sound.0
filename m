Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B095322779
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478798; cv=none; b=CZjZXr9cQM9F8IAzNeU0mOrfgq9W1X+kGqEOAMNBM5PxGAOVqZLLlxiIzgzyjzlcKHxo5FZ355sWSZ0fiw9SQCNLOK2aVuvXZv0zKD7AKyYLXAO3jZX7b8Ds99lty9aNsJRxE55tLBURwt4KAYwUi/B+zjxXSDHxYQExA33xlBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478798; c=relaxed/simple;
	bh=14iBtLwx8Vwpz0o74xpSGlBIekclcu/g1ep2WOTSysM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=osfqFHPoZCMHgJCYtuWrkDkBMgYmEhF1Sx7ydENglbHBBiVmbwKH2lhTYVnK6PZH+KrAWCj1VNkhi39/2LVzXiI0NSN/v+ztNgNGcwQZQP9ZTgFzXzNvgUMbeScQ038lBsPt+wglRyHlX0VjwNfLbPux9NqhSoswGgzsMRlhZkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=htg/XWW0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JGsyFXBZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=htg/XWW0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JGsyFXBZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="htg/XWW0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JGsyFXBZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="htg/XWW0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JGsyFXBZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F38E85C23B;
	Fri, 29 Aug 2025 14:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H0+vTg9Iog+FtmzJog6Z2KQHkqbtAwljpM2zgj5fyvg=;
	b=htg/XWW0nvgGAG9cqeUWK75YrAQDc4bVoPA22dMgpoyg5UNfAN+qdJrYc8CTYvV9LC6d24
	DmMJyruXr4BTi30v0K/f3Yh+QOsZ80Ose13UA2Oe1Pb/UOx/6jy7JZR4hitvzlkAuRkQ3D
	ebhCE8PnDo8nkBUGv2bckJtoPeonYXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H0+vTg9Iog+FtmzJog6Z2KQHkqbtAwljpM2zgj5fyvg=;
	b=JGsyFXBZbW+N2Ik28pXu7mB4NLj19qX6BAeGnkYqwkRAveoul3lw649L092fr1GmfSVNdq
	vs2kkyU+YZ+VxcDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="htg/XWW0";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JGsyFXBZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H0+vTg9Iog+FtmzJog6Z2KQHkqbtAwljpM2zgj5fyvg=;
	b=htg/XWW0nvgGAG9cqeUWK75YrAQDc4bVoPA22dMgpoyg5UNfAN+qdJrYc8CTYvV9LC6d24
	DmMJyruXr4BTi30v0K/f3Yh+QOsZ80Ose13UA2Oe1Pb/UOx/6jy7JZR4hitvzlkAuRkQ3D
	ebhCE8PnDo8nkBUGv2bckJtoPeonYXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H0+vTg9Iog+FtmzJog6Z2KQHkqbtAwljpM2zgj5fyvg=;
	b=JGsyFXBZbW+N2Ik28pXu7mB4NLj19qX6BAeGnkYqwkRAveoul3lw649L092fr1GmfSVNdq
	vs2kkyU+YZ+VxcDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DAE5313A54;
	Fri, 29 Aug 2025 14:44:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oCxPNLG8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 41/61] ALSA: lx6464es: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:43:16 +0200
Message-ID: <20250829144342.4290-42-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829144342.4290-1-tiwai@suse.de>
References: <20250829144342.4290-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: F38E85C23B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/lx6464es/lx6464es.c |  49 ++++++----------
 sound/pci/lx6464es/lx_core.c  | 107 ++++++++++------------------------
 2 files changed, 48 insertions(+), 108 deletions(-)

diff --git a/sound/pci/lx6464es/lx6464es.c b/sound/pci/lx6464es/lx6464es.c
index 9f12c936bb1f..96df00db51d5 100644
--- a/sound/pci/lx6464es/lx6464es.c
+++ b/sound/pci/lx6464es/lx6464es.c
@@ -207,7 +207,7 @@ static int lx_pcm_open(struct snd_pcm_substream *substream)
 	int board_rate;
 
 	dev_dbg(chip->card->dev, "->lx_pcm_open\n");
-	mutex_lock(&chip->setup_mutex);
+	guard(mutex)(&chip->setup_mutex);
 
 	/* copy the struct snd_pcm_hardware struct */
 	runtime->hw = lx_caps;
@@ -218,7 +218,7 @@ static int lx_pcm_open(struct snd_pcm_substream *substream)
 					    SNDRV_PCM_HW_PARAM_PERIODS);
 	if (err < 0) {
 		dev_warn(chip->card->dev, "could not constrain periods\n");
-		goto exit;
+		return err;
 	}
 #endif
 
@@ -229,7 +229,7 @@ static int lx_pcm_open(struct snd_pcm_substream *substream)
 
 	if (err < 0) {
 		dev_warn(chip->card->dev, "could not constrain periods\n");
-		goto exit;
+		return err;
 	}
 
 	/* constrain period size */
@@ -240,7 +240,7 @@ static int lx_pcm_open(struct snd_pcm_substream *substream)
 	if (err < 0) {
 		dev_warn(chip->card->dev,
 			   "could not constrain period size\n");
-		goto exit;
+		return err;
 	}
 
 	snd_pcm_hw_constraint_step(runtime, 0,
@@ -249,10 +249,8 @@ static int lx_pcm_open(struct snd_pcm_substream *substream)
 	snd_pcm_set_sync(substream);
 	err = 0;
 
-exit:
 	runtime->private_data = chip;
 
-	mutex_unlock(&chip->setup_mutex);
 	dev_dbg(chip->card->dev, "<-lx_pcm_open, %d\n", err);
 	return err;
 }
@@ -275,9 +273,8 @@ static snd_pcm_uframes_t lx_pcm_stream_pointer(struct snd_pcm_substream
 
 	dev_dbg(chip->card->dev, "->lx_pcm_stream_pointer\n");
 
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 	pos = lx_stream->frame_pos * substream->runtime->period_size;
-	mutex_unlock(&chip->lock);
 
 	dev_dbg(chip->card->dev, "stream_pointer at %ld\n", pos);
 	return pos;
@@ -291,21 +288,21 @@ static int lx_pcm_prepare(struct snd_pcm_substream *substream)
 
 	dev_dbg(chip->card->dev, "->lx_pcm_prepare\n");
 
-	mutex_lock(&chip->setup_mutex);
+	guard(mutex)(&chip->setup_mutex);
 
 	if (chip->hardware_running[is_capture]) {
 		err = lx_hardware_stop(chip, substream);
 		if (err < 0) {
 			dev_err(chip->card->dev, "failed to stop hardware. "
 				   "Error code %d\n", err);
-			goto exit;
+			return err;
 		}
 
 		err = lx_hardware_close(chip, substream);
 		if (err < 0) {
 			dev_err(chip->card->dev, "failed to close hardware. "
 				   "Error code %d\n", err);
-			goto exit;
+			return err;
 		}
 	}
 
@@ -314,14 +311,14 @@ static int lx_pcm_prepare(struct snd_pcm_substream *substream)
 	if (err < 0) {
 		dev_err(chip->card->dev, "failed to open hardware. "
 			   "Error code %d\n", err);
-		goto exit;
+		return err;
 	}
 
 	err = lx_hardware_start(chip, substream);
 	if (err < 0) {
 		dev_err(chip->card->dev, "failed to start hardware. "
 			   "Error code %d\n", err);
-		goto exit;
+		return err;
 	}
 
 	chip->hardware_running[is_capture] = 1;
@@ -331,8 +328,6 @@ static int lx_pcm_prepare(struct snd_pcm_substream *substream)
 			chip->board_sample_rate = substream->runtime->rate;
 	}
 
-exit:
-	mutex_unlock(&chip->setup_mutex);
 	return err;
 }
 
@@ -343,14 +338,13 @@ static int lx_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	dev_dbg(chip->card->dev, "->lx_pcm_hw_params\n");
 
-	mutex_lock(&chip->setup_mutex);
+	guard(mutex)(&chip->setup_mutex);
 
 	if (is_capture)
 		chip->capture_stream.stream = substream;
 	else
 		chip->playback_stream.stream = substream;
 
-	mutex_unlock(&chip->setup_mutex);
 	return 0;
 }
 
@@ -373,21 +367,21 @@ static int lx_pcm_hw_free(struct snd_pcm_substream *substream)
 	int is_capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
 
 	dev_dbg(chip->card->dev, "->lx_pcm_hw_free\n");
-	mutex_lock(&chip->setup_mutex);
+	guard(mutex)(&chip->setup_mutex);
 
 	if (chip->hardware_running[is_capture]) {
 		err = lx_hardware_stop(chip, substream);
 		if (err < 0) {
 			dev_err(chip->card->dev, "failed to stop hardware. "
 				   "Error code %d\n", err);
-			goto exit;
+			return err;
 		}
 
 		err = lx_hardware_close(chip, substream);
 		if (err < 0) {
 			dev_err(chip->card->dev, "failed to close hardware. "
 				   "Error code %d\n", err);
-			goto exit;
+			return err;
 		}
 
 		chip->hardware_running[is_capture] = 0;
@@ -398,9 +392,7 @@ static int lx_pcm_hw_free(struct snd_pcm_substream *substream)
 	else
 		chip->playback_stream.stream = NULL;
 
-exit:
-	mutex_unlock(&chip->setup_mutex);
-	return err;
+	return 0;
 }
 
 static void lx_trigger_start(struct lx6464es *chip, struct lx_stream *lx_stream)
@@ -486,9 +478,7 @@ static void lx_trigger_dispatch_stream(struct lx6464es *chip,
 static int lx_pcm_trigger_dispatch(struct lx6464es *chip,
 				   struct lx_stream *lx_stream, int cmd)
 {
-	int err = 0;
-
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		lx_stream->status = LX_STREAM_STATUS_SCHEDULE_RUN;
@@ -499,16 +489,13 @@ static int lx_pcm_trigger_dispatch(struct lx6464es *chip,
 		break;
 
 	default:
-		err = -EINVAL;
-		goto exit;
+		return -EINVAL;
 	}
 
 	lx_trigger_dispatch_stream(chip, &chip->capture_stream);
 	lx_trigger_dispatch_stream(chip, &chip->playback_stream);
 
-exit:
-	mutex_unlock(&chip->lock);
-	return err;
+	return 0;
 }
 
 
diff --git a/sound/pci/lx6464es/lx_core.c b/sound/pci/lx6464es/lx_core.c
index a99acd1125e7..6f0843cfb3be 100644
--- a/sound/pci/lx6464es/lx_core.c
+++ b/sound/pci/lx6464es/lx_core.c
@@ -318,13 +318,12 @@ int lx_dsp_get_version(struct lx6464es *chip, u32 *rdsp_version)
 {
 	int ret;
 
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 
 	lx_message_init(&chip->rmh, CMD_01_GET_SYS_CFG);
 	ret = lx_message_send_atomic(chip, &chip->rmh);
 
 	*rdsp_version = chip->rmh.stat[1];
-	mutex_unlock(&chip->msg_lock);
 	return ret;
 }
 
@@ -335,7 +334,7 @@ int lx_dsp_get_clock_frequency(struct lx6464es *chip, u32 *rfreq)
 	u32 frequency = 0;
 	int ret;
 
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 
 	lx_message_init(&chip->rmh, CMD_01_GET_SYS_CFG);
 	ret = lx_message_send_atomic(chip, &chip->rmh);
@@ -353,8 +352,6 @@ int lx_dsp_get_clock_frequency(struct lx6464es *chip, u32 *rfreq)
 			frequency = 48000;
 	}
 
-	mutex_unlock(&chip->msg_lock);
-
 	*rfreq = frequency * chip->freq_ratio;
 
 	return ret;
@@ -381,23 +378,19 @@ int lx_dsp_get_mac(struct lx6464es *chip)
 
 int lx_dsp_set_granularity(struct lx6464es *chip, u32 gran)
 {
-	int ret;
-
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 
 	lx_message_init(&chip->rmh, CMD_02_SET_GRANULARITY);
 	chip->rmh.cmd[0] |= gran;
 
-	ret = lx_message_send_atomic(chip, &chip->rmh);
-	mutex_unlock(&chip->msg_lock);
-	return ret;
+	return lx_message_send_atomic(chip, &chip->rmh);
 }
 
 int lx_dsp_read_async_events(struct lx6464es *chip, u32 *data)
 {
 	int ret;
 
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 
 	lx_message_init(&chip->rmh, CMD_04_GET_EVENT);
 	chip->rmh.stat_len = 9;	/* we don't necessarily need the full length */
@@ -407,7 +400,6 @@ int lx_dsp_read_async_events(struct lx6464es *chip, u32 *data)
 	if (!ret)
 		memcpy(data, chip->rmh.stat, chip->rmh.stat_len * sizeof(u32));
 
-	mutex_unlock(&chip->msg_lock);
 	return ret;
 }
 
@@ -423,14 +415,13 @@ int lx_pipe_allocate(struct lx6464es *chip, u32 pipe, int is_capture,
 	int err;
 	u32 pipe_cmd = PIPE_INFO_TO_CMD(is_capture, pipe);
 
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 	lx_message_init(&chip->rmh, CMD_06_ALLOCATE_PIPE);
 
 	chip->rmh.cmd[0] |= pipe_cmd;
 	chip->rmh.cmd[0] |= channels;
 
 	err = lx_message_send_atomic(chip, &chip->rmh);
-	mutex_unlock(&chip->msg_lock);
 
 	if (err != 0)
 		dev_err(chip->card->dev, "could not allocate pipe\n");
@@ -440,18 +431,14 @@ int lx_pipe_allocate(struct lx6464es *chip, u32 pipe, int is_capture,
 
 int lx_pipe_release(struct lx6464es *chip, u32 pipe, int is_capture)
 {
-	int err;
 	u32 pipe_cmd = PIPE_INFO_TO_CMD(is_capture, pipe);
 
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 	lx_message_init(&chip->rmh, CMD_07_RELEASE_PIPE);
 
 	chip->rmh.cmd[0] |= pipe_cmd;
 
-	err = lx_message_send_atomic(chip, &chip->rmh);
-	mutex_unlock(&chip->msg_lock);
-
-	return err;
+	return lx_message_send_atomic(chip, &chip->rmh);
 }
 
 int lx_buffer_ask(struct lx6464es *chip, u32 pipe, int is_capture,
@@ -468,7 +455,7 @@ int lx_buffer_ask(struct lx6464es *chip, u32 pipe, int is_capture,
 	*r_needed = 0;
 	*r_freed = 0;
 
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 	lx_message_init(&chip->rmh, CMD_08_ASK_BUFFERS);
 
 	chip->rmh.cmd[0] |= pipe_cmd;
@@ -501,41 +488,32 @@ int lx_buffer_ask(struct lx6464es *chip, u32 pipe, int is_capture,
 		}
 	}
 
-	mutex_unlock(&chip->msg_lock);
 	return err;
 }
 
 
 int lx_pipe_stop(struct lx6464es *chip, u32 pipe, int is_capture)
 {
-	int err;
 	u32 pipe_cmd = PIPE_INFO_TO_CMD(is_capture, pipe);
 
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 	lx_message_init(&chip->rmh, CMD_09_STOP_PIPE);
 
 	chip->rmh.cmd[0] |= pipe_cmd;
 
-	err = lx_message_send_atomic(chip, &chip->rmh);
-
-	mutex_unlock(&chip->msg_lock);
-	return err;
+	return lx_message_send_atomic(chip, &chip->rmh);
 }
 
 static int lx_pipe_toggle_state(struct lx6464es *chip, u32 pipe, int is_capture)
 {
-	int err;
 	u32 pipe_cmd = PIPE_INFO_TO_CMD(is_capture, pipe);
 
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 	lx_message_init(&chip->rmh, CMD_0B_TOGGLE_PIPE_STATE);
 
 	chip->rmh.cmd[0] |= pipe_cmd;
 
-	err = lx_message_send_atomic(chip, &chip->rmh);
-
-	mutex_unlock(&chip->msg_lock);
-	return err;
+	return lx_message_send_atomic(chip, &chip->rmh);
 }
 
 
@@ -572,7 +550,7 @@ int lx_pipe_sample_count(struct lx6464es *chip, u32 pipe, int is_capture,
 	int err;
 	u32 pipe_cmd = PIPE_INFO_TO_CMD(is_capture, pipe);
 
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 	lx_message_init(&chip->rmh, CMD_0A_GET_PIPE_SPL_COUNT);
 
 	chip->rmh.cmd[0] |= pipe_cmd;
@@ -589,7 +567,6 @@ int lx_pipe_sample_count(struct lx6464es *chip, u32 pipe, int is_capture,
 			+ chip->rmh.stat[1]; /* lo part */
 	}
 
-	mutex_unlock(&chip->msg_lock);
 	return err;
 }
 
@@ -598,7 +575,7 @@ int lx_pipe_state(struct lx6464es *chip, u32 pipe, int is_capture, u16 *rstate)
 	int err;
 	u32 pipe_cmd = PIPE_INFO_TO_CMD(is_capture, pipe);
 
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 	lx_message_init(&chip->rmh, CMD_0A_GET_PIPE_SPL_COUNT);
 
 	chip->rmh.cmd[0] |= pipe_cmd;
@@ -610,7 +587,6 @@ int lx_pipe_state(struct lx6464es *chip, u32 pipe, int is_capture, u16 *rstate)
 	else
 		*rstate = (chip->rmh.stat[0] >> PSTATE_OFFSET) & 0x0F;
 
-	mutex_unlock(&chip->msg_lock);
 	return err;
 }
 
@@ -651,29 +627,24 @@ int lx_pipe_wait_for_idle(struct lx6464es *chip, u32 pipe, int is_capture)
 int lx_stream_set_state(struct lx6464es *chip, u32 pipe,
 			       int is_capture, enum stream_state_t state)
 {
-	int err;
 	u32 pipe_cmd = PIPE_INFO_TO_CMD(is_capture, pipe);
 
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 	lx_message_init(&chip->rmh, CMD_13_SET_STREAM_STATE);
 
 	chip->rmh.cmd[0] |= pipe_cmd;
 	chip->rmh.cmd[0] |= state;
 
-	err = lx_message_send_atomic(chip, &chip->rmh);
-	mutex_unlock(&chip->msg_lock);
-
-	return err;
+	return lx_message_send_atomic(chip, &chip->rmh);
 }
 
 int lx_stream_set_format(struct lx6464es *chip, struct snd_pcm_runtime *runtime,
 			 u32 pipe, int is_capture)
 {
-	int err;
 	u32 pipe_cmd = PIPE_INFO_TO_CMD(is_capture, pipe);
 	u32 channels = runtime->channels;
 
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 	lx_message_init(&chip->rmh, CMD_0C_DEF_STREAM);
 
 	chip->rmh.cmd[0] |= pipe_cmd;
@@ -688,10 +659,7 @@ int lx_stream_set_format(struct lx6464es *chip, struct snd_pcm_runtime *runtime,
 
 	chip->rmh.cmd[0] |= channels-1;
 
-	err = lx_message_send_atomic(chip, &chip->rmh);
-	mutex_unlock(&chip->msg_lock);
-
-	return err;
+	return lx_message_send_atomic(chip, &chip->rmh);
 }
 
 int lx_stream_state(struct lx6464es *chip, u32 pipe, int is_capture,
@@ -700,7 +668,7 @@ int lx_stream_state(struct lx6464es *chip, u32 pipe, int is_capture,
 	int err;
 	u32 pipe_cmd = PIPE_INFO_TO_CMD(is_capture, pipe);
 
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 	lx_message_init(&chip->rmh, CMD_0E_GET_STREAM_SPL_COUNT);
 
 	chip->rmh.cmd[0] |= pipe_cmd;
@@ -709,7 +677,6 @@ int lx_stream_state(struct lx6464es *chip, u32 pipe, int is_capture,
 
 	*rstate = (chip->rmh.stat[0] & SF_START) ? START_STATE : PAUSE_STATE;
 
-	mutex_unlock(&chip->msg_lock);
 	return err;
 }
 
@@ -719,7 +686,7 @@ int lx_stream_sample_position(struct lx6464es *chip, u32 pipe, int is_capture,
 	int err;
 	u32 pipe_cmd = PIPE_INFO_TO_CMD(is_capture, pipe);
 
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 	lx_message_init(&chip->rmh, CMD_0E_GET_STREAM_SPL_COUNT);
 
 	chip->rmh.cmd[0] |= pipe_cmd;
@@ -730,7 +697,6 @@ int lx_stream_sample_position(struct lx6464es *chip, u32 pipe, int is_capture,
 		      << 32)	     /* hi part */
 		+ chip->rmh.stat[1]; /* lo part */
 
-	mutex_unlock(&chip->msg_lock);
 	return err;
 }
 
@@ -742,7 +708,7 @@ int lx_buffer_give(struct lx6464es *chip, u32 pipe, int is_capture,
 	int err;
 	u32 pipe_cmd = PIPE_INFO_TO_CMD(is_capture, pipe);
 
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 	lx_message_init(&chip->rmh, CMD_0F_UPDATE_BUFFER);
 
 	chip->rmh.cmd[0] |= pipe_cmd;
@@ -763,7 +729,7 @@ int lx_buffer_give(struct lx6464es *chip, u32 pipe, int is_capture,
 
 	if (err == 0) {
 		*r_buffer_index = chip->rmh.stat[0];
-		goto done;
+		return err;
 	}
 
 	if (err == EB_RBUFFERS_TABLE_OVERFLOW)
@@ -778,8 +744,6 @@ int lx_buffer_give(struct lx6464es *chip, u32 pipe, int is_capture,
 		dev_err(chip->card->dev,
 			"lx_buffer_give EB_CMD_REFUSED\n");
 
- done:
-	mutex_unlock(&chip->msg_lock);
 	return err;
 }
 
@@ -789,7 +753,7 @@ int lx_buffer_free(struct lx6464es *chip, u32 pipe, int is_capture,
 	int err;
 	u32 pipe_cmd = PIPE_INFO_TO_CMD(is_capture, pipe);
 
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 	lx_message_init(&chip->rmh, CMD_11_CANCEL_BUFFER);
 
 	chip->rmh.cmd[0] |= pipe_cmd;
@@ -801,26 +765,21 @@ int lx_buffer_free(struct lx6464es *chip, u32 pipe, int is_capture,
 	if (err == 0)
 		*r_buffer_size = chip->rmh.stat[0]  & MASK_DATA_SIZE;
 
-	mutex_unlock(&chip->msg_lock);
 	return err;
 }
 
 int lx_buffer_cancel(struct lx6464es *chip, u32 pipe, int is_capture,
 		     u32 buffer_index)
 {
-	int err;
 	u32 pipe_cmd = PIPE_INFO_TO_CMD(is_capture, pipe);
 
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 	lx_message_init(&chip->rmh, CMD_11_CANCEL_BUFFER);
 
 	chip->rmh.cmd[0] |= pipe_cmd;
 	chip->rmh.cmd[0] |= buffer_index;
 
-	err = lx_message_send_atomic(chip, &chip->rmh);
-
-	mutex_unlock(&chip->msg_lock);
-	return err;
+	return lx_message_send_atomic(chip, &chip->rmh);
 }
 
 
@@ -831,11 +790,10 @@ int lx_buffer_cancel(struct lx6464es *chip, u32 pipe, int is_capture,
  * */
 int lx_level_unmute(struct lx6464es *chip, int is_capture, int unmute)
 {
-	int err;
 	/* bit set to 1: channel muted */
 	u64 mute_mask = unmute ? 0 : 0xFFFFFFFFFFFFFFFFLLU;
 
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 	lx_message_init(&chip->rmh, CMD_0D_SET_MUTE);
 
 	chip->rmh.cmd[0] |= PIPE_INFO_TO_CMD(is_capture, 0);
@@ -847,10 +805,7 @@ int lx_level_unmute(struct lx6464es *chip, int is_capture, int unmute)
 		"mute %x %x %x\n", chip->rmh.cmd[0], chip->rmh.cmd[1],
 		   chip->rmh.cmd[2]);
 
-	err = lx_message_send_atomic(chip, &chip->rmh);
-
-	mutex_unlock(&chip->msg_lock);
-	return err;
+	return lx_message_send_atomic(chip, &chip->rmh);
 }
 
 static const u32 peak_map[] = {
@@ -878,7 +833,7 @@ int lx_level_peaks(struct lx6464es *chip, int is_capture, int channels,
 	int err = 0;
 	int i;
 
-	mutex_lock(&chip->msg_lock);
+	guard(mutex)(&chip->msg_lock);
 	for (i = 0; i < channels; i += 4) {
 		u32 s0, s1, s2, s3;
 
@@ -903,7 +858,6 @@ int lx_level_peaks(struct lx6464es *chip, int is_capture, int channels,
 		r_levels += 4;
 	}
 
-	mutex_unlock(&chip->msg_lock);
 	return err;
 }
 
@@ -1033,7 +987,7 @@ static int lx_interrupt_request_new_buffer(struct lx6464es *chip,
 
 	dev_dbg(chip->card->dev, "->lx_interrupt_request_new_buffer\n");
 
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 
 	err = lx_buffer_ask(chip, 0, is_capture, &needed, &freed, size_array);
 	dev_dbg(chip->card->dev,
@@ -1047,7 +1001,6 @@ static int lx_interrupt_request_new_buffer(struct lx6464es *chip,
 		    buffer_index, (unsigned long)buf, period_bytes);
 
 	lx_stream->frame_pos = next_pos;
-	mutex_unlock(&chip->lock);
 
 	return err;
 }
-- 
2.50.1

