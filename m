Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C8E1C5D62
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887788; cv=none; b=sa09fLulSW9T4+vPzNnBRGtHeOEsiTJtK0VzQDdU6j0QBOHVOBw1i8QKwFQicz1ehleXSuNezE1DzuEcCxhOYDuBRB4Ie/S38FIAngnywrPJ/rn+O/XsUCANQS1fBNAmExUCgjVHtODQkN2hOA+NaLG9svhlmUp7xZXhh0FgIXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887788; c=relaxed/simple;
	bh=DAlvv/RgUbPEqdTi7SvG7HM9ch+BGU8PzzH+dHwxlt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dabsvkUizBV52JkzN5MKCfWiYoTN/+NEuI/MzMfdkyrmRsdCmB5EAIl3MjQSgWkXNuX92Nafkv/pAxL5SxMReIMxEUZntFJqoA1D10VTkglPpJtaDmbPz7hiuU0BryLczInzwvV4gkerkoIq/Hr0aQIhx3Rz1cTia/TB+qrGpeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cmjh23fa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S4ilbF3j; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cmjh23fa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S4ilbF3j; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cmjh23fa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S4ilbF3j";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cmjh23fa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S4ilbF3j"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2B659211D2;
	Thu, 13 Mar 2025 17:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ypKQqc+0SSYoP+r5PpRCIgpJOmvoOfujusZYA1GVhe0=;
	b=Cmjh23faJChDfsNi7FCzS/ckkTfy1rRVrAV36LbJgOPFk/09wnXEZ2s6FsDCxJKdFCuAND
	Q6ImvXPvVmetI2M0c6Kc8ViGz9pg0YcyD6kvN3wFTl0KG744Uz3uLi/UMofg8lcni872P9
	ITnuvLcWb5nC+f3MtP8RZ7uQZpmS1qs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ypKQqc+0SSYoP+r5PpRCIgpJOmvoOfujusZYA1GVhe0=;
	b=S4ilbF3jC5d2vvkpGv8O4pS2o1+z4GokPKPHuSrjELDnFOB1rlt/CfowRa7RWK+SFbh+mJ
	nvYB/6J184RE+oDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Cmjh23fa;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=S4ilbF3j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ypKQqc+0SSYoP+r5PpRCIgpJOmvoOfujusZYA1GVhe0=;
	b=Cmjh23faJChDfsNi7FCzS/ckkTfy1rRVrAV36LbJgOPFk/09wnXEZ2s6FsDCxJKdFCuAND
	Q6ImvXPvVmetI2M0c6Kc8ViGz9pg0YcyD6kvN3wFTl0KG744Uz3uLi/UMofg8lcni872P9
	ITnuvLcWb5nC+f3MtP8RZ7uQZpmS1qs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ypKQqc+0SSYoP+r5PpRCIgpJOmvoOfujusZYA1GVhe0=;
	b=S4ilbF3jC5d2vvkpGv8O4pS2o1+z4GokPKPHuSrjELDnFOB1rlt/CfowRa7RWK+SFbh+mJ
	nvYB/6J184RE+oDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0369713A24;
	Thu, 13 Mar 2025 17:41:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ON8RO+QY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 20/89] ASoC: lpass: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:25 +0100
Message-ID: <20250313174139.29942-21-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 2B659211D2
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLi691ga9brjh6qjnnbs1osk4o)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the newer RUNTIE_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
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

