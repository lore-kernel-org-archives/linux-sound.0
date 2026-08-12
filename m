Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ECC3264F4
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 06:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514792; cv=none; b=eb6//0PolfVJx0+o3pqHkGetXarljsUwRBls51EdqNMlXs+0MWdYxCD8h5m3l5B//cRmDnG7y9oR3i6qgKc1uNN/1emlQsG+dD9LC0EoQ1sEUmw1BUCr09FXfIIML+7zYsNhyOzyPhVD3B9VOTYCh/kZh6+Prcv+QBWOtOaorTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514792; c=relaxed/simple;
	bh=EB2EadKDGrSFYcILzdsv5Mxv/azdU35v/TUlT05jjfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oncr57Y0W4gp9vfB7NmLx4jspLBXSJXM+EmI7GG4vpOR40i5nzJqe2I4JCTRXnRZoOWLIDarhLzWTg7d8kmIJBifTKyyerb3lOAfXHK/smY5rKQSAZtIEI62doB6+6V4uCFuaD3XYAef2WmUsjHtiYmeTy5QVjGaG4m8GgMyPyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V06UKXZJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7B08AmK2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Pt4gQTH5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/NpIZWAa; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V06UKXZJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7B08AmK2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Pt4gQTH5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/NpIZWAa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5FDC33E45;
	Wed, 12 Aug 2026 06:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K3+Hdyv4Gw7G7xdy9kgiXzWMTSOrUDLkxv0/pwQakd0=;
	b=V06UKXZJedtm4dQOItjsEZtYOafF5RcJBbQdNguo4OZ8ch5xGXkz6Yz/qkAz49/ytFAOqB
	KkDgDbp1MrHGhXKDNR22UWWW0wD0mgipQA9NQe1MxDWzUaX/zEoNS9RjBfU6MA5QmjbvDx
	FHfMwFrBXWrx1A6qX3YS1Al+quTwW04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K3+Hdyv4Gw7G7xdy9kgiXzWMTSOrUDLkxv0/pwQakd0=;
	b=7B08AmK2V4a9IdiXIdu7k/5WHLjGjt02gez0xPYVYs+nR5jQB35kJUBv6wmPH6jbg/a5v3
	fBnscn8tFFY7DDCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K3+Hdyv4Gw7G7xdy9kgiXzWMTSOrUDLkxv0/pwQakd0=;
	b=Pt4gQTH5g8Ur+fL47/FurPia7eZMrNwQcLw/5eZjpmlfxWKh1BkCO4kK3dP0Bu6vzYcZVw
	ujn70VA55jvu36xN8GQ9WDNdCV5oDGuEf6jJJp1NLVIccWrXtqQY7E1+S3MVRHD/ts0Hbn
	eul8iwZkjrjV1/GY1DAV3rTJWakGcww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514780;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K3+Hdyv4Gw7G7xdy9kgiXzWMTSOrUDLkxv0/pwQakd0=;
	b=/NpIZWAa+yiEd/eecrkR0aSeLj5hUtgcJdg1MlKAHZdz+cmBTgZPsvBQPrP/z03gju4I7N
	Z/jao6I6oEt0avBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2ED32779D0;
	Wed, 12 Aug 2026 06:06:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8KM0ClUNfGrREAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 06:06:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 11/14] ASoC: fsl: Drop __force casts
Date: Wed, 12 Aug 2026 08:04:43 +0200
Message-ID: <20260812060557.80445-12-tiwai@suse.de>
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
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spam-Level: 

Now that the bitwise parameter definitions are gone for PCM
parameters, we don't have to cast with ugly __force prefix.
Simply drop those superfluous casts.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/fsl/fsl-asoc-card.c |  2 +-
 sound/soc/fsl/fsl_asrc.c      |  2 +-
 sound/soc/fsl/fsl_asrc_m2m.c  | 10 +++++-----
 sound/soc/fsl/fsl_easrc.c     |  2 +-
 sound/soc/fsl/fsl_qmc_audio.c |  8 ++++----
 sound/soc/fsl/imx-card.c      |  4 ++--
 6 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 709543308fe9..9dc46ab1d3e1 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -1118,7 +1118,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		}
 
 		ret = of_property_read_u32(asrc_np, "fsl,asrc-format", &asrc_fmt);
-		priv->asrc_format = (__force snd_pcm_format_t)asrc_fmt;
+		priv->asrc_format = asrc_fmt;
 		if (ret) {
 			/* Fallback to old binding; translate to asrc_format */
 			ret = of_property_read_u32(asrc_np, "fsl,asrc-width",
diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index f23c21032287..11748c65d5cc 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1358,7 +1358,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	}
 
 	ret = of_property_read_u32(np, "fsl,asrc-format", &asrc_fmt);
-	asrc->asrc_format = (__force snd_pcm_format_t)asrc_fmt;
+	asrc->asrc_format = asrc_fmt;
 	if (ret) {
 		ret = of_property_read_u32(np, "fsl,asrc-width", &width);
 		if (ret) {
diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
index 7d39378c0622..4bc40f328f58 100644
--- a/sound/soc/fsl/fsl_asrc_m2m.c
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -367,13 +367,13 @@ static int fsl_asrc_m2m_comp_set_params(struct snd_compr_stream *stream,
 	if (ret)
 		return -EINVAL;
 
-	if (pcm_format_to_bits((__force snd_pcm_format_t)params->codec.format) & cap.fmt_in)
-		pair->sample_format[IN] = (__force snd_pcm_format_t)params->codec.format;
+	if (pcm_format_to_bits(params->codec.format) & cap.fmt_in)
+		pair->sample_format[IN] = params->codec.format;
 	else
 		return -EINVAL;
 
-	if (pcm_format_to_bits((__force snd_pcm_format_t)params->codec.pcm_format) & cap.fmt_out)
-		pair->sample_format[OUT] = (__force snd_pcm_format_t)params->codec.pcm_format;
+	if (pcm_format_to_bits(params->codec.pcm_format) & cap.fmt_out)
+		pair->sample_format[OUT] = params->codec.pcm_format;
 	else
 		return -EINVAL;
 
@@ -600,7 +600,7 @@ static int fsl_asrc_m2m_fill_codec_caps(struct fsl_asrc *asrc,
 			       cap.rate_in,
 			       cap.rate_in_count * sizeof(__u32));
 			codec->descriptor[j].num_sample_rates = cap.rate_in_count;
-			codec->descriptor[j].formats = (__force __u32)k;
+			codec->descriptor[j].formats = k;
 			codec->descriptor[j].pcm_formats = cap.fmt_out;
 			codec->descriptor[j].src.out_sample_rate_min = cap.rate_out[0];
 			codec->descriptor[j].src.out_sample_rate_max =
diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 8535ef844ce0..79eb2391058d 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -2227,7 +2227,7 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 	}
 
 	ret = of_property_read_u32(np, "fsl,asrc-format", &asrc_fmt);
-	easrc->asrc_format = (__force snd_pcm_format_t)asrc_fmt;
+	easrc->asrc_format = asrc_fmt;
 	if (ret) {
 		dev_err(dev, "failed to asrc format\n");
 		return ret;
diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index d0f644573f49..f27934cf49da 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -503,8 +503,8 @@ static int qmc_dai_constraints_interleaved(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	access = 1ULL << (__force int)SNDRV_PCM_ACCESS_MMAP_INTERLEAVED |
-		 1ULL << (__force int)SNDRV_PCM_ACCESS_RW_INTERLEAVED;
+	access = 1ULL << SNDRV_PCM_ACCESS_MMAP_INTERLEAVED |
+		 1ULL << SNDRV_PCM_ACCESS_RW_INTERLEAVED;
 	ret = snd_pcm_hw_constraint_mask64(substream->runtime, SNDRV_PCM_HW_PARAM_ACCESS,
 					   access);
 	if (ret) {
@@ -532,8 +532,8 @@ static int qmc_dai_constraints_noninterleaved(struct snd_pcm_substream *substrea
 		return ret;
 	}
 
-	access = 1ULL << (__force int)SNDRV_PCM_ACCESS_MMAP_NONINTERLEAVED |
-		 1ULL << (__force int)SNDRV_PCM_ACCESS_RW_NONINTERLEAVED;
+	access = 1ULL << SNDRV_PCM_ACCESS_MMAP_NONINTERLEAVED |
+		 1ULL << SNDRV_PCM_ACCESS_RW_NONINTERLEAVED;
 	ret = snd_pcm_hw_constraint_mask64(substream->runtime, SNDRV_PCM_HW_PARAM_ACCESS,
 					   access);
 	if (ret) {
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 43438af1e1c6..e3cb1438e837 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -531,7 +531,7 @@ static int be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 
 	mask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 	snd_mask_none(mask);
-	snd_mask_set(mask, (__force unsigned int)data->asrc_format);
+	snd_mask_set(mask, data->asrc_format);
 
 	return 0;
 }
@@ -684,7 +684,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 			}
 
 			ret = of_property_read_u32(args.np, "fsl,asrc-format", &asrc_fmt);
-			data->asrc_format = (__force snd_pcm_format_t)asrc_fmt;
+			data->asrc_format = asrc_fmt;
 			if (ret) {
 				/* Fallback to old binding; translate to asrc_format */
 				ret = of_property_read_u32(args.np, "fsl,asrc-width", &width);
-- 
2.55.0

