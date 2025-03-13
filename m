Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0D21C84B6
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887794; cv=none; b=TMNEGJsZWaNLdGVt/4VjGdp3tEPrSQkj+QeGOzUQKMrhYPS/9aw3qDarKcTY0yIc2eb5PEwQzGzhgmKq+lPgnK8UP+GGSFti9F87mIEhkQukLgbFIyB528hFyHG/bwMWU7ySKOO6g1u5KXMleDDaeVJPx3Li8oChMyM+WdrlAXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887794; c=relaxed/simple;
	bh=tGisyXuo9md3HsdCCpLqp4KSBvPPJn2PeU3tkdQrsGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZPy5wHty00xALgnn5p41w3el3oEqNHrkABDqkPpAaHc7AESUCi7Z6JlXkXDioxYc9EDz4V/3CO8ZKNaGTD4FBAztQnCyeaJPB4ZXGSyzF706DlDxFjA9cHkGtvEua+V0u6oxGZTFZxa2PYeBP61ggwzjyBn+GtTl3QSrARYECfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y6NjjBYo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RcToAFE4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y6NjjBYo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RcToAFE4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y6NjjBYo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RcToAFE4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y6NjjBYo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RcToAFE4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7F9C7211D4;
	Thu, 13 Mar 2025 17:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cEybxrpcEZ7VC+QuADUVQoCczz7ikE0G9aIlCPB78/E=;
	b=y6NjjBYouyrWPI7EM7t/wLZ4r9dQkuf6PdX0KK1IDsWKYHzXZR19IeoZSZi2KTwB1Ft4xS
	CfA6alkKACYzVGc4vv5q+8Y+bVLRsuW4yDmCiAOZHcvbwDF+FWxuPvzMSinFFJ69NHB3WK
	Dkc7y5q/EdsL6v0zs35T1hubvzQ0V9c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cEybxrpcEZ7VC+QuADUVQoCczz7ikE0G9aIlCPB78/E=;
	b=RcToAFE4bCt9ZlUeyLvIm7nNiaGvc1LfPodFwaxNgcSQKoeXzQr68meTSwfZ/BbFjJ0OfV
	r6LmS+dsGcvHI7Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cEybxrpcEZ7VC+QuADUVQoCczz7ikE0G9aIlCPB78/E=;
	b=y6NjjBYouyrWPI7EM7t/wLZ4r9dQkuf6PdX0KK1IDsWKYHzXZR19IeoZSZi2KTwB1Ft4xS
	CfA6alkKACYzVGc4vv5q+8Y+bVLRsuW4yDmCiAOZHcvbwDF+FWxuPvzMSinFFJ69NHB3WK
	Dkc7y5q/EdsL6v0zs35T1hubvzQ0V9c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cEybxrpcEZ7VC+QuADUVQoCczz7ikE0G9aIlCPB78/E=;
	b=RcToAFE4bCt9ZlUeyLvIm7nNiaGvc1LfPodFwaxNgcSQKoeXzQr68meTSwfZ/BbFjJ0OfV
	r6LmS+dsGcvHI7Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A540139D2;
	Thu, 13 Mar 2025 17:41:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SPtrFOUY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 22/89] ASoC: max98373: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:40:27 +0100
Message-ID: <20250313174139.29942-23-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Use the newer RUNTIE_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros instead
of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together with
pm_ptr(), which allows us dropping superfluous CONFIG_PM and
CONFIG_PM_SLEEP ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/max98373-i2c.c |  6 ++----
 sound/soc/codecs/max98373-sdw.c | 10 +++++-----
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/max98373-i2c.c b/sound/soc/codecs/max98373-i2c.c
index 1f7ff3dbcbbe..56c4ba1f3782 100644
--- a/sound/soc/codecs/max98373-i2c.c
+++ b/sound/soc/codecs/max98373-i2c.c
@@ -472,7 +472,6 @@ static struct snd_soc_dai_driver max98373_dai[] = {
 	}
 };
 
-#ifdef CONFIG_PM_SLEEP
 static int max98373_suspend(struct device *dev)
 {
 	struct max98373_priv *max98373 = dev_get_drvdata(dev);
@@ -496,10 +495,9 @@ static int max98373_resume(struct device *dev)
 	regcache_sync(max98373->regmap);
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops max98373_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(max98373_suspend, max98373_resume)
+	SYSTEM_SLEEP_PM_OPS(max98373_suspend, max98373_resume)
 };
 
 static const struct regmap_config max98373_regmap = {
@@ -605,7 +603,7 @@ static struct i2c_driver max98373_i2c_driver = {
 		.name = "max98373",
 		.of_match_table = of_match_ptr(max98373_of_match),
 		.acpi_match_table = ACPI_PTR(max98373_acpi_match),
-		.pm = &max98373_pm,
+		.pm = pm_ptr(&max98373_pm),
 	},
 	.probe = max98373_i2c_probe,
 	.id_table = max98373_i2c_id,
diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index 26860882fd91..6088278e6503 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -246,7 +246,7 @@ static const struct regmap_config max98373_sdw_regmap = {
 };
 
 /* Power management functions and structure */
-static __maybe_unused int max98373_suspend(struct device *dev)
+static int max98373_suspend(struct device *dev)
 {
 	struct max98373_priv *max98373 = dev_get_drvdata(dev);
 	int i;
@@ -262,7 +262,7 @@ static __maybe_unused int max98373_suspend(struct device *dev)
 
 #define MAX98373_PROBE_TIMEOUT 5000
 
-static __maybe_unused int max98373_resume(struct device *dev)
+static int max98373_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct max98373_priv *max98373 = dev_get_drvdata(dev);
@@ -292,8 +292,8 @@ static __maybe_unused int max98373_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops max98373_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(max98373_suspend, max98373_resume)
-	SET_RUNTIME_PM_OPS(max98373_suspend, max98373_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(max98373_suspend, max98373_resume)
+	RUNTIME_PM_OPS(max98373_suspend, max98373_resume, NULL)
 };
 
 static int max98373_read_prop(struct sdw_slave *slave)
@@ -874,7 +874,7 @@ static struct sdw_driver max98373_sdw_driver = {
 		.name = "max98373",
 		.of_match_table = of_match_ptr(max98373_of_match),
 		.acpi_match_table = ACPI_PTR(max98373_acpi_match),
-		.pm = &max98373_pm,
+		.pm = pm_ptr(&max98373_pm),
 	},
 	.probe = max98373_sdw_probe,
 	.remove = max98373_sdw_remove,
-- 
2.43.0

