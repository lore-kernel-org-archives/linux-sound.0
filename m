Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B530522A4D3
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205404; cv=none; b=KEpkyi1kcbk2suzHpA3d1YB5FJRfximYG9oRsdMYsi+02jTlMtI0E4xHRFlkfVOGl7s1+dhKyI0sQXoHrAbJtphHMNL6w8T8Fry/TaEK8vUl32hdTCOmP9gRqWE6TzxSUPrcXxVBHMW4+xxwOOtB2b/1GaWPAtE/JPMP40lyb5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205404; c=relaxed/simple;
	bh=LzdNFfL7emP6l/V3OXHXKvAaKH/tFyP/j+T5YWGoxO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fs92BqivSr0x9A7qU+4VBgsE09qCvhV/2XdNWHUrVYqFabdlki4T55WLrAX/RChrt3oLuDhWOe2HWXISncpIqj72t0stRv2Foq/bYUGTwMQuuYyGYZDjKym5WLQNnG1vkCtHCAdi+LWzwoK3eKFG8Q5FqUE5gtIo4UNUKvMdwZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C10D320033;
	Mon, 17 Mar 2025 09:56:13 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 91DDE13A2C;
	Mon, 17 Mar 2025 09:56:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iKgqIr3x12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 05/88] ASoC: cs35l32: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:27 +0100
Message-ID: <20250317095603.20073-6-tiwai@suse.de>
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
X-Rspamd-Queue-Id: C10D320033
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

Cc: patches@opensource.cirrus.com
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs35l32.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs35l32.c b/sound/soc/codecs/cs35l32.c
index 6d78fa953c89..0bb4bdb3deec 100644
--- a/sound/soc/codecs/cs35l32.c
+++ b/sound/soc/codecs/cs35l32.c
@@ -504,7 +504,6 @@ static void cs35l32_i2c_remove(struct i2c_client *i2c_client)
 	gpiod_set_value_cansleep(cs35l32->reset_gpio, 0);
 }
 
-#ifdef CONFIG_PM
 static int cs35l32_runtime_suspend(struct device *dev)
 {
 	struct cs35l32_private *cs35l32 = dev_get_drvdata(dev);
@@ -543,11 +542,9 @@ static int cs35l32_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops cs35l32_runtime_pm = {
-	SET_RUNTIME_PM_OPS(cs35l32_runtime_suspend, cs35l32_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(cs35l32_runtime_suspend, cs35l32_runtime_resume, NULL)
 };
 
 static const struct of_device_id cs35l32_of_match[] = {
@@ -567,7 +564,7 @@ MODULE_DEVICE_TABLE(i2c, cs35l32_id);
 static struct i2c_driver cs35l32_i2c_driver = {
 	.driver = {
 		   .name = "cs35l32",
-		   .pm = &cs35l32_runtime_pm,
+		   .pm = pm_ptr(&cs35l32_runtime_pm),
 		   .of_match_table = cs35l32_of_match,
 		   },
 	.id_table = cs35l32_id,
-- 
2.43.0

