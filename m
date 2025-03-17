Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C50821ABDF
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205524; cv=none; b=PGtgHd1I6oV0Dj42qiYf7Fskf/VivREC6qFhojRhghBXovPdzpyt4376UmrZNrMnM8r5LX/vuFbEbn9QY9ImqFSLnpxQ+bDWkNz7C6j7tskadJpshB23zaJ20U7LSbCb2ZjOUMovhhzEs+dWZwvcFwXWGv/BRxpr/2z3mpYx+F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205524; c=relaxed/simple;
	bh=YhX6FSRBwY8qpxBJI1qK6Cn7dWV7UBBJP4KQuAuVrJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQ/6/+1in+D4NCe2YCWuJGiCiGObgz0EvAXGj66dvN2Kagp0iyaEZLjp2DoxoTvuC64kobZkXkKaBS6KsBRfzPpQMaZll8niN+LNXW66FOKKGLiZhDTTMdRzRebL032xbg8oFoUHUpWY8PGEHyguP+D1bO9FIVLiuWTPmxS1CQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 655D620232;
	Mon, 17 Mar 2025 09:56:20 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32AF813A2C;
	Mon, 17 Mar 2025 09:56:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uCQiC8Tx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 41/88] ASoC: rt721: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:55:03 +0100
Message-ID: <20250317095603.20073-42-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 655D620232
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
 sound/soc/codecs/rt721-sdca-sdw.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index c71453da088a..582b47d69278 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -437,7 +437,7 @@ static const struct sdw_device_id rt721_sdca_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt721_sdca_id);
 
-static int __maybe_unused rt721_sdca_dev_suspend(struct device *dev)
+static int rt721_sdca_dev_suspend(struct device *dev)
 {
 	struct rt721_sdca_priv *rt721 = dev_get_drvdata(dev);
 
@@ -453,7 +453,7 @@ static int __maybe_unused rt721_sdca_dev_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt721_sdca_dev_system_suspend(struct device *dev)
+static int rt721_sdca_dev_system_suspend(struct device *dev)
 {
 	struct rt721_sdca_priv *rt721_sdca = dev_get_drvdata(dev);
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
@@ -485,7 +485,7 @@ static int __maybe_unused rt721_sdca_dev_system_suspend(struct device *dev)
 
 #define RT721_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt721_sdca_dev_resume(struct device *dev)
+static int rt721_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt721_sdca_priv *rt721 = dev_get_drvdata(dev);
@@ -524,15 +524,15 @@ static int __maybe_unused rt721_sdca_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt721_sdca_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt721_sdca_dev_system_suspend, rt721_sdca_dev_resume)
-	SET_RUNTIME_PM_OPS(rt721_sdca_dev_suspend, rt721_sdca_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt721_sdca_dev_system_suspend, rt721_sdca_dev_resume)
+	RUNTIME_PM_OPS(rt721_sdca_dev_suspend, rt721_sdca_dev_resume, NULL)
 };
 
 static struct sdw_driver rt721_sdca_sdw_driver = {
 	.driver = {
 		.name = "rt721-sdca",
 		.owner = THIS_MODULE,
-		.pm = &rt721_sdca_pm,
+		.pm = pm_ptr(&rt721_sdca_pm),
 	},
 	.probe = rt721_sdca_sdw_probe,
 	.remove = rt721_sdca_sdw_remove,
-- 
2.43.0

