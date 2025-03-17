Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5892922ACD3
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205463; cv=none; b=rdRFoE5+Wn02Zsaqmt4uCoYPh1wt5Ec+UqAd9gFHekn8WXzmYzavzY9idRdm6HSMN9TUtJIfVBPML79AkYSbIJ1/jPkzJyozJTIBidU70C23d3e7SWNuo2YXtan7x1XLw+JbVz74Dz2MgDguC7CqUSUQq7k5vGS0PdStaiWofqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205463; c=relaxed/simple;
	bh=vmtsOu4nULS2wCfXuZvPdmA1OVkzj0/Qi4L3DrHYahM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnRz/CjhKCNG+ox7A4VqIiSFEdwPEgfGCizWmRu+HsgjBlcDVn/mgqIIGsdudR5BZIwFNCCT9OFtggGPLGc9YWazgBM/o2ldMYOu5AaSvKK0HGdSr9cxlBtuYftfPVQ0tuFceK7mu0dUVmYwhHcWfTFK2uG6ynHAQCTZbfxh/mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r9nRkjsr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7jALubIZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r9nRkjsr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7jALubIZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r9nRkjsr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7jALubIZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r9nRkjsr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7jALubIZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D312C20229;
	Mon, 17 Mar 2025 09:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gCXSUzI1G0Pz7D4zp1x83tSSCFGASQWyUncbD9ZzUkY=;
	b=r9nRkjsr0FvWvveqKpsnSSwW/LVZ+CeAltiPgQSFG4DUO8BoyUS/XYaS3RQJQCTz7RcjDg
	44ABBI48P6zgcIlVTj4GSWepMbpmOGlRp0k47QmIjVBmJcfNd8mDX8EvVDIvt9HvdXEElA
	1gTOOEs/YaqeZWauqbDZjRHKfIVGr2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gCXSUzI1G0Pz7D4zp1x83tSSCFGASQWyUncbD9ZzUkY=;
	b=7jALubIZ/4hm9MBeRJO5jLR3rYj0fSizFi1VmOh2dCMwrCa1OkuO8Um0er6zzIH//9DI9D
	PrU2poBN4KbuILBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gCXSUzI1G0Pz7D4zp1x83tSSCFGASQWyUncbD9ZzUkY=;
	b=r9nRkjsr0FvWvveqKpsnSSwW/LVZ+CeAltiPgQSFG4DUO8BoyUS/XYaS3RQJQCTz7RcjDg
	44ABBI48P6zgcIlVTj4GSWepMbpmOGlRp0k47QmIjVBmJcfNd8mDX8EvVDIvt9HvdXEElA
	1gTOOEs/YaqeZWauqbDZjRHKfIVGr2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gCXSUzI1G0Pz7D4zp1x83tSSCFGASQWyUncbD9ZzUkY=;
	b=7jALubIZ/4hm9MBeRJO5jLR3rYj0fSizFi1VmOh2dCMwrCa1OkuO8Um0er6zzIH//9DI9D
	PrU2poBN4KbuILBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B3E7313A2C;
	Mon, 17 Mar 2025 09:56:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GB20KsDx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 21/88] ASoC: max98373: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:54:43 +0100
Message-ID: <20250317095603.20073-22-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping superfluous CONFIG_PM and
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

