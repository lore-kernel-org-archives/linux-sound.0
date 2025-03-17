Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C50522F15C
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205529; cv=none; b=qA5Ofi0pl6EggI2OBbSKjh63j/L9/9/tAtrk7IPRhmLEsZXY18IyU9CMw8v8kzTJeQ/zTEWr0L0W45F4EKVpAwPgj39wkLhJYEt+G7oT1Nf8DTjPKg1RdRuA6CG+dZOLAwbgKIOZuMlPZpUIUet5AO3tXID4v/dihkl2NLKRVoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205529; c=relaxed/simple;
	bh=0HFHK+hM3hI/HJpDWjv+DM/c5ioMHsHDg2XNYGUBoug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T5O+BpPDUPCBAokoC5TMzVlUmmjYnBxQ0XGlOoYYDXT4OR9VgNYgh0u5T9Kmy60LdmFVzvtsDQZP57An2CfymngNQ3ELiiUEzkrrQw23aECu3zPVQBEOYq9XL87L2wp1MgKxCuh6kumV/SVDNzJYZXOTh4byk96hwv+xWQMU9yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=joBnQZGj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3nqwvzJL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=joBnQZGj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3nqwvzJL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="joBnQZGj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3nqwvzJL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="joBnQZGj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3nqwvzJL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B16E820233;
	Mon, 17 Mar 2025 09:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2k6Vt6Q57OliwEE3khZVWGRv7GOozX//jklQTrhxKY=;
	b=joBnQZGjx0+IDPBwaAjJB0DAK4TQCbf/uVLC8mLCkyzSUBkF3Iau6JQ10apdLFjVerhzUD
	/MSm0M5bi006tSymY8or2sylx4WehZiBrGoGAzdi0wOCkWLvp6KFKg3ZJMZICHch78k0Pw
	sX2Q2OkAgUmdV0Q1YJ4PMboGDf7SfS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205380;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2k6Vt6Q57OliwEE3khZVWGRv7GOozX//jklQTrhxKY=;
	b=3nqwvzJLePsa4XFVvKxBAxBx0prwmQio2UxcX+KJpeVMzAFVnuhY50pePPQ7B1/Ff29lko
	+o9R/ld8jnfRTWDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2k6Vt6Q57OliwEE3khZVWGRv7GOozX//jklQTrhxKY=;
	b=joBnQZGjx0+IDPBwaAjJB0DAK4TQCbf/uVLC8mLCkyzSUBkF3Iau6JQ10apdLFjVerhzUD
	/MSm0M5bi006tSymY8or2sylx4WehZiBrGoGAzdi0wOCkWLvp6KFKg3ZJMZICHch78k0Pw
	sX2Q2OkAgUmdV0Q1YJ4PMboGDf7SfS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205380;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2k6Vt6Q57OliwEE3khZVWGRv7GOozX//jklQTrhxKY=;
	b=3nqwvzJLePsa4XFVvKxBAxBx0prwmQio2UxcX+KJpeVMzAFVnuhY50pePPQ7B1/Ff29lko
	+o9R/ld8jnfRTWDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D41313A2C;
	Mon, 17 Mar 2025 09:56:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +NkCIcTx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 43/88] ASoC: rt9120: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:05 +0100
Message-ID: <20250317095603.20073-44-tiwai@suse.de>
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
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt9120.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt9120.c b/sound/soc/codecs/rt9120.c
index 733a7d130a95..97f56af25577 100644
--- a/sound/soc/codecs/rt9120.c
+++ b/sound/soc/codecs/rt9120.c
@@ -590,7 +590,7 @@ static void rt9120_remove(struct i2c_client *i2c)
 	pm_runtime_set_suspended(&i2c->dev);
 }
 
-static int __maybe_unused rt9120_runtime_suspend(struct device *dev)
+static int rt9120_runtime_suspend(struct device *dev)
 {
 	struct rt9120_data *data = dev_get_drvdata(dev);
 
@@ -603,7 +603,7 @@ static int __maybe_unused rt9120_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt9120_runtime_resume(struct device *dev)
+static int rt9120_runtime_resume(struct device *dev)
 {
 	struct rt9120_data *data = dev_get_drvdata(dev);
 
@@ -618,7 +618,7 @@ static int __maybe_unused rt9120_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt9120_pm_ops = {
-	SET_RUNTIME_PM_OPS(rt9120_runtime_suspend, rt9120_runtime_resume, NULL)
+	RUNTIME_PM_OPS(rt9120_runtime_suspend, rt9120_runtime_resume, NULL)
 };
 
 static const struct of_device_id __maybe_unused rt9120_device_table[] = {
@@ -631,7 +631,7 @@ static struct i2c_driver rt9120_driver = {
 	.driver = {
 		.name = "rt9120",
 		.of_match_table = rt9120_device_table,
-		.pm = &rt9120_pm_ops,
+		.pm = pm_ptr(&rt9120_pm_ops),
 	},
 	.probe = rt9120_probe,
 	.remove = rt9120_remove,
-- 
2.43.0

