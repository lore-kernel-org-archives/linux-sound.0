Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A5422F155
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205491; cv=none; b=PQU0irLBeMsrYgIwSW/5XsOMPIgIxAMyZOpAe/oNvj4tKs4ykHQKxk/QAN4MwnqPhrfhh0PXqCHb423BDOYvAYrjkUL0f/wA4LBQ1Zoz79yfPugjggyxUtrw9Zhkch1U1pu/lX0SfnFl1uIyOR17q62VAF82ZJKwnq25t8BCMsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205491; c=relaxed/simple;
	bh=CErNXOEtx2M9T3Tqwk7XB1zRUf81EBR+6WBQWTSohso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gz91T1OdCXmz/5K16GwF4cGAU/AStaeAO/RDhkhRvtzfgVeU8bj4OelNdzsSBj2GgCS3fS1h9pEfuBYS3pX7wEquQiSdQGicaP4pPGKR7nXWcqpl+VD1y+hMzgpVNGsfFHTjVeN89jclexIfXeD2fAN8y0QKRUAvfUWQZBOmgFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1DF5021F52;
	Mon, 17 Mar 2025 09:56:21 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E1E97132CF;
	Mon, 17 Mar 2025 09:56:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EDHeNcTx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 45/88] ASoC: tas2552: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:07 +0100
Message-ID: <20250317095603.20073-46-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317095603.20073-1-tiwai@suse.de>
References: <20250317095603.20073-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 1DF5021F52
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

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

