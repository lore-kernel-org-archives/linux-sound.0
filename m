Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BEC1C84A8
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887774; cv=none; b=kdOFsTCY5eAbMvMaRyhcvlxqafTI8GypfLCWNBYJkfFU4r030WMKeuQdGybqn0DMImaaz0M9IfARlN2w5eWGXarbULEa/gvoNHQX6phW1lveUgn6aDC7nEdgizkVGV8mtTXTXo75YO56GKWeBHI6Bk2wPGNd2g8Q9hpGIGKmg4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887774; c=relaxed/simple;
	bh=XCQGVWqY83crVvR7+MN5DlbFSjeo8zpd0tusTHqgquo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VLHlSLkwA1FNdmtURznhQ9HMerx+XpwPR0DScvW0NjGzIchzgNXK2Rc1O7252GK33OzuLTrbx9IYc70py/Dls0s12FEkja71f61NB7j8yRQSAH8UIHgqgd5IKGDjGkEwypJx31BvWrmsXAhEOleKUpfVjt3rPyz3Q4FXkgOC3XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=atZutl6X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fC3xqvql; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=atZutl6X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fC3xqvql; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="atZutl6X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fC3xqvql";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="atZutl6X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fC3xqvql"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C9200211CF;
	Thu, 13 Mar 2025 17:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/oMOUaJhH/X82nw91DCsWjhXXB0+M2/idirdQriqrQ=;
	b=atZutl6XeF9HVL/S8unh4iwthUTJ9Q5aNMpwPRuJVpEX6Y61SUmOJJM/T3uAMIchYoiN3Y
	w50fGozK5JNFHGM+1BHFCHfz1/nbVajzwwvmejj8ESvIZMpHDgVF6TkuEoREhWtYdT2hyg
	qf8SCtw2KcTwB3wOD4x1QRNHypgABTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/oMOUaJhH/X82nw91DCsWjhXXB0+M2/idirdQriqrQ=;
	b=fC3xqvqlrVsXBT5Hio1fQp+8wGL9SZ5YZ0n7Tg/JhnqjnoSunCu8A88RQdBJG+CxQXnPu9
	COuxn4Ws1R62qkCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=atZutl6X;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fC3xqvql
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/oMOUaJhH/X82nw91DCsWjhXXB0+M2/idirdQriqrQ=;
	b=atZutl6XeF9HVL/S8unh4iwthUTJ9Q5aNMpwPRuJVpEX6Y61SUmOJJM/T3uAMIchYoiN3Y
	w50fGozK5JNFHGM+1BHFCHfz1/nbVajzwwvmejj8ESvIZMpHDgVF6TkuEoREhWtYdT2hyg
	qf8SCtw2KcTwB3wOD4x1QRNHypgABTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/oMOUaJhH/X82nw91DCsWjhXXB0+M2/idirdQriqrQ=;
	b=fC3xqvqlrVsXBT5Hio1fQp+8wGL9SZ5YZ0n7Tg/JhnqjnoSunCu8A88RQdBJG+CxQXnPu9
	COuxn4Ws1R62qkCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A2BC2137BA;
	Thu, 13 Mar 2025 17:41:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +OxJJuQY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	support.opensource@diasemi.com
Subject: [PATCH 18/89] ASoC: da7213: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:40:23 +0100
Message-ID: <20250313174139.29942-19-tiwai@suse.de>
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
X-Rspamd-Queue-Id: C9200211CF
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
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the newer RUNTIE_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros instead
of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together with
pm_ptr(), which allows us dropping ugly __maybe_unused attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: support.opensource@diasemi.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/da7213.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index eb97ac73ec06..a4496cc26902 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -2224,7 +2224,7 @@ static void da7213_i2c_remove(struct i2c_client *i2c)
 	pm_runtime_disable(&i2c->dev);
 }
 
-static int __maybe_unused da7213_runtime_suspend(struct device *dev)
+static int da7213_runtime_suspend(struct device *dev)
 {
 	struct da7213_priv *da7213 = dev_get_drvdata(dev);
 
@@ -2235,7 +2235,7 @@ static int __maybe_unused da7213_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused da7213_runtime_resume(struct device *dev)
+static int da7213_runtime_resume(struct device *dev)
 {
 	struct da7213_priv *da7213 = dev_get_drvdata(dev);
 	int ret;
@@ -2248,8 +2248,8 @@ static int __maybe_unused da7213_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops da7213_pm = {
-	SET_RUNTIME_PM_OPS(da7213_runtime_suspend, da7213_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	RUNTIME_PM_OPS(da7213_runtime_suspend, da7213_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static const struct i2c_device_id da7213_i2c_id[] = {
@@ -2264,7 +2264,7 @@ static struct i2c_driver da7213_i2c_driver = {
 		.name = "da7213",
 		.of_match_table = of_match_ptr(da7213_of_match),
 		.acpi_match_table = ACPI_PTR(da7213_acpi_match),
-		.pm = &da7213_pm,
+		.pm = pm_ptr(&da7213_pm),
 	},
 	.probe		= da7213_i2c_probe,
 	.remove		= da7213_i2c_remove,
-- 
2.43.0

