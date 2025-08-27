Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2703176FA
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 07:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756279777; cv=none; b=CfJXWZoa6UXm6FsFQiX4OU8HSb5Pisw7GMtxQWVZUF5MgSfAR/F8nTjR0i2Bt9AcCivStlGIT8R97dDqihROk1TlqhGBE4bFNv8sh9y31erde6mQb5ASkDQ5fKOv8Ijc+UnVIbbcSoOzCYQIJJH7zlLyJ/V4kp8V6ED8fl3FTCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756279777; c=relaxed/simple;
	bh=USdW5DtkITk5Px5aVqqKyxw508gBAqKU1fsX3JYBPUE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dWIWbd9QgUYhlxX5Ad3lA/83UwqUVuSH9uXoYDXdU0gkq69/bK6mT3MRlbyhL56YTly+UY9iOCSdmJrWo75rK9JHGvO+u/ZjLtdSTpeudkkF20F4Swc5hFJRu9iBR2AueAUfkgOshvzEMk3MDpJWqwrp2iBVk+z//7k6CHqvDpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0zpvfj+/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hFHcG/RO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0zpvfj+/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hFHcG/RO; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0zpvfj+/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hFHcG/RO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0zpvfj+/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hFHcG/RO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 602BD1FEC9;
	Wed, 27 Aug 2025 07:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D23ozKM9FmCz+9sTOpaoZszC1h68jiqVkszsfIH27W0=;
	b=0zpvfj+/p/1IUhF0zOd6kGXuqBjLU/ZqJ7fpleucwL/28V3fU+AoRBIFA+umFLtNoHB9hz
	HNBU2pThRY1QxpBojS7RBJ+QCCbOrh4XpXCrhzU4KL4Av8SMDwrMO6PtptWLGI32crE9uZ
	jhKeZ06qDlqI8toX5cNR26XqmCyr+TU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D23ozKM9FmCz+9sTOpaoZszC1h68jiqVkszsfIH27W0=;
	b=hFHcG/ROZsgh8wv7kV6ioQM3lCPfj1iidU6hJ+ztIq6YWG9skAxPIjLDeAOOo5qYHMvVcy
	XulKNn8X2RprdbAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D23ozKM9FmCz+9sTOpaoZszC1h68jiqVkszsfIH27W0=;
	b=0zpvfj+/p/1IUhF0zOd6kGXuqBjLU/ZqJ7fpleucwL/28V3fU+AoRBIFA+umFLtNoHB9hz
	HNBU2pThRY1QxpBojS7RBJ+QCCbOrh4XpXCrhzU4KL4Av8SMDwrMO6PtptWLGI32crE9uZ
	jhKeZ06qDlqI8toX5cNR26XqmCyr+TU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D23ozKM9FmCz+9sTOpaoZszC1h68jiqVkszsfIH27W0=;
	b=hFHcG/ROZsgh8wv7kV6ioQM3lCPfj1iidU6hJ+ztIq6YWG9skAxPIjLDeAOOo5qYHMvVcy
	XulKNn8X2RprdbAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45C5913867;
	Wed, 27 Aug 2025 07:29:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2L25D9CzrmjoagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 07:29:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 06/25] ALSA: hda: Use auto cleanup macros for DSP loader locks
Date: Wed, 27 Aug 2025 09:28:46 +0200
Message-ID: <20250827072916.31933-7-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827072916.31933-1-tiwai@suse.de>
References: <20250827072916.31933-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

There are temporary DSP locking/unlocking patterns found in various
places, and those can be cleaned up nicely with the guard() macro
calling snd_hdac_dsp_lock() and *_unlock().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hdaudio.h       |  1 +
 sound/hda/common/controller.c | 47 +++++++++++++++--------------------
 sound/hda/core/stream.c       | 11 +++-----
 3 files changed, 24 insertions(+), 35 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index d38234f8fe44..4e0c1d8af09f 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -651,6 +651,7 @@ int snd_hdac_stream_set_lpib(struct hdac_stream *azx_dev, u32 value);
 #define snd_hdac_dsp_lock(dev)		mutex_lock(&(dev)->dsp_mutex)
 #define snd_hdac_dsp_unlock(dev)	mutex_unlock(&(dev)->dsp_mutex)
 #define snd_hdac_stream_is_locked(dev)	((dev)->locked)
+DEFINE_GUARD(snd_hdac_dsp_lock, struct hdac_stream *, snd_hdac_dsp_lock(_T), snd_hdac_dsp_unlock(_T))
 /* DSP loader helpers */
 int snd_hdac_dsp_prepare(struct hdac_stream *azx_dev, unsigned int format,
 			 unsigned int byte_size, struct snd_dma_buffer *bufp);
diff --git a/sound/hda/common/controller.c b/sound/hda/common/controller.c
index 84387ed761be..ceab8625bb1f 100644
--- a/sound/hda/common/controller.c
+++ b/sound/hda/common/controller.c
@@ -32,8 +32,11 @@
 #include "controller_trace.h"
 
 /* DSP lock helpers */
-#define dsp_lock(dev)		snd_hdac_dsp_lock(azx_stream(dev))
-#define dsp_unlock(dev)		snd_hdac_dsp_unlock(azx_stream(dev))
+#ifdef CONFIG_SND_HDA_DSP_LOADER
+#define guard_dsp_lock(dev)	guard(snd_hdac_dsp_lock)(azx_stream(dev))
+#else
+#define guard_dsp_lock(dev)	do {} while (0)
+#endif
 #define dsp_is_locked(dev)	snd_hdac_stream_is_locked(azx_stream(dev))
 
 /* assign a stream for the PCM */
@@ -110,14 +113,11 @@ static int azx_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct azx *chip = apcm->chip;
 	struct azx_dev *azx_dev = get_azx_dev(substream);
 	struct hdac_stream *hdas = azx_stream(azx_dev);
-	int ret = 0;
 
 	trace_azx_pcm_hw_params(chip, azx_dev);
-	dsp_lock(azx_dev);
-	if (dsp_is_locked(azx_dev)) {
-		ret = -EBUSY;
-		goto unlock;
-	}
+	guard_dsp_lock(azx_dev);
+	if (dsp_is_locked(azx_dev))
+		return -EBUSY;
 
 	/* Set up BDLEs here, return -ENOMEM if too many BDLEs are required */
 	hdas->bufsize = params_buffer_bytes(hw_params);
@@ -127,11 +127,9 @@ static int azx_pcm_hw_params(struct snd_pcm_substream *substream,
 		(hw_params->info & SNDRV_PCM_INFO_NO_PERIOD_WAKEUP) &&
 		(hw_params->flags & SNDRV_PCM_HW_PARAMS_NO_PERIOD_WAKEUP);
 	if (snd_hdac_stream_setup_periods(hdas) < 0)
-		ret = -ENOMEM;
+		return -ENOMEM;
 
-unlock:
-	dsp_unlock(azx_dev);
-	return ret;
+	return 0;
 }
 
 static int azx_pcm_hw_free(struct snd_pcm_substream *substream)
@@ -141,14 +139,13 @@ static int azx_pcm_hw_free(struct snd_pcm_substream *substream)
 	struct hda_pcm_stream *hinfo = to_hda_pcm_stream(substream);
 
 	/* reset BDL address */
-	dsp_lock(azx_dev);
+	guard_dsp_lock(azx_dev);
 	if (!dsp_is_locked(azx_dev))
 		snd_hdac_stream_cleanup(azx_stream(azx_dev));
 
 	snd_hda_codec_cleanup(apcm->codec, hinfo, substream);
 
 	azx_stream(azx_dev)->prepared = 0;
-	dsp_unlock(azx_dev);
 	return 0;
 }
 
@@ -166,11 +163,9 @@ static int azx_pcm_prepare(struct snd_pcm_substream *substream)
 	unsigned short ctls = spdif ? spdif->ctls : 0;
 
 	trace_azx_pcm_prepare(chip, azx_dev);
-	dsp_lock(azx_dev);
-	if (dsp_is_locked(azx_dev)) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	guard_dsp_lock(azx_dev);
+	if (dsp_is_locked(azx_dev))
+		return -EBUSY;
 
 	snd_hdac_stream_reset(azx_stream(azx_dev));
 	bits = snd_hdac_stream_format_bits(runtime->format, SNDRV_PCM_SUBFORMAT_STD, hinfo->maxbps);
@@ -180,13 +175,12 @@ static int azx_pcm_prepare(struct snd_pcm_substream *substream)
 		dev_err(chip->card->dev,
 			"invalid format_val, rate=%d, ch=%d, format=%d\n",
 			runtime->rate, runtime->channels, runtime->format);
-		err = -EINVAL;
-		goto unlock;
+		return -EINVAL;
 	}
 
 	err = snd_hdac_stream_set_params(azx_stream(azx_dev), format_val);
 	if (err < 0)
-		goto unlock;
+		return err;
 
 	snd_hdac_stream_setup(azx_stream(azx_dev), false);
 
@@ -197,12 +191,11 @@ static int azx_pcm_prepare(struct snd_pcm_substream *substream)
 		stream_tag -= chip->capture_streams;
 	err = snd_hda_codec_prepare(apcm->codec, hinfo, stream_tag,
 				     azx_dev->core.format_val, substream);
+	if (err < 0)
+		return err;
 
- unlock:
-	if (!err)
-		azx_stream(azx_dev)->prepared = 1;
-	dsp_unlock(azx_dev);
-	return err;
+	azx_stream(azx_dev)->prepared = 1;
+	return 0;
 }
 
 static int azx_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
diff --git a/sound/hda/core/stream.c b/sound/hda/core/stream.c
index 4a87bef8834f..0caeebcc591a 100644
--- a/sound/hda/core/stream.c
+++ b/sound/hda/core/stream.c
@@ -922,12 +922,11 @@ int snd_hdac_dsp_prepare(struct hdac_stream *azx_dev, unsigned int format,
 	struct hdac_bus *bus = azx_dev->bus;
 	int err;
 
-	snd_hdac_dsp_lock(azx_dev);
+	guard(snd_hdac_dsp_lock)(azx_dev);
 	spin_lock_irq(&bus->reg_lock);
 	if (azx_dev->running || azx_dev->locked) {
 		spin_unlock_irq(&bus->reg_lock);
-		err = -EBUSY;
-		goto unlock;
+		return -EBUSY;
 	}
 	azx_dev->locked = true;
 	spin_unlock_irq(&bus->reg_lock);
@@ -951,7 +950,6 @@ int snd_hdac_dsp_prepare(struct hdac_stream *azx_dev, unsigned int format,
 		goto error;
 
 	snd_hdac_stream_setup(azx_dev, true);
-	snd_hdac_dsp_unlock(azx_dev);
 	return azx_dev->stream_tag;
 
  error:
@@ -960,8 +958,6 @@ int snd_hdac_dsp_prepare(struct hdac_stream *azx_dev, unsigned int format,
 	spin_lock_irq(&bus->reg_lock);
 	azx_dev->locked = false;
 	spin_unlock_irq(&bus->reg_lock);
- unlock:
-	snd_hdac_dsp_unlock(azx_dev);
 	return err;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_dsp_prepare);
@@ -993,7 +989,7 @@ void snd_hdac_dsp_cleanup(struct hdac_stream *azx_dev,
 	if (!dmab->area || !azx_dev->locked)
 		return;
 
-	snd_hdac_dsp_lock(azx_dev);
+	guard(snd_hdac_dsp_lock)(azx_dev);
 	/* reset BDL address */
 	snd_hdac_stream_writel(azx_dev, SD_BDLPL, 0);
 	snd_hdac_stream_writel(azx_dev, SD_BDLPU, 0);
@@ -1008,7 +1004,6 @@ void snd_hdac_dsp_cleanup(struct hdac_stream *azx_dev,
 	spin_lock_irq(&bus->reg_lock);
 	azx_dev->locked = false;
 	spin_unlock_irq(&bus->reg_lock);
-	snd_hdac_dsp_unlock(azx_dev);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_dsp_cleanup);
 #endif /* CONFIG_SND_HDA_DSP_LOADER */
-- 
2.50.1

