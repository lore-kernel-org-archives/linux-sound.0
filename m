Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E8022A7F6
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205443; cv=none; b=P22+pvyifz5xP+NOFPL5ahVTqjlmQGkUsrS4XRkd7r0rRTTLWg6lgo+KF+tjoED6qQU9Qlcqj38cMNTssAICI4MOboOywqUa/iqhSiLpmUrexwxIXW8UdMD+sal+X8qxg+UHnJ3VXrehbHjMMOjc+znhpJ4BtXKT/cPuB2g5Jkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205443; c=relaxed/simple;
	bh=qK6wU1DxCbzVJNJfQS1yaD9J0LuKLt2h8LpCUKopc+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VM6oGomZSBkvsTLv0q1ux7C0oAZevYckPdVE2NLJnrEDoAqWdav9tTqikxRSu0Q4RiAke4QPrhdUucuXWKwd8Ze4AvthfZEC90F9mGqvivcoSdNAm/2H4CUhDFkYwwOX+u/QLrvaAPU4+9zB3Ln4RUNYkv3LLrx+h2uR7rL8MFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C46A221E69;
	Mon, 17 Mar 2025 09:56:17 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A473613A2C;
	Mon, 17 Mar 2025 09:56:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SGfoJsHx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 27/88] ASoC: mt6660: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:49 +0100
Message-ID: <20250317095603.20073-28-tiwai@suse.de>
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
X-Rspamd-Queue-Id: C46A221E69
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/mt6660.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/mt6660.c b/sound/soc/codecs/mt6660.c
index 39a57f643d81..d16bccebae52 100644
--- a/sound/soc/codecs/mt6660.c
+++ b/sound/soc/codecs/mt6660.c
@@ -529,7 +529,7 @@ static void mt6660_i2c_remove(struct i2c_client *client)
 	mutex_destroy(&chip->io_lock);
 }
 
-static int __maybe_unused mt6660_i2c_runtime_suspend(struct device *dev)
+static int mt6660_i2c_runtime_suspend(struct device *dev)
 {
 	struct mt6660_chip *chip = dev_get_drvdata(dev);
 
@@ -538,7 +538,7 @@ static int __maybe_unused mt6660_i2c_runtime_suspend(struct device *dev)
 		MT6660_REG_SYSTEM_CTRL, 0x01, 0x01);
 }
 
-static int __maybe_unused mt6660_i2c_runtime_resume(struct device *dev)
+static int mt6660_i2c_runtime_resume(struct device *dev)
 {
 	struct mt6660_chip *chip = dev_get_drvdata(dev);
 
@@ -548,8 +548,7 @@ static int __maybe_unused mt6660_i2c_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops mt6660_dev_pm_ops = {
-	SET_RUNTIME_PM_OPS(mt6660_i2c_runtime_suspend,
-			   mt6660_i2c_runtime_resume, NULL)
+	RUNTIME_PM_OPS(mt6660_i2c_runtime_suspend, mt6660_i2c_runtime_resume, NULL)
 };
 
 static const struct of_device_id __maybe_unused mt6660_of_id[] = {
@@ -568,7 +567,7 @@ static struct i2c_driver mt6660_i2c_driver = {
 	.driver = {
 		.name = "mt6660",
 		.of_match_table = of_match_ptr(mt6660_of_id),
-		.pm = &mt6660_dev_pm_ops,
+		.pm = pm_ptr(&mt6660_dev_pm_ops),
 	},
 	.probe = mt6660_i2c_probe,
 	.remove = mt6660_i2c_remove,
-- 
2.43.0

