Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DA11C84A8
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887826; cv=none; b=ZnW9rQz42432GBQ3DEZkLHLHYaTg3bpi7uGWNhU+FlMWwmLl/jq6Neotqnlswor2pwAZcTbFLF+HYTVmRtNLwyRzk+kpD1d0eE8mCmTZi+LpxwfoS8/1TGZkkMYTxhyWJiFJ1xVr6fdnoTs1jsb/jzPO/sXBUq0JW+zKMRjw1gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887826; c=relaxed/simple;
	bh=SGiu7wyxmA0vVffRNTaOq7+hyShILm2BlmSJSR6MsSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BCllmEmWPDjYJwqZGyZummLCxIdS74pEjA/sb3hq38huJR9X32Kj00rQv6xgp79fVtO7OPIjKUlVwzYADhr+a6Tv1uaiPViYd5oHU7FZ6fVoqr9A8PLkdX+mjNYxrZSXadLUKgICxIAUeRmhMV6nuygylvDf9LTnwW+BOS4yehA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S+LBIH2m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m/p2xZMj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S+LBIH2m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m/p2xZMj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S+LBIH2m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m/p2xZMj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S+LBIH2m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m/p2xZMj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 36CFC211DF;
	Thu, 13 Mar 2025 17:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UteLMKyQ0Zb+NUxlvWU1Jge50ZQzXLshajVazhZn3/I=;
	b=S+LBIH2mGBrQzY7e08T8W4Ovn2Gji6tk9F/ljkIz8OZ37TD8dl+l3x+Gl3Cy5IIPUDOFqC
	DYPpY2g7KhHCu+TFHdCFslTvu5MgJdn2inrquTKhnrztKBJAFh4xF57DoGJtDR1oCDnkVP
	Yy5bWeyR18+jHB7dZEyYJ/P7F5FsPdQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UteLMKyQ0Zb+NUxlvWU1Jge50ZQzXLshajVazhZn3/I=;
	b=m/p2xZMjAe8JWCqnGij0WyNVT95sYFzkZwZQEG+Y/8Xy04T1o0xrHzxnoA59VY3CR3+Sk5
	dsN8onL8F8G09OBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UteLMKyQ0Zb+NUxlvWU1Jge50ZQzXLshajVazhZn3/I=;
	b=S+LBIH2mGBrQzY7e08T8W4Ovn2Gji6tk9F/ljkIz8OZ37TD8dl+l3x+Gl3Cy5IIPUDOFqC
	DYPpY2g7KhHCu+TFHdCFslTvu5MgJdn2inrquTKhnrztKBJAFh4xF57DoGJtDR1oCDnkVP
	Yy5bWeyR18+jHB7dZEyYJ/P7F5FsPdQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UteLMKyQ0Zb+NUxlvWU1Jge50ZQzXLshajVazhZn3/I=;
	b=m/p2xZMjAe8JWCqnGij0WyNVT95sYFzkZwZQEG+Y/8Xy04T1o0xrHzxnoA59VY3CR3+Sk5
	dsN8onL8F8G09OBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 02FE6139D2;
	Thu, 13 Mar 2025 17:41:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iMANO+cY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 36/89] ASoC: rt5645: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:41 +0100
Message-ID: <20250313174139.29942-37-tiwai@suse.de>
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
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
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
 sound/soc/codecs/rt5645.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 2680bcce4c95..343e3bcef0ca 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -4314,7 +4314,7 @@ static void rt5645_i2c_shutdown(struct i2c_client *i2c)
 		gpiod_set_value(rt5645->gpiod_cbj_sleeve, 0);
 }
 
-static int __maybe_unused rt5645_sys_suspend(struct device *dev)
+static int rt5645_sys_suspend(struct device *dev)
 {
 	struct rt5645_priv *rt5645 = dev_get_drvdata(dev);
 
@@ -4327,7 +4327,7 @@ static int __maybe_unused rt5645_sys_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt5645_sys_resume(struct device *dev)
+static int rt5645_sys_resume(struct device *dev)
 {
 	struct rt5645_priv *rt5645 = dev_get_drvdata(dev);
 
@@ -4342,7 +4342,7 @@ static int __maybe_unused rt5645_sys_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt5645_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt5645_sys_suspend, rt5645_sys_resume)
+	SYSTEM_SLEEP_PM_OPS(rt5645_sys_suspend, rt5645_sys_resume)
 };
 
 static struct i2c_driver rt5645_i2c_driver = {
@@ -4350,7 +4350,7 @@ static struct i2c_driver rt5645_i2c_driver = {
 		.name = "rt5645",
 		.of_match_table = of_match_ptr(rt5645_of_match),
 		.acpi_match_table = ACPI_PTR(rt5645_acpi_match),
-		.pm = &rt5645_pm,
+		.pm = pm_ptr(&rt5645_pm),
 	},
 	.probe = rt5645_i2c_probe,
 	.remove = rt5645_i2c_remove,
-- 
2.43.0

