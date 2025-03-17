Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662B522F397
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 10:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205625; cv=none; b=Fp5SzF2Zw0LxtnuKl1FA6ptg6W97GEI8v3fGmBvd11b0PU4+UaDFLM8gtspoqn5c+rM/YfwDdJpSDu/Z5oNYn81UYTJtFXwbvXBq/odz3LCj93GwZZn9TNz7y1eM6KPWrarARYaOKQiKhgVuofyNd1stmLW6d/USf603aqJKf4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205625; c=relaxed/simple;
	bh=RsA9j94p+YVvKdB90cd3Q/61+ZX91AldYwaYz9pEC0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzGGP3oXiAG6b2g0VtvWpjNCTFKSQ42ETbnhgs46obcSxWkxfGE7M6BxOA+S+3OI4hgU/Mk5/vs9F8Q4MPJHjaUH5IeSi4CkJbf7loaEi4rBKXBy+8/3uiErmf9DHabLwF+CUB1mD5DekFWUvvDbz9AO4aXkvRWZ6DdlmPCPnYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E08492213D;
	Mon, 17 Mar 2025 09:56:27 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BB4A913A2C;
	Mon, 17 Mar 2025 09:56:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gHN7LMvx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 82/88] ASoC: tegra186: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:55:44 +0100
Message-ID: <20250317095603.20073-83-tiwai@suse.de>
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
X-Rspamd-Queue-Id: E08492213D
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: linux-tegra@vger.kernel.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/tegra/tegra186_asrc.c | 13 ++++++-------
 sound/soc/tegra/tegra186_dspk.c | 13 ++++++-------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_asrc.c
index d914dba56013..5c67e1f01d9b 100644
--- a/sound/soc/tegra/tegra186_asrc.c
+++ b/sound/soc/tegra/tegra186_asrc.c
@@ -76,7 +76,7 @@ static void tegra186_asrc_lock_stream(struct tegra186_asrc *asrc,
 		     1);
 }
 
-static int __maybe_unused tegra186_asrc_runtime_suspend(struct device *dev)
+static int tegra186_asrc_runtime_suspend(struct device *dev)
 {
 	struct tegra186_asrc *asrc = dev_get_drvdata(dev);
 
@@ -86,7 +86,7 @@ static int __maybe_unused tegra186_asrc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tegra186_asrc_runtime_resume(struct device *dev)
+static int tegra186_asrc_runtime_resume(struct device *dev)
 {
 	struct tegra186_asrc *asrc = dev_get_drvdata(dev);
 	int id;
@@ -1021,17 +1021,16 @@ static void tegra186_asrc_platform_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops tegra186_asrc_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra186_asrc_runtime_suspend,
-			   tegra186_asrc_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(tegra186_asrc_runtime_suspend,
+		       tegra186_asrc_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra186_asrc_driver = {
 	.driver = {
 		.name = "tegra186-asrc",
 		.of_match_table = tegra186_asrc_of_match,
-		.pm = &tegra186_asrc_pm_ops,
+		.pm = pm_ptr(&tegra186_asrc_pm_ops),
 	},
 	.probe = tegra186_asrc_platform_probe,
 	.remove = tegra186_asrc_platform_remove,
diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index 1be6c09cbe1a..21fdab2a1977 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -181,7 +181,7 @@ static int tegra186_dspk_put_stereo_to_mono(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static int __maybe_unused tegra186_dspk_runtime_suspend(struct device *dev)
+static int tegra186_dspk_runtime_suspend(struct device *dev)
 {
 	struct tegra186_dspk *dspk = dev_get_drvdata(dev);
 
@@ -193,7 +193,7 @@ static int __maybe_unused tegra186_dspk_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tegra186_dspk_runtime_resume(struct device *dev)
+static int tegra186_dspk_runtime_resume(struct device *dev)
 {
 	struct tegra186_dspk *dspk = dev_get_drvdata(dev);
 	int err;
@@ -532,17 +532,16 @@ static void tegra186_dspk_platform_remove(struct platform_device *pdev)
 }
 
 static const struct dev_pm_ops tegra186_dspk_pm_ops = {
-	SET_RUNTIME_PM_OPS(tegra186_dspk_runtime_suspend,
-			   tegra186_dspk_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(tegra186_dspk_runtime_suspend,
+		       tegra186_dspk_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra186_dspk_driver = {
 	.driver = {
 		.name = "tegra186-dspk",
 		.of_match_table = tegra186_dspk_of_match,
-		.pm = &tegra186_dspk_pm_ops,
+		.pm = pm_ptr(&tegra186_dspk_pm_ops),
 	},
 	.probe = tegra186_dspk_platform_probe,
 	.remove = tegra186_dspk_platform_remove,
-- 
2.43.0

