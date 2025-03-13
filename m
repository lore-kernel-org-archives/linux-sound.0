Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA30B1C84A8
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887844; cv=none; b=QmhUsMmJQ1Nv12d3OiSQXRbBkRqkh0cnnEsLNVUdKfW89kck2fuPBga0wstP8lI+/ZYYXeaRaCRogCHNnAZlccpU79DVv7h/RJBrwZaVvt4WR/aKQq0wwq7MdJL6iyzS2y/RZeQaZCZ4vfmCaE6KOxHzK/rCI97n00OAwZ4ooxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887844; c=relaxed/simple;
	bh=CErNXOEtx2M9T3Tqwk7XB1zRUf81EBR+6WBQWTSohso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OTQB3dS6d8pYmDn3T3dra+a7tDyGUnCaR/Q4XX1iRCRqvE0yMCD3BT3RKKTOWfND5XePb85ZprfiuF63I604vx7QzjdUu3aEpL8jEm5WtnQkxc1ryjba6WhxcGYMJuffvALzrdqaDe5UDuLWTSm/G/aGatQXJV5YgJk/RFoC0Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JSJMv1b6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ThcXMkyA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JSJMv1b6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ThcXMkyA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JSJMv1b6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ThcXMkyA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JSJMv1b6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ThcXMkyA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1CF7F211CB;
	Thu, 13 Mar 2025 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yb5BTuvGpPWIrTgBZyFM7MuZBtD3RRV0rwsBmKoYnHg=;
	b=JSJMv1b67cJRhV+Vg0U9HBZMFP3DcDQ2X5haWDBm1x5+84WMyjoEexaFDj1eb/cpcisczh
	qK9SeCjxWa2qu3dN63p4XRIDSzMt/pUlwN4gugAQHBo95hGTNfY9iAY7z0QC1Dw0R4qHLZ
	CcxB2usbzcqc1jpeO3TG/MMYmxDUhZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yb5BTuvGpPWIrTgBZyFM7MuZBtD3RRV0rwsBmKoYnHg=;
	b=ThcXMkyAQxbARUC2n5yoHgulOyS1QPTzw+yvCdIb4yZZ7dFYypt3CsetM8ouuW4mAx+s/u
	tog74qOa/hFwfADA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yb5BTuvGpPWIrTgBZyFM7MuZBtD3RRV0rwsBmKoYnHg=;
	b=JSJMv1b67cJRhV+Vg0U9HBZMFP3DcDQ2X5haWDBm1x5+84WMyjoEexaFDj1eb/cpcisczh
	qK9SeCjxWa2qu3dN63p4XRIDSzMt/pUlwN4gugAQHBo95hGTNfY9iAY7z0QC1Dw0R4qHLZ
	CcxB2usbzcqc1jpeO3TG/MMYmxDUhZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yb5BTuvGpPWIrTgBZyFM7MuZBtD3RRV0rwsBmKoYnHg=;
	b=ThcXMkyAQxbARUC2n5yoHgulOyS1QPTzw+yvCdIb4yZZ7dFYypt3CsetM8ouuW4mAx+s/u
	tog74qOa/hFwfADA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E0636137BA;
	Thu, 13 Mar 2025 17:42:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YJZHNekY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 46/89] ASoC: tas2552: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:51 +0100
Message-ID: <20250313174139.29942-47-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313174139.29942-1-tiwai@suse.de>
References: <20250313174139.29942-1-tiwai@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping superfluous CONFIG_PM
ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Shenghao Ding <shenghao-ding@ti.com>
Cc: Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/tas2552.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index 684d52ec6600..b56dd279d90a 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -138,7 +138,6 @@ static const struct snd_soc_dapm_route tas2552_audio_map[] = {
 	{"ASI OUT", NULL, "DMIC"}
 };
 
-#ifdef CONFIG_PM
 static void tas2552_sw_shutdown(struct tas2552_data *tas2552, int sw_shutdown)
 {
 	u8 cfg1_reg = 0;
@@ -152,7 +151,6 @@ static void tas2552_sw_shutdown(struct tas2552_data *tas2552, int sw_shutdown)
 	snd_soc_component_update_bits(tas2552->component, TAS2552_CFG_1, TAS2552_SWS,
 			    cfg1_reg);
 }
-#endif
 
 static int tas2552_setup_pll(struct snd_soc_component *component,
 			     struct snd_pcm_hw_params *params)
@@ -480,7 +478,6 @@ static int tas2552_mute(struct snd_soc_dai *dai, int mute, int direction)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int tas2552_runtime_suspend(struct device *dev)
 {
 	struct tas2552_data *tas2552 = dev_get_drvdata(dev);
@@ -508,11 +505,9 @@ static int tas2552_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops tas2552_pm = {
-	SET_RUNTIME_PM_OPS(tas2552_runtime_suspend, tas2552_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(tas2552_runtime_suspend, tas2552_runtime_resume, NULL)
 };
 
 static const struct snd_soc_dai_ops tas2552_speaker_dai_ops = {
@@ -768,7 +763,7 @@ static struct i2c_driver tas2552_i2c_driver = {
 	.driver = {
 		.name = "tas2552",
 		.of_match_table = of_match_ptr(tas2552_of_match),
-		.pm = &tas2552_pm,
+		.pm = pm_ptr(&tas2552_pm),
 	},
 	.probe = tas2552_probe,
 	.remove = tas2552_i2c_remove,
-- 
2.43.0

