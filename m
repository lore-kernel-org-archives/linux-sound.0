Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D908635C
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887936; cv=none; b=DNeQ7O1a4O6vTyHDqtL8Ei/SyLV3LrJDFQymvjN9QwPLvT7Tb156rikAiiJnxkkd16evg4OpivQbsxZtAEhkIMLmbWaqIAicXPi5s9aW1hNqMHSTsxPUeHmFkYPoaNWnivV5ffmSxGoHiropKJYUlBAsAFX7+Xbwz2jGoZMzO60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887936; c=relaxed/simple;
	bh=sADiLTkrhb7eXJx+ghNoxpIKl0jHe2UADQMig9vu8Vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQoHIjpbvqkXTi+U2lIAJHuyW5EuL1e2R9BMBU6d6AkH5G7iqaPIzPOQXqLXRK8pZBUfiSeYmduttGBv4AppCHEQWHcGqwCThdIEkWOnMmeVrugUbhOMauCT1jLZPErDiR6kvFtNwTqjVPoOOPSld9AubY2OZgmOObRQcE4VvSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c7SZBsUg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qe9gDAjG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c7SZBsUg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qe9gDAjG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c7SZBsUg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qe9gDAjG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c7SZBsUg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qe9gDAjG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6FF2A1F7AF;
	Thu, 13 Mar 2025 17:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lQCKIAqZeT5QqrQgVZScnFrqjV29sIPW5wxAnYhnAPE=;
	b=c7SZBsUgVZbflMStqsxvMgrOh0L+p9LHOCBpsN2iK8VM7pX7GYz5V4DKQk7AdmFg4DpZiV
	qC03rSjmftanLB04AMmZXGtTRIg1Ihi0ggGnaiRMBandnHgarqV4f02FucTEPqZaPIRH9V
	Maiq3eHz3N59N4ZF9NR5ODZypf5pmeg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lQCKIAqZeT5QqrQgVZScnFrqjV29sIPW5wxAnYhnAPE=;
	b=qe9gDAjGwEFSDEwJDbTMEp5LWC1PEUNG+7tRwS4K6052BLj2U2cwYjLj3dhN8tX+ewzqyw
	NpCN0RIlB9pM70AA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=c7SZBsUg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qe9gDAjG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lQCKIAqZeT5QqrQgVZScnFrqjV29sIPW5wxAnYhnAPE=;
	b=c7SZBsUgVZbflMStqsxvMgrOh0L+p9LHOCBpsN2iK8VM7pX7GYz5V4DKQk7AdmFg4DpZiV
	qC03rSjmftanLB04AMmZXGtTRIg1Ihi0ggGnaiRMBandnHgarqV4f02FucTEPqZaPIRH9V
	Maiq3eHz3N59N4ZF9NR5ODZypf5pmeg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lQCKIAqZeT5QqrQgVZScnFrqjV29sIPW5wxAnYhnAPE=;
	b=qe9gDAjGwEFSDEwJDbTMEp5LWC1PEUNG+7tRwS4K6052BLj2U2cwYjLj3dhN8tX+ewzqyw
	NpCN0RIlB9pM70AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 42FEE139D2;
	Thu, 13 Mar 2025 17:42:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qCYYD+8Y02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 76/89] ASoC: rockchip: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:41:21 +0100
Message-ID: <20250313174139.29942-77-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 6FF2A1F7AF
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
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLi691ga9brjh6qjnnbs1osk4o)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us to drop ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/rockchip/rockchip_i2s.c     |  5 ++---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 16 +++++++---------
 sound/soc/rockchip/rockchip_pdm.c     | 10 ++++------
 sound/soc/rockchip/rockchip_spdif.c   |  9 ++++-----
 4 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 4315da4a47c1..0a0a95b4f520 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -860,8 +860,7 @@ static void rockchip_i2s_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops rockchip_i2s_pm_ops = {
-	SET_RUNTIME_PM_OPS(i2s_runtime_suspend, i2s_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(i2s_runtime_suspend, i2s_runtime_resume, NULL)
 };
 
 static struct platform_driver rockchip_i2s_driver = {
@@ -870,7 +869,7 @@ static struct platform_driver rockchip_i2s_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = of_match_ptr(rockchip_i2s_match),
-		.pm = &rockchip_i2s_pm_ops,
+		.pm = pm_ptr(&rockchip_i2s_pm_ops),
 	},
 };
 module_platform_driver(rockchip_i2s_driver);
diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 78ab88843f86..d9a1fab7f403 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -122,7 +122,7 @@ static int i2s_tdm_prepare_enable_mclk(struct rk_i2s_tdm_dev *i2s_tdm)
 	return ret;
 }
 
-static int __maybe_unused i2s_tdm_runtime_suspend(struct device *dev)
+static int i2s_tdm_runtime_suspend(struct device *dev)
 {
 	struct rk_i2s_tdm_dev *i2s_tdm = dev_get_drvdata(dev);
 
@@ -134,7 +134,7 @@ static int __maybe_unused i2s_tdm_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused i2s_tdm_runtime_resume(struct device *dev)
+static int i2s_tdm_runtime_resume(struct device *dev)
 {
 	struct rk_i2s_tdm_dev *i2s_tdm = dev_get_drvdata(dev);
 	int ret;
@@ -1390,7 +1390,7 @@ static void rockchip_i2s_tdm_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused rockchip_i2s_tdm_suspend(struct device *dev)
+static int rockchip_i2s_tdm_suspend(struct device *dev)
 {
 	struct rk_i2s_tdm_dev *i2s_tdm = dev_get_drvdata(dev);
 
@@ -1399,7 +1399,7 @@ static int __maybe_unused rockchip_i2s_tdm_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rockchip_i2s_tdm_resume(struct device *dev)
+static int rockchip_i2s_tdm_resume(struct device *dev)
 {
 	struct rk_i2s_tdm_dev *i2s_tdm = dev_get_drvdata(dev);
 	int ret;
@@ -1414,10 +1414,8 @@ static int __maybe_unused rockchip_i2s_tdm_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rockchip_i2s_tdm_pm_ops = {
-	SET_RUNTIME_PM_OPS(i2s_tdm_runtime_suspend, i2s_tdm_runtime_resume,
-			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(rockchip_i2s_tdm_suspend,
-				rockchip_i2s_tdm_resume)
+	RUNTIME_PM_OPS(i2s_tdm_runtime_suspend, i2s_tdm_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rockchip_i2s_tdm_suspend, rockchip_i2s_tdm_resume)
 };
 
 static struct platform_driver rockchip_i2s_tdm_driver = {
@@ -1426,7 +1424,7 @@ static struct platform_driver rockchip_i2s_tdm_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = rockchip_i2s_tdm_match,
-		.pm = &rockchip_i2s_tdm_pm_ops,
+		.pm = pm_ptr(&rockchip_i2s_tdm_pm_ops),
 	},
 };
 module_platform_driver(rockchip_i2s_tdm_driver);
diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index cae91108f7a8..c1ee470ec607 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -668,7 +668,6 @@ static void rockchip_pdm_remove(struct platform_device *pdev)
 	clk_disable_unprepare(pdm->hclk);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int rockchip_pdm_suspend(struct device *dev)
 {
 	struct rk_pdm_dev *pdm = dev_get_drvdata(dev);
@@ -693,12 +692,11 @@ static int rockchip_pdm_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
 static const struct dev_pm_ops rockchip_pdm_pm_ops = {
-	SET_RUNTIME_PM_OPS(rockchip_pdm_runtime_suspend,
-			   rockchip_pdm_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(rockchip_pdm_suspend, rockchip_pdm_resume)
+	RUNTIME_PM_OPS(rockchip_pdm_runtime_suspend,
+		       rockchip_pdm_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rockchip_pdm_suspend, rockchip_pdm_resume)
 };
 
 static struct platform_driver rockchip_pdm_driver = {
@@ -707,7 +705,7 @@ static struct platform_driver rockchip_pdm_driver = {
 	.driver = {
 		.name = "rockchip-pdm",
 		.of_match_table = of_match_ptr(rockchip_pdm_match),
-		.pm = &rockchip_pdm_pm_ops,
+		.pm = pm_ptr(&rockchip_pdm_pm_ops),
 	},
 };
 
diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index d87c0e4f6f91..d365168934dc 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -63,7 +63,7 @@ static const struct of_device_id rk_spdif_match[] __maybe_unused = {
 };
 MODULE_DEVICE_TABLE(of, rk_spdif_match);
 
-static int __maybe_unused rk_spdif_runtime_suspend(struct device *dev)
+static int rk_spdif_runtime_suspend(struct device *dev)
 {
 	struct rk_spdif_dev *spdif = dev_get_drvdata(dev);
 
@@ -74,7 +74,7 @@ static int __maybe_unused rk_spdif_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rk_spdif_runtime_resume(struct device *dev)
+static int rk_spdif_runtime_resume(struct device *dev)
 {
 	struct rk_spdif_dev *spdif = dev_get_drvdata(dev);
 	int ret;
@@ -374,8 +374,7 @@ static void rk_spdif_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops rk_spdif_pm_ops = {
-	SET_RUNTIME_PM_OPS(rk_spdif_runtime_suspend, rk_spdif_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(rk_spdif_runtime_suspend, rk_spdif_runtime_resume, NULL)
 };
 
 static struct platform_driver rk_spdif_driver = {
@@ -384,7 +383,7 @@ static struct platform_driver rk_spdif_driver = {
 	.driver = {
 		.name = "rockchip-spdif",
 		.of_match_table = of_match_ptr(rk_spdif_match),
-		.pm = &rk_spdif_pm_ops,
+		.pm = pm_ptr(&rk_spdif_pm_ops),
 	},
 };
 module_platform_driver(rk_spdif_driver);
-- 
2.43.0

