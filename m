Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFDE1DC985
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887985; cv=none; b=A+jipLA0GF2j+0KrJKl+n2Ur6aQONM8xfhh7DcUfCU3P3SPugTbq9w9q3HHKzEqEHAzCNYI8Vmj9uUokfxHoIJ12WaaCry+OPzbR5N15IYesEWJHYkDgE+sadXDPU/rO8H/0cz/GoMcPH7T9XU1QsRTdg1wycZSTLZtOpclPsQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887985; c=relaxed/simple;
	bh=pZOjmLSBzB7EoLXhHLmw6ya6S8XESJYqFBoQzUdfsxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fzlqceSoaSkOR2IECbvLDuretvVPY0D8qRG9RDVL9r0sWkZUJZ7vW64rYDzrXSq7zFIEzHvC4iLwQguykSc3Etfag40LL4iB7pLW5kucgEqyJdpB2HMvwg8I49zDY1x7DsGzA3bMR0+IVZja0dcGa+jDovJqGscEke9TOkA4wAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UHG84aGe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KVBrzZ7J; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UHG84aGe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KVBrzZ7J; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UHG84aGe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KVBrzZ7J";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UHG84aGe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KVBrzZ7J"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 67522211FB;
	Thu, 13 Mar 2025 17:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALkCxGMbkVojMnOLD8HonACgqmh+ydB2r6PVOSKY24g=;
	b=UHG84aGeEXYQCDd2bVWcl8KGF5gVsHsGOV3FWKb34V+KFifuF0hhCClZ0zrCgMGeduHFy7
	I9fYvsGCLw5TyyWqemrVvs8RnBqIgRposQKyFA4UELVcOCPOi19zDCgvrnuBWEL5uMEWse
	7irNVAEbqGA190UaHrdY7AappyFQQJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887728;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALkCxGMbkVojMnOLD8HonACgqmh+ydB2r6PVOSKY24g=;
	b=KVBrzZ7JDl4dNrTfuGsHPDal7PknK7rRu9p7UP2ZrFQm0sca4q2vpG/B2UUWjbmGVS4XJO
	u1TKEiknQc4yO/AQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UHG84aGe;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KVBrzZ7J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALkCxGMbkVojMnOLD8HonACgqmh+ydB2r6PVOSKY24g=;
	b=UHG84aGeEXYQCDd2bVWcl8KGF5gVsHsGOV3FWKb34V+KFifuF0hhCClZ0zrCgMGeduHFy7
	I9fYvsGCLw5TyyWqemrVvs8RnBqIgRposQKyFA4UELVcOCPOi19zDCgvrnuBWEL5uMEWse
	7irNVAEbqGA190UaHrdY7AappyFQQJM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887728;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALkCxGMbkVojMnOLD8HonACgqmh+ydB2r6PVOSKY24g=;
	b=KVBrzZ7JDl4dNrTfuGsHPDal7PknK7rRu9p7UP2ZrFQm0sca4q2vpG/B2UUWjbmGVS4XJO
	u1TKEiknQc4yO/AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2E3B8137BA;
	Thu, 13 Mar 2025 17:42:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cMf6CfAY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 81/89] ASoC: stm: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Thu, 13 Mar 2025 18:41:26 +0100
Message-ID: <20250313174139.29942-82-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 67522211FB
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,st.com:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead
SET_SYSTEM_SLEEP_PM_OPS() together with pm_ptr(), which allows us
dropping superfluous CONFIG_PM_SLEEP ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/stm/stm32_i2s.c     | 6 ++----
 sound/soc/stm/stm32_sai.c     | 6 ++----
 sound/soc/stm/stm32_sai_sub.c | 6 ++----
 sound/soc/stm/stm32_spdifrx.c | 6 ++----
 4 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 19dc61008a75..6037b7a9c97b 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -1352,7 +1352,6 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 
 MODULE_DEVICE_TABLE(of, stm32_i2s_ids);
 
-#ifdef CONFIG_PM_SLEEP
 static int stm32_i2s_suspend(struct device *dev)
 {
 	struct stm32_i2s_data *i2s = dev_get_drvdata(dev);
@@ -1370,17 +1369,16 @@ static int stm32_i2s_resume(struct device *dev)
 	regcache_cache_only(i2s->regmap, false);
 	return regcache_sync(i2s->regmap);
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops stm32_i2s_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(stm32_i2s_suspend, stm32_i2s_resume)
+	SYSTEM_SLEEP_PM_OPS(stm32_i2s_suspend, stm32_i2s_resume)
 };
 
 static struct platform_driver stm32_i2s_driver = {
 	.driver = {
 		.name = "st,stm32-i2s",
 		.of_match_table = stm32_i2s_ids,
-		.pm = &stm32_i2s_pm_ops,
+		.pm = pm_ptr(&stm32_i2s_pm_ops),
 	},
 	.probe = stm32_i2s_probe,
 	.remove = stm32_i2s_remove,
diff --git a/sound/soc/stm/stm32_sai.c b/sound/soc/stm/stm32_sai.c
index bc8180fc8462..504a14584765 100644
--- a/sound/soc/stm/stm32_sai.c
+++ b/sound/soc/stm/stm32_sai.c
@@ -270,7 +270,6 @@ static int stm32_sai_probe(struct platform_device *pdev)
 	return devm_of_platform_populate(&pdev->dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 /*
  * When pins are shared by two sai sub instances, pins have to be defined
  * in sai parent node. In this case, pins state is not managed by alsa fw.
@@ -305,10 +304,9 @@ static int stm32_sai_resume(struct device *dev)
 
 	return pinctrl_pm_select_default_state(dev);
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops stm32_sai_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(stm32_sai_suspend, stm32_sai_resume)
+	SYSTEM_SLEEP_PM_OPS(stm32_sai_suspend, stm32_sai_resume)
 };
 
 MODULE_DEVICE_TABLE(of, stm32_sai_ids);
@@ -317,7 +315,7 @@ static struct platform_driver stm32_sai_driver = {
 	.driver = {
 		.name = "st,stm32-sai",
 		.of_match_table = stm32_sai_ids,
-		.pm = &stm32_sai_pm_ops,
+		.pm = pm_ptr(&stm32_sai_pm_ops),
 	},
 	.probe = stm32_sai_probe,
 };
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 3efbf4aaf965..e8c1abf1ae0a 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1704,7 +1704,6 @@ static void stm32_sai_sub_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int stm32_sai_sub_suspend(struct device *dev)
 {
 	struct stm32_sai_sub_data *sai = dev_get_drvdata(dev);
@@ -1738,17 +1737,16 @@ static int stm32_sai_sub_resume(struct device *dev)
 
 	return ret;
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops stm32_sai_sub_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(stm32_sai_sub_suspend, stm32_sai_sub_resume)
+	SYSTEM_SLEEP_PM_OPS(stm32_sai_sub_suspend, stm32_sai_sub_resume)
 };
 
 static struct platform_driver stm32_sai_sub_driver = {
 	.driver = {
 		.name = "st,stm32-sai-sub",
 		.of_match_table = stm32_sai_sub_ids,
-		.pm = &stm32_sai_sub_pm_ops,
+		.pm = pm_ptr(&stm32_sai_sub_pm_ops),
 	},
 	.probe = stm32_sai_sub_probe,
 	.remove = stm32_sai_sub_remove,
diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 9e30852de93c..57b711c44278 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -1040,7 +1040,6 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 
 MODULE_DEVICE_TABLE(of, stm32_spdifrx_ids);
 
-#ifdef CONFIG_PM_SLEEP
 static int stm32_spdifrx_suspend(struct device *dev)
 {
 	struct stm32_spdifrx_data *spdifrx = dev_get_drvdata(dev);
@@ -1059,17 +1058,16 @@ static int stm32_spdifrx_resume(struct device *dev)
 
 	return regcache_sync(spdifrx->regmap);
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops stm32_spdifrx_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(stm32_spdifrx_suspend, stm32_spdifrx_resume)
+	SYSTEM_SLEEP_PM_OPS(stm32_spdifrx_suspend, stm32_spdifrx_resume)
 };
 
 static struct platform_driver stm32_spdifrx_driver = {
 	.driver = {
 		.name = "st,stm32-spdifrx",
 		.of_match_table = stm32_spdifrx_ids,
-		.pm = &stm32_spdifrx_pm_ops,
+		.pm = pm_ptr(&stm32_spdifrx_pm_ops),
 	},
 	.probe = stm32_spdifrx_probe,
 	.remove = stm32_spdifrx_remove,
-- 
2.43.0

