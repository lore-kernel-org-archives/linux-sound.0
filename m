Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1788322E002
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205501; cv=none; b=q5vfzlsmnkPDxpivCY+aeBAXhHNrNcO/6mnvlIoJtVn/wTyU7lhWlnR4JUUVxdfQjRQmyF/Mqe/D+tK7OL2cQr7DGi1XVnbHIcfxevXbumhTmgexxGnj0xQJ4OWjZbhrb79q533SdX62c8FH+fRV1rgo+pkrJx62gcU1zqFk2JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205501; c=relaxed/simple;
	bh=IWAXQFNbSbAgYt3g/zQqML1IyIfDQ/JOsuxtf5uNJ/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j6q8Ye8FmzibdiWIYcDkfbWHp6BELzNU8TYeROtCIWvs1quewGINaTTKkW9tlO2gqKl72cQdB/EnZOBQi0+7Nskt22/4FiVbPCyL5h3slJrhnbQJ6U90XqPGf75b8hU00BB09zjM6UB8Hk+8vxSFVpYmM+Hd6plzsOyLxPqVspM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QlqDVwgm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ShKkjRNK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QlqDVwgm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ShKkjRNK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QlqDVwgm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ShKkjRNK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QlqDVwgm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ShKkjRNK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 17A472022E;
	Mon, 17 Mar 2025 09:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lr/xn/UFswW2B2xqi+2ytk231nmCh2Lj9enlFEBPJAc=;
	b=QlqDVwgmNLtJsjKj/mkCaUORzd5VV5X1PCK5rBLrJqK2ZUiv3+WFROfWsDmM+8rOPSuxEo
	wnN7LaNHwBGbnhXoxIsp/tJpBQNgtHq9KbttoAuL7+bch9YYGPm2G8KXZtriBvwjP8N8GK
	SbE6Jn/Cw2SSxeU1y+4qGkTN6jICCP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205379;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lr/xn/UFswW2B2xqi+2ytk231nmCh2Lj9enlFEBPJAc=;
	b=ShKkjRNKMflh+hm3Q9E0F4ZAtO3P9btTlRUNySGLfr6aeYi9657aG1p3kFGBHIpxiEgVZ6
	lHva33ooosdPUQDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lr/xn/UFswW2B2xqi+2ytk231nmCh2Lj9enlFEBPJAc=;
	b=QlqDVwgmNLtJsjKj/mkCaUORzd5VV5X1PCK5rBLrJqK2ZUiv3+WFROfWsDmM+8rOPSuxEo
	wnN7LaNHwBGbnhXoxIsp/tJpBQNgtHq9KbttoAuL7+bch9YYGPm2G8KXZtriBvwjP8N8GK
	SbE6Jn/Cw2SSxeU1y+4qGkTN6jICCP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205379;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lr/xn/UFswW2B2xqi+2ytk231nmCh2Lj9enlFEBPJAc=;
	b=ShKkjRNKMflh+hm3Q9E0F4ZAtO3P9btTlRUNySGLfr6aeYi9657aG1p3kFGBHIpxiEgVZ6
	lHva33ooosdPUQDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7B4613A2C;
	Mon, 17 Mar 2025 09:56:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WHNIN8Lx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 34/88] ASoC: rt5514: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:56 +0100
Message-ID: <20250317095603.20073-35-tiwai@suse.de>
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
X-Spam-Score: -6.80
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
SET_SYSTEM_SLEEP_PM_OPS() together with pm_ptr(), which allows us
dropping ugly __maybe_unused attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt5514-spi.c | 8 ++++----
 sound/soc/codecs/rt5514.c     | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index f475c8cfadae..54d84581ec47 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -458,7 +458,7 @@ static int rt5514_spi_probe(struct spi_device *spi)
 	return 0;
 }
 
-static int __maybe_unused rt5514_suspend(struct device *dev)
+static int rt5514_suspend(struct device *dev)
 {
 	int irq = to_spi_device(dev)->irq;
 
@@ -468,7 +468,7 @@ static int __maybe_unused rt5514_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt5514_resume(struct device *dev)
+static int rt5514_resume(struct device *dev)
 {
 	struct rt5514_dsp *rt5514_dsp = dev_get_drvdata(dev);
 	int irq = to_spi_device(dev)->irq;
@@ -490,7 +490,7 @@ static int __maybe_unused rt5514_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt5514_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt5514_suspend, rt5514_resume)
+	SYSTEM_SLEEP_PM_OPS(rt5514_suspend, rt5514_resume)
 };
 
 static const struct of_device_id rt5514_of_match[] = {
@@ -502,7 +502,7 @@ MODULE_DEVICE_TABLE(of, rt5514_of_match);
 static struct spi_driver rt5514_spi_driver = {
 	.driver = {
 		.name = "rt5514",
-		.pm = &rt5514_pm_ops,
+		.pm = pm_ptr(&rt5514_pm_ops),
 		.of_match_table = of_match_ptr(rt5514_of_match),
 	},
 	.probe = rt5514_spi_probe,
diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index a7f984b5d80f..ab9d81c32be8 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -1231,7 +1231,7 @@ static int rt5514_parse_dp(struct rt5514_priv *rt5514, struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int rt5514_i2c_resume(struct device *dev)
+static int rt5514_i2c_resume(struct device *dev)
 {
 	struct rt5514_priv *rt5514 = dev_get_drvdata(dev);
 	unsigned int val;
@@ -1313,7 +1313,7 @@ static int rt5514_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct dev_pm_ops rt5514_i2_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(NULL, rt5514_i2c_resume)
+	SYSTEM_SLEEP_PM_OPS(NULL, rt5514_i2c_resume)
 };
 
 static struct i2c_driver rt5514_i2c_driver = {
@@ -1321,7 +1321,7 @@ static struct i2c_driver rt5514_i2c_driver = {
 		.name = "rt5514",
 		.acpi_match_table = ACPI_PTR(rt5514_acpi_match),
 		.of_match_table = of_match_ptr(rt5514_of_match),
-		.pm = &rt5514_i2_pm_ops,
+		.pm = pm_ptr(&rt5514_i2_pm_ops),
 	},
 	.probe = rt5514_i2c_probe,
 	.id_table = rt5514_i2c_id,
-- 
2.43.0

