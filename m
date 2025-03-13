Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173DA18A6A5
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887797; cv=none; b=kRpY7Bid9Pv6ySwzWt1tJtXYL0OsXzYQAUVKYI8RPajshkI4S6sdB7UiWXepYjw4qunwlSQ1IWlpLocAX0Dl0CefO0128jdoheVTtC/tpGnjXjRP8cQiJLfGE3cHTEL6q03Ptizgun7yRA9/GmgPt5aTA6uwXmZM+vzUE6z8fg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887797; c=relaxed/simple;
	bh=qK6wU1DxCbzVJNJfQS1yaD9J0LuKLt2h8LpCUKopc+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=giYmQtJudaDKDGlhnKv91SZksv/q2dhV39z1RI65xL8Bb5YpyJqTTWnqubih6ObczDailYuypQ0Q4ju7GagX1h2TpRxpzrOITjV0lQANU+9nCi/A6wzJuX6BnJuZ8U8loIT9+1TDo8dPTUHg8iDdUsEJZoqAqzQd7V/ahM4nLWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b+Rksxxj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nBodAAAM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b+Rksxxj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nBodAAAM; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b+Rksxxj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nBodAAAM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b+Rksxxj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nBodAAAM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9DD5E1F791;
	Thu, 13 Mar 2025 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AzDN+xeuwJbhSEjP2b4OpxrJyBEIkFduYYw2mxoPT4c=;
	b=b+Rksxxj1U0GjBn0Dij+OEeX9TPPveRN8sW/zodH0KPozt/F3SUlXHgsFm5lLbLIwNY50L
	Fx6bepG6cu6qWDovJXyge1q0XktLFaZk4Hv6IEqTsok1W1n0sHhn7rPxgj3vKx9oOvgK3o
	wHH5j/tGpPG/qrAogt/Npdxjusoa7xA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AzDN+xeuwJbhSEjP2b4OpxrJyBEIkFduYYw2mxoPT4c=;
	b=nBodAAAMHNxBCZ/NKiHkytrUm+9qm7lWh0a+F46HjfI3mbxvw2aYUi5ffmW5B+YqUc7XT2
	KZxxxd/ttL2jicDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=b+Rksxxj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nBodAAAM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AzDN+xeuwJbhSEjP2b4OpxrJyBEIkFduYYw2mxoPT4c=;
	b=b+Rksxxj1U0GjBn0Dij+OEeX9TPPveRN8sW/zodH0KPozt/F3SUlXHgsFm5lLbLIwNY50L
	Fx6bepG6cu6qWDovJXyge1q0XktLFaZk4Hv6IEqTsok1W1n0sHhn7rPxgj3vKx9oOvgK3o
	wHH5j/tGpPG/qrAogt/Npdxjusoa7xA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AzDN+xeuwJbhSEjP2b4OpxrJyBEIkFduYYw2mxoPT4c=;
	b=nBodAAAMHNxBCZ/NKiHkytrUm+9qm7lWh0a+F46HjfI3mbxvw2aYUi5ffmW5B+YqUc7XT2
	KZxxxd/ttL2jicDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 627DF139D2;
	Thu, 13 Mar 2025 17:41:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gDeMFuYY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 28/89] ASoC: mt6660: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:33 +0100
Message-ID: <20250313174139.29942-29-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 9DD5E1F791
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLi691ga9brjh6qjnnbs1osk4o)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

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

