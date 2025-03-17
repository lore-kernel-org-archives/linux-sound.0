Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7712288EE
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205390; cv=none; b=eZIuBV1md1EQP413kbE4hFkweQ72vZ0Au1GuINc9ubRT7XkCaZPa4tn0RCc569W7KHRdRiBTEgJfpu3HI3LqEuHhLJCYz1xCBO+Ae4W+q3STUVpKr9adhrunI6GlVaSbwTpFJb9zwlDATkEMHKK26yfHwSLrNQdgGecyZMAAtBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205390; c=relaxed/simple;
	bh=+gH/3oBu2eo/B2+euLN1C0F+7m5mpSO3Yd4rf++FlNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PW2bmvFEee4fn7uBBp7L7+v67a92uHutJ5EnhJYS4I428Jm7nM85WZjAnudAMQ0bfALSZvGteXPgbkNFElN06SvBNY6VMv+7z0NjIDNiB1rMOxBdDDoGBmpQZEcAEppFNAse5EgMPYdNr88qFNwsvCr5kwGpj9Rsz3SVidLhBg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 648A11FE22;
	Mon, 17 Mar 2025 09:56:13 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40A3013A2C;
	Mon, 17 Mar 2025 09:56:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uDF2Dr3x12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 03/88] ASoC: ak4458: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:54:25 +0100
Message-ID: <20250317095603.20073-4-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 648A11FE22
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused attributes
and CONFIG_PM ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/ak4458.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index d472d9952628..5f3a68dfe7bd 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -639,8 +639,7 @@ static void ak4458_reset(struct ak4458_priv *ak4458, bool active)
 	}
 }
 
-#ifdef CONFIG_PM
-static int __maybe_unused ak4458_runtime_suspend(struct device *dev)
+static int ak4458_runtime_suspend(struct device *dev)
 {
 	struct ak4458_priv *ak4458 = dev_get_drvdata(dev);
 
@@ -656,7 +655,7 @@ static int __maybe_unused ak4458_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ak4458_runtime_resume(struct device *dev)
+static int ak4458_runtime_resume(struct device *dev)
 {
 	struct ak4458_priv *ak4458 = dev_get_drvdata(dev);
 	int ret;
@@ -678,7 +677,6 @@ static int __maybe_unused ak4458_runtime_resume(struct device *dev)
 
 	return regcache_sync(ak4458->regmap);
 }
-#endif /* CONFIG_PM */
 
 static const struct snd_soc_component_driver soc_codec_dev_ak4458 = {
 	.controls		= ak4458_snd_controls,
@@ -727,9 +725,8 @@ static const struct ak4458_drvdata ak4497_drvdata = {
 };
 
 static const struct dev_pm_ops ak4458_pm = {
-	SET_RUNTIME_PM_OPS(ak4458_runtime_suspend, ak4458_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(ak4458_runtime_suspend, ak4458_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static int ak4458_i2c_probe(struct i2c_client *i2c)
@@ -805,7 +802,7 @@ MODULE_DEVICE_TABLE(of, ak4458_of_match);
 static struct i2c_driver ak4458_i2c_driver = {
 	.driver = {
 		.name = "ak4458",
-		.pm = &ak4458_pm,
+		.pm = pm_ptr(&ak4458_pm),
 		.of_match_table = ak4458_of_match,
 		},
 	.probe = ak4458_i2c_probe,
-- 
2.43.0

