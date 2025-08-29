Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C98B27A454
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480466; cv=none; b=L8E04cHjl62wHAE9xdcLs0Ex3ox0RIkwoCs+HvatY9VZ6NuL/x/3hzMuWhfS6AthvbuQIQ4XCBsF95S4aMhOvzzx7H/x/JF+ihCx8AIuGggDYw/DlgV2xoe6sECvXgQoCn0Nn4xoIfG6DHH6nSPttpAe0jxhcpwdCNlS2rUk77k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480466; c=relaxed/simple;
	bh=MkNftZISmuPo6OdRMKvdz8K3kCCTj8s7naTvokZ64j8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XCY0R3dPzo+Yv6Ez/KmwMZ5d9xS3/edTSb1yZ6gna+KuPNK0wImQKZw4qH//Fm0WhsGzWDiJK8jmaumLYgrSeEHMssdT6211seEhrlCHApXM6Rp3u3hiUuqOwy2zM5PJoxrFcw1sdsRJIwCjIJIEJnUCOmFL8xYHKpt/3+z1m9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2AkoTqdF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XmYh1XX1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2AkoTqdF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XmYh1XX1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2AkoTqdF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XmYh1XX1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2AkoTqdF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XmYh1XX1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F3F1F5C26E;
	Fri, 29 Aug 2025 15:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=emJdhZnEw/JUSZqWovdHc7iDlfmJHw7ybaWW1amh0bE=;
	b=2AkoTqdF9liPvzc3IAIzq3Fd83s9bFsTmjJYVUsjCV/s9qFdFSwwDtaeZiZ7BFYJ6A41A5
	5C1NjEV3dLcpucucLueuyHPyw0/JfrHJA3/CQXx7/8SBvdeVrjnHY/b5YLb61jHC/LlwFp
	E1kzuQDy5VFT+Mh+hSaWwlNZWUC7fbY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=emJdhZnEw/JUSZqWovdHc7iDlfmJHw7ybaWW1amh0bE=;
	b=XmYh1XX1fnHybJOeMqVcZfFv794swa5Cs3jw/2Lz+26guWRG8KE8sE/8zy1ag0yu6GTcns
	VGMG66TyjbKCqtAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2AkoTqdF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XmYh1XX1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=emJdhZnEw/JUSZqWovdHc7iDlfmJHw7ybaWW1amh0bE=;
	b=2AkoTqdF9liPvzc3IAIzq3Fd83s9bFsTmjJYVUsjCV/s9qFdFSwwDtaeZiZ7BFYJ6A41A5
	5C1NjEV3dLcpucucLueuyHPyw0/JfrHJA3/CQXx7/8SBvdeVrjnHY/b5YLb61jHC/LlwFp
	E1kzuQDy5VFT+Mh+hSaWwlNZWUC7fbY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=emJdhZnEw/JUSZqWovdHc7iDlfmJHw7ybaWW1amh0bE=;
	b=XmYh1XX1fnHybJOeMqVcZfFv794swa5Cs3jw/2Lz+26guWRG8KE8sE/8zy1ag0yu6GTcns
	VGMG66TyjbKCqtAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8AA913326;
	Fri, 29 Aug 2025 15:13:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UPSlM6bDsWiQIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:13:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 13/19] ALSA: aoa: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:13:27 +0200
Message-ID: <20250829151335.7342-14-tiwai@suse.de>
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
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: F3F1F5C26E
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
 sound/aoa/codecs/onyx.c         | 104 +++++++++--------------------
 sound/aoa/codecs/tas.c          | 113 +++++++++++---------------------
 sound/aoa/core/gpio-feature.c   |  20 ++----
 sound/aoa/core/gpio-pmf.c       |  26 +++-----
 sound/aoa/soundbus/i2sbus/pcm.c |  76 +++++++--------------
 5 files changed, 112 insertions(+), 227 deletions(-)

diff --git a/sound/aoa/codecs/onyx.c b/sound/aoa/codecs/onyx.c
index ac347a14f282..7400a5aa47ca 100644
--- a/sound/aoa/codecs/onyx.c
+++ b/sound/aoa/codecs/onyx.c
@@ -122,10 +122,9 @@ static int onyx_snd_vol_get(struct snd_kcontrol *kcontrol,
 	struct onyx *onyx = snd_kcontrol_chip(kcontrol);
 	s8 l, r;
 
-	mutex_lock(&onyx->mutex);
+	guard(mutex)(&onyx->mutex);
 	onyx_read_register(onyx, ONYX_REG_DAC_ATTEN_LEFT, &l);
 	onyx_read_register(onyx, ONYX_REG_DAC_ATTEN_RIGHT, &r);
-	mutex_unlock(&onyx->mutex);
 
 	ucontrol->value.integer.value[0] = l + VOLUME_RANGE_SHIFT;
 	ucontrol->value.integer.value[1] = r + VOLUME_RANGE_SHIFT;
@@ -146,15 +145,13 @@ static int onyx_snd_vol_put(struct snd_kcontrol *kcontrol,
 	    ucontrol->value.integer.value[1] > -1 + VOLUME_RANGE_SHIFT)
 		return -EINVAL;
 
-	mutex_lock(&onyx->mutex);
+	guard(mutex)(&onyx->mutex);
 	onyx_read_register(onyx, ONYX_REG_DAC_ATTEN_LEFT, &l);
 	onyx_read_register(onyx, ONYX_REG_DAC_ATTEN_RIGHT, &r);
 
 	if (l + VOLUME_RANGE_SHIFT == ucontrol->value.integer.value[0] &&
-	    r + VOLUME_RANGE_SHIFT == ucontrol->value.integer.value[1]) {
-		mutex_unlock(&onyx->mutex);
+	    r + VOLUME_RANGE_SHIFT == ucontrol->value.integer.value[1])
 		return 0;
-	}
 
 	onyx_write_register(onyx, ONYX_REG_DAC_ATTEN_LEFT,
 			    ucontrol->value.integer.value[0]
@@ -162,7 +159,6 @@ static int onyx_snd_vol_put(struct snd_kcontrol *kcontrol,
 	onyx_write_register(onyx, ONYX_REG_DAC_ATTEN_RIGHT,
 			    ucontrol->value.integer.value[1]
 			     - VOLUME_RANGE_SHIFT);
-	mutex_unlock(&onyx->mutex);
 
 	return 1;
 }
@@ -198,9 +194,8 @@ static int onyx_snd_inputgain_get(struct snd_kcontrol *kcontrol,
 	struct onyx *onyx = snd_kcontrol_chip(kcontrol);
 	u8 ig;
 
-	mutex_lock(&onyx->mutex);
+	guard(mutex)(&onyx->mutex);
 	onyx_read_register(onyx, ONYX_REG_ADC_CONTROL, &ig);
-	mutex_unlock(&onyx->mutex);
 
 	ucontrol->value.integer.value[0] =
 		(ig & ONYX_ADC_PGA_GAIN_MASK) + INPUTGAIN_RANGE_SHIFT;
@@ -217,14 +212,13 @@ static int onyx_snd_inputgain_put(struct snd_kcontrol *kcontrol,
 	if (ucontrol->value.integer.value[0] < 3 + INPUTGAIN_RANGE_SHIFT ||
 	    ucontrol->value.integer.value[0] > 28 + INPUTGAIN_RANGE_SHIFT)
 		return -EINVAL;
-	mutex_lock(&onyx->mutex);
+	guard(mutex)(&onyx->mutex);
 	onyx_read_register(onyx, ONYX_REG_ADC_CONTROL, &v);
 	n = v;
 	n &= ~ONYX_ADC_PGA_GAIN_MASK;
 	n |= (ucontrol->value.integer.value[0] - INPUTGAIN_RANGE_SHIFT)
 		& ONYX_ADC_PGA_GAIN_MASK;
 	onyx_write_register(onyx, ONYX_REG_ADC_CONTROL, n);
-	mutex_unlock(&onyx->mutex);
 
 	return n != v;
 }
@@ -252,9 +246,8 @@ static int onyx_snd_capture_source_get(struct snd_kcontrol *kcontrol,
 	struct onyx *onyx = snd_kcontrol_chip(kcontrol);
 	s8 v;
 
-	mutex_lock(&onyx->mutex);
+	guard(mutex)(&onyx->mutex);
 	onyx_read_register(onyx, ONYX_REG_ADC_CONTROL, &v);
-	mutex_unlock(&onyx->mutex);
 
 	ucontrol->value.enumerated.item[0] = !!(v&ONYX_ADC_INPUT_MIC);
 
@@ -265,13 +258,12 @@ static void onyx_set_capture_source(struct onyx *onyx, int mic)
 {
 	s8 v;
 
-	mutex_lock(&onyx->mutex);
+	guard(mutex)(&onyx->mutex);
 	onyx_read_register(onyx, ONYX_REG_ADC_CONTROL, &v);
 	v &= ~ONYX_ADC_INPUT_MIC;
 	if (mic)
 		v |= ONYX_ADC_INPUT_MIC;
 	onyx_write_register(onyx, ONYX_REG_ADC_CONTROL, v);
-	mutex_unlock(&onyx->mutex);
 }
 
 static int onyx_snd_capture_source_put(struct snd_kcontrol *kcontrol,
@@ -312,9 +304,8 @@ static int onyx_snd_mute_get(struct snd_kcontrol *kcontrol,
 	struct onyx *onyx = snd_kcontrol_chip(kcontrol);
 	u8 c;
 
-	mutex_lock(&onyx->mutex);
+	guard(mutex)(&onyx->mutex);
 	onyx_read_register(onyx, ONYX_REG_DAC_CONTROL, &c);
-	mutex_unlock(&onyx->mutex);
 
 	ucontrol->value.integer.value[0] = !(c & ONYX_MUTE_LEFT);
 	ucontrol->value.integer.value[1] = !(c & ONYX_MUTE_RIGHT);
@@ -329,9 +320,9 @@ static int onyx_snd_mute_put(struct snd_kcontrol *kcontrol,
 	u8 v = 0, c = 0;
 	int err = -EBUSY;
 
-	mutex_lock(&onyx->mutex);
+	guard(mutex)(&onyx->mutex);
 	if (onyx->analog_locked)
-		goto out_unlock;
+		return -EBUSY;
 
 	onyx_read_register(onyx, ONYX_REG_DAC_CONTROL, &v);
 	c = v;
@@ -342,9 +333,6 @@ static int onyx_snd_mute_put(struct snd_kcontrol *kcontrol,
 		c |= ONYX_MUTE_RIGHT;
 	err = onyx_write_register(onyx, ONYX_REG_DAC_CONTROL, c);
 
- out_unlock:
-	mutex_unlock(&onyx->mutex);
-
 	return !err ? (v != c) : err;
 }
 
@@ -373,9 +361,8 @@ static int onyx_snd_single_bit_get(struct snd_kcontrol *kcontrol,
 	u8 address = (pv >> 8) & 0xff;
 	u8 mask = pv & 0xff;
 
-	mutex_lock(&onyx->mutex);
+	guard(mutex)(&onyx->mutex);
 	onyx_read_register(onyx, address, &c);
-	mutex_unlock(&onyx->mutex);
 
 	ucontrol->value.integer.value[0] = !!(c & mask) ^ polarity;
 
@@ -394,11 +381,10 @@ static int onyx_snd_single_bit_put(struct snd_kcontrol *kcontrol,
 	u8 address = (pv >> 8) & 0xff;
 	u8 mask = pv & 0xff;
 
-	mutex_lock(&onyx->mutex);
+	guard(mutex)(&onyx->mutex);
 	if (spdiflock && onyx->spdif_locked) {
 		/* even if alsamixer doesn't care.. */
-		err = -EBUSY;
-		goto out_unlock;
+		return -EBUSY;
 	}
 	onyx_read_register(onyx, address, &v);
 	c = v;
@@ -407,9 +393,6 @@ static int onyx_snd_single_bit_put(struct snd_kcontrol *kcontrol,
 		c |= mask;
 	err = onyx_write_register(onyx, address, c);
 
- out_unlock:
-	mutex_unlock(&onyx->mutex);
-
 	return !err ? (v != c) : err;
 }
 
@@ -490,7 +473,7 @@ static int onyx_spdif_get(struct snd_kcontrol *kcontrol,
 	struct onyx *onyx = snd_kcontrol_chip(kcontrol);
 	u8 v;
 
-	mutex_lock(&onyx->mutex);
+	guard(mutex)(&onyx->mutex);
 	onyx_read_register(onyx, ONYX_REG_DIG_INFO1, &v);
 	ucontrol->value.iec958.status[0] = v & 0x3e;
 
@@ -502,7 +485,6 @@ static int onyx_spdif_get(struct snd_kcontrol *kcontrol,
 
 	onyx_read_register(onyx, ONYX_REG_DIG_INFO4, &v);
 	ucontrol->value.iec958.status[4] = v & 0x0f;
-	mutex_unlock(&onyx->mutex);
 
 	return 0;
 }
@@ -513,7 +495,7 @@ static int onyx_spdif_put(struct snd_kcontrol *kcontrol,
 	struct onyx *onyx = snd_kcontrol_chip(kcontrol);
 	u8 v;
 
-	mutex_lock(&onyx->mutex);
+	guard(mutex)(&onyx->mutex);
 	onyx_read_register(onyx, ONYX_REG_DIG_INFO1, &v);
 	v = (v & ~0x3e) | (ucontrol->value.iec958.status[0] & 0x3e);
 	onyx_write_register(onyx, ONYX_REG_DIG_INFO1, v);
@@ -528,7 +510,6 @@ static int onyx_spdif_put(struct snd_kcontrol *kcontrol,
 	onyx_read_register(onyx, ONYX_REG_DIG_INFO4, &v);
 	v = (v & ~0x0f) | (ucontrol->value.iec958.status[4] & 0x0f);
 	onyx_write_register(onyx, ONYX_REG_DIG_INFO4, v);
-	mutex_unlock(&onyx->mutex);
 
 	return 1;
 }
@@ -673,14 +654,13 @@ static int onyx_usable(struct codec_info_item *cii,
 	struct onyx *onyx = cii->codec_data;
 	int spdif_enabled, analog_enabled;
 
-	mutex_lock(&onyx->mutex);
+	guard(mutex)(&onyx->mutex);
 	onyx_read_register(onyx, ONYX_REG_DIG_INFO4, &v);
 	spdif_enabled = !!(v & ONYX_SPDIF_ENABLE);
 	onyx_read_register(onyx, ONYX_REG_DAC_CONTROL, &v);
 	analog_enabled =
 		(v & (ONYX_MUTE_RIGHT|ONYX_MUTE_LEFT))
 		 != (ONYX_MUTE_RIGHT|ONYX_MUTE_LEFT);
-	mutex_unlock(&onyx->mutex);
 
 	switch (ti->tag) {
 	case 0: return 1;
@@ -696,9 +676,8 @@ static int onyx_prepare(struct codec_info_item *cii,
 {
 	u8 v;
 	struct onyx *onyx = cii->codec_data;
-	int err = -EBUSY;
 
-	mutex_lock(&onyx->mutex);
+	guard(mutex)(&onyx->mutex);
 
 #ifdef SNDRV_PCM_FMTBIT_COMPRESSED_16BE
 	if (substream->runtime->format == SNDRV_PCM_FMTBIT_COMPRESSED_16BE) {
@@ -707,10 +686,9 @@ static int onyx_prepare(struct codec_info_item *cii,
 		if (onyx_write_register(onyx,
 					ONYX_REG_DAC_CONTROL,
 					v | ONYX_MUTE_RIGHT | ONYX_MUTE_LEFT))
-			goto out_unlock;
+			return -EBUSY;
 		onyx->analog_locked = 1;
-		err = 0;
-		goto out_unlock;
+		return 0;
 	}
 #endif
 	switch (substream->runtime->rate) {
@@ -720,8 +698,7 @@ static int onyx_prepare(struct codec_info_item *cii,
 		/* these rates are ok for all outputs */
 		/* FIXME: program spdif channel control bits here so that
 		 *	  userspace doesn't have to if it only plays pcm! */
-		err = 0;
-		goto out_unlock;
+		return 0;
 	default:
 		/* got some rate that the digital output can't do,
 		 * so disable and lock it */
@@ -729,16 +706,12 @@ static int onyx_prepare(struct codec_info_item *cii,
 		if (onyx_write_register(onyx,
 					ONYX_REG_DIG_INFO4,
 					v & ~ONYX_SPDIF_ENABLE))
-			goto out_unlock;
+			return -EBUSY;
 		onyx->spdif_locked = 1;
-		err = 0;
-		goto out_unlock;
+		return 0;
 	}
 
- out_unlock:
-	mutex_unlock(&onyx->mutex);
-
-	return err;
+	return -EBUSY;
 }
 
 static int onyx_open(struct codec_info_item *cii,
@@ -746,9 +719,8 @@ static int onyx_open(struct codec_info_item *cii,
 {
 	struct onyx *onyx = cii->codec_data;
 
-	mutex_lock(&onyx->mutex);
+	guard(mutex)(&onyx->mutex);
 	onyx->open_count++;
-	mutex_unlock(&onyx->mutex);
 
 	return 0;
 }
@@ -758,11 +730,10 @@ static int onyx_close(struct codec_info_item *cii,
 {
 	struct onyx *onyx = cii->codec_data;
 
-	mutex_lock(&onyx->mutex);
+	guard(mutex)(&onyx->mutex);
 	onyx->open_count--;
 	if (!onyx->open_count)
 		onyx->spdif_locked = onyx->analog_locked = 0;
-	mutex_unlock(&onyx->mutex);
 
 	return 0;
 }
@@ -772,7 +743,7 @@ static int onyx_switch_clock(struct codec_info_item *cii,
 {
 	struct onyx *onyx = cii->codec_data;
 
-	mutex_lock(&onyx->mutex);
+	guard(mutex)(&onyx->mutex);
 	/* this *MUST* be more elaborate later... */
 	switch (what) {
 	case CLOCK_SWITCH_PREPARE_SLAVE:
@@ -784,7 +755,6 @@ static int onyx_switch_clock(struct codec_info_item *cii,
 	default: /* silence warning */
 		break;
 	}
-	mutex_unlock(&onyx->mutex);
 
 	return 0;
 }
@@ -795,27 +765,21 @@ static int onyx_suspend(struct codec_info_item *cii, pm_message_t state)
 {
 	struct onyx *onyx = cii->codec_data;
 	u8 v;
-	int err = -ENXIO;
 
-	mutex_lock(&onyx->mutex);
+	guard(mutex)(&onyx->mutex);
 	if (onyx_read_register(onyx, ONYX_REG_CONTROL, &v))
-		goto out_unlock;
+		return -ENXIO;
 	onyx_write_register(onyx, ONYX_REG_CONTROL, v | ONYX_ADPSV | ONYX_DAPSV);
 	/* Apple does a sleep here but the datasheet says to do it on resume */
-	err = 0;
- out_unlock:
-	mutex_unlock(&onyx->mutex);
-
-	return err;
+	return 0;
 }
 
 static int onyx_resume(struct codec_info_item *cii)
 {
 	struct onyx *onyx = cii->codec_data;
 	u8 v;
-	int err = -ENXIO;
 
-	mutex_lock(&onyx->mutex);
+	guard(mutex)(&onyx->mutex);
 
 	/* reset codec */
 	onyx->codec.gpio->methods->set_hw_reset(onyx->codec.gpio, 0);
@@ -827,17 +791,13 @@ static int onyx_resume(struct codec_info_item *cii)
 
 	/* take codec out of suspend (if it still is after reset) */
 	if (onyx_read_register(onyx, ONYX_REG_CONTROL, &v))
-		goto out_unlock;
+		return -ENXIO;
 	onyx_write_register(onyx, ONYX_REG_CONTROL, v & ~(ONYX_ADPSV | ONYX_DAPSV));
 	/* FIXME: should divide by sample rate, but 8k is the lowest we go */
 	msleep(2205000/8000);
 	/* reset all values */
 	onyx_register_init(onyx);
-	err = 0;
- out_unlock:
-	mutex_unlock(&onyx->mutex);
-
-	return err;
+	return 0;
 }
 
 #endif /* CONFIG_PM */
diff --git a/sound/aoa/codecs/tas.c b/sound/aoa/codecs/tas.c
index 804b2ebbe28f..70216aa05965 100644
--- a/sound/aoa/codecs/tas.c
+++ b/sound/aoa/codecs/tas.c
@@ -235,10 +235,9 @@ static int tas_snd_vol_get(struct snd_kcontrol *kcontrol,
 {
 	struct tas *tas = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&tas->mtx);
+	guard(mutex)(&tas->mtx);
 	ucontrol->value.integer.value[0] = tas->cached_volume_l;
 	ucontrol->value.integer.value[1] = tas->cached_volume_r;
-	mutex_unlock(&tas->mtx);
 	return 0;
 }
 
@@ -254,18 +253,15 @@ static int tas_snd_vol_put(struct snd_kcontrol *kcontrol,
 	    ucontrol->value.integer.value[1] > 177)
 		return -EINVAL;
 
-	mutex_lock(&tas->mtx);
+	guard(mutex)(&tas->mtx);
 	if (tas->cached_volume_l == ucontrol->value.integer.value[0]
-	 && tas->cached_volume_r == ucontrol->value.integer.value[1]) {
-		mutex_unlock(&tas->mtx);
+	 && tas->cached_volume_r == ucontrol->value.integer.value[1])
 		return 0;
-	}
 
 	tas->cached_volume_l = ucontrol->value.integer.value[0];
 	tas->cached_volume_r = ucontrol->value.integer.value[1];
 	if (tas->hw_enabled)
 		tas_set_volume(tas);
-	mutex_unlock(&tas->mtx);
 	return 1;
 }
 
@@ -285,10 +281,9 @@ static int tas_snd_mute_get(struct snd_kcontrol *kcontrol,
 {
 	struct tas *tas = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&tas->mtx);
+	guard(mutex)(&tas->mtx);
 	ucontrol->value.integer.value[0] = !tas->mute_l;
 	ucontrol->value.integer.value[1] = !tas->mute_r;
-	mutex_unlock(&tas->mtx);
 	return 0;
 }
 
@@ -297,18 +292,15 @@ static int tas_snd_mute_put(struct snd_kcontrol *kcontrol,
 {
 	struct tas *tas = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&tas->mtx);
+	guard(mutex)(&tas->mtx);
 	if (tas->mute_l == !ucontrol->value.integer.value[0]
-	 && tas->mute_r == !ucontrol->value.integer.value[1]) {
-		mutex_unlock(&tas->mtx);
+	 && tas->mute_r == !ucontrol->value.integer.value[1])
 		return 0;
-	}
 
 	tas->mute_l = !ucontrol->value.integer.value[0];
 	tas->mute_r = !ucontrol->value.integer.value[1];
 	if (tas->hw_enabled)
 		tas_set_volume(tas);
-	mutex_unlock(&tas->mtx);
 	return 1;
 }
 
@@ -337,10 +329,9 @@ static int tas_snd_mixer_get(struct snd_kcontrol *kcontrol,
 	struct tas *tas = snd_kcontrol_chip(kcontrol);
 	int idx = kcontrol->private_value;
 
-	mutex_lock(&tas->mtx);
+	guard(mutex)(&tas->mtx);
 	ucontrol->value.integer.value[0] = tas->mixer_l[idx];
 	ucontrol->value.integer.value[1] = tas->mixer_r[idx];
-	mutex_unlock(&tas->mtx);
 
 	return 0;
 }
@@ -351,19 +342,16 @@ static int tas_snd_mixer_put(struct snd_kcontrol *kcontrol,
 	struct tas *tas = snd_kcontrol_chip(kcontrol);
 	int idx = kcontrol->private_value;
 
-	mutex_lock(&tas->mtx);
+	guard(mutex)(&tas->mtx);
 	if (tas->mixer_l[idx] == ucontrol->value.integer.value[0]
-	 && tas->mixer_r[idx] == ucontrol->value.integer.value[1]) {
-		mutex_unlock(&tas->mtx);
+	 && tas->mixer_r[idx] == ucontrol->value.integer.value[1])
 		return 0;
-	}
 
 	tas->mixer_l[idx] = ucontrol->value.integer.value[0];
 	tas->mixer_r[idx] = ucontrol->value.integer.value[1];
 
 	if (tas->hw_enabled)
 		tas_set_mixer(tas);
-	mutex_unlock(&tas->mtx);
 	return 1;
 }
 
@@ -396,9 +384,8 @@ static int tas_snd_drc_range_get(struct snd_kcontrol *kcontrol,
 {
 	struct tas *tas = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&tas->mtx);
+	guard(mutex)(&tas->mtx);
 	ucontrol->value.integer.value[0] = tas->drc_range;
-	mutex_unlock(&tas->mtx);
 	return 0;
 }
 
@@ -411,16 +398,13 @@ static int tas_snd_drc_range_put(struct snd_kcontrol *kcontrol,
 	    ucontrol->value.integer.value[0] > TAS3004_DRC_MAX)
 		return -EINVAL;
 
-	mutex_lock(&tas->mtx);
-	if (tas->drc_range == ucontrol->value.integer.value[0]) {
-		mutex_unlock(&tas->mtx);
+	guard(mutex)(&tas->mtx);
+	if (tas->drc_range == ucontrol->value.integer.value[0])
 		return 0;
-	}
 
 	tas->drc_range = ucontrol->value.integer.value[0];
 	if (tas->hw_enabled)
 		tas3004_set_drc(tas);
-	mutex_unlock(&tas->mtx);
 	return 1;
 }
 
@@ -440,9 +424,8 @@ static int tas_snd_drc_switch_get(struct snd_kcontrol *kcontrol,
 {
 	struct tas *tas = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&tas->mtx);
+	guard(mutex)(&tas->mtx);
 	ucontrol->value.integer.value[0] = tas->drc_enabled;
-	mutex_unlock(&tas->mtx);
 	return 0;
 }
 
@@ -451,16 +434,13 @@ static int tas_snd_drc_switch_put(struct snd_kcontrol *kcontrol,
 {
 	struct tas *tas = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&tas->mtx);
-	if (tas->drc_enabled == ucontrol->value.integer.value[0]) {
-		mutex_unlock(&tas->mtx);
+	guard(mutex)(&tas->mtx);
+	if (tas->drc_enabled == ucontrol->value.integer.value[0])
 		return 0;
-	}
 
 	tas->drc_enabled = !!ucontrol->value.integer.value[0];
 	if (tas->hw_enabled)
 		tas3004_set_drc(tas);
-	mutex_unlock(&tas->mtx);
 	return 1;
 }
 
@@ -486,9 +466,8 @@ static int tas_snd_capture_source_get(struct snd_kcontrol *kcontrol,
 {
 	struct tas *tas = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&tas->mtx);
+	guard(mutex)(&tas->mtx);
 	ucontrol->value.enumerated.item[0] = !!(tas->acr & TAS_ACR_INPUT_B);
-	mutex_unlock(&tas->mtx);
 	return 0;
 }
 
@@ -500,7 +479,7 @@ static int tas_snd_capture_source_put(struct snd_kcontrol *kcontrol,
 
 	if (ucontrol->value.enumerated.item[0] > 1)
 		return -EINVAL;
-	mutex_lock(&tas->mtx);
+	guard(mutex)(&tas->mtx);
 	oldacr = tas->acr;
 
 	/*
@@ -512,13 +491,10 @@ static int tas_snd_capture_source_put(struct snd_kcontrol *kcontrol,
 	if (ucontrol->value.enumerated.item[0])
 		tas->acr |= TAS_ACR_INPUT_B | TAS_ACR_B_MONAUREAL |
 		      TAS_ACR_B_MON_SEL_RIGHT;
-	if (oldacr == tas->acr) {
-		mutex_unlock(&tas->mtx);
+	if (oldacr == tas->acr)
 		return 0;
-	}
 	if (tas->hw_enabled)
 		tas_write_reg(tas, TAS_REG_ACR, 1, &tas->acr);
-	mutex_unlock(&tas->mtx);
 	return 1;
 }
 
@@ -557,9 +533,8 @@ static int tas_snd_treble_get(struct snd_kcontrol *kcontrol,
 {
 	struct tas *tas = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&tas->mtx);
+	guard(mutex)(&tas->mtx);
 	ucontrol->value.integer.value[0] = tas->treble;
-	mutex_unlock(&tas->mtx);
 	return 0;
 }
 
@@ -571,16 +546,13 @@ static int tas_snd_treble_put(struct snd_kcontrol *kcontrol,
 	if (ucontrol->value.integer.value[0] < TAS3004_TREBLE_MIN ||
 	    ucontrol->value.integer.value[0] > TAS3004_TREBLE_MAX)
 		return -EINVAL;
-	mutex_lock(&tas->mtx);
-	if (tas->treble == ucontrol->value.integer.value[0]) {
-		mutex_unlock(&tas->mtx);
+	guard(mutex)(&tas->mtx);
+	if (tas->treble == ucontrol->value.integer.value[0])
 		return 0;
-	}
 
 	tas->treble = ucontrol->value.integer.value[0];
 	if (tas->hw_enabled)
 		tas_set_treble(tas);
-	mutex_unlock(&tas->mtx);
 	return 1;
 }
 
@@ -608,9 +580,8 @@ static int tas_snd_bass_get(struct snd_kcontrol *kcontrol,
 {
 	struct tas *tas = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&tas->mtx);
+	guard(mutex)(&tas->mtx);
 	ucontrol->value.integer.value[0] = tas->bass;
-	mutex_unlock(&tas->mtx);
 	return 0;
 }
 
@@ -622,16 +593,13 @@ static int tas_snd_bass_put(struct snd_kcontrol *kcontrol,
 	if (ucontrol->value.integer.value[0] < TAS3004_BASS_MIN ||
 	    ucontrol->value.integer.value[0] > TAS3004_BASS_MAX)
 		return -EINVAL;
-	mutex_lock(&tas->mtx);
-	if (tas->bass == ucontrol->value.integer.value[0]) {
-		mutex_unlock(&tas->mtx);
+	guard(mutex)(&tas->mtx);
+	if (tas->bass == ucontrol->value.integer.value[0])
 		return 0;
-	}
 
 	tas->bass = ucontrol->value.integer.value[0];
 	if (tas->hw_enabled)
 		tas_set_bass(tas);
-	mutex_unlock(&tas->mtx);
 	return 1;
 }
 
@@ -722,13 +690,13 @@ static int tas_switch_clock(struct codec_info_item *cii, enum clock_switch clock
 		break;
 	case CLOCK_SWITCH_SLAVE:
 		/* Clocks are back, re-init the codec */
-		mutex_lock(&tas->mtx);
-		tas_reset_init(tas);
-		tas_set_volume(tas);
-		tas_set_mixer(tas);
-		tas->hw_enabled = 1;
-		tas->codec.gpio->methods->all_amps_restore(tas->codec.gpio);
-		mutex_unlock(&tas->mtx);
+		scoped_guard(mutex, &tas->mtx) {
+			tas_reset_init(tas);
+			tas_set_volume(tas);
+			tas_set_mixer(tas);
+			tas->hw_enabled = 1;
+			tas->codec.gpio->methods->all_amps_restore(tas->codec.gpio);
+		}
 		break;
 	default:
 		/* doesn't happen as of now */
@@ -743,23 +711,21 @@ static int tas_switch_clock(struct codec_info_item *cii, enum clock_switch clock
  * our i2c device is suspended, and then take note of that! */
 static int tas_suspend(struct tas *tas)
 {
-	mutex_lock(&tas->mtx);
+	guard(mutex)(&tas->mtx);
 	tas->hw_enabled = 0;
 	tas->acr |= TAS_ACR_ANALOG_PDOWN;
 	tas_write_reg(tas, TAS_REG_ACR, 1, &tas->acr);
-	mutex_unlock(&tas->mtx);
 	return 0;
 }
 
 static int tas_resume(struct tas *tas)
 {
 	/* reset codec */
-	mutex_lock(&tas->mtx);
+	guard(mutex)(&tas->mtx);
 	tas_reset_init(tas);
 	tas_set_volume(tas);
 	tas_set_mixer(tas);
 	tas->hw_enabled = 1;
-	mutex_unlock(&tas->mtx);
 	return 0;
 }
 
@@ -802,14 +768,13 @@ static int tas_init_codec(struct aoa_codec *codec)
 		return -EINVAL;
 	}
 
-	mutex_lock(&tas->mtx);
-	if (tas_reset_init(tas)) {
-		printk(KERN_ERR PFX "tas failed to initialise\n");
-		mutex_unlock(&tas->mtx);
-		return -ENXIO;
+	scoped_guard(mutex, &tas->mtx) {
+		if (tas_reset_init(tas)) {
+			printk(KERN_ERR PFX "tas failed to initialise\n");
+			return -ENXIO;
+		}
+		tas->hw_enabled = 1;
 	}
-	tas->hw_enabled = 1;
-	mutex_unlock(&tas->mtx);
 
 	if (tas->codec.soundbus_dev->attach_codec(tas->codec.soundbus_dev,
 						   aoa_get_card(),
diff --git a/sound/aoa/core/gpio-feature.c b/sound/aoa/core/gpio-feature.c
index 39bb409b27f6..19ed0e6907da 100644
--- a/sound/aoa/core/gpio-feature.c
+++ b/sound/aoa/core/gpio-feature.c
@@ -212,10 +212,9 @@ static void ftr_handle_notify(struct work_struct *work)
 	struct gpio_notification *notif =
 		container_of(work, struct gpio_notification, work.work);
 
-	mutex_lock(&notif->mutex);
+	guard(mutex)(&notif->mutex);
 	if (notif->notify)
 		notif->notify(notif->data);
-	mutex_unlock(&notif->mutex);
 }
 
 static void gpio_enable_dual_edge(int gpio)
@@ -341,19 +340,17 @@ static int ftr_set_notify(struct gpio_runtime *rt,
 	if (!irq)
 		return -ENODEV;
 
-	mutex_lock(&notif->mutex);
+	guard(mutex)(&notif->mutex);
 
 	old = notif->notify;
 
-	if (!old && !notify) {
-		err = 0;
-		goto out_unlock;
-	}
+	if (!old && !notify)
+		return 0;
 
 	if (old && notify) {
 		if (old == notify && notif->data == data)
 			err = 0;
-		goto out_unlock;
+		return err;
 	}
 
 	if (old && !notify)
@@ -362,16 +359,13 @@ static int ftr_set_notify(struct gpio_runtime *rt,
 	if (!old && notify) {
 		err = request_irq(irq, ftr_handle_notify_irq, 0, name, notif);
 		if (err)
-			goto out_unlock;
+			return err;
 	}
 
 	notif->notify = notify;
 	notif->data = data;
 
-	err = 0;
- out_unlock:
-	mutex_unlock(&notif->mutex);
-	return err;
+	return 0;
 }
 
 static int ftr_get_detect(struct gpio_runtime *rt,
diff --git a/sound/aoa/core/gpio-pmf.c b/sound/aoa/core/gpio-pmf.c
index 37866039d1ea..e76bde25e41a 100644
--- a/sound/aoa/core/gpio-pmf.c
+++ b/sound/aoa/core/gpio-pmf.c
@@ -74,10 +74,9 @@ static void pmf_handle_notify(struct work_struct *work)
 	struct gpio_notification *notif =
 		container_of(work, struct gpio_notification, work.work);
 
-	mutex_lock(&notif->mutex);
+	guard(mutex)(&notif->mutex);
 	if (notif->notify)
 		notif->notify(notif->data);
-	mutex_unlock(&notif->mutex);
 }
 
 static void pmf_gpio_init(struct gpio_runtime *rt)
@@ -154,19 +153,17 @@ static int pmf_set_notify(struct gpio_runtime *rt,
 		return -EINVAL;
 	}
 
-	mutex_lock(&notif->mutex);
+	guard(mutex)(&notif->mutex);
 
 	old = notif->notify;
 
-	if (!old && !notify) {
-		err = 0;
-		goto out_unlock;
-	}
+	if (!old && !notify)
+		return 0;
 
 	if (old && notify) {
 		if (old == notify && notif->data == data)
 			err = 0;
-		goto out_unlock;
+		return err;
 	}
 
 	if (old && !notify) {
@@ -178,10 +175,8 @@ static int pmf_set_notify(struct gpio_runtime *rt,
 	if (!old && notify) {
 		irq_client = kzalloc(sizeof(struct pmf_irq_client),
 				     GFP_KERNEL);
-		if (!irq_client) {
-			err = -ENOMEM;
-			goto out_unlock;
-		}
+		if (!irq_client)
+			return -ENOMEM;
 		irq_client->data = notif;
 		irq_client->handler = pmf_handle_notify_irq;
 		irq_client->owner = THIS_MODULE;
@@ -192,17 +187,14 @@ static int pmf_set_notify(struct gpio_runtime *rt,
 			printk(KERN_ERR "snd-aoa: gpio layer failed to"
 					" register %s irq (%d)\n", name, err);
 			kfree(irq_client);
-			goto out_unlock;
+			return err;
 		}
 		notif->gpio_private = irq_client;
 	}
 	notif->notify = notify;
 	notif->data = data;
 
-	err = 0;
- out_unlock:
-	mutex_unlock(&notif->mutex);
-	return err;
+	return 0;
 }
 
 static int pmf_get_detect(struct gpio_runtime *rt,
diff --git a/sound/aoa/soundbus/i2sbus/pcm.c b/sound/aoa/soundbus/i2sbus/pcm.c
index 98b812ffbde6..1edda4c9c6ab 100644
--- a/sound/aoa/soundbus/i2sbus/pcm.c
+++ b/sound/aoa/soundbus/i2sbus/pcm.c
@@ -79,11 +79,10 @@ static int i2sbus_pcm_open(struct i2sbus_dev *i2sdev, int in)
 	u64 formats = 0;
 	unsigned int rates = 0;
 	struct transfer_info v;
-	int result = 0;
 	int bus_factor = 0, sysclock_factor = 0;
 	int found_this;
 
-	mutex_lock(&i2sdev->lock);
+	guard(mutex)(&i2sdev->lock);
 
 	get_pcm_info(i2sdev, in, &pi, &other);
 
@@ -92,8 +91,7 @@ static int i2sbus_pcm_open(struct i2sbus_dev *i2sdev, int in)
 
 	if (pi->active) {
 		/* alsa messed up */
-		result = -EBUSY;
-		goto out_unlock;
+		return -EBUSY;
 	}
 
 	/* we now need to assign the hw */
@@ -117,10 +115,8 @@ static int i2sbus_pcm_open(struct i2sbus_dev *i2sdev, int in)
 			ti++;
 		}
 	}
-	if (!masks_inited || !bus_factor || !sysclock_factor) {
-		result = -ENODEV;
-		goto out_unlock;
-	}
+	if (!masks_inited || !bus_factor || !sysclock_factor)
+		return -ENODEV;
 	/* bus dependent stuff */
 	hw->info = SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
 		   SNDRV_PCM_INFO_INTERLEAVED | SNDRV_PCM_INFO_RESUME |
@@ -194,15 +190,12 @@ static int i2sbus_pcm_open(struct i2sbus_dev *i2sdev, int in)
 	hw->periods_max = MAX_DBDMA_COMMANDS;
 	err = snd_pcm_hw_constraint_integer(pi->substream->runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (err < 0) {
-		result = err;
-		goto out_unlock;
-	}
+	if (err < 0)
+		return err;
 	list_for_each_entry(cii, &sdev->codec_list, list) {
 		if (cii->codec->open) {
 			err = cii->codec->open(cii, pi->substream);
 			if (err) {
-				result = err;
 				/* unwind */
 				found_this = 0;
 				list_for_each_entry_reverse(rev,
@@ -214,14 +207,12 @@ static int i2sbus_pcm_open(struct i2sbus_dev *i2sdev, int in)
 					if (rev == cii)
 						found_this = 1;
 				}
-				goto out_unlock;
+				return err;
 			}
 		}
 	}
 
- out_unlock:
-	mutex_unlock(&i2sdev->lock);
-	return result;
+	return 0;
 }
 
 #undef CHECK_RATE
@@ -232,7 +223,7 @@ static int i2sbus_pcm_close(struct i2sbus_dev *i2sdev, int in)
 	struct pcm_info *pi;
 	int err = 0, tmp;
 
-	mutex_lock(&i2sdev->lock);
+	guard(mutex)(&i2sdev->lock);
 
 	get_pcm_info(i2sdev, in, &pi, NULL);
 
@@ -246,7 +237,6 @@ static int i2sbus_pcm_close(struct i2sbus_dev *i2sdev, int in)
 
 	pi->substream = NULL;
 	pi->active = 0;
-	mutex_unlock(&i2sdev->lock);
 	return err;
 }
 
@@ -330,33 +320,26 @@ static int i2sbus_pcm_prepare(struct i2sbus_dev *i2sdev, int in)
 	int input_16bit;
 	struct pcm_info *pi, *other;
 	int cnt;
-	int result = 0;
 	unsigned int cmd, stopaddr;
 
-	mutex_lock(&i2sdev->lock);
+	guard(mutex)(&i2sdev->lock);
 
 	get_pcm_info(i2sdev, in, &pi, &other);
 
-	if (pi->dbdma_ring.running) {
-		result = -EBUSY;
-		goto out_unlock;
-	}
+	if (pi->dbdma_ring.running)
+		return -EBUSY;
 	if (pi->dbdma_ring.stopping)
 		i2sbus_wait_for_stop(i2sdev, pi);
 
-	if (!pi->substream || !pi->substream->runtime) {
-		result = -EINVAL;
-		goto out_unlock;
-	}
+	if (!pi->substream || !pi->substream->runtime)
+		return -EINVAL;
 
 	runtime = pi->substream->runtime;
 	pi->active = 1;
 	if (other->active &&
 	    ((i2sdev->format != runtime->format)
-	     || (i2sdev->rate != runtime->rate))) {
-		result = -EINVAL;
-		goto out_unlock;
-	}
+	     || (i2sdev->rate != runtime->rate)))
+		return -EINVAL;
 
 	i2sdev->format = runtime->format;
 	i2sdev->rate = runtime->rate;
@@ -412,10 +395,8 @@ static int i2sbus_pcm_prepare(struct i2sbus_dev *i2sdev, int in)
 			bi.bus_factor = cii->codec->bus_factor;
 			break;
 		}
-		if (!bi.bus_factor) {
-			result = -ENODEV;
-			goto out_unlock;
-		}
+		if (!bi.bus_factor)
+			return -ENODEV;
 		input_16bit = 1;
 		break;
 	case SNDRV_PCM_FORMAT_S32_BE:
@@ -426,8 +407,7 @@ static int i2sbus_pcm_prepare(struct i2sbus_dev *i2sdev, int in)
 		input_16bit = 0;
 		break;
 	default:
-		result = -EINVAL;
-		goto out_unlock;
+		return -EINVAL;
 	}
 	/* we assume all sysclocks are the same! */
 	list_for_each_entry(cii, &i2sdev->sound.codec_list, list) {
@@ -438,10 +418,8 @@ static int i2sbus_pcm_prepare(struct i2sbus_dev *i2sdev, int in)
 	if (clock_and_divisors(bi.sysclock_factor,
 			       bi.bus_factor,
 			       runtime->rate,
-			       &sfr) < 0) {
-		result = -EINVAL;
-		goto out_unlock;
-	}
+			       &sfr) < 0)
+		return -EINVAL;
 	switch (bi.bus_factor) {
 	case 32:
 		sfr |= I2S_SF_SERIAL_FORMAT_I2S_32X;
@@ -457,10 +435,8 @@ static int i2sbus_pcm_prepare(struct i2sbus_dev *i2sdev, int in)
 		int err = 0;
 		if (cii->codec->prepare)
 			err = cii->codec->prepare(cii, &bi, pi->substream);
-		if (err) {
-			result = err;
-			goto out_unlock;
-		}
+		if (err)
+			return err;
 	}
 	/* codecs are fine with it, so set our clocks */
 	if (input_16bit)
@@ -476,7 +452,7 @@ static int i2sbus_pcm_prepare(struct i2sbus_dev *i2sdev, int in)
 	/* not locking these is fine since we touch them only in this function */
 	if (in_le32(&i2sdev->intfregs->serial_format) == sfr
 	 && in_le32(&i2sdev->intfregs->data_word_sizes) == dws)
-		goto out_unlock;
+		return 0;
 
 	/* let's notify the codecs about clocks going away.
 	 * For now we only do mastering on the i2s cell... */
@@ -514,9 +490,7 @@ static int i2sbus_pcm_prepare(struct i2sbus_dev *i2sdev, int in)
 		if (cii->codec->switch_clock)
 			cii->codec->switch_clock(cii, CLOCK_SWITCH_SLAVE);
 
- out_unlock:
-	mutex_unlock(&i2sdev->lock);
-	return result;
+	return 0;
 }
 
 #ifdef CONFIG_PM
-- 
2.50.1

