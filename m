Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4197721ABDF
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205515; cv=none; b=UpdhJTAHk1C0ysrVoYmKi8ayFXiSL3UeGYyCUbtTXOH6xUOeHHr+MBPDXNUTxMVIpenZJJsP8uhKUTd+3d//PAY3NVhzGyJPakCMLOmBoFOGV0aS/CboW28Lc7Z/hBei8fsasDYa89IcJ81+DBVq2+r/FtATTSk19JZ9Rx+wD6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205515; c=relaxed/simple;
	bh=Kiz1iCgNZfM22mISHURRI9H0YLPEQ/9Zf5GeB1ZEV6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3+/+SS16tOzEoZdJcctueJFFKpqRe9BiiNYiNxpidhYC9rVB/tfnsqffEx7me6sGEL/nFlOJS2XtQsrxiqdkeP+UHCYyFXnAN8xgm2J7A8LfJyutVeWp1Lsq01Kab8vKdGohQtE49sZeEhuagpcEVNlHe6HKlmkiKXhpv3Ssvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1D66D22042;
	Mon, 17 Mar 2025 09:56:22 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E75BB132CF;
	Mon, 17 Mar 2025 09:56:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mIBLN8Xx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 51/88] ASoC: wm5100: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:13 +0100
Message-ID: <20250317095603.20073-52-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 1D66D22042
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping superfluous CONFIG_PM
ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wm5100.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index dfeec55159a6..d9e5762324df 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -2625,7 +2625,6 @@ static void wm5100_i2c_remove(struct i2c_client *i2c)
 	gpiod_set_value_cansleep(wm5100->ldo_ena, 0);
 }
 
-#ifdef CONFIG_PM
 static int wm5100_runtime_suspend(struct device *dev)
 {
 	struct wm5100_priv *wm5100 = dev_get_drvdata(dev);
@@ -2662,11 +2661,9 @@ static int wm5100_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops wm5100_pm = {
-	SET_RUNTIME_PM_OPS(wm5100_runtime_suspend, wm5100_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(wm5100_runtime_suspend, wm5100_runtime_resume, NULL)
 };
 
 static const struct i2c_device_id wm5100_i2c_id[] = {
@@ -2678,7 +2675,7 @@ MODULE_DEVICE_TABLE(i2c, wm5100_i2c_id);
 static struct i2c_driver wm5100_i2c_driver = {
 	.driver = {
 		.name = "wm5100",
-		.pm = &wm5100_pm,
+		.pm = pm_ptr(&wm5100_pm),
 	},
 	.probe =    wm5100_i2c_probe,
 	.remove =   wm5100_i2c_remove,
-- 
2.43.0

