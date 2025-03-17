Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF8022FF4D
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205593; cv=none; b=AEvAw/wmGScy7qO4A5XE/a6Ycv1yZlI16AGx8GpJDtEKoHjDdrL9Wbqwb4gN/1iheF02knIx6uCmpqRbGZUmTIYjSfdcIj+BTTwGcYcMOpfSc/wNZiWyRQwnmEuU2HwsenlGdBDM8yJwJk2Dt0G6Oh6ABNWHyqdP9mcZS/2IocE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205593; c=relaxed/simple;
	bh=sADiLTkrhb7eXJx+ghNoxpIKl0jHe2UADQMig9vu8Vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LaB0Z2Wdt60UK66UMXtU7Z18w/IuKbdzIyI12Nm0tIaO01a+++sf0oyd2lw2ZZUwGhvojVbXLLJh76hGQm9ekD0neonZfG3sQ+RexkUb5R3+weDJPq0nvyQMA6/fg7BgsnY4zrfi8vl5Q4t8drpg27brBp/41PAzXdhyAuKot48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 913612210C;
	Mon, 17 Mar 2025 09:56:26 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F5E6132CF;
	Mon, 17 Mar 2025 09:56:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SMToGcrx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 75/88] ASoC: rockchip: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:55:37 +0100
Message-ID: <20250317095603.20073-76-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 913612210C
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

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

