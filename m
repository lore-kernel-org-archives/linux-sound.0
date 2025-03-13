Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF3E15747C
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887735; cv=none; b=mKNTQo/ly9vNScvY7IqaiGLhAIovTzR6pHb75JE/jr/NygXAkL+INHAUghebzs32/+aqub+HJeHqYGT1q1kGez/ooyC1rqXGZXTq1oXfuNsiAtHVIVrYWYHNE5Q28voSGQu8ipUy6JkYVqJQbwajmnWfnhZEM4boTeU9fOw+yY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887735; c=relaxed/simple;
	bh=VfSuFyJ6K7gi77pSwt0hTVT7eSUI6+OEvYW03/nf1zQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQAFGmmWnl35q4iJ75FfmnG7q7SPnNiqefkcFA/VAlG4b/5HoN8gp0UHoRpEf4VkVPzrnEn7b6vyTh9fSeWp73LvQQlyx+0QLS920XeP96tydpt6WPYTwXGh7OxnsmM2TTBgZZSE5CU0pcSJ9QvI1O2enXgQz7Woez76hVa95RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gf1DF+qj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hS2vlFrS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gf1DF+qj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hS2vlFrS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gf1DF+qj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hS2vlFrS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gf1DF+qj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hS2vlFrS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0ACFB1F797;
	Thu, 13 Mar 2025 17:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPnmMVyIWuOVFp3p9tE4+yORq6cKJozlvS/5RwwYHLA=;
	b=Gf1DF+qjIYzKowCZkNXeMsfugll88lu5PLKIAC9qi3c6p9ZlMqWKXDBWjifVatYk6qEVA9
	4U5G4ommCaH2yGHDnYS/Q7eVVzs1BxUAjHXkyi4TGCUd0IvemgAqkm3FzOafoFDekRPrEG
	js3TV+/zaHkK1W6txboWM+nMsTJRUaE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPnmMVyIWuOVFp3p9tE4+yORq6cKJozlvS/5RwwYHLA=;
	b=hS2vlFrSJ7K+VKuJVw+RSzszHD0+7y6LJ9hWzOXSIePaQlvIxbvIEKvuFM+vabXS1VYawp
	WJTd5wuEgM9X3XBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Gf1DF+qj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hS2vlFrS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPnmMVyIWuOVFp3p9tE4+yORq6cKJozlvS/5RwwYHLA=;
	b=Gf1DF+qjIYzKowCZkNXeMsfugll88lu5PLKIAC9qi3c6p9ZlMqWKXDBWjifVatYk6qEVA9
	4U5G4ommCaH2yGHDnYS/Q7eVVzs1BxUAjHXkyi4TGCUd0IvemgAqkm3FzOafoFDekRPrEG
	js3TV+/zaHkK1W6txboWM+nMsTJRUaE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPnmMVyIWuOVFp3p9tE4+yORq6cKJozlvS/5RwwYHLA=;
	b=hS2vlFrSJ7K+VKuJVw+RSzszHD0+7y6LJ9hWzOXSIePaQlvIxbvIEKvuFM+vabXS1VYawp
	WJTd5wuEgM9X3XBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB889139D2;
	Thu, 13 Mar 2025 17:41:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +JAuNOEY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 03/89] ASoC: ak4458: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:40:08 +0100
Message-ID: <20250313174139.29942-4-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 0ACFB1F797
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIE_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros instead
of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together with
pm_ptr(), which allows us dropping ugly __maybe_unused attributes and
CONFIG_PM ifdefs.

This optimizes slightly	when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/ak4458.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index d472d9952628..5f3a68dfe7bd 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -639,8 +639,7 @@ static void ak4458_reset(struct ak4458_priv *ak4458, bool active)
 	}
 }
 
-#ifdef CONFIG_PM
-static int __maybe_unused ak4458_runtime_suspend(struct device *dev)
+static int ak4458_runtime_suspend(struct device *dev)
 {
 	struct ak4458_priv *ak4458 = dev_get_drvdata(dev);
 
@@ -656,7 +655,7 @@ static int __maybe_unused ak4458_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ak4458_runtime_resume(struct device *dev)
+static int ak4458_runtime_resume(struct device *dev)
 {
 	struct ak4458_priv *ak4458 = dev_get_drvdata(dev);
 	int ret;
@@ -678,7 +677,6 @@ static int __maybe_unused ak4458_runtime_resume(struct device *dev)
 
 	return regcache_sync(ak4458->regmap);
 }
-#endif /* CONFIG_PM */
 
 static const struct snd_soc_component_driver soc_codec_dev_ak4458 = {
 	.controls		= ak4458_snd_controls,
@@ -727,9 +725,8 @@ static const struct ak4458_drvdata ak4497_drvdata = {
 };
 
 static const struct dev_pm_ops ak4458_pm = {
-	SET_RUNTIME_PM_OPS(ak4458_runtime_suspend, ak4458_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(ak4458_runtime_suspend, ak4458_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static int ak4458_i2c_probe(struct i2c_client *i2c)
@@ -805,7 +802,7 @@ MODULE_DEVICE_TABLE(of, ak4458_of_match);
 static struct i2c_driver ak4458_i2c_driver = {
 	.driver = {
 		.name = "ak4458",
-		.pm = &ak4458_pm,
+		.pm = pm_ptr(&ak4458_pm),
 		.of_match_table = ak4458_of_match,
 		},
 	.probe = ak4458_i2c_probe,
-- 
2.43.0

