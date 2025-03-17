Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67D322F178
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205476; cv=none; b=d+1fDz+KKWyVJ3NdWgSmXjOCeTv5XQ1VBuwcz8TiKK/MEqTqFnVF5leNPUJtSTO8Ktohetgd1PDiZa0buaeQQGPjwPX/FkV7xwdAxMfJ9DRVkuR29bPSEWNAdzN1kJ0ZY8cYs39vbM+UqI8qelPCn8WTQQz8l0LdOCPWMtoVNUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205476; c=relaxed/simple;
	bh=sEO+7a7DAsS+yA4j4gaoFTfCFQQ5UitbJZEKQYUQDgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z6nTA/21LOpT7jwCflVS3qMIdLBra1phiL0YIrxv5VvAN9WDo97bK+ntZ/kvfy7YdB+i4V/4Kd/oO5RWlln2c1UyFIEft16wCHZaAZebbP+4tl4EWRZ32bf6HbPiayD4wJK6lWCmMn8liSr9umqO8Yi/Q6rL4QFJA7a8/uKNAmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=huDEpSZd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mTa/8Fod; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=huDEpSZd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mTa/8Fod; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="huDEpSZd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mTa/8Fod";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="huDEpSZd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mTa/8Fod"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A8A182022B;
	Mon, 17 Mar 2025 09:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUWEiDpUJwm5Kuz8oj15DMbP4y4js/IRWB5npvPf0Zo=;
	b=huDEpSZdTSJIvWEIsTCfvjlejSDIAiHXT1dWE22YO7LIzVFStJBi5BqdEsFdcdInV63FPw
	K8ImtG8fS9OoJ+3QgRQJDqSdriBktVIcZ7dlEDoCsfvDdG8I92UtKr5+NL7uBpxUsNT0xW
	Y70Mmh4mA9u7LqmCeSfUUFLngF3t59Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205377;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUWEiDpUJwm5Kuz8oj15DMbP4y4js/IRWB5npvPf0Zo=;
	b=mTa/8Fod5WnkQwVtm9307pNm/61Mwj4KXZOvXCWkRmYWWESx6Wqqi1S21OzAI2zQe25qaR
	5SyOD7KUn4kwkyAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUWEiDpUJwm5Kuz8oj15DMbP4y4js/IRWB5npvPf0Zo=;
	b=huDEpSZdTSJIvWEIsTCfvjlejSDIAiHXT1dWE22YO7LIzVFStJBi5BqdEsFdcdInV63FPw
	K8ImtG8fS9OoJ+3QgRQJDqSdriBktVIcZ7dlEDoCsfvDdG8I92UtKr5+NL7uBpxUsNT0xW
	Y70Mmh4mA9u7LqmCeSfUUFLngF3t59Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205377;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUWEiDpUJwm5Kuz8oj15DMbP4y4js/IRWB5npvPf0Zo=;
	b=mTa/8Fod5WnkQwVtm9307pNm/61Mwj4KXZOvXCWkRmYWWESx6Wqqi1S21OzAI2zQe25qaR
	5SyOD7KUn4kwkyAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7E19E132CF;
	Mon, 17 Mar 2025 09:56:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wD17HcHx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 26/88] ASoC: max98927: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:48 +0100
Message-ID: <20250317095603.20073-27-tiwai@suse.de>
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
	RCPT_COUNT_THREE(0.00)[3];
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

