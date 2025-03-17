Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B01B22CBC9
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205519; cv=none; b=FniRfqXnwzzCUdCzgBGvk1TVISDnMyRe8jXIc4Rev5j1NCbOr4VFYmSdffMOEazkizneL2VoHMkpHyMttZ3tr8skXh/OFlvUR00rPabvzalnFIkH/Hu8ZT5YaP/+sHt3F0LWzKKkr+AodavOeVCvkW6+LqiftKtOFottxLqfWwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205519; c=relaxed/simple;
	bh=gYBnuLRuaLh9jFY6jeMzAeSTB1bIkzp1Jnps1FLM2gE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RVNx2yLBxh+J9y+6OTm9ZuDAsA0bltwQSS/gugg6W/o/7dSm9h/rKMHxXHd+u7V7qYZSQv+2jv7kMY+DWV1kuHSXSzrHtpoB2xafBBx84xwQQ8Gia3ffeZbcxgNTtCE1jjG5jAbFMH6dNDRYPX4l3Agy+6QQXKPtD2A0QrPDGQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0127B20231;
	Mon, 17 Mar 2025 09:56:20 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CFC4D132CF;
	Mon, 17 Mar 2025 09:56:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2Ph1McPx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 39/88] ASoC: rt712: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:55:01 +0100
Message-ID: <20250317095603.20073-40-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 0127B20231
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

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt712-sdca-dmic.c | 12 ++++++------
 sound/soc/codecs/rt712-sdca-sdw.c  | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-dmic.c b/sound/soc/codecs/rt712-sdca-dmic.c
index ee5435f3a80a..db011da63bd9 100644
--- a/sound/soc/codecs/rt712-sdca-dmic.c
+++ b/sound/soc/codecs/rt712-sdca-dmic.c
@@ -884,7 +884,7 @@ static const struct sdw_device_id rt712_sdca_dmic_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt712_sdca_dmic_id);
 
-static int __maybe_unused rt712_sdca_dmic_dev_suspend(struct device *dev)
+static int rt712_sdca_dmic_dev_suspend(struct device *dev)
 {
 	struct rt712_sdca_dmic_priv *rt712 = dev_get_drvdata(dev);
 
@@ -897,7 +897,7 @@ static int __maybe_unused rt712_sdca_dmic_dev_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt712_sdca_dmic_dev_system_suspend(struct device *dev)
+static int rt712_sdca_dmic_dev_system_suspend(struct device *dev)
 {
 	struct rt712_sdca_dmic_priv *rt712_sdca = dev_get_drvdata(dev);
 
@@ -909,7 +909,7 @@ static int __maybe_unused rt712_sdca_dmic_dev_system_suspend(struct device *dev)
 
 #define RT712_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt712_sdca_dmic_dev_resume(struct device *dev)
+static int rt712_sdca_dmic_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt712_sdca_dmic_priv *rt712 = dev_get_drvdata(dev);
@@ -941,8 +941,8 @@ static int __maybe_unused rt712_sdca_dmic_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt712_sdca_dmic_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt712_sdca_dmic_dev_system_suspend, rt712_sdca_dmic_dev_resume)
-	SET_RUNTIME_PM_OPS(rt712_sdca_dmic_dev_suspend, rt712_sdca_dmic_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt712_sdca_dmic_dev_system_suspend, rt712_sdca_dmic_dev_resume)
+	RUNTIME_PM_OPS(rt712_sdca_dmic_dev_suspend, rt712_sdca_dmic_dev_resume, NULL)
 };
 
 
@@ -978,7 +978,7 @@ static int rt712_sdca_dmic_sdw_remove(struct sdw_slave *slave)
 static struct sdw_driver rt712_sdca_dmic_sdw_driver = {
 	.driver = {
 		.name = "rt712-sdca-dmic",
-		.pm = &rt712_sdca_dmic_pm,
+		.pm = pm_ptr(&rt712_sdca_dmic_pm),
 	},
 	.probe = rt712_sdca_dmic_sdw_probe,
 	.remove = rt712_sdca_dmic_sdw_remove,
diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index b584a3f854b8..ea07131edfa2 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -400,7 +400,7 @@ static const struct sdw_device_id rt712_sdca_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt712_sdca_id);
 
-static int __maybe_unused rt712_sdca_dev_suspend(struct device *dev)
+static int rt712_sdca_dev_suspend(struct device *dev)
 {
 	struct rt712_sdca_priv *rt712 = dev_get_drvdata(dev);
 
@@ -416,7 +416,7 @@ static int __maybe_unused rt712_sdca_dev_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt712_sdca_dev_system_suspend(struct device *dev)
+static int rt712_sdca_dev_system_suspend(struct device *dev)
 {
 	struct rt712_sdca_priv *rt712_sdca = dev_get_drvdata(dev);
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
@@ -448,7 +448,7 @@ static int __maybe_unused rt712_sdca_dev_system_suspend(struct device *dev)
 
 #define RT712_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt712_sdca_dev_resume(struct device *dev)
+static int rt712_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt712_sdca_priv *rt712 = dev_get_drvdata(dev);
@@ -488,14 +488,14 @@ static int __maybe_unused rt712_sdca_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt712_sdca_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt712_sdca_dev_system_suspend, rt712_sdca_dev_resume)
-	SET_RUNTIME_PM_OPS(rt712_sdca_dev_suspend, rt712_sdca_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt712_sdca_dev_system_suspend, rt712_sdca_dev_resume)
+	RUNTIME_PM_OPS(rt712_sdca_dev_suspend, rt712_sdca_dev_resume, NULL)
 };
 
 static struct sdw_driver rt712_sdca_sdw_driver = {
 	.driver = {
 		.name = "rt712-sdca",
-		.pm = &rt712_sdca_pm,
+		.pm = pm_ptr(&rt712_sdca_pm),
 	},
 	.probe = rt712_sdca_sdw_probe,
 	.remove = rt712_sdca_sdw_remove,
-- 
2.43.0

