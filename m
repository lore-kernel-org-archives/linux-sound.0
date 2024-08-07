Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16F31EB4AD
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037671; cv=none; b=V8S5XjW9bX9Dwx2pgD94h0NlCBWjtXX6pxgKfX0TghoXJqm/yjzjd8/uDCdxm2l33mDeGCJwLMcuB3E4iQ9EX/HV5fSltkGcuxWOZbh6W+78Ns9YQBBpXUS1G+hm16nAfib6mWzGIlVUo2awG9B4+RwXJxeyllctiAqnvcMcb1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037671; c=relaxed/simple;
	bh=lnSwHL6NaqQlErvQs7Vj41dqV+1MHV2IJpOu3Y0touM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RMmS3rmvYlw7ta4IwaEGyueAd5t7iSzOw1pbXuJ97DBvuqwByXEl5vHJMJKwwUv/gFoUYwhM9MPiUtP+Nv/Vk1IlPwXbrNGd+WKG4loag8+z3FpISLoc4NRqM6UGHtonJ2LYzJcapjAmjHWXw4Cvxkce4oJtelIFgFg5CodRVP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lMo3kp7B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UTtUv7+a; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lMo3kp7B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UTtUv7+a; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lMo3kp7B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UTtUv7+a";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lMo3kp7B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UTtUv7+a"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8E41A1FDD2;
	Wed,  7 Aug 2024 13:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DM6cBJ6Xqg62qGXg6odGpuDlKYiqDpZhk1IDw5PudDQ=;
	b=lMo3kp7BXHzXL0ygYQRXa4Q7LdIJ45Swsa3HdReN/LH5UE57lClZqNu6e8VNuy5ur+MZMM
	3fbnyUqrZK6J7QcBK19Y/qrLY5VXdCbb6Uqt/9YeoRcp2SHxr3TXg6tQ/1si0DJ/Y/+7K+
	A6uOAnANDsIT/xe/a+hp9Tzagmy4jlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DM6cBJ6Xqg62qGXg6odGpuDlKYiqDpZhk1IDw5PudDQ=;
	b=UTtUv7+a0Q8GI1bRPYfXtZnLZvn2ztxVl0lYOe8F/6VSPYXuKRxhv+Ke7GOy3Q5McjsPZ8
	ELvcetmw3kNIzZBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lMo3kp7B;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UTtUv7+a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DM6cBJ6Xqg62qGXg6odGpuDlKYiqDpZhk1IDw5PudDQ=;
	b=lMo3kp7BXHzXL0ygYQRXa4Q7LdIJ45Swsa3HdReN/LH5UE57lClZqNu6e8VNuy5ur+MZMM
	3fbnyUqrZK6J7QcBK19Y/qrLY5VXdCbb6Uqt/9YeoRcp2SHxr3TXg6tQ/1si0DJ/Y/+7K+
	A6uOAnANDsIT/xe/a+hp9Tzagmy4jlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DM6cBJ6Xqg62qGXg6odGpuDlKYiqDpZhk1IDw5PudDQ=;
	b=UTtUv7+a0Q8GI1bRPYfXtZnLZvn2ztxVl0lYOe8F/6VSPYXuKRxhv+Ke7GOy3Q5McjsPZ8
	ELvcetmw3kNIzZBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7681113B03;
	Wed,  7 Aug 2024 13:34:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YHnTG993s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 52/54] ALSA: asihpi: Use standard print API
Date: Wed,  7 Aug 2024 15:34:42 +0200
Message-ID: <20240807133452.9424-53-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
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
X-Rspamd-Queue-Id: 8E41A1FDD2
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.01

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

The debug prints with a special macro snd_printddd() are replaced with
the conditional pr_debug().  Unfortunately dev_dbg() can't be applied
well due to the lack of the reference to the device pointer.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/asihpi/asihpi.c  | 101 ++++++++++++++++---------------------
 sound/pci/asihpi/hpioctl.c |   2 +-
 2 files changed, 44 insertions(+), 59 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 001786e2aba1..fdd4fe16225f 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -36,19 +36,10 @@ MODULE_AUTHOR("AudioScience inc. <support@audioscience.com>");
 MODULE_DESCRIPTION("AudioScience ALSA ASI5xxx ASI6xxx ASI87xx ASI89xx "
 			HPI_VER_STRING);
 
-#if defined CONFIG_SND_DEBUG_VERBOSE
-/**
- * snd_printddd - very verbose debug printk
- * @format: format string
- *
- * Works like snd_printk() for debugging purposes.
- * Ignored when CONFIG_SND_DEBUG_VERBOSE is not set.
- * Must set snd module debug parameter to 3 to enable at runtime.
- */
-#define snd_printddd(format, args...) \
-	__snd_printk(3, __FILE__, __LINE__, format, ##args)
+#ifdef ASIHPI_VERBOSE_DEBUG
+#define asihpi_dbg(format, args...) pr_debug(format, ##args)
 #else
-#define snd_printddd(format, args...) do { } while (0)
+#define asihpi_dbg(format, args...) do { } while (0)
 #endif
 
 static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;	/* index 0-MAX */
@@ -260,8 +251,7 @@ static inline u16 hpi_stream_group_reset(u32 h_stream)
 static u16 handle_error(u16 err, int line, char *filename)
 {
 	if (err)
-		printk(KERN_WARNING
-			"in file %s, line %d: HPI error %d\n",
+		pr_warn("in file %s, line %d: HPI error %d\n",
 			filename, line, err);
 	return err;
 }
@@ -273,16 +263,18 @@ static u16 handle_error(u16 err, int line, char *filename)
 static void print_hwparams(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *p)
 {
+	struct device *dev = substream->pcm->card->dev;
 	char name[16];
+
 	snd_pcm_debug_name(substream, name, sizeof(name));
-	snd_printdd("%s HWPARAMS\n", name);
-	snd_printdd(" samplerate=%dHz channels=%d format=%d subformat=%d\n",
+	dev_dbg(dev, "%s HWPARAMS\n", name);
+	dev_dbg(dev, " samplerate=%dHz channels=%d format=%d subformat=%d\n",
 		params_rate(p), params_channels(p),
 		params_format(p), params_subformat(p));
-	snd_printdd(" buffer=%dB period=%dB period_size=%dB periods=%d\n",
+	dev_dbg(dev, " buffer=%dB period=%dB period_size=%dB periods=%d\n",
 		params_buffer_bytes(p), params_period_bytes(p),
 		params_period_size(p), params_periods(p));
-	snd_printdd(" buffer_size=%d access=%d data_rate=%dB/s\n",
+	dev_dbg(dev, " buffer_size=%d access=%d data_rate=%dB/s\n",
 		params_buffer_size(p), params_access(p),
 		params_rate(p) * params_channels(p) *
 		snd_pcm_format_width(params_format(p)) / 8);
@@ -317,7 +309,8 @@ static const snd_pcm_format_t hpi_to_alsa_formats[] = {
 };
 
 
-static int snd_card_asihpi_format_alsa2hpi(snd_pcm_format_t alsa_format,
+static int snd_card_asihpi_format_alsa2hpi(struct snd_card_asihpi *asihpi,
+					   snd_pcm_format_t alsa_format,
 					   u16 *hpi_format)
 {
 	u16 format;
@@ -330,8 +323,8 @@ static int snd_card_asihpi_format_alsa2hpi(snd_pcm_format_t alsa_format,
 		}
 	}
 
-	snd_printd(KERN_WARNING "failed match for alsa format %d\n",
-		   alsa_format);
+	dev_dbg(asihpi->card->dev, "failed match for alsa format %d\n",
+		alsa_format);
 	*hpi_format = 0;
 	return -EINVAL;
 }
@@ -439,7 +432,7 @@ static int snd_card_asihpi_pcm_hw_params(struct snd_pcm_substream *substream,
 	unsigned int bytes_per_sec;
 
 	print_hwparams(substream, params);
-	err = snd_card_asihpi_format_alsa2hpi(params_format(params), &format);
+	err = snd_card_asihpi_format_alsa2hpi(card, params_format(params), &format);
 	if (err)
 		return err;
 
@@ -461,13 +454,13 @@ static int snd_card_asihpi_pcm_hw_params(struct snd_pcm_substream *substream,
 		err = hpi_stream_host_buffer_attach(dpcm->h_stream,
 			params_buffer_bytes(params),  runtime->dma_addr);
 		if (err == 0) {
-			snd_printdd(
+			dev_dbg(card->card->dev,
 				"stream_host_buffer_attach success %u %lu\n",
 				params_buffer_bytes(params),
 				(unsigned long)runtime->dma_addr);
 		} else {
-			snd_printd("stream_host_buffer_attach error %d\n",
-					err);
+			dev_dbg(card->card->dev,
+				"stream_host_buffer_attach error %d\n", err);
 			return -ENOMEM;
 		}
 
@@ -569,7 +562,7 @@ static int snd_card_asihpi_trigger(struct snd_pcm_substream *substream,
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		snd_printdd("%s trigger start\n", name);
+		dev_dbg(card->card->dev, "%s trigger start\n", name);
 		snd_pcm_group_for_each_entry(s, substream) {
 			struct snd_pcm_runtime *runtime = s->runtime;
 			struct snd_card_asihpi_pcm *ds = runtime->private_data;
@@ -590,7 +583,7 @@ static int snd_card_asihpi_trigger(struct snd_pcm_substream *substream,
 				* data??
 				*/
 				unsigned int preload = ds->period_bytes * 1;
-				snd_printddd("%d preload %d\n", s->number, preload);
+				asihpi_dbg("%d preload %d\n", s->number, preload);
 				hpi_handle_error(hpi_outstream_write_buf(
 						ds->h_stream,
 						&runtime->dma_area[0],
@@ -600,7 +593,7 @@ static int snd_card_asihpi_trigger(struct snd_pcm_substream *substream,
 			}
 
 			if (card->support_grouping) {
-				snd_printdd("%d group\n", s->number);
+				dev_dbg(card->card->dev, "%d group\n", s->number);
 				e = hpi_stream_group_add(
 					dpcm->h_stream,
 					ds->h_stream);
@@ -621,7 +614,7 @@ static int snd_card_asihpi_trigger(struct snd_pcm_substream *substream,
 		break;
 
 	case SNDRV_PCM_TRIGGER_STOP:
-		snd_printdd("%s trigger stop\n", name);
+		dev_dbg(card->card->dev, "%s trigger stop\n", name);
 		card->pcm_stop(substream);
 		snd_pcm_group_for_each_entry(s, substream) {
 			if (snd_pcm_substream_chip(s) != card)
@@ -635,7 +628,7 @@ static int snd_card_asihpi_trigger(struct snd_pcm_substream *substream,
 			__snd_pcm_set_state(s->runtime, SNDRV_PCM_STATE_SETUP);
 
 			if (card->support_grouping) {
-				snd_printdd("%d group\n", s->number);
+				dev_dbg(card->card->dev, "%d group\n", s->number);
 				snd_pcm_trigger_done(s, substream);
 			} else
 				break;
@@ -652,17 +645,17 @@ static int snd_card_asihpi_trigger(struct snd_pcm_substream *substream,
 		break;
 
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		snd_printdd("%s trigger pause release\n", name);
+		dev_dbg(card->card->dev, "%s trigger pause release\n", name);
 		card->pcm_start(substream);
 		hpi_handle_error(hpi_stream_start(dpcm->h_stream));
 		break;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		snd_printdd("%s trigger pause push\n", name);
+		dev_dbg(card->card->dev, "%s trigger pause push\n", name);
 		card->pcm_stop(substream);
 		hpi_handle_error(hpi_stream_stop(dpcm->h_stream));
 		break;
 	default:
-		snd_printd(KERN_ERR "\tINVALID\n");
+		dev_dbg(card->card->dev, "\tINVALID\n");
 		return -EINVAL;
 	}
 
@@ -760,12 +753,13 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 			if (state == HPI_STATE_STOPPED) {
 				if (bytes_avail == 0) {
 					hpi_handle_error(hpi_stream_start(ds->h_stream));
-					snd_printdd("P%d start\n", s->number);
+					dev_dbg(card->card->dev,
+						"P%d start\n", s->number);
 					ds->drained_count = 0;
 				}
 			} else if (state == HPI_STATE_DRAINED) {
-				snd_printd(KERN_WARNING "P%d drained\n",
-						s->number);
+				dev_dbg(card->card->dev,
+					"P%d drained\n", s->number);
 				ds->drained_count++;
 				if (ds->drained_count > 20) {
 					snd_pcm_stop_xrun(s);
@@ -790,7 +784,7 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 				newdata);
 		}
 
-		snd_printddd(
+		asihpi_dbg(
 			"timer1, %s, %d, S=%d, elap=%d, rw=%d, dsp=%d, left=%d, aux=%d, space=%d, hw_ptr=%ld, appl_ptr=%ld\n",
 			name, s->number, state,
 			ds->pcm_buf_elapsed_dma_ofs,
@@ -821,7 +815,7 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 
 	next_jiffies = max(next_jiffies, 1U);
 	dpcm->timer.expires = jiffies + next_jiffies;
-	snd_printddd("timer2, jif=%d, buf_pos=%d, newdata=%d, xfer=%d\n",
+	asihpi_dbg("timer2, jif=%d, buf_pos=%d, newdata=%d, xfer=%d\n",
 			next_jiffies, pcm_buf_dma_ofs, newdata, xfercount);
 
 	snd_pcm_group_for_each_entry(s, substream) {
@@ -854,7 +848,7 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 			}
 
 			if (s->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-				snd_printddd("write1, P=%d, xfer=%d, buf_ofs=%d\n",
+				asihpi_dbg("write1, P=%d, xfer=%d, buf_ofs=%d\n",
 					s->number, xfer1, buf_ofs);
 				hpi_handle_error(
 					hpi_outstream_write_buf(
@@ -864,7 +858,7 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 				if (xfer2) {
 					pd = s->runtime->dma_area;
 
-					snd_printddd("write2, P=%d, xfer=%d, buf_ofs=%d\n",
+					asihpi_dbg("write2, P=%d, xfer=%d, buf_ofs=%d\n",
 							s->number,
 							xfercount - xfer1, buf_ofs);
 					hpi_handle_error(
@@ -874,7 +868,7 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 							&ds->format));
 				}
 			} else {
-				snd_printddd("read1, C=%d, xfer=%d\n",
+				asihpi_dbg("read1, C=%d, xfer=%d\n",
 					s->number, xfer1);
 				hpi_handle_error(
 					hpi_instream_read_buf(
@@ -882,7 +876,7 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 						pd, xfer1));
 				if (xfer2) {
 					pd = s->runtime->dma_area;
-					snd_printddd("read2, C=%d, xfer=%d\n",
+					asihpi_dbg("read2, C=%d, xfer=%d\n",
 						s->number, xfer2);
 					hpi_handle_error(
 						hpi_instream_read_buf(
@@ -919,8 +913,6 @@ static int snd_card_asihpi_playback_prepare(struct snd_pcm_substream *
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_card_asihpi_pcm *dpcm = runtime->private_data;
 
-	snd_printdd("P%d prepare\n", substream->number);
-
 	hpi_handle_error(hpi_outstream_reset(dpcm->h_stream));
 	dpcm->pcm_buf_host_rw_ofs = 0;
 	dpcm->pcm_buf_dma_ofs = 0;
@@ -938,7 +930,7 @@ snd_card_asihpi_playback_pointer(struct snd_pcm_substream *substream)
 	snd_pcm_debug_name(substream, name, sizeof(name));
 
 	ptr = bytes_to_frames(runtime, dpcm->pcm_buf_dma_ofs  % dpcm->buffer_bytes);
-	snd_printddd("%s, pointer=%ld\n", name, (unsigned long)ptr);
+	asihpi_dbg("%s, pointer=%ld\n", name, (unsigned long)ptr);
 	return ptr;
 }
 
@@ -1060,8 +1052,6 @@ static int snd_card_asihpi_playback_open(struct snd_pcm_substream *substream)
 	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
 		card->update_interval_frames, UINT_MAX);
 
-	snd_printdd("playback open\n");
-
 	return 0;
 }
 
@@ -1071,8 +1061,6 @@ static int snd_card_asihpi_playback_close(struct snd_pcm_substream *substream)
 	struct snd_card_asihpi_pcm *dpcm = runtime->private_data;
 
 	hpi_handle_error(hpi_outstream_close(dpcm->h_stream));
-	snd_printdd("playback close\n");
-
 	return 0;
 }
 
@@ -1095,7 +1083,7 @@ snd_card_asihpi_capture_pointer(struct snd_pcm_substream *substream)
 	char name[16];
 	snd_pcm_debug_name(substream, name, sizeof(name));
 
-	snd_printddd("%s, pointer=%d\n", name, dpcm->pcm_buf_dma_ofs);
+	asihpi_dbg("%s, pointer=%d\n", name, dpcm->pcm_buf_dma_ofs);
 	/* NOTE Unlike playback can't use actual samples_played
 		for the capture position, because those samples aren't yet in
 		the local buffer available for reading.
@@ -1113,7 +1101,6 @@ static int snd_card_asihpi_capture_prepare(struct snd_pcm_substream *substream)
 	dpcm->pcm_buf_dma_ofs = 0;
 	dpcm->pcm_buf_elapsed_dma_ofs = 0;
 
-	snd_printdd("Capture Prepare %d\n", substream->number);
 	return 0;
 }
 
@@ -1162,8 +1149,9 @@ static int snd_card_asihpi_capture_open(struct snd_pcm_substream *substream)
 	if (dpcm == NULL)
 		return -ENOMEM;
 
-	snd_printdd("capture open adapter %d stream %d\n",
-			card->hpi->adapter->index, substream->number);
+
+	dev_dbg(card->card->dev, "capture open adapter %d stream %d\n",
+		card->hpi->adapter->index, substream->number);
 
 	err = hpi_handle_error(
 	    hpi_instream_open(card->hpi->adapter->index,
@@ -1413,8 +1401,6 @@ static void asihpi_ctl_init(struct snd_kcontrol_new *snd_control,
 		hpi_ctl->src_node_index,
 		dir, name);
 	}
-	/* printk(KERN_INFO "Adding %s %d to %d ",  hpi_ctl->name,
-		hpi_ctl->wSrcNodeType, hpi_ctl->wDstNodeType); */
 }
 
 /*------------------------------------------------------------
@@ -2175,9 +2161,8 @@ static int snd_asihpi_mux_get(struct snd_kcontrol *kcontrol,
 			return 0;
 		}
 	}
-	snd_printd(KERN_WARNING
-		"Control %x failed to match mux source %hu %hu\n",
-		h_control, source_type, source_index);
+	pr_warn("%s: Control %x failed to match mux source %hu %hu\n",
+		__func__, h_control, source_type, source_index);
 	ucontrol->value.enumerated.item[0] = 0;
 	return 0;
 }
diff --git a/sound/pci/asihpi/hpioctl.c b/sound/pci/asihpi/hpioctl.c
index 477a5b4b50bc..9fb0c8e503df 100644
--- a/sound/pci/asihpi/hpioctl.c
+++ b/sound/pci/asihpi/hpioctl.c
@@ -356,7 +356,7 @@ int asihpi_adapter_probe(struct pci_dev *pci_dev,
 
 	memset(&adapter, 0, sizeof(adapter));
 
-	dev_printk(KERN_DEBUG, &pci_dev->dev,
+	dev_dbg(&pci_dev->dev,
 		"probe %04x:%04x,%04x:%04x,%04x\n", pci_dev->vendor,
 		pci_dev->device, pci_dev->subsystem_vendor,
 		pci_dev->subsystem_device, pci_dev->devfn);
-- 
2.43.0

