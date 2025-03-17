Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB73C22A4DB
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205424; cv=none; b=StssZ6iLSKzJEFnjO7JtvNaEH01M//ZpvgAUL/Zp16fQ6IXJFYvDYKAoMOGQsIbBlTPlLgOXCn9fYD0FXOjPzNnCFgr9vCP2kxTc86HIEGlvcKSz1ggl8V9NMxLpgcX7C8dbB9Hp2moFAfDaJOxJ+vGI4v0Rk0a9f84eom6eoLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205424; c=relaxed/simple;
	bh=Xk33Ycum69RYGOtN0RSUpxiHYmjW8f/R+mE4Eper96Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DA8fekXEA/zH4q5T+AInw29ixKBBeh4PDwejhsYGQudmEk0CzB7s/oAdaENTVwz/hEWDgwtiWGFx58ktN6tdENruAbwF8L0ut04Z8vTclNBY59oZoMp+felFnOHkkgUdKSEMu+Cpxp9rT2iHkrb/eO1y4X18WRoyAwhc1QwRDzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CE93E200DD;
	Mon, 17 Mar 2025 09:56:14 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F06B13A2C;
	Mon, 17 Mar 2025 09:56:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +A2JJb7x12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 10/88] ASoC: cs42l51: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:32 +0100
Message-ID: <20250317095603.20073-11-tiwai@suse.de>
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
X-Rspamd-Queue-Id: CE93E200DD
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
SET_SYSTEM_SLEEP_PM_OPS().

Also, drop superfluous __maybe_unused attributes to cs42l51_suspend()
and _resume() functions.

Merely a cleanup, there should be no actual code change.

Cc: patches@opensource.cirrus.com
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs42l51-i2c.c | 2 +-
 sound/soc/codecs/cs42l51.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l51-i2c.c b/sound/soc/codecs/cs42l51-i2c.c
index f171bd66fcac..ba7e237619f2 100644
--- a/sound/soc/codecs/cs42l51-i2c.c
+++ b/sound/soc/codecs/cs42l51-i2c.c
@@ -40,7 +40,7 @@ static void cs42l51_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct dev_pm_ops cs42l51_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(cs42l51_suspend, cs42l51_resume)
+	SYSTEM_SLEEP_PM_OPS(cs42l51_suspend, cs42l51_resume)
 };
 
 static struct i2c_driver cs42l51_i2c_driver = {
diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index 0602d03095d6..8083a339dc7b 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -805,7 +805,7 @@ void cs42l51_remove(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(cs42l51_remove);
 
-int __maybe_unused cs42l51_suspend(struct device *dev)
+int cs42l51_suspend(struct device *dev)
 {
 	struct cs42l51_private *cs42l51 = dev_get_drvdata(dev);
 
@@ -816,7 +816,7 @@ int __maybe_unused cs42l51_suspend(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(cs42l51_suspend);
 
-int __maybe_unused cs42l51_resume(struct device *dev)
+int cs42l51_resume(struct device *dev)
 {
 	struct cs42l51_private *cs42l51 = dev_get_drvdata(dev);
 
-- 
2.43.0

