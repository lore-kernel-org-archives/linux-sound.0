Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B98C22A81E
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205449; cv=none; b=nsSqvhhAkO6hHsP5o0o+o7oMPE9JTK4cq5tjsMiZS/IElhQz0+Rr2PfTkph7nJ/sW6ebSfIUtcFYvRT3UOuql1vSGDVAfAfN2NDazvauFfgpZbDdfifZgnGwV3sjK9WpVrpFOt1WsnxNPpXTPLpmiia2Efm8ABzeL7MtgEYUuhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205449; c=relaxed/simple;
	bh=5GIyWBgsapr8k3kYGmrDvRhAFmhWw6SsPCrlNPduTD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AHL6SkBO4i0jFpUuxcOIAXBKmHVO34ZCOacL934bp/MpkqHmLhg4FL3HkzxaD7E6/1FCWQaTwMM0SeS+qCISQTm57nTYq2zYZGK13FjH369+bEaj3IAbWYeoeL4JJN2Xv3RdttQwnj9NTlyk02X4FZsmLFPmBhMxO1yEJ8YP9TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YqANzr0T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7lgFUyY8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YqANzr0T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7lgFUyY8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YqANzr0T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7lgFUyY8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YqANzr0T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7lgFUyY8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 06C5521E6B;
	Mon, 17 Mar 2025 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cN8pV9nJbWJdrs9rCmsO+Ry5i71SMg3/Wv5wMqTF4Ao=;
	b=YqANzr0Ttm0uovCVvS2fuzEEHi5VNwjfB3iqasRjksC/wqBaSOUxyycpMUCWrXs2JiwKfK
	jmGexmBeoghFbWrgfGseEAbxZDs/476UTQ2xVtda+qO2KPYhFonfo6/A0tJzDOzWzQFv1t
	mlD/cRAtlRx74+XGnTdHGVcmoAeCtd0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205378;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cN8pV9nJbWJdrs9rCmsO+Ry5i71SMg3/Wv5wMqTF4Ao=;
	b=7lgFUyY8F2J+XdFCRI/ctZpxInsCcXHiB8CH6105DD6nyIHkgVdBXOOm6822NicYYUsubT
	FNA2irLVEbRKhmAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cN8pV9nJbWJdrs9rCmsO+Ry5i71SMg3/Wv5wMqTF4Ao=;
	b=YqANzr0Ttm0uovCVvS2fuzEEHi5VNwjfB3iqasRjksC/wqBaSOUxyycpMUCWrXs2JiwKfK
	jmGexmBeoghFbWrgfGseEAbxZDs/476UTQ2xVtda+qO2KPYhFonfo6/A0tJzDOzWzQFv1t
	mlD/cRAtlRx74+XGnTdHGVcmoAeCtd0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205378;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cN8pV9nJbWJdrs9rCmsO+Ry5i71SMg3/Wv5wMqTF4Ao=;
	b=7lgFUyY8F2J+XdFCRI/ctZpxInsCcXHiB8CH6105DD6nyIHkgVdBXOOm6822NicYYUsubT
	FNA2irLVEbRKhmAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CAF7F132CF;
	Mon, 17 Mar 2025 09:56:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aMEtMMHx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 28/88] ASoC: pcm512x: Convert to EXPORT_GPL_DEV_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:50 +0100
Message-ID: <20250317095603.20073-29-tiwai@suse.de>
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
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer EXPORT_GPL_DEV_PM_OPS() macro together with pm_ptr(),
which allows us to drop superfluous CONFIG_PM ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Shenghao Ding <shenghao-ding@ti.com>
Cc: Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/pcm512x-i2c.c | 2 +-
 sound/soc/codecs/pcm512x-spi.c | 2 +-
 sound/soc/codecs/pcm512x.c     | 7 ++-----
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/pcm512x-i2c.c b/sound/soc/codecs/pcm512x-i2c.c
index 92bcf5179779..a1d849b0c50f 100644
--- a/sound/soc/codecs/pcm512x-i2c.c
+++ b/sound/soc/codecs/pcm512x-i2c.c
@@ -79,7 +79,7 @@ static struct i2c_driver pcm512x_i2c_driver = {
 		.name	= "pcm512x",
 		.of_match_table = of_match_ptr(pcm512x_of_match),
 		.acpi_match_table = ACPI_PTR(pcm512x_acpi_match),
-		.pm     = &pcm512x_pm_ops,
+		.pm     = pm_ptr(&pcm512x_pm_ops),
 	},
 };
 
diff --git a/sound/soc/codecs/pcm512x-spi.c b/sound/soc/codecs/pcm512x-spi.c
index 6629b862f47d..92f7f78a4e20 100644
--- a/sound/soc/codecs/pcm512x-spi.c
+++ b/sound/soc/codecs/pcm512x-spi.c
@@ -58,7 +58,7 @@ static struct spi_driver pcm512x_spi_driver = {
 	.driver = {
 		.name	= "pcm512x",
 		.of_match_table = pcm512x_of_match,
-		.pm     = &pcm512x_pm_ops,
+		.pm     = pm_ptr(&pcm512x_pm_ops),
 	},
 };
 
diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index aa8edf87b743..007dfc0fa224 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -1725,7 +1725,6 @@ void pcm512x_remove(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(pcm512x_remove);
 
-#ifdef CONFIG_PM
 static int pcm512x_suspend(struct device *dev)
 {
 	struct pcm512x_priv *pcm512x = dev_get_drvdata(dev);
@@ -1787,12 +1786,10 @@ static int pcm512x_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-const struct dev_pm_ops pcm512x_pm_ops = {
-	SET_RUNTIME_PM_OPS(pcm512x_suspend, pcm512x_resume, NULL)
+EXPORT_GPL_DEV_PM_OPS(pcm512x_pm_ops) = {
+	RUNTIME_PM_OPS(pcm512x_suspend, pcm512x_resume, NULL)
 };
-EXPORT_SYMBOL_GPL(pcm512x_pm_ops);
 
 MODULE_DESCRIPTION("ASoC PCM512x codec driver");
 MODULE_AUTHOR("Mark Brown <broonie@kernel.org>");
-- 
2.43.0

