Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92870320CD3
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 06:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514792; cv=none; b=tQaoi6CN+h6e/d+4iFFnqbqCZAnUG/qZvQUfrX1/gzmGZbHKEt6v7H/RFD4WEFRJrM0NlCKpuhmS2hwhki08sDd4eriehEdjmJoyitugzOO4xzdcBaIueil4JTNu2QTqwK4kSf5goa7zA7lAP8o1JPmnuuQ7r8I6Mfk2jsdQpUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514792; c=relaxed/simple;
	bh=TG9vo6Cwh0aLBK4razmJOjo+bhXTBln+KHmIi4Lo2t8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NJB6FtuYRhZGX0x3Hjq3NH9Spmq0PCv+Q6iDbnSP5jpd9fo3nBAb9W5qRDpldtc1Y9fAOkur7iBUEo6vQgu19dmmGH/8ZGkCPEIT1Tz6DHfelnw2Bd0YFhUQyZBww2QbSUF97rMc8fRVl1MDMTVDudkM1BQC1yArVv0h74EUs5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GB8K1H/7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vOidyePX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aY4sFBF2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SaKMJi+d; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GB8K1H/7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vOidyePX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aY4sFBF2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SaKMJi+d"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 79BC2820EB;
	Wed, 12 Aug 2026 06:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Cv2rErzjhpfcvkjQRjcH7iOXDh46G2N5lTIzQ8qC8o=;
	b=GB8K1H/7BfFANUPn0Z4k7sRLgwpr2ddqsY1Klx8GqOWv1i4b4X6TeZ8/ME3pC+y/LXk/xb
	RTts+HgCdDxxnPlkxSqHLHQI74iwLPqV6HpSyEfTd8+8SAWXVmk7BmNcodSnm8mCxfMyed
	3+Ow94moCrtewnVJmXhpgKFAognzcW8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Cv2rErzjhpfcvkjQRjcH7iOXDh46G2N5lTIzQ8qC8o=;
	b=vOidyePXNuhr9MryltWHQ9qmFZltK04u+Y95eMLJVSnif+cTsUdoQ1C3zo8NEPpPXi9YvO
	0ZFlzChH4OrNtzDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aY4sFBF2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SaKMJi+d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Cv2rErzjhpfcvkjQRjcH7iOXDh46G2N5lTIzQ8qC8o=;
	b=aY4sFBF2jl3XgAA4YRQtltLB/XiTvz87lGLrYW1yXW8v72pU5ck+CtCUuty++mkXFgSjiL
	pPAqgnrCwrwQnVS1WJToEPmwFX5wj6YFD1vbzQeg9k9AJC28Hmc+BW8biFrWlr+JyWeO9T
	SvZOBHP9NPpNb3xCxxCOzDLDu0MpoPU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514780;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Cv2rErzjhpfcvkjQRjcH7iOXDh46G2N5lTIzQ8qC8o=;
	b=SaKMJi+dBDbmQLtDCc7ajltbXmAnrE6X47VvWVh0mubmrUsBRCHiBufGg1dgoTM25MnIjD
	8uwDCs/kQQWI+MCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9016A779D2;
	Wed, 12 Aug 2026 06:06:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0DToIVUNfGrREAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 06:06:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
Subject: [PATCH 13/14] ASoC: mediatek: Drop __force casts
Date: Wed, 12 Aug 2026 08:04:45 +0200
Message-ID: <20260812060557.80445-14-tiwai@suse.de>
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
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 79BC2820EB
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Now that the bitwise parameter definitions are gone for PCM
parameters, we don't have to cast with ugly __force prefix.
Simply drop those superfluous casts.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c         | 4 ++--
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 4 ++--
 sound/soc/mediatek/mt8186/mt8186-mt6366.c                  | 2 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c                  | 2 +-
 sound/soc/mediatek/mt8189/mt8189-nau8825.c                 | 2 +-
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c    | 2 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c                  | 4 ++--
 sound/soc/mediatek/mt8196/mt8196-nau8825.c                 | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 983f3b91119a..aa3d1a588479 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -172,7 +172,7 @@ static int mt8183_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 {
 	/* fix BE i2s format to S32_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
+			     0, SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S32_LE);
 
@@ -184,7 +184,7 @@ static int mt8183_rt1015_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 {
 	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
+			     0, SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 0bc1f11e17aa..dea7ad167a49 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -99,7 +99,7 @@ static int mt8183_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 
 	/* fix BE i2s format to S32_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
+			     0, SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S32_LE);
 	return 0;
@@ -112,7 +112,7 @@ static int mt8183_rt1015_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 
 	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
+			     0, SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
 	return 0;
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366.c b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
index 22123b087c3c..b68f474b63f4 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
@@ -387,7 +387,7 @@ static int mt8186_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 
 	/* clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
+			     0, SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, fmt);
 
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 55ebac0c3cef..75c90d1d165f 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -623,7 +623,7 @@ static int mt8188_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 {
 	/* fix BE i2s format to 32bit, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
+			     0, SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S32_LE);
 
diff --git a/sound/soc/mediatek/mt8189/mt8189-nau8825.c b/sound/soc/mediatek/mt8189/mt8189-nau8825.c
index e849e7a649bc..5d652d0cf01e 100644
--- a/sound/soc/mediatek/mt8189/mt8189-nau8825.c
+++ b/sound/soc/mediatek/mt8189/mt8189-nau8825.c
@@ -174,7 +174,7 @@ static int mt8189_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 
 	/* fix BE i2s format to 32bit, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
+			     0, SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S32_LE);
 
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 91c57765ab57..8af8b0a366d5 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -382,7 +382,7 @@ static int mt8192_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 {
 	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
+			     0, SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
 
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 4d62bc654a58..fc293ca71502 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -387,7 +387,7 @@ static int mt8195_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 {
 	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
+			     0, SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
 
@@ -650,7 +650,7 @@ static int mt8195_etdm_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 {
 	/* fix BE i2s format to S24_LE, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
+			     0, SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
 
diff --git a/sound/soc/mediatek/mt8196/mt8196-nau8825.c b/sound/soc/mediatek/mt8196/mt8196-nau8825.c
index c9424786c53d..1d1dad86365b 100644
--- a/sound/soc/mediatek/mt8196/mt8196-nau8825.c
+++ b/sound/soc/mediatek/mt8196/mt8196-nau8825.c
@@ -180,7 +180,7 @@ static int mt8196_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 
 	/* fix BE i2s format to 32bit, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
-			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
+			     0, SNDRV_PCM_FORMAT_LAST);
 
 	params_set_format(params, SNDRV_PCM_FORMAT_S32_LE);
 	return 0;
-- 
2.55.0

