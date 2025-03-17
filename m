Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A27122D7BA
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205489; cv=none; b=O/C1zOoMUj1wXbU0r2oW5EcS9PqA96fvTKxmnfQI/6eODqjCQCL0d5JM3zXn7zv4rmSyg3a7nr8zTTEzTnfgtvAsCPndp1edVES5KHX/9MoVC3RIqMaDB++qeOlKrZgMXrJuqOEifJeksnEmJMoUWdgSSkK/FyvywRUY9F8KX74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205489; c=relaxed/simple;
	bh=ICENAgvD+Uu/oArWNcOOcZiDB8Iu0giogIUuMKbWNps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z8ZqGVcuHHoNnQWEieRaMgke9iZtvAys0xrATgTL0Tfxos6RI+ost0PM5BbnKin5cKOMttSzhqXMvIyxaVD1VyUyvuedHL48otpCrHpCkpMnnfTOqlNQJYq4xkUYg4xsF5rpHBD+7Gm7lbV/+hbYggtgQE4mM3J8Ffkx8nosCxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B42071FDCB;
	Mon, 17 Mar 2025 09:56:18 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F6D8132CF;
	Mon, 17 Mar 2025 09:56:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WCzDIcLx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 32/88] ASoC: rt1318-sdw: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:54:54 +0100
Message-ID: <20250317095603.20073-33-tiwai@suse.de>
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
X-Rspamd-Queue-Id: B42071FDCB
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
 sound/soc/codecs/rt1318-sdw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt1318-sdw.c b/sound/soc/codecs/rt1318-sdw.c
index 319f71f5e60d..4eb636e0c9ed 100644
--- a/sound/soc/codecs/rt1318-sdw.c
+++ b/sound/soc/codecs/rt1318-sdw.c
@@ -807,7 +807,7 @@ static const struct sdw_device_id rt1318_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt1318_id);
 
-static int __maybe_unused rt1318_dev_suspend(struct device *dev)
+static int rt1318_dev_suspend(struct device *dev)
 {
 	struct rt1318_sdw_priv *rt1318 = dev_get_drvdata(dev);
 
@@ -820,7 +820,7 @@ static int __maybe_unused rt1318_dev_suspend(struct device *dev)
 
 #define RT1318_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt1318_dev_resume(struct device *dev)
+static int rt1318_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1318_sdw_priv *rt1318 = dev_get_drvdata(dev);
@@ -848,14 +848,14 @@ static int __maybe_unused rt1318_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt1318_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt1318_dev_suspend, rt1318_dev_resume)
-	SET_RUNTIME_PM_OPS(rt1318_dev_suspend, rt1318_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt1318_dev_suspend, rt1318_dev_resume)
+	RUNTIME_PM_OPS(rt1318_dev_suspend, rt1318_dev_resume, NULL)
 };
 
 static struct sdw_driver rt1318_sdw_driver = {
 	.driver = {
 		.name = "rt1318-sdca",
-		.pm = &rt1318_pm,
+		.pm = pm_ptr(&rt1318_pm),
 	},
 	.probe = rt1318_sdw_probe,
 	.remove = rt1318_sdw_remove,
-- 
2.43.0

