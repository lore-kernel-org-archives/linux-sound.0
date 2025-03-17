Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2327422CBC9
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205521; cv=none; b=WQV4S5DqJp0ISd3DKtbtIwj8C3pEf2yxXfotLySr9p0XcQPSCus2AQSEmqibezIDA989Xu2UU9acQBGSYi1oFhI2nrMKhstJulI8hDyAIL5S7xYxTxRrDCWvhcLnqvnKq9Z8oz9TeDqywHR0NIMZGTUnLaMkV41XgDAo1SpHykg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205521; c=relaxed/simple;
	bh=a6xsm2g1eg1p/mNPtDazD0ryzHPldAVN7zMpdPjLn5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B2EXfpqT2dK6O17pteSH5UYeNeSPRLXotArx/fEMe+3scq9oPI32nwd9d9JI++ykcz4n9rxz87o4y6m0RjU+PaUBGD5p5qM27soWZs8TOTgYTzu3IVfK1ztlFI8KM7smqrQ3zNIeUKlD+9UeQqas6wkrAGuGRM7IJq/gNFq4EG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0WB53bPo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a9xdbxFE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0WB53bPo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a9xdbxFE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0WB53bPo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a9xdbxFE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0WB53bPo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a9xdbxFE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4E5E92204E;
	Mon, 17 Mar 2025 09:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pxInrLYKWcjtLgCWqK4QPOEuvcsTK8IBg5OB9drpWeM=;
	b=0WB53bPokzyN6aoIeAh8KWsqv0X9ftLl/Jk0csZ5B9MwnjiB1OtKcI/3ChrXHB2nkv1/ok
	z8OHx1yeJ4mSASAXIXCsdvfZ7HIdaBAhBkTNGIdXwHJOT6EY+tNC4hPDQ6Gkgoh18Fpq4s
	rqZb5bWxx/Q1ybByvfBQuRFNwSnM760=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pxInrLYKWcjtLgCWqK4QPOEuvcsTK8IBg5OB9drpWeM=;
	b=a9xdbxFEiyRGqaB5w2qY+9XW7dfUL4wI+W0iSswa0gmaGm0OT1aeFhZLZ5o0cuDawoUAud
	ZIrjtPqAMY7AU0AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pxInrLYKWcjtLgCWqK4QPOEuvcsTK8IBg5OB9drpWeM=;
	b=0WB53bPokzyN6aoIeAh8KWsqv0X9ftLl/Jk0csZ5B9MwnjiB1OtKcI/3ChrXHB2nkv1/ok
	z8OHx1yeJ4mSASAXIXCsdvfZ7HIdaBAhBkTNGIdXwHJOT6EY+tNC4hPDQ6Gkgoh18Fpq4s
	rqZb5bWxx/Q1ybByvfBQuRFNwSnM760=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pxInrLYKWcjtLgCWqK4QPOEuvcsTK8IBg5OB9drpWeM=;
	b=a9xdbxFEiyRGqaB5w2qY+9XW7dfUL4wI+W0iSswa0gmaGm0OT1aeFhZLZ5o0cuDawoUAud
	ZIrjtPqAMY7AU0AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 25E1B132CF;
	Mon, 17 Mar 2025 09:56:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2BsECMbx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 52/88] ASoC: wm8804: Convert to EXPORT_GPL_DEV_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:14 +0100
Message-ID: <20250317095603.20073-53-tiwai@suse.de>
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
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer EXPORT_GPL_DEV_PM_OPS() macro together with pm_ptr(),
which allows us to drop superfluous CONFIG_PM ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
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

