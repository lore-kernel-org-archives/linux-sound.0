Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894AB1B3F3D
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887803; cv=none; b=o9K/9nHtRGNNA6iN4yY6Em0K+67BuWC4natQp5xjR+qr33Y2y0xxzI7padMuHhpmVfo8mEfsmruwXJFzh0Yy7TUnwHJCLRR4O7MOtPpdTA90J6CsqbccDcsHoCZ7qeS1RVvGWEeeWvVOzTFNJZ4idmFWezrl0NY35u2XrVW8i2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887803; c=relaxed/simple;
	bh=RE0/Z0kxqGWEbuWg9s+6WtoGV/CtrquKriTqc4IIbC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HmwOEyZnNbjJryPXldSqPTLLbz+g1MhvGzSNMQVuTcz77vAifpLrIBmc0W+CDW+HmMBgw88/9P+3Rl/P9TIsvGI6FUsVI70PGil3UrwD7VfMBqYGrHeWW/Bnvhdt5Lu1yB626tHJCwhNK2lprwh31VVW2fH54wQPjBvCwZlXcgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W0qK0lPc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kpebkBdD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W0qK0lPc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kpebkBdD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W0qK0lPc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kpebkBdD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W0qK0lPc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kpebkBdD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C99411F796;
	Thu, 13 Mar 2025 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eEEc6eY8Dw7HlngDDgvADPGCT2Ksurw9wwVJlN8VaQ=;
	b=W0qK0lPcH0u3z0bpteH50Bp6/QxZD4D7I3r+Bcrw9IVHoHCm9fGHraEKvyGUvrl7x9lRgm
	YTYAqWAWGq6RpB1oT8VxNzOWh1POgMxBF7lUOfMG0pr83B3CDVthjQPht8NGVDbyKey8it
	rnDa8IChedKXfwX8exL7kw27h5v+HJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eEEc6eY8Dw7HlngDDgvADPGCT2Ksurw9wwVJlN8VaQ=;
	b=kpebkBdDbaYpJmet3kr98N4Up6+rACI7qtPAshXuJFJq5oAM0hkOY73c9NR9NcvlNKjcxf
	rLej2WBOnE69oLAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eEEc6eY8Dw7HlngDDgvADPGCT2Ksurw9wwVJlN8VaQ=;
	b=W0qK0lPcH0u3z0bpteH50Bp6/QxZD4D7I3r+Bcrw9IVHoHCm9fGHraEKvyGUvrl7x9lRgm
	YTYAqWAWGq6RpB1oT8VxNzOWh1POgMxBF7lUOfMG0pr83B3CDVthjQPht8NGVDbyKey8it
	rnDa8IChedKXfwX8exL7kw27h5v+HJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9eEEc6eY8Dw7HlngDDgvADPGCT2Ksurw9wwVJlN8VaQ=;
	b=kpebkBdDbaYpJmet3kr98N4Up6+rACI7qtPAshXuJFJq5oAM0hkOY73c9NR9NcvlNKjcxf
	rLej2WBOnE69oLAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98034137BA;
	Thu, 13 Mar 2025 17:41:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6A3NI+YY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 29/89] ASoC: pcm512x: Convert to EXPORT_GPL_DEV_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:34 +0100
Message-ID: <20250313174139.29942-30-tiwai@suse.de>
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
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer EXPORT_GPL_DEV_PM_OPS() macro together with pm_ptr().
This allows us to drop superfluous CONFIG_PM ifdefs.

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

