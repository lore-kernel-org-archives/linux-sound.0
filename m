Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B93226D1F
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205394; cv=none; b=c4+bBiH7tbYEhZYswqiZ+4SpFMWp0kf3uvR5Vd0VCnORClwLTG4lD4yCyxMVviOUw66Mvy7uU+Z9S52oEYsqTsW/ZAph+BvF73H0VRD/0el6jTNhx75tlbMZh7prmC0cha+7FRSq2yw5lFY9s+I1SivXafRxOclWndCXNZrxOXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205394; c=relaxed/simple;
	bh=ZkV0oTJQ4/Ui1oOWYDJGNNpgmp0chjlaC8yP0or3BFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rhlp8962h0BFy2Gy9zLPWZZKYeglGr3aiaX2D3Vjh+REazln5iZB81mOpb4VMwcnL7C1sxJEzhQJunpJFCFxcmXEJ/rq9oBbYgdz4w4DNOZklP5zjz2xZO0FO8aqPCQJ74/RMhbVHRyMhivPcMo4y/Bro9z2UCQt8yyrwAi8el8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3C51621D92;
	Mon, 17 Mar 2025 09:56:15 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 10F9B132CF;
	Mon, 17 Mar 2025 09:56:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mNvoAr/x12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 12/88] ASoC: cs42xx8: Convert to EXPORT_GPL_DEV_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:34 +0100
Message-ID: <20250317095603.20073-13-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 3C51621D92
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Use the newer EXPORT_GPL_DEV_PM_OPS() macro together with pm_ptr(),
which allows us to drop superfluous CONFIG_PM ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs42xx8-i2c.c |  2 +-
 sound/soc/codecs/cs42xx8.c     | 10 +++-------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/cs42xx8-i2c.c b/sound/soc/codecs/cs42xx8-i2c.c
index ecaebf8e1c8f..039b3ecb3b9b 100644
--- a/sound/soc/codecs/cs42xx8-i2c.c
+++ b/sound/soc/codecs/cs42xx8-i2c.c
@@ -61,7 +61,7 @@ MODULE_DEVICE_TABLE(i2c, cs42xx8_i2c_id);
 static struct i2c_driver cs42xx8_i2c_driver = {
 	.driver = {
 		.name = "cs42xx8",
-		.pm = &cs42xx8_pm,
+		.pm = pm_ptr(&cs42xx8_pm),
 		.of_match_table = cs42xx8_of_match,
 	},
 	.probe = cs42xx8_i2c_probe,
diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index 8887db653dbf..6a925f3f7137 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -606,7 +606,6 @@ int cs42xx8_probe(struct device *dev, struct regmap *regmap, struct cs42xx8_driv
 }
 EXPORT_SYMBOL_GPL(cs42xx8_probe);
 
-#ifdef CONFIG_PM
 static int cs42xx8_runtime_resume(struct device *dev)
 {
 	struct cs42xx8_priv *cs42xx8 = dev_get_drvdata(dev);
@@ -665,14 +664,11 @@ static int cs42xx8_runtime_suspend(struct device *dev)
 
 	return 0;
 }
-#endif
 
-const struct dev_pm_ops cs42xx8_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(cs42xx8_runtime_suspend, cs42xx8_runtime_resume, NULL)
+EXPORT_GPL_DEV_PM_OPS(cs42xx8_pm) = {
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	RUNTIME_PM_OPS(cs42xx8_runtime_suspend, cs42xx8_runtime_resume, NULL)
 };
-EXPORT_SYMBOL_GPL(cs42xx8_pm);
 
 MODULE_DESCRIPTION("Cirrus Logic CS42448/CS42888 ALSA SoC Codec Driver");
 MODULE_AUTHOR("Freescale Semiconductor, Inc.");
-- 
2.43.0

