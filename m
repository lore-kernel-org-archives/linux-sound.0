Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71DA1E3DE5
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887870; cv=none; b=a2wYaooMAMz6PbR+5NYNYsVhil2rSnEMwnCTucTfWheT5YPFYbMNo0cPXZn8uXCIQQWBcLra6lEP570kmfJ61fBlPP+a/y2apARQZ6oPEG8NUFilcp6Pb41R7LCBmSrkIaGBQMhEzzm9CI+dluxy6GtKX1d7vg1CAcDobbH1chY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887870; c=relaxed/simple;
	bh=Rco2S2QBD/VJqA4HWtVariCutQ6fg0MzStVYGuh6sxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ryzRYqBCKRm4D2wdw5vmWDsoRoBzMnFM2XuXsoKpmjnqHCOatQPD6TAyXwL+EsnKcHaf06CGYbhBpUNNBMRrcXSnDEt+sSmX+jnDsOKViHQqCOoZzcYZl0iD+MQbpplX2T3tdna+8Z/wpHmzG9YIE65rTJlVOp82IOVkNb2xL4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rB2DySJg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=baY+IBnG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rB2DySJg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=baY+IBnG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rB2DySJg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="baY+IBnG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rB2DySJg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="baY+IBnG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D92811F7A5;
	Thu, 13 Mar 2025 17:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hL0nQQUe4ce7x9Xg03AGwmSR2V61+9O6XGg7+eE/4oU=;
	b=rB2DySJgX5dytgVm32CQ+3Dx7HK7+SIOsUEwFimVvWOJghScyU4p4xsNUJ15VLUtc6QZf2
	G8O36rxW9gxSCn6NDJn/W/zUaVPI/PhFSQOfZ5W5TxFnpHyVOjdHh4yqstfwBBT2OW4EEl
	u4PnSeHszqNL1p0P+G5kENUVnu08MM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887721;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hL0nQQUe4ce7x9Xg03AGwmSR2V61+9O6XGg7+eE/4oU=;
	b=baY+IBnGxkD6QLpVAK2AQ1prNX1iMYw4V680Khox5dYP0CY6hDcHM+GDv154wH1FnfxReT
	RTLMnKRZOUw2YnAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hL0nQQUe4ce7x9Xg03AGwmSR2V61+9O6XGg7+eE/4oU=;
	b=rB2DySJgX5dytgVm32CQ+3Dx7HK7+SIOsUEwFimVvWOJghScyU4p4xsNUJ15VLUtc6QZf2
	G8O36rxW9gxSCn6NDJn/W/zUaVPI/PhFSQOfZ5W5TxFnpHyVOjdHh4yqstfwBBT2OW4EEl
	u4PnSeHszqNL1p0P+G5kENUVnu08MM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887721;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hL0nQQUe4ce7x9Xg03AGwmSR2V61+9O6XGg7+eE/4oU=;
	b=baY+IBnGxkD6QLpVAK2AQ1prNX1iMYw4V680Khox5dYP0CY6hDcHM+GDv154wH1FnfxReT
	RTLMnKRZOUw2YnAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B46B313A24;
	Thu, 13 Mar 2025 17:42:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OO3IKukY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 45/89] ASoC: rtq9128: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:50 +0100
Message-ID: <20250313174139.29942-46-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS(),
which allows us dropping ugly __maybe_unsed attributes.

Merely a cleanup, there should be no actual code change.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rtq9128.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rtq9128.c b/sound/soc/codecs/rtq9128.c
index aa3eadecd974..391cc03d687f 100644
--- a/sound/soc/codecs/rtq9128.c
+++ b/sound/soc/codecs/rtq9128.c
@@ -729,7 +729,7 @@ static int rtq9128_probe(struct i2c_client *i2c)
 	return devm_snd_soc_register_component(dev, &rtq9128_comp_driver, &rtq9128_dai, 1);
 }
 
-static int __maybe_unused rtq9128_pm_runtime_suspend(struct device *dev)
+static int rtq9128_pm_runtime_suspend(struct device *dev)
 {
 	struct rtq9128_data *data = dev_get_drvdata(dev);
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
@@ -746,7 +746,7 @@ static int __maybe_unused rtq9128_pm_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rtq9128_pm_runtime_resume(struct device *dev)
+static int rtq9128_pm_runtime_resume(struct device *dev)
 {
 	struct rtq9128_data *data = dev_get_drvdata(dev);
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
@@ -764,8 +764,8 @@ static int __maybe_unused rtq9128_pm_runtime_resume(struct device *dev)
 	return regcache_sync(regmap);
 }
 
-static const struct dev_pm_ops __maybe_unused rtq9128_pm_ops = {
-	SET_RUNTIME_PM_OPS(rtq9128_pm_runtime_suspend, rtq9128_pm_runtime_resume, NULL)
+static const struct dev_pm_ops rtq9128_pm_ops = {
+	RUNTIME_PM_OPS(rtq9128_pm_runtime_suspend, rtq9128_pm_runtime_resume, NULL)
 };
 
 static const struct of_device_id rtq9128_device_table[] = {
-- 
2.43.0

