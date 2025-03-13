Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32401D63F8
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887875; cv=none; b=DjrovNVnyDov4+LlVPCMJ8Xm4Rms+ITROs6+45641D7fA4B1dsWTCEVYT2LUg0ImjfaNqLnNn27alQi4UPIgsgKbbF3S/G1MrnYcLYD2jHTNjvIpxgsZpl2jIF767HOLLlhXU39ocU4JyjJfGlhx5FWm7z2GUGq45Vh63YFLC3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887875; c=relaxed/simple;
	bh=XQsCDselaO4g/wW4jFxbyVDMz95u84D6GhWBYyIXLuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAtexJFl+wmBtKNQuCinHklpGpDdnbGptTmuQUzqoJ1MBAwzK9OxFNhmtOB2aaqu8nvEgxL3NKjbuBm3Rw3anAKbeBBFTDDDxzz4rL+TLgwNvFmsSw9aHbHYP06xAGyYgR0U+JfiHX44xINPJqXQBvIKkEcr0tH/iDCXEzZI3Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GYljKbIB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+LIMX7/5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GYljKbIB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+LIMX7/5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GYljKbIB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+LIMX7/5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GYljKbIB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+LIMX7/5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 522F7211E8;
	Thu, 13 Mar 2025 17:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b5nRIQHGn5bmY2QyMa5uH+o+XSLwt6TXb/HLsxQm90o=;
	b=GYljKbIBsOQQOIEDKr+IIuQ7GsAvHK8EWYAYuvvdW9dHIVw8elXdst2f3DqN6J4yRXugos
	vkuYeJuMC8gB0Mgll/Ch4aZ9oMn+Mmd80puBUhUOpzOEC1qL38YdpzcXNeWqJOFV6GpdBq
	ey0JBE3FV7Z0tkhtQEhYmjg7uIXbv9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b5nRIQHGn5bmY2QyMa5uH+o+XSLwt6TXb/HLsxQm90o=;
	b=+LIMX7/5b0IwPYtNgkQdjmtAOE8J/6yBbKQAAyEoYRs/cfE92dwyWjnIwIKD8b37Y7yr5Y
	fH9lzhJi3VuyWxBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b5nRIQHGn5bmY2QyMa5uH+o+XSLwt6TXb/HLsxQm90o=;
	b=GYljKbIBsOQQOIEDKr+IIuQ7GsAvHK8EWYAYuvvdW9dHIVw8elXdst2f3DqN6J4yRXugos
	vkuYeJuMC8gB0Mgll/Ch4aZ9oMn+Mmd80puBUhUOpzOEC1qL38YdpzcXNeWqJOFV6GpdBq
	ey0JBE3FV7Z0tkhtQEhYmjg7uIXbv9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b5nRIQHGn5bmY2QyMa5uH+o+XSLwt6TXb/HLsxQm90o=;
	b=+LIMX7/5b0IwPYtNgkQdjmtAOE8J/6yBbKQAAyEoYRs/cfE92dwyWjnIwIKD8b37Y7yr5Y
	fH9lzhJi3VuyWxBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C358139D2;
	Thu, 13 Mar 2025 17:42:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IJl5CesY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 53/89] ASoC: wm8804: Convert to EXPORT_GPL_DEV_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:58 +0100
Message-ID: <20250313174139.29942-54-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer EXPORT_GPL_DEV_PM_OPS() macro together with pm_ptr().
This allows us to drop superfluous CONFIG_PM ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wm8804-i2c.c | 2 +-
 sound/soc/codecs/wm8804-spi.c | 2 +-
 sound/soc/codecs/wm8804.c     | 7 ++-----
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wm8804-i2c.c b/sound/soc/codecs/wm8804-i2c.c
index e80dad87219b..3380d7301b17 100644
--- a/sound/soc/codecs/wm8804-i2c.c
+++ b/sound/soc/codecs/wm8804-i2c.c
@@ -56,7 +56,7 @@ MODULE_DEVICE_TABLE(acpi, wm8804_acpi_match);
 static struct i2c_driver wm8804_i2c_driver = {
 	.driver = {
 		.name = "wm8804",
-		.pm = &wm8804_pm,
+		.pm = pm_ptr(&wm8804_pm),
 		.of_match_table = of_match_ptr(wm8804_of_match),
 		.acpi_match_table = ACPI_PTR(wm8804_acpi_match),
 	},
diff --git a/sound/soc/codecs/wm8804-spi.c b/sound/soc/codecs/wm8804-spi.c
index 628568724c20..cf74abfb1a2c 100644
--- a/sound/soc/codecs/wm8804-spi.c
+++ b/sound/soc/codecs/wm8804-spi.c
@@ -38,7 +38,7 @@ MODULE_DEVICE_TABLE(of, wm8804_of_match);
 static struct spi_driver wm8804_spi_driver = {
 	.driver = {
 		.name = "wm8804",
-		.pm = &wm8804_pm,
+		.pm = pm_ptr(&wm8804_pm),
 		.of_match_table = wm8804_of_match,
 	},
 	.probe = wm8804_spi_probe,
diff --git a/sound/soc/codecs/wm8804.c b/sound/soc/codecs/wm8804.c
index 0a879c29eb04..48700cc25cb0 100644
--- a/sound/soc/codecs/wm8804.c
+++ b/sound/soc/codecs/wm8804.c
@@ -680,7 +680,6 @@ void wm8804_remove(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(wm8804_remove);
 
-#if IS_ENABLED(CONFIG_PM)
 static int wm8804_runtime_resume(struct device *dev)
 {
 	struct wm8804_priv *wm8804 = dev_get_drvdata(dev);
@@ -713,12 +712,10 @@ static int wm8804_runtime_suspend(struct device *dev)
 
 	return 0;
 }
-#endif
 
-const struct dev_pm_ops wm8804_pm = {
-	SET_RUNTIME_PM_OPS(wm8804_runtime_suspend, wm8804_runtime_resume, NULL)
+EXPORT_GPL_DEV_PM_OPS(wm8804_pm) = {
+	RUNTIME_PM_OPS(wm8804_runtime_suspend, wm8804_runtime_resume, NULL)
 };
-EXPORT_SYMBOL_GPL(wm8804_pm);
 
 MODULE_DESCRIPTION("ASoC WM8804 driver");
 MODULE_AUTHOR("Dimitris Papastamos <dp@opensource.wolfsonmicro.com>");
-- 
2.43.0

