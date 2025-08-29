Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BDF1E25F9
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480452; cv=none; b=s0HHweboFOONhgclddvnky0s2Wtq+qBQ23U0kUGWa2h+GdjzT08U5Hal3n7F+20c+MlPtg5TkURAX8PcUCVi4eUxgDPu3Fe6zy/JSBV4GNHyrR1vHtXvGuxC5sBdyhOeL5a78r4ByMfJ6XvvCRIZprjrj8ysXa63X1OmPGojTtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480452; c=relaxed/simple;
	bh=FQnBYT8l7kQT6u8KVRj4y6dhV0hSa0HOcEeflFxQhR8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BQeV4Q1GgM8yGqzUSw9Djhlo5GYrOgBdRNd2PlqiHtzEvvQOM6VTHsYjaYAmQZEg31Y5qKY81kDhaqMrfOsJSjVDni64snSPiUjcHVgMaE5E9VnysvCllb18h4SObmd6w8nU9x64k8MXaJES8O1OzDOEdBJpQqBv55mxGJ58Iy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GncYmRdu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yR4sfp8G; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GncYmRdu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yR4sfp8G; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GncYmRdu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yR4sfp8G";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GncYmRdu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yR4sfp8G"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2F84133F09;
	Fri, 29 Aug 2025 15:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TdyDsIAOVDdSTFLGY/e114spsgCQfkdyqGU7LWHF9SQ=;
	b=GncYmRduwwGyQdEDUsrLAmc7jSnDcNkKS+X+onq8EnPFD2NzBokVUfCJRhar0wGUTml3Yk
	U67gP4q3JjrOwM3wQpT64na1H5WYPMtFppk7Q+rSEbyNA9gn9kwBlgg114gR3j8IAohviN
	x00QiVZl5wj8QkZR3i43SpcvJAVMP1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TdyDsIAOVDdSTFLGY/e114spsgCQfkdyqGU7LWHF9SQ=;
	b=yR4sfp8GVyepil//cCPoNcsldq/mD8jMKLarPm5n3RCBjy0RbI5O3/crsTa1dRJcXiYK7W
	ZPf1x/ketBPeKvBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GncYmRdu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yR4sfp8G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TdyDsIAOVDdSTFLGY/e114spsgCQfkdyqGU7LWHF9SQ=;
	b=GncYmRduwwGyQdEDUsrLAmc7jSnDcNkKS+X+onq8EnPFD2NzBokVUfCJRhar0wGUTml3Yk
	U67gP4q3JjrOwM3wQpT64na1H5WYPMtFppk7Q+rSEbyNA9gn9kwBlgg114gR3j8IAohviN
	x00QiVZl5wj8QkZR3i43SpcvJAVMP1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TdyDsIAOVDdSTFLGY/e114spsgCQfkdyqGU7LWHF9SQ=;
	b=yR4sfp8GVyepil//cCPoNcsldq/mD8jMKLarPm5n3RCBjy0RbI5O3/crsTa1dRJcXiYK7W
	ZPf1x/ketBPeKvBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F61B13326;
	Fri, 29 Aug 2025 15:13:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cCiDAqbDsWiQIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:13:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 07/19] ALSA: x86: Use guard() for spin locks
Date: Fri, 29 Aug 2025 17:13:21 +0200
Message-ID: <20250829151335.7342-8-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829151335.7342-1-tiwai@suse.de>
References: <20250829151335.7342-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 2F84133F09
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/x86/intel_hdmi_audio.c | 93 +++++++++++++++---------------------
 1 file changed, 39 insertions(+), 54 deletions(-)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index c1506a9f7e15..8e2a007311d3 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -171,13 +171,11 @@ static struct snd_pcm_substream *
 had_substream_get(struct snd_intelhad *intelhaddata)
 {
 	struct snd_pcm_substream *substream;
-	unsigned long flags;
 
-	spin_lock_irqsave(&intelhaddata->had_spinlock, flags);
+	guard(spinlock_irqsave)(&intelhaddata->had_spinlock);
 	substream = intelhaddata->stream_info.substream;
 	if (substream)
 		intelhaddata->stream_info.substream_refcount++;
-	spin_unlock_irqrestore(&intelhaddata->had_spinlock, flags);
 	return substream;
 }
 
@@ -186,11 +184,8 @@ had_substream_get(struct snd_intelhad *intelhaddata)
  */
 static void had_substream_put(struct snd_intelhad *intelhaddata)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&intelhaddata->had_spinlock, flags);
+	guard(spinlock_irqsave)(&intelhaddata->had_spinlock);
 	intelhaddata->stream_info.substream_refcount--;
-	spin_unlock_irqrestore(&intelhaddata->had_spinlock, flags);
 }
 
 static u32 had_config_offset(int pipe)
@@ -946,10 +941,9 @@ static int had_process_ringbuf(struct snd_pcm_substream *substream,
 			       struct snd_intelhad *intelhaddata)
 {
 	int len, processed;
-	unsigned long flags;
 
 	processed = 0;
-	spin_lock_irqsave(&intelhaddata->had_spinlock, flags);
+	guard(spinlock_irqsave)(&intelhaddata->had_spinlock);
 	for (;;) {
 		/* get the remaining bytes on the buffer */
 		had_read_register(intelhaddata,
@@ -958,25 +952,20 @@ static int had_process_ringbuf(struct snd_pcm_substream *substream,
 		if (len < 0 || len > intelhaddata->period_bytes) {
 			dev_dbg(intelhaddata->dev, "Invalid buf length %d\n",
 				len);
-			len = -EPIPE;
-			goto out;
+			return -EPIPE;
 		}
 
 		if (len > 0) /* OK, this is the current buffer */
 			break;
 
 		/* len=0 => already empty, check the next buffer */
-		if (++processed >= intelhaddata->num_bds) {
-			len = -EPIPE; /* all empty? - report underrun */
-			goto out;
-		}
+		if (++processed >= intelhaddata->num_bds)
+			return -EPIPE; /* all empty? - report underrun */
 		had_advance_ringbuf(substream, intelhaddata);
 	}
 
 	len = intelhaddata->period_bytes - len;
 	len += intelhaddata->period_bytes * intelhaddata->pcmbuf_head;
- out:
-	spin_unlock_irqrestore(&intelhaddata->had_spinlock, flags);
 	return len;
 }
 
@@ -1092,10 +1081,10 @@ static int had_pcm_open(struct snd_pcm_substream *substream)
 		goto error;
 
 	/* expose PCM substream */
-	spin_lock_irq(&intelhaddata->had_spinlock);
-	intelhaddata->stream_info.substream = substream;
-	intelhaddata->stream_info.substream_refcount++;
-	spin_unlock_irq(&intelhaddata->had_spinlock);
+	scoped_guard(spinlock_irq, &intelhaddata->had_spinlock) {
+		intelhaddata->stream_info.substream = substream;
+		intelhaddata->stream_info.substream_refcount++;
+	}
 
 	return retval;
  error:
@@ -1153,7 +1142,7 @@ static int had_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 
 	intelhaddata = snd_pcm_substream_chip(substream);
 
-	spin_lock(&intelhaddata->had_spinlock);
+	guard(spinlock)(&intelhaddata->had_spinlock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
@@ -1172,7 +1161,6 @@ static int had_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	default:
 		retval = -EINVAL;
 	}
-	spin_unlock(&intelhaddata->had_spinlock);
 	return retval;
 }
 
@@ -1311,21 +1299,20 @@ static void had_process_hot_plug(struct snd_intelhad *intelhaddata)
 {
 	struct snd_pcm_substream *substream;
 
-	spin_lock_irq(&intelhaddata->had_spinlock);
-	if (intelhaddata->connected) {
-		dev_dbg(intelhaddata->dev, "Device already connected\n");
-		spin_unlock_irq(&intelhaddata->had_spinlock);
-		return;
-	}
+	scoped_guard(spinlock_irq, &intelhaddata->had_spinlock) {
+		if (intelhaddata->connected) {
+			dev_dbg(intelhaddata->dev, "Device already connected\n");
+			return;
+		}
 
-	/* Disable Audio */
-	had_enable_audio(intelhaddata, false);
+		/* Disable Audio */
+		had_enable_audio(intelhaddata, false);
 
-	intelhaddata->connected = true;
-	dev_dbg(intelhaddata->dev,
-		"%s @ %d:DEBUG PLUG/UNPLUG : HAD_DRV_CONNECTED\n",
+		intelhaddata->connected = true;
+		dev_dbg(intelhaddata->dev,
+			"%s @ %d:DEBUG PLUG/UNPLUG : HAD_DRV_CONNECTED\n",
 			__func__, __LINE__);
-	spin_unlock_irq(&intelhaddata->had_spinlock);
+	}
 
 	had_build_channel_allocation_map(intelhaddata);
 
@@ -1344,22 +1331,20 @@ static void had_process_hot_unplug(struct snd_intelhad *intelhaddata)
 {
 	struct snd_pcm_substream *substream;
 
-	spin_lock_irq(&intelhaddata->had_spinlock);
-	if (!intelhaddata->connected) {
-		dev_dbg(intelhaddata->dev, "Device already disconnected\n");
-		spin_unlock_irq(&intelhaddata->had_spinlock);
-		return;
+	scoped_guard(spinlock_irq, &intelhaddata->had_spinlock) {
+		if (!intelhaddata->connected) {
+			dev_dbg(intelhaddata->dev, "Device already disconnected\n");
+			return;
+		}
 
-	}
+		/* Disable Audio */
+		had_enable_audio(intelhaddata, false);
 
-	/* Disable Audio */
-	had_enable_audio(intelhaddata, false);
-
-	intelhaddata->connected = false;
-	dev_dbg(intelhaddata->dev,
-		"%s @ %d:DEBUG PLUG/UNPLUG : HAD_DRV_DISCONNECTED\n",
+		intelhaddata->connected = false;
+		dev_dbg(intelhaddata->dev,
+			"%s @ %d:DEBUG PLUG/UNPLUG : HAD_DRV_DISCONNECTED\n",
 			__func__, __LINE__);
-	spin_unlock_irq(&intelhaddata->had_spinlock);
+	}
 
 	kfree(intelhaddata->chmap->chmap);
 	intelhaddata->chmap->chmap = NULL;
@@ -1636,9 +1621,9 @@ static void hdmi_lpe_audio_free(struct snd_card *card)
 	struct intel_hdmi_lpe_audio_pdata *pdata = card_ctx->dev->platform_data;
 	int port;
 
-	spin_lock_irq(&pdata->lpe_audio_slock);
-	pdata->notify_audio_lpe = NULL;
-	spin_unlock_irq(&pdata->lpe_audio_slock);
+	scoped_guard(spinlock_irq, &pdata->lpe_audio_slock) {
+		pdata->notify_audio_lpe = NULL;
+	}
 
 	for_each_port(card_ctx, port) {
 		struct snd_intelhad *ctx = &card_ctx->pcm_ctx[port];
@@ -1799,9 +1784,9 @@ static int __hdmi_lpe_audio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	spin_lock_irq(&pdata->lpe_audio_slock);
-	pdata->notify_audio_lpe = notify_audio_lpe;
-	spin_unlock_irq(&pdata->lpe_audio_slock);
+	scoped_guard(spinlock_irq, &pdata->lpe_audio_slock) {
+		pdata->notify_audio_lpe = notify_audio_lpe;
+	}
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, INTEL_HDMI_AUDIO_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&pdev->dev);
-- 
2.50.1

