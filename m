Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80FB22D4C8
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205509; cv=none; b=Mp1ozGAg1KNBYCFUHyFItCH8E9D+Rm87533cUM34QaMF7ozEVV7+SHoL5jK/zvJW+9qYDEaygdOj2czWETmkaBnymzfWAPCX+mTZ+jGbmOB6GSeQk8OypOSa07gKWdq2riU7Krth891RdC/oEtybpM9JwDuViOUmCW/hHH6A5IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205509; c=relaxed/simple;
	bh=82q6gTbCc5JH/z2h3OJ3cFtaTJhu8kxz1cUwYR/HnQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XpnNhJF9dSRUR8mHDRC82cE7Cq0XwmQzD/IKcQ9ZXcus5urF8D973iWAf4PKoHoD923eQhDdAm5p1mSiF+QBEbId7QNPNFLB0+wdTnx3aJdCvUJYHylQNG5hF/xvGXZvLjBdJCL6dZ4AHIlJhoX5HtVPL+K2pys/nP2m6epXJNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E135921F9B;
	Mon, 17 Mar 2025 09:56:21 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B84D513A2C;
	Mon, 17 Mar 2025 09:56:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8HvCK8Xx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 50/88] ASoC: wm2200: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:12 +0100
Message-ID: <20250317095603.20073-51-tiwai@suse.de>
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
X-Rspamd-Queue-Id: E135921F9B
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes and superfluous CONFIG_PM ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wm2200.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm2200.c b/sound/soc/codecs/wm2200.c
index 7ed4ac5cce3c..87418c838ca0 100644
--- a/sound/soc/codecs/wm2200.c
+++ b/sound/soc/codecs/wm2200.c
@@ -2429,7 +2429,6 @@ static void wm2200_i2c_remove(struct i2c_client *i2c)
 			       wm2200->core_supplies);
 }
 
-#ifdef CONFIG_PM
 static int wm2200_runtime_suspend(struct device *dev)
 {
 	struct wm2200_priv *wm2200 = dev_get_drvdata(dev);
@@ -2466,11 +2465,9 @@ static int wm2200_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops wm2200_pm = {
-	SET_RUNTIME_PM_OPS(wm2200_runtime_suspend, wm2200_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(wm2200_runtime_suspend, wm2200_runtime_resume, NULL)
 };
 
 static const struct i2c_device_id wm2200_i2c_id[] = {
@@ -2482,7 +2479,7 @@ MODULE_DEVICE_TABLE(i2c, wm2200_i2c_id);
 static struct i2c_driver wm2200_i2c_driver = {
 	.driver = {
 		.name = "wm2200",
-		.pm = &wm2200_pm,
+		.pm = pm_ptr(&wm2200_pm),
 	},
 	.probe =    wm2200_i2c_probe,
 	.remove =   wm2200_i2c_remove,
-- 
2.43.0

