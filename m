Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE963233ED
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 06:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514793; cv=none; b=fphylL+ujuVWZ9jjEMFTNhD9jMSVhLjHtmZBZYpFcUZbYdRZheLEehZN6uvk5uoQkSy+czZzLPjvVVk9jcC8lN8Ce0O4hUwkXLNfmxhSvxdsnHMjr1mONhVudESa8ltfR5/BkXu0kcDgQXmh2m+Uh8i2rOYBbQEwOP9DOpprO2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514793; c=relaxed/simple;
	bh=yV3ogJg3wXc0wb+MHLeiliz5/ZlQI827Q+NDaVP3yx4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nnnDoZF4S03owsb1hyxUe/+fl8p7i/0wyTC7QvQJvwqsIkwQ2yrlXis86fMMiX/Af9k3z/sErsIKO3IgbCKPKWYBc12L2c2V1w8H7jAghGvx4DMnmSvzwWyN3jaeQdQlLVH2jFgbiUQAA2VMxOYhzzgZPcN18x9s0xtlT9mLBhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BVJJ0UPA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IJTbmNQZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kgsgnfRj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DO4Ca9g9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BVJJ0UPA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IJTbmNQZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kgsgnfRj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DO4Ca9g9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0A0D13E41;
	Wed, 12 Aug 2026 06:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FytZh7Q1IUMelrlncWfk3D6PMNMdpCcWfnZASCmfZvA=;
	b=BVJJ0UPA+XhTiy2yE+eM1Nf1JX6XYdAv7Iv4wgt29BuBec0bwkeG6UIlhrjwJd6bVsx7V7
	1oNeHhIXmJ6P2dRMGVdknGxd/jMBrphgLeIon0Z8zXwo4gbadycjK91uQGsLtBZKa6LNAO
	35nuzR+xTxW7G/l42WM1fxpdech6Ons=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FytZh7Q1IUMelrlncWfk3D6PMNMdpCcWfnZASCmfZvA=;
	b=IJTbmNQZtoR1zXL1OB4no0CO/Dnw2oKrpopfM+x3pLauk3XopXBwmDAoFdumdDzTl0u78o
	qDooKiy9KtMqt2AQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kgsgnfRj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DO4Ca9g9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FytZh7Q1IUMelrlncWfk3D6PMNMdpCcWfnZASCmfZvA=;
	b=kgsgnfRjtT1nx9wttGNVI7dm1WRCDD+y9y7DjFmk+ld9BNxhZDGmA/TTBhL+zKOwEaNkPv
	QqmSVRuAQjXK/gYWfR6quQ2UFb8iziXEn4hnhE8iKXL2wV3mf/dRotSEBHisvBkH2SIEW8
	+WaeTDKxeR3hQ6YmtoXwiihzKjrDmzs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514780;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FytZh7Q1IUMelrlncWfk3D6PMNMdpCcWfnZASCmfZvA=;
	b=DO4Ca9g9LTXoBxCb9swofLOzg5qPwU9QrZVB6Kizi7HzG8DPf2k9ycky+ntDMJtGEliTAm
	fLRMZLY1NJJaqGDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 256EF779BC;
	Wed, 12 Aug 2026 06:06:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mMPOB1QNfGrREAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 06:06:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 05/14] ALSA: oss: Drop __force casts
Date: Wed, 12 Aug 2026 08:04:37 +0200
Message-ID: <20260812060557.80445-6-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812060557.80445-1-tiwai@suse.de>
References: <20260812060557.80445-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 0A0D13E41
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Now that the bitwise parameter definitions are gone for PCM
parameters, we don't have to cast with ugly __force prefix.
Simply drop those superfluous casts.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/pcm_oss.c    | 16 ++++++++--------
 sound/core/oss/pcm_plugin.c | 20 ++++++++++----------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 0924f1ff1ae7..bd19328dca9e 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -879,11 +879,11 @@ static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 	_snd_pcm_hw_param_min(sparams, SNDRV_PCM_HW_PARAM_PERIODS, 2, 0);
 	snd_mask_none(&mask);
 	if (atomic_read(&substream->mmap_count))
-		snd_mask_set(&mask, (__force int)SNDRV_PCM_ACCESS_MMAP_INTERLEAVED);
+		snd_mask_set(&mask, SNDRV_PCM_ACCESS_MMAP_INTERLEAVED);
 	else {
-		snd_mask_set(&mask, (__force int)SNDRV_PCM_ACCESS_RW_INTERLEAVED);
+		snd_mask_set(&mask, SNDRV_PCM_ACCESS_RW_INTERLEAVED);
 		if (!direct)
-			snd_mask_set(&mask, (__force int)SNDRV_PCM_ACCESS_RW_NONINTERLEAVED);
+			snd_mask_set(&mask, SNDRV_PCM_ACCESS_RW_NONINTERLEAVED);
 	}
 	err = snd_pcm_hw_param_mask(substream, sparams, SNDRV_PCM_HW_PARAM_ACCESS, &mask);
 	if (err < 0) {
@@ -909,7 +909,7 @@ static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 	else
 		sformat = snd_pcm_plug_slave_format(format, sformat_mask);
 
-	if ((__force int)sformat < 0 ||
+	if (sformat < 0 ||
 	    !snd_mask_test_format(sformat_mask, sformat)) {
 		pcm_for_each_format(sformat) {
 			if (snd_mask_test_format(sformat_mask, sformat) &&
@@ -921,7 +921,7 @@ static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 		goto failure;
 	}
  format_found:
-	err = _snd_pcm_hw_param_set(sparams, SNDRV_PCM_HW_PARAM_FORMAT, (__force int)sformat, 0);
+	err = _snd_pcm_hw_param_set(sparams, SNDRV_PCM_HW_PARAM_FORMAT, sformat, 0);
 	if (err < 0)
 		goto failure;
 
@@ -930,9 +930,9 @@ static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 	} else {
 		_snd_pcm_hw_params_any(params);
 		_snd_pcm_hw_param_set(params, SNDRV_PCM_HW_PARAM_ACCESS,
-				      (__force int)SNDRV_PCM_ACCESS_RW_INTERLEAVED, 0);
+				      SNDRV_PCM_ACCESS_RW_INTERLEAVED, 0);
 		_snd_pcm_hw_param_set(params, SNDRV_PCM_HW_PARAM_FORMAT,
-				      (__force int)snd_pcm_oss_format_from(runtime->oss.format), 0);
+				      snd_pcm_oss_format_from(runtime->oss.format), 0);
 		_snd_pcm_hw_param_set(params, SNDRV_PCM_HW_PARAM_CHANNELS,
 				      runtime->oss.channels, 0);
 		_snd_pcm_hw_param_set(params, SNDRV_PCM_HW_PARAM_RATE,
@@ -1875,7 +1875,7 @@ static int snd_pcm_oss_get_formats(struct snd_pcm_oss_file *pcm_oss_file)
 	format_mask = hw_param_mask_c(params, SNDRV_PCM_HW_PARAM_FORMAT);
 	for (fmt = 0; fmt < 32; ++fmt) {
 		if (snd_mask_test(format_mask, fmt)) {
-			int f = snd_pcm_oss_format_to((__force snd_pcm_format_t)fmt);
+			int f = snd_pcm_oss_format_to(fmt);
 			if (f >= 0)
 				formats |= f;
 		}
diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
index 5f4d6945a7df..acf5ca663ba8 100644
--- a/sound/core/oss/pcm_plugin.c
+++ b/sound/core/oss/pcm_plugin.c
@@ -272,13 +272,13 @@ static int snd_pcm_plug_formats(const struct snd_mask *mask,
 		       SNDRV_PCM_FMTBIT_U24_3BE | SNDRV_PCM_FMTBIT_S24_3BE |
 		       SNDRV_PCM_FMTBIT_U32_LE | SNDRV_PCM_FMTBIT_S32_LE |
 		       SNDRV_PCM_FMTBIT_U32_BE | SNDRV_PCM_FMTBIT_S32_BE);
-	snd_mask_set(&formats, (__force int)SNDRV_PCM_FORMAT_MU_LAW);
+	snd_mask_set(&formats, SNDRV_PCM_FORMAT_MU_LAW);
 	
 	if (formats.bits[0] & lower_32_bits(linfmts))
 		formats.bits[0] |= lower_32_bits(linfmts);
 	if (formats.bits[1] & upper_32_bits(linfmts))
 		formats.bits[1] |= upper_32_bits(linfmts);
-	return snd_mask_test(&formats, (__force int)format);
+	return snd_mask_test(&formats, format);
 }
 
 static const snd_pcm_format_t preferred_formats[] = {
@@ -307,20 +307,20 @@ snd_pcm_format_t snd_pcm_plug_slave_format(snd_pcm_format_t format,
 {
 	int i;
 
-	if (snd_mask_test(format_mask, (__force int)format))
+	if (snd_mask_test(format_mask, format))
 		return format;
 	if (!snd_pcm_plug_formats(format_mask, format))
-		return (__force snd_pcm_format_t)-EINVAL;
+		return -EINVAL;
 	if (snd_pcm_format_linear(format)) {
 		unsigned int width = snd_pcm_format_width(format);
 		int unsignd = snd_pcm_format_unsigned(format) > 0;
 		int big = snd_pcm_format_big_endian(format) > 0;
 		unsigned int badness, best = -1;
-		snd_pcm_format_t best_format = (__force snd_pcm_format_t)-1;
+		snd_pcm_format_t best_format = -1;
 		for (i = 0; i < ARRAY_SIZE(preferred_formats); i++) {
 			snd_pcm_format_t f = preferred_formats[i];
 			unsigned int w;
-			if (!snd_mask_test(format_mask, (__force int)f))
+			if (!snd_mask_test(format_mask, f))
 				continue;
 			w = snd_pcm_format_width(f);
 			if (w >= width)
@@ -334,21 +334,21 @@ snd_pcm_format_t snd_pcm_plug_slave_format(snd_pcm_format_t format,
 				best = badness;
 			}
 		}
-		if ((__force int)best_format >= 0)
+		if (best_format >= 0)
 			return best_format;
 		else
-			return (__force snd_pcm_format_t)-EINVAL;
+			return -EINVAL;
 	} else {
 		switch (format) {
 		case SNDRV_PCM_FORMAT_MU_LAW:
 			for (i = 0; i < ARRAY_SIZE(preferred_formats); ++i) {
 				snd_pcm_format_t format1 = preferred_formats[i];
-				if (snd_mask_test(format_mask, (__force int)format1))
+				if (snd_mask_test(format_mask, format1))
 					return format1;
 			}
 			fallthrough;
 		default:
-			return (__force snd_pcm_format_t)-EINVAL;
+			return -EINVAL;
 		}
 	}
 }
-- 
2.55.0

