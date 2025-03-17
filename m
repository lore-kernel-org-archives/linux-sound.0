Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B228821C167
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 10:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205626; cv=none; b=dZ205dOcBK80saU0dlPYRptVZIkxdLoJF5j+OCUNCNmXCDiPGl5KvwnTPaDAUYJa/wQ4P5KXrm4c67EFEoQ02XKBVMOZvk5V75LuZ1NVE6krHP4IP/mrtIKrAMByOERv/qZbGesAwS9zvn5qUGzgiEGoL9mxe0aqqHFPyneKcgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205626; c=relaxed/simple;
	bh=pZOjmLSBzB7EoLXhHLmw6ya6S8XESJYqFBoQzUdfsxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9ji3nEkXpCBt3I0VbEiQutE8XoLv2p0dSgAi5e6F/bz7nI/MkW9GjudEYYIRLCPZezjJ6LwrIO1hfdrGUK2Z7EkyUqTxiJyzywAhwbLHLSHjKsIYuwiFNf2EXulQy2HEqdAn4csBnM23aE0l+PLEiE12xQE+sROWU6ZtvjzD2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 902D020243;
	Mon, 17 Mar 2025 09:56:27 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6359F13A2C;
	Mon, 17 Mar 2025 09:56:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mDT0Fsvx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 80/88] ASoC: stm: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:42 +0100
Message-ID: <20250317095603.20073-81-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 902D020243
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

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

