Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E4232277B
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480070; cv=none; b=jvVm9BDGT4G4iQSFibGtp0uSxE6hLdRsX//v2uDrcNdHrvPZWe59f7I0zj3H+QzTVk480It3j2ZWCwrnpv+E3v7m7OJO+xpOD0xWUzYSscXAwRlMpQcuhZiPPtYW101pbiP26BSWAs/Rb0pXqSkQQ6DD8wXRH1RussJLIw8SGXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480070; c=relaxed/simple;
	bh=5jqjvHpE5iI2rQGE9nepKKchq3uJ3YSBZ5qwrroqdkE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bw6R+N9H1dsMfmHVyGKRrrdGshWRtVE0tiJXhrXRJmIygMa5e8SzYnXolWwpObKVEsAqvF7Hlh68WLQeJQVmROMWeYQog159hEFKuBtnQ8X8ie4KGnZawDT3nP/GtErooLKwb3DxjLvONuWYIqrzbviM6CclhtirPU/PGvEefMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rB5VN8/P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8Lv6VBtz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rB5VN8/P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8Lv6VBtz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rB5VN8/P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8Lv6VBtz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rB5VN8/P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8Lv6VBtz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CA84F33EF6;
	Fri, 29 Aug 2025 15:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pGyHtNgMOdOs0GZkRhQ4urGwOBAswYdOoDzhP3ZR1wA=;
	b=rB5VN8/PLjh3ccV/Wj1eMVwIxcVY/fWUvblsZlReDwDw3OvbxI8fWCc6dS6aJn7FmD50fb
	sJAOupzg6tGRI6gdtIWbaeBxjXwljY3o8axOKsJAg832OHNASZlaQ2MdiJjWg2g91PxCee
	jeOkTlG5pQbOXt/squ6NeBfx9RKC6wA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pGyHtNgMOdOs0GZkRhQ4urGwOBAswYdOoDzhP3ZR1wA=;
	b=8Lv6VBtzXjwbtP2uBiIC1XxJiWWucLKL+vamdTLzfi5mWDdpShU4Nyf2TGNe2xulJU7c8P
	RZefQa+aM3CSxzBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pGyHtNgMOdOs0GZkRhQ4urGwOBAswYdOoDzhP3ZR1wA=;
	b=rB5VN8/PLjh3ccV/Wj1eMVwIxcVY/fWUvblsZlReDwDw3OvbxI8fWCc6dS6aJn7FmD50fb
	sJAOupzg6tGRI6gdtIWbaeBxjXwljY3o8axOKsJAg832OHNASZlaQ2MdiJjWg2g91PxCee
	jeOkTlG5pQbOXt/squ6NeBfx9RKC6wA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pGyHtNgMOdOs0GZkRhQ4urGwOBAswYdOoDzhP3ZR1wA=;
	b=8Lv6VBtzXjwbtP2uBiIC1XxJiWWucLKL+vamdTLzfi5mWDdpShU4Nyf2TGNe2xulJU7c8P
	RZefQa+aM3CSxzBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF96D13326;
	Fri, 29 Aug 2025 15:07:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ECCXKTbCsWjMHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:07:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 4/9] ALSA: hiface: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:07:12 +0200
Message-ID: <20250829150724.6886-5-tiwai@suse.de>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/hiface/chip.c | 11 +++--------
 sound/usb/hiface/pcm.c  | 25 +++++++------------------
 2 files changed, 10 insertions(+), 26 deletions(-)

diff --git a/sound/usb/hiface/chip.c b/sound/usb/hiface/chip.c
index 95385e90882c..bce28f683666 100644
--- a/sound/usb/hiface/chip.c
+++ b/sound/usb/hiface/chip.c
@@ -101,7 +101,7 @@ static int hiface_chip_probe(struct usb_interface *intf,
 
 	/* check whether the card is already registered */
 	chip = NULL;
-	mutex_lock(&register_mutex);
+	guard(mutex)(&register_mutex);
 
 	for (i = 0; i < SNDRV_CARDS; i++)
 		if (enable[i])
@@ -109,13 +109,12 @@ static int hiface_chip_probe(struct usb_interface *intf,
 
 	if (i >= SNDRV_CARDS) {
 		dev_err(&device->dev, "no available " CARD_NAME " audio device\n");
-		ret = -ENODEV;
-		goto err;
+		return -ENODEV;
 	}
 
 	ret = hiface_chip_create(intf, device, i, quirk, &chip);
 	if (ret < 0)
-		goto err;
+		return ret;
 
 	ret = hiface_pcm_init(chip, quirk ? quirk->extra_freq : 0);
 	if (ret < 0)
@@ -127,15 +126,11 @@ static int hiface_chip_probe(struct usb_interface *intf,
 		goto err_chip_destroy;
 	}
 
-	mutex_unlock(&register_mutex);
-
 	usb_set_intfdata(intf, chip);
 	return 0;
 
 err_chip_destroy:
 	snd_card_free(chip->card);
-err:
-	mutex_unlock(&register_mutex);
 	return ret;
 }
 
diff --git a/sound/usb/hiface/pcm.c b/sound/usb/hiface/pcm.c
index cf650fab54d7..f992e94feb64 100644
--- a/sound/usb/hiface/pcm.c
+++ b/sound/usb/hiface/pcm.c
@@ -356,7 +356,7 @@ static int hiface_pcm_open(struct snd_pcm_substream *alsa_sub)
 	if (rt->panic)
 		return -EPIPE;
 
-	mutex_lock(&rt->stream_mutex);
+	guard(mutex)(&rt->stream_mutex);
 	alsa_rt->hw = pcm_hw;
 
 	if (alsa_sub->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -364,7 +364,6 @@ static int hiface_pcm_open(struct snd_pcm_substream *alsa_sub)
 
 	if (!sub) {
 		struct device *device = &rt->chip->dev->dev;
-		mutex_unlock(&rt->stream_mutex);
 		dev_err(device, "Invalid stream type\n");
 		return -EINVAL;
 	}
@@ -377,15 +376,12 @@ static int hiface_pcm_open(struct snd_pcm_substream *alsa_sub)
 		ret = snd_pcm_hw_constraint_list(alsa_sub->runtime, 0,
 						 SNDRV_PCM_HW_PARAM_RATE,
 						 &constraints_extra_rates);
-		if (ret < 0) {
-			mutex_unlock(&rt->stream_mutex);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	sub->instance = alsa_sub;
 	sub->active = false;
-	mutex_unlock(&rt->stream_mutex);
 	return 0;
 }
 
@@ -398,7 +394,7 @@ static int hiface_pcm_close(struct snd_pcm_substream *alsa_sub)
 	if (rt->panic)
 		return 0;
 
-	mutex_lock(&rt->stream_mutex);
+	guard(mutex)(&rt->stream_mutex);
 	if (sub) {
 		hiface_pcm_stream_stop(rt);
 
@@ -409,7 +405,6 @@ static int hiface_pcm_close(struct snd_pcm_substream *alsa_sub)
 		spin_unlock_irqrestore(&sub->lock, flags);
 
 	}
-	mutex_unlock(&rt->stream_mutex);
 	return 0;
 }
 
@@ -425,7 +420,7 @@ static int hiface_pcm_prepare(struct snd_pcm_substream *alsa_sub)
 	if (!sub)
 		return -ENODEV;
 
-	mutex_lock(&rt->stream_mutex);
+	guard(mutex)(&rt->stream_mutex);
 
 	hiface_pcm_stream_stop(rt);
 
@@ -435,17 +430,12 @@ static int hiface_pcm_prepare(struct snd_pcm_substream *alsa_sub)
 	if (rt->stream_state == STREAM_DISABLED) {
 
 		ret = hiface_pcm_set_rate(rt, alsa_rt->rate);
-		if (ret) {
-			mutex_unlock(&rt->stream_mutex);
+		if (ret)
 			return ret;
-		}
 		ret = hiface_pcm_stream_start(rt);
-		if (ret) {
-			mutex_unlock(&rt->stream_mutex);
+		if (ret)
 			return ret;
-		}
 	}
-	mutex_unlock(&rt->stream_mutex);
 	return 0;
 }
 
@@ -532,9 +522,8 @@ void hiface_pcm_abort(struct hiface_chip *chip)
 	if (rt) {
 		rt->panic = true;
 
-		mutex_lock(&rt->stream_mutex);
+		guard(mutex)(&rt->stream_mutex);
 		hiface_pcm_stream_stop(rt);
-		mutex_unlock(&rt->stream_mutex);
 	}
 }
 
-- 
2.50.1

