Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF56C22A805
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205418; cv=none; b=qJ3iI5ePmq289ufiGt91Q/cfarZSYTguP09rvbACAvh9nDIZ0wuf/LutNt+/ckwBFgt3i7drXo3HJudtnQRJVRohfCgTBb7yDgPXIi9KMhc0uQtz8JeCWftvv0tK34Vgf08kZe7HA6OE+bYgZXrff2COkva1wJdxiwHjtbLUk0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205418; c=relaxed/simple;
	bh=jATJcN3AzpToVxE8qGI8zsNbMYEnth1UyGMadg2yC5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mmZ6fTyQWxvSdLWqYrRTDcEVe8Kh+AwvgTGWQnDR+Q0PB/4qMj9oDmifGnXEU7svaZxQmetHvrQoKXu0ZCQy/FRaNm4lJnqlMXB+zQloqtsoEYPGc+iUACdPthptFmIj6Ilh57P0m9+N6ADRTCeEJ4j7hEHHNOkyeTgMUrUGyGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 86A9F21E2D;
	Mon, 17 Mar 2025 09:56:16 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 61E8013A31;
	Mon, 17 Mar 2025 09:56:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CK+lFsDx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 19/88] ASoC: lpass: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:41 +0100
Message-ID: <20250317095603.20073-20-tiwai@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 86A9F21E2D
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/lpass-rx-macro.c  | 8 ++++----
 sound/soc/codecs/lpass-tx-macro.c  | 8 ++++----
 sound/soc/codecs/lpass-va-macro.c  | 8 ++++----
 sound/soc/codecs/lpass-wsa-macro.c | 8 ++++----
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index febbbe073962..45a6b83808b2 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3963,7 +3963,7 @@ static const struct of_device_id rx_macro_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rx_macro_dt_match);
 
-static int __maybe_unused rx_macro_runtime_suspend(struct device *dev)
+static int rx_macro_runtime_suspend(struct device *dev)
 {
 	struct rx_macro *rx = dev_get_drvdata(dev);
 
@@ -3977,7 +3977,7 @@ static int __maybe_unused rx_macro_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rx_macro_runtime_resume(struct device *dev)
+static int rx_macro_runtime_resume(struct device *dev)
 {
 	struct rx_macro *rx = dev_get_drvdata(dev);
 	int ret;
@@ -4012,7 +4012,7 @@ static int __maybe_unused rx_macro_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rx_macro_pm_ops = {
-	SET_RUNTIME_PM_OPS(rx_macro_runtime_suspend, rx_macro_runtime_resume, NULL)
+	RUNTIME_PM_OPS(rx_macro_runtime_suspend, rx_macro_runtime_resume, NULL)
 };
 
 static struct platform_driver rx_macro_driver = {
@@ -4020,7 +4020,7 @@ static struct platform_driver rx_macro_driver = {
 		.name = "rx_macro",
 		.of_match_table = rx_macro_dt_match,
 		.suppress_bind_attrs = true,
-		.pm = &rx_macro_pm_ops,
+		.pm = pm_ptr(&rx_macro_pm_ops),
 	},
 	.probe = rx_macro_probe,
 	.remove = rx_macro_remove,
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index a134584acf90..27bae58f4072 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2400,7 +2400,7 @@ static void tx_macro_remove(struct platform_device *pdev)
 	lpass_macro_pds_exit(tx->pds);
 }
 
-static int __maybe_unused tx_macro_runtime_suspend(struct device *dev)
+static int tx_macro_runtime_suspend(struct device *dev)
 {
 	struct tx_macro *tx = dev_get_drvdata(dev);
 
@@ -2414,7 +2414,7 @@ static int __maybe_unused tx_macro_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tx_macro_runtime_resume(struct device *dev)
+static int tx_macro_runtime_resume(struct device *dev)
 {
 	struct tx_macro *tx = dev_get_drvdata(dev);
 	int ret;
@@ -2450,7 +2450,7 @@ static int __maybe_unused tx_macro_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops tx_macro_pm_ops = {
-	SET_RUNTIME_PM_OPS(tx_macro_runtime_suspend, tx_macro_runtime_resume, NULL)
+	RUNTIME_PM_OPS(tx_macro_runtime_suspend, tx_macro_runtime_resume, NULL)
 };
 
 static const struct tx_macro_data lpass_ver_9 = {
@@ -2531,7 +2531,7 @@ static struct platform_driver tx_macro_driver = {
 		.name = "tx_macro",
 		.of_match_table = tx_macro_dt_match,
 		.suppress_bind_attrs = true,
-		.pm = &tx_macro_pm_ops,
+		.pm = pm_ptr(&tx_macro_pm_ops),
 	},
 	.probe = tx_macro_probe,
 	.remove = tx_macro_remove,
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index c781da476240..74ada6e77526 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1674,7 +1674,7 @@ static void va_macro_remove(struct platform_device *pdev)
 	lpass_macro_pds_exit(va->pds);
 }
 
-static int __maybe_unused va_macro_runtime_suspend(struct device *dev)
+static int va_macro_runtime_suspend(struct device *dev)
 {
 	struct va_macro *va = dev_get_drvdata(dev);
 
@@ -1689,7 +1689,7 @@ static int __maybe_unused va_macro_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused va_macro_runtime_resume(struct device *dev)
+static int va_macro_runtime_resume(struct device *dev)
 {
 	struct va_macro *va = dev_get_drvdata(dev);
 	int ret;
@@ -1717,7 +1717,7 @@ static int __maybe_unused va_macro_runtime_resume(struct device *dev)
 
 
 static const struct dev_pm_ops va_macro_pm_ops = {
-	SET_RUNTIME_PM_OPS(va_macro_runtime_suspend, va_macro_runtime_resume, NULL)
+	RUNTIME_PM_OPS(va_macro_runtime_suspend, va_macro_runtime_resume, NULL)
 };
 
 static const struct of_device_id va_macro_dt_match[] = {
@@ -1735,7 +1735,7 @@ static struct platform_driver va_macro_driver = {
 		.name = "va_macro",
 		.of_match_table = va_macro_dt_match,
 		.suppress_bind_attrs = true,
-		.pm = &va_macro_pm_ops,
+		.pm = pm_ptr(&va_macro_pm_ops),
 	},
 	.probe = va_macro_probe,
 	.remove = va_macro_remove,
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index c989d82d1d3c..b261fa373e65 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2900,7 +2900,7 @@ static void wsa_macro_remove(struct platform_device *pdev)
 	clk_disable_unprepare(wsa->fsgen);
 }
 
-static int __maybe_unused wsa_macro_runtime_suspend(struct device *dev)
+static int wsa_macro_runtime_suspend(struct device *dev)
 {
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
 
@@ -2914,7 +2914,7 @@ static int __maybe_unused wsa_macro_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused wsa_macro_runtime_resume(struct device *dev)
+static int wsa_macro_runtime_resume(struct device *dev)
 {
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
 	int ret;
@@ -2950,7 +2950,7 @@ static int __maybe_unused wsa_macro_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops wsa_macro_pm_ops = {
-	SET_RUNTIME_PM_OPS(wsa_macro_runtime_suspend, wsa_macro_runtime_resume, NULL)
+	RUNTIME_PM_OPS(wsa_macro_runtime_suspend, wsa_macro_runtime_resume, NULL)
 };
 
 static const struct of_device_id wsa_macro_dt_match[] = {
@@ -2977,7 +2977,7 @@ static struct platform_driver wsa_macro_driver = {
 	.driver = {
 		.name = "wsa_macro",
 		.of_match_table = wsa_macro_dt_match,
-		.pm = &wsa_macro_pm_ops,
+		.pm = pm_ptr(&wsa_macro_pm_ops),
 	},
 	.probe = wsa_macro_probe,
 	.remove = wsa_macro_remove,
-- 
2.43.0

