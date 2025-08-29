Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE18322A24
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478647; cv=none; b=DuM/l3GHgXX2ZAyUy+ZJURZtGBDqJAWO0iBsHdxHIQHhVoR9A2WswgUkEo1YxzSeR48gl0+e4B49o6zqlta7MBzCHELQjPrZKLx0n3IKElz2tCk0RdPdu8Gz8esjBByv12ACFMY1xIRwXzYzIuFbEgAIteOIyT71GyT6eSJsNxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478647; c=relaxed/simple;
	bh=KxO6OVEPLxPafhr7qgGzMm8kWj6ei2WZ0AyFlgwHiBc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UYKOAjg4DVc+jehupBurMsCnQ1WPOoBHBhgAex2L+nGpeCVc4wa26NDtB7zqY9FEaBCss5XYlXdvdq24PErdEcMaiHUqHVixwWT/ku4DOC7TpTAaG+XNRQ34AiyWxhjwRvyOPnSi+a2aTPKZEJJkp/yjEs5FyDqFpOXuaAZzCHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jAM3Jxgm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OPDR9jSL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jAM3Jxgm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OPDR9jSL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jAM3Jxgm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OPDR9jSL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jAM3Jxgm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OPDR9jSL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2A0B75C17C;
	Fri, 29 Aug 2025 14:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wgtZBXiDFiGbfU1BFEw9sLH7He/BaAIC790I1O9+7Yc=;
	b=jAM3JxgmeZoJUcIGBrUWT8+RzUi+hsA6fjSQOVx0buuYAR3dgsKm1oU7sT3+mhxVyALEeP
	81lSVEkgbx2ZsO1odP5P+6UlSRgAUw/6s/32U/PvqjioBRWdJ4rqWU+E64/Vb5okwO2kNF
	Aw4tbztOzSEBIzYK6ZYYAnJHyWkro/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wgtZBXiDFiGbfU1BFEw9sLH7He/BaAIC790I1O9+7Yc=;
	b=OPDR9jSLUiKgG4t6a8jZjNhflPTdmQ/bL8srH8+EftqWV365+ZYrsZNoPJ9OK4ao5mRbjy
	0SdST7MaX8JBJTCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jAM3Jxgm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OPDR9jSL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wgtZBXiDFiGbfU1BFEw9sLH7He/BaAIC790I1O9+7Yc=;
	b=jAM3JxgmeZoJUcIGBrUWT8+RzUi+hsA6fjSQOVx0buuYAR3dgsKm1oU7sT3+mhxVyALEeP
	81lSVEkgbx2ZsO1odP5P+6UlSRgAUw/6s/32U/PvqjioBRWdJ4rqWU+E64/Vb5okwO2kNF
	Aw4tbztOzSEBIzYK6ZYYAnJHyWkro/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wgtZBXiDFiGbfU1BFEw9sLH7He/BaAIC790I1O9+7Yc=;
	b=OPDR9jSLUiKgG4t6a8jZjNhflPTdmQ/bL8srH8+EftqWV365+ZYrsZNoPJ9OK4ao5mRbjy
	0SdST7MaX8JBJTCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 067D913A3E;
	Fri, 29 Aug 2025 14:43:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iLViAKi8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:52 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 05/61] ALSA: ens137x: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:42:40 +0200
Message-ID: <20250829144342.4290-6-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 2A0B75C17C
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
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
 sound/pci/ak4531_codec.c | 18 ++++++------------
 sound/pci/ens1370.c      | 13 ++++---------
 2 files changed, 10 insertions(+), 21 deletions(-)

diff --git a/sound/pci/ak4531_codec.c b/sound/pci/ak4531_codec.c
index e54812bfb2c6..cdad47e4098d 100644
--- a/sound/pci/ak4531_codec.c
+++ b/sound/pci/ak4531_codec.c
@@ -77,9 +77,8 @@ static int snd_ak4531_get_single(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 	int invert = (kcontrol->private_value >> 22) & 1;
 	int val;
 
-	mutex_lock(&ak4531->reg_mutex);
+	guard(mutex)(&ak4531->reg_mutex);
 	val = (ak4531->regs[reg] >> shift) & mask;
-	mutex_unlock(&ak4531->reg_mutex);
 	if (invert) {
 		val = mask - val;
 	}
@@ -102,11 +101,10 @@ static int snd_ak4531_put_single(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 		val = mask - val;
 	}
 	val <<= shift;
-	mutex_lock(&ak4531->reg_mutex);
+	guard(mutex)(&ak4531->reg_mutex);
 	val = (ak4531->regs[reg] & ~(mask << shift)) | val;
 	change = val != ak4531->regs[reg];
 	ak4531->write(ak4531, reg, ak4531->regs[reg] = val);
-	mutex_unlock(&ak4531->reg_mutex);
 	return change;
 }
 
@@ -146,10 +144,9 @@ static int snd_ak4531_get_double(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 	int invert = (kcontrol->private_value >> 22) & 1;
 	int left, right;
 
-	mutex_lock(&ak4531->reg_mutex);
+	guard(mutex)(&ak4531->reg_mutex);
 	left = (ak4531->regs[left_reg] >> left_shift) & mask;
 	right = (ak4531->regs[right_reg] >> right_shift) & mask;
-	mutex_unlock(&ak4531->reg_mutex);
 	if (invert) {
 		left = mask - left;
 		right = mask - right;
@@ -179,7 +176,7 @@ static int snd_ak4531_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 	}
 	left <<= left_shift;
 	right <<= right_shift;
-	mutex_lock(&ak4531->reg_mutex);
+	guard(mutex)(&ak4531->reg_mutex);
 	if (left_reg == right_reg) {
 		left = (ak4531->regs[left_reg] & ~((mask << left_shift) | (mask << right_shift))) | left | right;
 		change = left != ak4531->regs[left_reg];
@@ -191,7 +188,6 @@ static int snd_ak4531_put_double(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 		ak4531->write(ak4531, left_reg, ak4531->regs[left_reg] = left);
 		ak4531->write(ak4531, right_reg, ak4531->regs[right_reg] = right);
 	}
-	mutex_unlock(&ak4531->reg_mutex);
 	return change;
 }
 
@@ -218,12 +214,11 @@ static int snd_ak4531_get_input_sw(struct snd_kcontrol *kcontrol, struct snd_ctl
 	int left_shift = (kcontrol->private_value >> 16) & 0x0f;
 	int right_shift = (kcontrol->private_value >> 24) & 0x0f;
 
-	mutex_lock(&ak4531->reg_mutex);
+	guard(mutex)(&ak4531->reg_mutex);
 	ucontrol->value.integer.value[0] = (ak4531->regs[reg1] >> left_shift) & 1;
 	ucontrol->value.integer.value[1] = (ak4531->regs[reg2] >> left_shift) & 1;
 	ucontrol->value.integer.value[2] = (ak4531->regs[reg1] >> right_shift) & 1;
 	ucontrol->value.integer.value[3] = (ak4531->regs[reg2] >> right_shift) & 1;
-	mutex_unlock(&ak4531->reg_mutex);
 	return 0;
 }
 
@@ -237,7 +232,7 @@ static int snd_ak4531_put_input_sw(struct snd_kcontrol *kcontrol, struct snd_ctl
 	int change;
 	int val1, val2;
 
-	mutex_lock(&ak4531->reg_mutex);
+	guard(mutex)(&ak4531->reg_mutex);
 	val1 = ak4531->regs[reg1] & ~((1 << left_shift) | (1 << right_shift));
 	val2 = ak4531->regs[reg2] & ~((1 << left_shift) | (1 << right_shift));
 	val1 |= (ucontrol->value.integer.value[0] & 1) << left_shift;
@@ -247,7 +242,6 @@ static int snd_ak4531_put_input_sw(struct snd_kcontrol *kcontrol, struct snd_ctl
 	change = val1 != ak4531->regs[reg1] || val2 != ak4531->regs[reg2];
 	ak4531->write(ak4531, reg1, ak4531->regs[reg1] = val1);
 	ak4531->write(ak4531, reg2, ak4531->regs[reg2] = val2);
-	mutex_unlock(&ak4531->reg_mutex);
 	return change;
 }
 
diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 82e10ecb9196..23a756ece3c5 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -596,7 +596,7 @@ static void snd_es1371_codec_write(struct snd_ac97 *ac97,
 	unsigned int t, x, flag;
 
 	flag = is_ev1938(ensoniq) ? EV_1938_CODEC_MAGIC : 0;
-	mutex_lock(&ensoniq->src_mutex);
+	guard(mutex)(&ensoniq->src_mutex);
 	for (t = 0; t < POLL_COUNT; t++) {
 		if (!(inl(ES_REG(ensoniq, 1371_CODEC)) & ES_1371_CODEC_WIP)) {
 			/* save the current state for latter */
@@ -622,11 +622,9 @@ static void snd_es1371_codec_write(struct snd_ac97 *ac97,
 			/* restore SRC reg */
 			snd_es1371_wait_src_ready(ensoniq);
 			outl(x, ES_REG(ensoniq, 1371_SMPRATE));
-			mutex_unlock(&ensoniq->src_mutex);
 			return;
 		}
 	}
-	mutex_unlock(&ensoniq->src_mutex);
 	dev_err(ensoniq->card->dev, "codec write timeout at 0x%lx [0x%x]\n",
 		   ES_REG(ensoniq, 1371_CODEC), inl(ES_REG(ensoniq, 1371_CODEC)));
 }
@@ -713,7 +711,7 @@ static void snd_es1371_adc_rate(struct ensoniq * ensoniq, unsigned int rate)
 {
 	unsigned int n, truncm, freq;
 
-	mutex_lock(&ensoniq->src_mutex);
+	guard(mutex)(&ensoniq->src_mutex);
 	n = rate / 3000;
 	if ((1 << n) & ((1 << 15) | (1 << 13) | (1 << 11) | (1 << 9)))
 		n--;
@@ -737,14 +735,13 @@ static void snd_es1371_adc_rate(struct ensoniq * ensoniq, unsigned int rate)
 	snd_es1371_src_write(ensoniq, ES_SMPREG_ADC + ES_SMPREG_VFREQ_FRAC, freq & 0x7fff);
 	snd_es1371_src_write(ensoniq, ES_SMPREG_VOL_ADC, n << 8);
 	snd_es1371_src_write(ensoniq, ES_SMPREG_VOL_ADC + 1, n << 8);
-	mutex_unlock(&ensoniq->src_mutex);
 }
 
 static void snd_es1371_dac1_rate(struct ensoniq * ensoniq, unsigned int rate)
 {
 	unsigned int freq, r;
 
-	mutex_lock(&ensoniq->src_mutex);
+	guard(mutex)(&ensoniq->src_mutex);
 	freq = DIV_ROUND_CLOSEST(rate << 15, 3000);
 	r = (snd_es1371_wait_src_ready(ensoniq) & (ES_1371_SRC_DISABLE |
 						   ES_1371_DIS_P2 | ES_1371_DIS_R1)) |
@@ -758,14 +755,13 @@ static void snd_es1371_dac1_rate(struct ensoniq * ensoniq, unsigned int rate)
 	r = (snd_es1371_wait_src_ready(ensoniq) & (ES_1371_SRC_DISABLE |
 						   ES_1371_DIS_P2 | ES_1371_DIS_R1));
 	outl(r, ES_REG(ensoniq, 1371_SMPRATE));
-	mutex_unlock(&ensoniq->src_mutex);
 }
 
 static void snd_es1371_dac2_rate(struct ensoniq * ensoniq, unsigned int rate)
 {
 	unsigned int freq, r;
 
-	mutex_lock(&ensoniq->src_mutex);
+	guard(mutex)(&ensoniq->src_mutex);
 	freq = DIV_ROUND_CLOSEST(rate << 15, 3000);
 	r = (snd_es1371_wait_src_ready(ensoniq) & (ES_1371_SRC_DISABLE |
 						   ES_1371_DIS_P1 | ES_1371_DIS_R1)) |
@@ -780,7 +776,6 @@ static void snd_es1371_dac2_rate(struct ensoniq * ensoniq, unsigned int rate)
 	r = (snd_es1371_wait_src_ready(ensoniq) & (ES_1371_SRC_DISABLE |
 						   ES_1371_DIS_P1 | ES_1371_DIS_R1));
 	outl(r, ES_REG(ensoniq, 1371_SMPRATE));
-	mutex_unlock(&ensoniq->src_mutex);
 }
 
 #endif /* CHIP1371 */
-- 
2.50.1

