Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03395155CBD
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887723; cv=none; b=KHl+kf/nLZNVdIsv0WjJAReFstNCNopiP4ZljjHjpC4JZBZodnR8JYpdxYR/cFlhhKlFv3kV4Y3MKwDmApAueuK9HpdFDt+58jDylr0rGq087LDCQZ0rzGX2/2JW3gWIA/Q9I0VPj8hBXA8hP+SMd6FbLl0UFZ0leSJfl6oEesU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887723; c=relaxed/simple;
	bh=oOIXNfFskGk0v/7ATU5NWm3MAJXXGajaLztAGpYrOd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oieq3hVQD7EtgheETAYgvawCqlBtOr1IO69PP8QUFodBEHGP1rzQF3JCJ0pzDFDaXZgGTmkvq8QNDxQgY7O7HWvob7JnfG8O4LNummD8anOqpd7fDaLcCforbYaoEJ4CFQmPc5TjhaL8GW8FvJ9ibuEo8240rCNuk1NHkuTz7Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p+T7sQS6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2S3b5dLm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xEIS/qAC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7Fazghml; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p+T7sQS6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2S3b5dLm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xEIS/qAC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7Fazghml"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E90D42119A;
	Thu, 13 Mar 2025 17:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WyIjlVJPYT9lTl4DRjz7hjeSLxqWKmbntpOQ2T5OBRk=;
	b=p+T7sQS6v0/ozrDcucoNAmwlkNszeLVlBS1fXjH1trYcbb1PZGJuW19vINphrG2OOjZEKv
	QNB/Gts/gGzFyG1NfOQRySVP6zpT45ZSbpji/1pwzRjHPr+IGYLaZQqTpEaEIxZqv9Bvrc
	OVSl6RxuAvAaeoVNhejMifD3PCa0gcA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WyIjlVJPYT9lTl4DRjz7hjeSLxqWKmbntpOQ2T5OBRk=;
	b=2S3b5dLm1UKUT1IQYxTQsx/8Db2srmCC6H0pYfmh/bb4efxVozKlfZL8H6QwM4bWppvZRx
	/CuwS/Xa4S0bYsBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WyIjlVJPYT9lTl4DRjz7hjeSLxqWKmbntpOQ2T5OBRk=;
	b=xEIS/qACs9KG+2wZQz6J4/7zKevzfYDzgL+6fuBlcmBFWpT8UIFeWB1x7gN/SQKZ2pj/cA
	FCuV56z7NtFzUzpoJdcgg3E9N2PnDgWLjRNunog+6cUmkIHP6FH7631hnZiS8H15HDV3Dc
	9PTWQdEudft9SX1YdqDusWX4Ryq6NZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887714;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WyIjlVJPYT9lTl4DRjz7hjeSLxqWKmbntpOQ2T5OBRk=;
	b=7FazghmlG/7FJ43TEI4wKy1RrPkrvRnjz6wks/PNxAFEAR45S90plNGo7D0gy+RNs72pEC
	O3v7GbkDJi6qBWDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C37A4137BA;
	Thu, 13 Mar 2025 17:41:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QPtoLuIY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 08/89] ASoC: cs35l56: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:13 +0100
Message-ID: <20250313174139.29942-9-tiwai@suse.de>
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
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

Use the newer RUNTIE_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

Merely a cleanup, there should be no actual code change.

Cc: patches@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs35l56-sdw.c | 12 ++++++------
 sound/soc/codecs/cs35l56.c     |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 3f91cb3f9ae7..e7bb05775ecd 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -413,7 +413,7 @@ static const struct sdw_slave_ops cs35l56_sdw_ops = {
 #endif
 };
 
-static int __maybe_unused cs35l56_sdw_handle_unattach(struct cs35l56_private *cs35l56)
+static int cs35l56_sdw_handle_unattach(struct cs35l56_private *cs35l56)
 {
 	struct sdw_slave *peripheral = cs35l56->sdw_peripheral;
 
@@ -437,7 +437,7 @@ static int __maybe_unused cs35l56_sdw_handle_unattach(struct cs35l56_private *cs
 	return 0;
 }
 
-static int __maybe_unused cs35l56_sdw_runtime_suspend(struct device *dev)
+static int cs35l56_sdw_runtime_suspend(struct device *dev)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
 
@@ -447,7 +447,7 @@ static int __maybe_unused cs35l56_sdw_runtime_suspend(struct device *dev)
 	return cs35l56_runtime_suspend_common(&cs35l56->base);
 }
 
-static int __maybe_unused cs35l56_sdw_runtime_resume(struct device *dev)
+static int cs35l56_sdw_runtime_resume(struct device *dev)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
 	int ret;
@@ -472,7 +472,7 @@ static int __maybe_unused cs35l56_sdw_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cs35l56_sdw_system_suspend(struct device *dev)
+static int cs35l56_sdw_system_suspend(struct device *dev)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
 
@@ -495,7 +495,7 @@ static int __maybe_unused cs35l56_sdw_system_suspend(struct device *dev)
 	return cs35l56_system_suspend(dev);
 }
 
-static int __maybe_unused cs35l56_sdw_system_resume(struct device *dev)
+static int cs35l56_sdw_system_resume(struct device *dev)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
 
@@ -555,7 +555,7 @@ static int cs35l56_sdw_remove(struct sdw_slave *peripheral)
 }
 
 static const struct dev_pm_ops cs35l56_sdw_pm = {
-	SET_RUNTIME_PM_OPS(cs35l56_sdw_runtime_suspend, cs35l56_sdw_runtime_resume, NULL)
+	RUNTIME_PM_OPS(cs35l56_sdw_runtime_suspend, cs35l56_sdw_runtime_resume, NULL)
 	SYSTEM_SLEEP_PM_OPS(cs35l56_sdw_system_suspend, cs35l56_sdw_system_resume)
 	LATE_SYSTEM_SLEEP_PM_OPS(cs35l56_system_suspend_late, cs35l56_system_resume_early)
 	/* NOIRQ stage not needed, SoundWire doesn't use a hard IRQ */
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 735a1e487c6f..8742bdce7a92 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -939,14 +939,14 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l56 = {
 	.suspend_bias_off = 1, /* see cs35l56_system_resume() */
 };
 
-static int __maybe_unused cs35l56_runtime_suspend_i2c_spi(struct device *dev)
+static int cs35l56_runtime_suspend_i2c_spi(struct device *dev)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
 
 	return cs35l56_runtime_suspend_common(&cs35l56->base);
 }
 
-static int __maybe_unused cs35l56_runtime_resume_i2c_spi(struct device *dev)
+static int cs35l56_runtime_resume_i2c_spi(struct device *dev)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
 
@@ -1457,7 +1457,7 @@ EXPORT_SYMBOL_NS_GPL(cs35l56_remove, "SND_SOC_CS35L56_CORE");
 
 #if IS_ENABLED(CONFIG_SND_SOC_CS35L56_I2C) || IS_ENABLED(CONFIG_SND_SOC_CS35L56_SPI)
 EXPORT_NS_GPL_DEV_PM_OPS(cs35l56_pm_ops_i2c_spi, SND_SOC_CS35L56_CORE) = {
-	SET_RUNTIME_PM_OPS(cs35l56_runtime_suspend_i2c_spi, cs35l56_runtime_resume_i2c_spi, NULL)
+	RUNTIME_PM_OPS(cs35l56_runtime_suspend_i2c_spi, cs35l56_runtime_resume_i2c_spi, NULL)
 	SYSTEM_SLEEP_PM_OPS(cs35l56_system_suspend, cs35l56_system_resume)
 	LATE_SYSTEM_SLEEP_PM_OPS(cs35l56_system_suspend_late, cs35l56_system_resume_early)
 	NOIRQ_SYSTEM_SLEEP_PM_OPS(cs35l56_system_suspend_no_irq, cs35l56_system_resume_no_irq)
-- 
2.43.0

