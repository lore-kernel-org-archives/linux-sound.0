Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF704749FC
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938004; cv=none; b=QN9u4phH0SfEqEKW6IY5qgA/jSDMFkdFBILtyZlOqJf6sTujRv8l2Tj7/vfzXOtGQ4+x9gToF/6bcAQ3UklQ9Glb5MDwq2Jm8Us2umJz48ruCTHuankZm79zG3UGJJsUUb0wfQJxAl+n6bdjAr9EsqDjr19JXVlQt52UHE+sdRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938004; c=relaxed/simple;
	bh=zhq1XmhuPziWEzftRluHmM2MEewNDoDvXMJJx9/PmrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahQR7fNI2wbBuBn6f1Txt5IOBcoITiCdZyx4FkaNWRG/YEIHNYfyRAUR8zFz9YYLaE241ON82yLqbqk1VsKnWJaUeGloKN0BnfSsIGvOOiZeq02qaXxqi2zF6ILZ125bQA4RUW6Bwj+t5s36s934tTFvQAOon7BAjuBhwMt78WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tPTLWxx3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mVYbj8lO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mUE6jcAe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yls7qiJf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tPTLWxx3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mVYbj8lO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mUE6jcAe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yls7qiJf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 427157F0DB;
	Wed,  5 Aug 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Ze1WCxnVAbaKE8j+M3Rc3WbPZ+kOR8nOgn0aBdq1UM=;
	b=tPTLWxx3LDiy39sJrahRUD6CtGcmsBdLPLr6rC8rUIs/+cQ3zBT/T5f0jj5CxpUZO1CYhY
	rhZYOdvos8rz+L/HjYyAuwK/1ITYRE9vujQ5vkBfbCB/1dsbNRVmKmwOLjQ1xNJHyD6e0i
	9SGAyndTKKDPn34FAbLaL4tqh9gLyMg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Ze1WCxnVAbaKE8j+M3Rc3WbPZ+kOR8nOgn0aBdq1UM=;
	b=mVYbj8lOGtUE8bqQvIa6pPjfq9GrpalfcKy+5oTBknszOci6wvl9omLFQAzO4f+6dYOQj7
	yxC4VuF3lHLT0xDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mUE6jcAe;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yls7qiJf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Ze1WCxnVAbaKE8j+M3Rc3WbPZ+kOR8nOgn0aBdq1UM=;
	b=mUE6jcAeLWgf+H4DP/k8XqSNW53NZP2XWYJWbdTmUBdXNJXquXgYm4KutS4/j51Knt1Q6y
	m4ybXcYrsRnVOyZRc2IdWsqLwzemdzuuI7Nchcw8GR4RvA8lW+GCaW0AVcD/pkhC0WosSf
	r8TxGUQJCXMtyY3fNvt3PJw8oXuieoo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Ze1WCxnVAbaKE8j+M3Rc3WbPZ+kOR8nOgn0aBdq1UM=;
	b=yls7qiJfwL7ZYatM1w2qGyaj1ZNRGKrTbzFXcp7vMYSKR0aOdVnofoxu0hsIleJ3B+Qg5w
	4eh5EuFgqittCaDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 52DE3779FC;
	Wed,  5 Aug 2026 13:52:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kKYVEzpAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>
Subject: [PATCH 19/31] ASoC: tas2781: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:20 +0200
Message-ID: <20260805135247.670693-20-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805135247.670693-1-tiwai@suse.de>
References: <20260805135247.670693-1-tiwai@suse.de>
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
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 427157F0DB
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Shenghao Ding <shenghao-ding@ti.com>
Cc: Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>
Cc: Sen Wang <sen@ti.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/tas2781-fmwlib.c | 45 +++++++++++--------------------
 1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index dcbeb9618195..b1e75fc868b6 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2243,7 +2243,7 @@ int tas2781_load_calibration(void *context, char *file_name,
 {
 	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *)context;
 	struct tasdevice *tasdev = &(tas_priv->tasdevice[i]);
-	const struct firmware *fw_entry = NULL;
+	const struct firmware *fw_entry __free(firmware) = NULL;
 	struct tasdevice_fw *tas_fmw;
 	struct firmware fmw;
 	int offset = 0;
@@ -2253,60 +2253,50 @@ int tas2781_load_calibration(void *context, char *file_name,
 	if (ret) {
 		dev_err(tas_priv->dev, "%s: Request firmware %s failed\n",
 			__func__, file_name);
-		goto out;
+		return ret;
 	}
 
 	if (!fw_entry->size) {
 		dev_err(tas_priv->dev, "%s: file read error: size = %lu\n",
 			__func__, (unsigned long)fw_entry->size);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 	fmw.size = fw_entry->size;
 	fmw.data = fw_entry->data;
 
 	tas_fmw = tasdev->cali_data_fmw = kzalloc_obj(struct tasdevice_fw);
-	if (!tasdev->cali_data_fmw) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!tasdev->cali_data_fmw)
+		return -ENOMEM;
+
 	tas_fmw->dev = tas_priv->dev;
 	offset = fw_parse_header(tas_priv, tas_fmw, &fmw, offset);
 	if (offset == -EINVAL) {
 		dev_err(tas_priv->dev, "fw_parse_header EXIT!\n");
-		ret = offset;
-		goto out;
+		return -EINVAL;
 	}
 	offset = fw_parse_variable_hdr_cal(tas_priv, tas_fmw, &fmw, offset);
 	if (offset == -EINVAL) {
 		dev_err(tas_priv->dev,
 			"%s: fw_parse_variable_header_cal EXIT!\n", __func__);
-		ret = offset;
-		goto out;
+		return -EINVAL;
 	}
 	offset = fw_parse_program_data(tas_priv, tas_fmw, &fmw, offset);
 	if (offset < 0) {
 		dev_err(tas_priv->dev, "fw_parse_program_data EXIT!\n");
-		ret = offset;
-		goto out;
+		return offset;
 	}
 	offset = fw_parse_configuration_data(tas_priv, tas_fmw, &fmw, offset);
 	if (offset < 0) {
 		dev_err(tas_priv->dev, "fw_parse_configuration_data EXIT!\n");
-		ret = offset;
-		goto out;
+		return offset;
 	}
 	offset = fw_parse_calibration_data(tas_priv, tas_fmw, &fmw, offset);
 	if (offset < 0) {
 		dev_err(tas_priv->dev, "fw_parse_calibration_data EXIT!\n");
-		ret = offset;
-		goto out;
+		return offset;
 	}
 
-out:
-	release_firmware(fw_entry);
-
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(tas2781_load_calibration, "SND_SOC_TAS2781_FMWLIB");
 
@@ -2399,7 +2389,7 @@ static int tasdevice_dspfw_ready(const struct firmware *fmw,
 int tasdevice_dsp_parser(void *context)
 {
 	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *)context;
-	const struct firmware *fw_entry;
+	const struct firmware *fw_entry __free(firmware) = NULL;
 	int ret;
 
 	ret = request_firmware(&fw_entry, tas_priv->coef_binaryname,
@@ -2407,15 +2397,10 @@ int tasdevice_dsp_parser(void *context)
 	if (ret) {
 		dev_err(tas_priv->dev, "%s: load %s error\n", __func__,
 			tas_priv->coef_binaryname);
-		goto out;
+		return ret;
 	}
 
-	ret = tasdevice_dspfw_ready(fw_entry, tas_priv);
-	release_firmware(fw_entry);
-	fw_entry = NULL;
-
-out:
-	return ret;
+	return tasdevice_dspfw_ready(fw_entry, tas_priv);
 }
 EXPORT_SYMBOL_NS_GPL(tasdevice_dsp_parser, "SND_SOC_TAS2781_FMWLIB");
 
-- 
2.55.0

