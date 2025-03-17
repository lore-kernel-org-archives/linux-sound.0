Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CDF22DFA8
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205513; cv=none; b=eCpXdRVmYCJwRWA6HxdCZTiryByl1s1Yc9Ks+oVyngWdfz3v0TGWALzvIQjPLI2lVcKUmn4o7+EVIImOyUG6ZNI9jKF7n9BJak44c8fr3OSRQ07JIf2z7jfcYvxN7ZZJXqpZyY+sZJp2kcl+KdjziPNZtAWzpEN2DHB6knup/xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205513; c=relaxed/simple;
	bh=uRSkRTc+P5v1cLUGivl2pfyQr7Fq0YkqDpBdwUwm+/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e03nZuY+ooSXKdBE1jluSJEOsh96uKlb9y2G502CQsyZ6EigAdUcw8ziNoa/Wp/OSpR+MKRNaHusjpWKpE3selJhAxWQ8ZJk5DVurWKSVXB4E20U2PBJPPuKQEKyGZYTxqs+j3jCvGOAeazcsrAz64QseLmJpKF5WGOSwR/Cy4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C9CA920230;
	Mon, 17 Mar 2025 09:56:19 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A061B13A2C;
	Mon, 17 Mar 2025 09:56:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YE6zJcPx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 38/88] ASoC: rt711: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:55:00 +0100
Message-ID: <20250317095603.20073-39-tiwai@suse.de>
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
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: C9CA920230
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt711-sdca-sdw.c | 12 ++++++------
 sound/soc/codecs/rt711-sdw.c      | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index e87e2e1bfff7..6eb05871db37 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -388,7 +388,7 @@ static const struct sdw_device_id rt711_sdca_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt711_sdca_id);
 
-static int __maybe_unused rt711_sdca_dev_suspend(struct device *dev)
+static int rt711_sdca_dev_suspend(struct device *dev)
 {
 	struct rt711_sdca_priv *rt711 = dev_get_drvdata(dev);
 
@@ -404,7 +404,7 @@ static int __maybe_unused rt711_sdca_dev_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt711_sdca_dev_system_suspend(struct device *dev)
+static int rt711_sdca_dev_system_suspend(struct device *dev)
 {
 	struct rt711_sdca_priv *rt711_sdca = dev_get_drvdata(dev);
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
@@ -436,7 +436,7 @@ static int __maybe_unused rt711_sdca_dev_system_suspend(struct device *dev)
 
 #define RT711_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt711_sdca_dev_resume(struct device *dev)
+static int rt711_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt711_sdca_priv *rt711 = dev_get_drvdata(dev);
@@ -475,14 +475,14 @@ static int __maybe_unused rt711_sdca_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt711_sdca_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt711_sdca_dev_system_suspend, rt711_sdca_dev_resume)
-	SET_RUNTIME_PM_OPS(rt711_sdca_dev_suspend, rt711_sdca_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt711_sdca_dev_system_suspend, rt711_sdca_dev_resume)
+	RUNTIME_PM_OPS(rt711_sdca_dev_suspend, rt711_sdca_dev_resume, NULL)
 };
 
 static struct sdw_driver rt711_sdca_sdw_driver = {
 	.driver = {
 		.name = "rt711-sdca",
-		.pm = &rt711_sdca_pm,
+		.pm = pm_ptr(&rt711_sdca_pm),
 	},
 	.probe = rt711_sdca_sdw_probe,
 	.remove = rt711_sdca_sdw_remove,
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index dfda6bb5c6f8..93a5a89a96b1 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -482,7 +482,7 @@ static const struct sdw_device_id rt711_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt711_id);
 
-static int __maybe_unused rt711_dev_suspend(struct device *dev)
+static int rt711_dev_suspend(struct device *dev)
 {
 	struct rt711_priv *rt711 = dev_get_drvdata(dev);
 
@@ -498,7 +498,7 @@ static int __maybe_unused rt711_dev_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt711_dev_system_suspend(struct device *dev)
+static int rt711_dev_system_suspend(struct device *dev)
 {
 	struct rt711_priv *rt711 = dev_get_drvdata(dev);
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
@@ -528,7 +528,7 @@ static int __maybe_unused rt711_dev_system_suspend(struct device *dev)
 
 #define RT711_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt711_dev_resume(struct device *dev)
+static int rt711_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt711_priv *rt711 = dev_get_drvdata(dev);
@@ -564,14 +564,14 @@ static int __maybe_unused rt711_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt711_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt711_dev_system_suspend, rt711_dev_resume)
-	SET_RUNTIME_PM_OPS(rt711_dev_suspend, rt711_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt711_dev_system_suspend, rt711_dev_resume)
+	RUNTIME_PM_OPS(rt711_dev_suspend, rt711_dev_resume, NULL)
 };
 
 static struct sdw_driver rt711_sdw_driver = {
 	.driver = {
 		.name = "rt711",
-		.pm = &rt711_pm,
+		.pm = pm_ptr(&rt711_pm),
 	},
 	.probe = rt711_sdw_probe,
 	.remove = rt711_sdw_remove,
-- 
2.43.0

