Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED8F22ACD3
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205473; cv=none; b=e8L+HxA/10P7sOIl04qyRq9NRWbDJqiPTp4O983lISevUSyfTMXyhzgHxLhj7XRawpRHwsq907trohF2nAGA0iHkIMpXlkzJKf8Vmm/ZduWFEDRiY94ZytwltrUXmlZltVQbOxFon6tZEMK6JkQ+CKOWsGYgwBnpUbZcoD/gCrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205473; c=relaxed/simple;
	bh=lGQm0vu2MPU6v2OpUJEgZRifvyjxdBZxqWgPe6Y/rp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DUwvt+r5L3tP8MwVslvBcEZff2n5Y+xQ9CqrkkaDnXdh7PtE0avJaa3VlHB64646NRkSwAAVscnrDiZ+dizxjL1RaNVUzSppgS1fDBDp//Dzxe1LD2gz5SrYZ5UoSShQy7ktv7bEl4Bgm3FhlZaww+OrkZbD6ECuY/afzp86Iy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6CFB021EA8;
	Mon, 17 Mar 2025 09:56:19 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49C3E13A2C;
	Mon, 17 Mar 2025 09:56:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QDarEMPx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 36/88] ASoC: rt5682-sdw: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:54:58 +0100
Message-ID: <20250317095603.20073-37-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 6CFB021EA8
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
 sound/soc/codecs/rt5682-sdw.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 5edf11e136b4..aa229894129b 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -709,7 +709,7 @@ static const struct sdw_device_id rt5682_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt5682_id);
 
-static int __maybe_unused rt5682_dev_suspend(struct device *dev)
+static int rt5682_dev_suspend(struct device *dev)
 {
 	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
 
@@ -725,7 +725,7 @@ static int __maybe_unused rt5682_dev_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt5682_dev_system_suspend(struct device *dev)
+static int rt5682_dev_system_suspend(struct device *dev)
 {
 	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
@@ -753,7 +753,7 @@ static int __maybe_unused rt5682_dev_system_suspend(struct device *dev)
 	return rt5682_dev_suspend(dev);
 }
 
-static int __maybe_unused rt5682_dev_resume(struct device *dev)
+static int rt5682_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
@@ -791,14 +791,14 @@ static int __maybe_unused rt5682_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt5682_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt5682_dev_system_suspend, rt5682_dev_resume)
-	SET_RUNTIME_PM_OPS(rt5682_dev_suspend, rt5682_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt5682_dev_system_suspend, rt5682_dev_resume)
+	RUNTIME_PM_OPS(rt5682_dev_suspend, rt5682_dev_resume, NULL)
 };
 
 static struct sdw_driver rt5682_sdw_driver = {
 	.driver = {
 		.name = "rt5682",
-		.pm = &rt5682_pm,
+		.pm = pm_ptr(&rt5682_pm),
 	},
 	.probe = rt5682_sdw_probe,
 	.remove = rt5682_sdw_remove,
-- 
2.43.0

