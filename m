Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314563218D0
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480071; cv=none; b=H9qbcyDn0EClO3juPlPEy+hJHyb8HfdlNEZrL5ZvCfS+OxdzI0O94womGf/6LXK04ID3mlNzOpo06+osEv+7E2S5t+daM9ADDFfkBB0Ln2bAWgPu1b6Kp7PpUkkb32FZiGlNMvdRTUU/d9xL6ZKNTWiOBgXBa2hO43sULzOljzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480071; c=relaxed/simple;
	bh=cUKazRSDTjZ4o85Vlkw1HelC4XTHiBcXAFnFmbHnuis=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QzwZ4k2zP2krzin5VaFkSHbGrs7uTP3M93X/lDKOjgq8Nugfo2nQftvQuNu8E58+dMP1UTO0W9LRkv2txdbgsmWW9V154DsdE2u7bQChR9XlwwatLF8nheAOmC8FgISvmGXFszIXMfatXPm1HLJG079LFaJA3oxEs88pq09p5Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gojisOPG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m42LAF92; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gojisOPG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m42LAF92; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gojisOPG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m42LAF92";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gojisOPG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m42LAF92"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 19E1E5C24D;
	Fri, 29 Aug 2025 15:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cet4hNOJS7qZrdcf4wryF4BjreIihVajBcu7xjZTgos=;
	b=gojisOPGMCk65LP7Zt8dsOtbvUtwNTzFpo+I3p1BPdAaAjo37nZS3EC3H8ndlpkzKWLbBQ
	jBxmj2OE9iSkNJxcOmmy9E9hKfV3/vOAtEsODdt3+5KrLyLI3k7qn4vo1BkfVZmTZDjXMP
	zJlhqHrNudW/ZA7cWLZWmjPi8ErrJTw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cet4hNOJS7qZrdcf4wryF4BjreIihVajBcu7xjZTgos=;
	b=m42LAF92gc/ghgRiIwM6KwKXDidZWuiJcqprkTrQEShNupCO7wdoeNya8bRw8IIUlg2GjR
	2myWsmsGgQkhxtDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gojisOPG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=m42LAF92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cet4hNOJS7qZrdcf4wryF4BjreIihVajBcu7xjZTgos=;
	b=gojisOPGMCk65LP7Zt8dsOtbvUtwNTzFpo+I3p1BPdAaAjo37nZS3EC3H8ndlpkzKWLbBQ
	jBxmj2OE9iSkNJxcOmmy9E9hKfV3/vOAtEsODdt3+5KrLyLI3k7qn4vo1BkfVZmTZDjXMP
	zJlhqHrNudW/ZA7cWLZWmjPi8ErrJTw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cet4hNOJS7qZrdcf4wryF4BjreIihVajBcu7xjZTgos=;
	b=m42LAF92gc/ghgRiIwM6KwKXDidZWuiJcqprkTrQEShNupCO7wdoeNya8bRw8IIUlg2GjR
	2myWsmsGgQkhxtDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F185213326;
	Fri, 29 Aug 2025 15:07:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8OSbOTbCsWjMHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:07:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 6/9] ALSA: line6: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:07:14 +0200
Message-ID: <20250829150724.6886-7-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829150724.6886-1-tiwai@suse.de>
References: <20250829150724.6886-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 19E1E5C24D
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.  The core code of line6_pcm_release() is factored out,
so that it can be covered by guard() nicely, too.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/line6/driver.c |  8 ++----
 sound/usb/line6/pcm.c    | 58 ++++++++++++++++++++--------------------
 2 files changed, 31 insertions(+), 35 deletions(-)

diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index f2f9261489a2..c505c1cba162 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -628,16 +628,12 @@ line6_hwdep_write(struct snd_hwdep *hwdep, const char __user *data, long count,
 static __poll_t
 line6_hwdep_poll(struct snd_hwdep *hwdep, struct file *file, poll_table *wait)
 {
-	__poll_t rv;
 	struct usb_line6 *line6 = hwdep->private_data;
 
 	poll_wait(file, &line6->messages.wait_queue, wait);
 
-	mutex_lock(&line6->messages.read_lock);
-	rv = kfifo_len(&line6->messages.fifo) == 0 ? 0 : EPOLLIN | EPOLLRDNORM;
-	mutex_unlock(&line6->messages.read_lock);
-
-	return rv;
+	guard(mutex)(&line6->messages.read_lock);
+	return kfifo_len(&line6->messages.fifo) == 0 ? 0 : EPOLLIN | EPOLLRDNORM;
 }
 
 static const struct snd_hwdep_ops hwdep_ops = {
diff --git a/sound/usb/line6/pcm.c b/sound/usb/line6/pcm.c
index c1e2a8ab66fa..81e6d5e05135 100644
--- a/sound/usb/line6/pcm.c
+++ b/sound/usb/line6/pcm.c
@@ -295,6 +295,28 @@ snd_pcm_uframes_t snd_line6_pointer(struct snd_pcm_substream *substream)
 	return pstr->pos_done;
 }
 
+/* Stop and release duplex streams */
+static void __line6_pcm_release(struct snd_line6_pcm *line6pcm, int type)
+{
+	struct line6_pcm_stream *pstr;
+	int dir;
+
+	for (dir = 0; dir < 2; dir++)
+		line6_stream_stop(line6pcm, dir, type);
+	for (dir = 0; dir < 2; dir++) {
+		pstr = get_stream(line6pcm, dir);
+		line6_buffer_release(line6pcm, pstr, type);
+	}
+}
+
+/* Stop and release duplex streams */
+void line6_pcm_release(struct snd_line6_pcm *line6pcm, int type)
+{
+	guard(mutex)(&line6pcm->state_mutex);
+	__line6_pcm_release(line6pcm, type);
+}
+EXPORT_SYMBOL_GPL(line6_pcm_release);
+
 /* Acquire and optionally start duplex streams:
  * type is either LINE6_STREAM_IMPULSE or LINE6_STREAM_MONITOR
  */
@@ -304,7 +326,7 @@ int line6_pcm_acquire(struct snd_line6_pcm *line6pcm, int type, bool start)
 	int ret = 0, dir;
 
 	/* TODO: We should assert SNDRV_PCM_STREAM_PLAYBACK/CAPTURE == 0/1 */
-	mutex_lock(&line6pcm->state_mutex);
+	guard(mutex)(&line6pcm->state_mutex);
 	for (dir = 0; dir < 2; dir++) {
 		pstr = get_stream(line6pcm, dir);
 		ret = line6_buffer_acquire(line6pcm, pstr, dir, type);
@@ -321,30 +343,12 @@ int line6_pcm_acquire(struct snd_line6_pcm *line6pcm, int type, bool start)
 		}
 	}
  error:
-	mutex_unlock(&line6pcm->state_mutex);
 	if (ret < 0)
-		line6_pcm_release(line6pcm, type);
+		__line6_pcm_release(line6pcm, type);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(line6_pcm_acquire);
 
-/* Stop and release duplex streams */
-void line6_pcm_release(struct snd_line6_pcm *line6pcm, int type)
-{
-	struct line6_pcm_stream *pstr;
-	int dir;
-
-	mutex_lock(&line6pcm->state_mutex);
-	for (dir = 0; dir < 2; dir++)
-		line6_stream_stop(line6pcm, dir, type);
-	for (dir = 0; dir < 2; dir++) {
-		pstr = get_stream(line6pcm, dir);
-		line6_buffer_release(line6pcm, pstr, type);
-	}
-	mutex_unlock(&line6pcm->state_mutex);
-}
-EXPORT_SYMBOL_GPL(line6_pcm_release);
-
 /* common PCM hw_params callback */
 int snd_line6_hw_params(struct snd_pcm_substream *substream,
 			struct snd_pcm_hw_params *hw_params)
@@ -353,16 +357,14 @@ int snd_line6_hw_params(struct snd_pcm_substream *substream,
 	struct snd_line6_pcm *line6pcm = snd_pcm_substream_chip(substream);
 	struct line6_pcm_stream *pstr = get_stream(line6pcm, substream->stream);
 
-	mutex_lock(&line6pcm->state_mutex);
+	guard(mutex)(&line6pcm->state_mutex);
 	ret = line6_buffer_acquire(line6pcm, pstr, substream->stream,
 	                           LINE6_STREAM_PCM);
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	pstr->period = params_period_bytes(hw_params);
- error:
-	mutex_unlock(&line6pcm->state_mutex);
-	return ret;
+	return 0;
 }
 
 /* common PCM hw_free callback */
@@ -371,9 +373,8 @@ int snd_line6_hw_free(struct snd_pcm_substream *substream)
 	struct snd_line6_pcm *line6pcm = snd_pcm_substream_chip(substream);
 	struct line6_pcm_stream *pstr = get_stream(line6pcm, substream->stream);
 
-	mutex_lock(&line6pcm->state_mutex);
+	guard(mutex)(&line6pcm->state_mutex);
 	line6_buffer_release(line6pcm, pstr, LINE6_STREAM_PCM);
-	mutex_unlock(&line6pcm->state_mutex);
 	return 0;
 }
 
@@ -588,7 +589,7 @@ int snd_line6_prepare(struct snd_pcm_substream *substream)
 	struct snd_line6_pcm *line6pcm = snd_pcm_substream_chip(substream);
 	struct line6_pcm_stream *pstr = get_stream(line6pcm, substream->stream);
 
-	mutex_lock(&line6pcm->state_mutex);
+	guard(mutex)(&line6pcm->state_mutex);
 	if (!pstr->running)
 		line6_wait_clear_audio_urbs(line6pcm, pstr);
 
@@ -602,6 +603,5 @@ int snd_line6_prepare(struct snd_pcm_substream *substream)
 		line6pcm->in.bytes = 0;
 	}
 
-	mutex_unlock(&line6pcm->state_mutex);
 	return 0;
 }
-- 
2.50.1

