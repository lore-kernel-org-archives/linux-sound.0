Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C76D1B3F3D
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887791; cv=none; b=bA4BlUuJrpI0OOPvAwc6RFlLhnaarh98AVwZBD90fpQ/WkUz1+nobOvmcquPBHQ0YPenyt0mZEsk4b8yEVs//34KBD/DMT4pT7TAR4ekJ/0D1H+v91aTPkajUtLeEea4r9adLkZDn12f/LJve7Jr9X/ReDxV9Buyxih7rzE80d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887791; c=relaxed/simple;
	bh=sEO+7a7DAsS+yA4j4gaoFTfCFQQ5UitbJZEKQYUQDgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FI2jiAwFKAB5A7u0UyaTjrGsOKblU4NJJUX5DKlmjpFsFdhPvHLDJcNtF+ZUpRtQWkAynsLKg8B2nIyaJSIfOTR9sgRhEue+UdL16EWVkcHyUWif38JhZprKGtjmPk+wXeujm67/YIA2eGjIhd2t9We1WEhImpfyzJYeuEqtlBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OUzOR66Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eFxe1S4Q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OUzOR66Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eFxe1S4Q; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OUzOR66Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eFxe1S4Q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OUzOR66Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eFxe1S4Q"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 59E061F792;
	Thu, 13 Mar 2025 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUWEiDpUJwm5Kuz8oj15DMbP4y4js/IRWB5npvPf0Zo=;
	b=OUzOR66Qw5Dj1lNjzxmOygsDEsUX8PD9k6rWtalHjIp4QAmZTtqK62LowM0P6AbioP/NAd
	3IYxOzW1sjrh3tgrMb2u7TS2G4lU6s5b5MmCFcZyAgr/yI9KRRE4y/c1j08vWeNbc+YT3p
	Ca6+LAF+HYIpeatgr30AXVk+wM5ZZLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUWEiDpUJwm5Kuz8oj15DMbP4y4js/IRWB5npvPf0Zo=;
	b=eFxe1S4QbLF9SjUVRZgcyQjc2ub8079/rtTqgp7gehlvYvH2wlnLtNH7+bwYa2/aJ0riNt
	UfPToJmjKUJ0gjCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUWEiDpUJwm5Kuz8oj15DMbP4y4js/IRWB5npvPf0Zo=;
	b=OUzOR66Qw5Dj1lNjzxmOygsDEsUX8PD9k6rWtalHjIp4QAmZTtqK62LowM0P6AbioP/NAd
	3IYxOzW1sjrh3tgrMb2u7TS2G4lU6s5b5MmCFcZyAgr/yI9KRRE4y/c1j08vWeNbc+YT3p
	Ca6+LAF+HYIpeatgr30AXVk+wM5ZZLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUWEiDpUJwm5Kuz8oj15DMbP4y4js/IRWB5npvPf0Zo=;
	b=eFxe1S4QbLF9SjUVRZgcyQjc2ub8079/rtTqgp7gehlvYvH2wlnLtNH7+bwYa2/aJ0riNt
	UfPToJmjKUJ0gjCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3AC5D137BA;
	Thu, 13 Mar 2025 17:41:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QMcTDeYY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 27/89] ASoC: max98927: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:32 +0100
Message-ID: <20250313174139.29942-28-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
SET_SYSTEM_SLEEP_PM_OPS() together with pm_ptr(), which allows us
dropping superfluous CONFIG_PM_SLEEP ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/max98927.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index 747aa6f1d54f..55cc18451a2d 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -731,7 +731,6 @@ static int max98927_probe(struct snd_soc_component *component)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int max98927_suspend(struct device *dev)
 {
 	struct max98927_priv *max98927 = dev_get_drvdata(dev);
@@ -750,10 +749,9 @@ static int max98927_resume(struct device *dev)
 	regcache_sync(max98927->regmap);
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops max98927_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(max98927_suspend, max98927_resume)
+	SYSTEM_SLEEP_PM_OPS(max98927_suspend, max98927_resume)
 };
 
 static const struct snd_soc_component_driver soc_component_dev_max98927 = {
@@ -902,7 +900,7 @@ static struct i2c_driver max98927_i2c_driver = {
 		.name = "max98927",
 		.of_match_table = of_match_ptr(max98927_of_match),
 		.acpi_match_table = ACPI_PTR(max98927_acpi_match),
-		.pm = &max98927_pm,
+		.pm = pm_ptr(&max98927_pm),
 	},
 	.probe = max98927_i2c_probe,
 	.remove = max98927_i2c_remove,
-- 
2.43.0

