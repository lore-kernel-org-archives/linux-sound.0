Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A66622E3F3
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205502; cv=none; b=CLMOkY+W1ZIhwaBVnq2vvnSsME9aUf83nrHClfNcnHmpBwAzwqq9P6bxfQ2sPYIP91wOab1X/zCXXTba6EUSU9v2kehokZBVP8CWyGWYJxeyCqLQlTJ7enF8POUqIeBx8tCq+/lqE7qsc0BcWrutyQOsMPpj2OKJwLlBzB2Ry6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205502; c=relaxed/simple;
	bh=cgH/eXQT0VMLzdspxPDzYZc+tC1g/FTv3+u/ICVgV8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzDMw0aaT6DL/LbHr19CHvIck3KqBNqGDJ4qWi7UklLmEMJF3hDUmc8Vd3Cev5ryKUQf5AifdWcmmjzqbNZ2UQhYw8lfHpsS4MLwy1RlqwK+ADWZVra/rrjWHkhu2cPMMRQUtcdKDrCZE+Zn/5NUVjZYQhq784T/VSkphjfIGTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8B49E21F7F;
	Mon, 17 Mar 2025 09:56:21 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D30F132CF;
	Mon, 17 Mar 2025 09:56:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iDxyGcXx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 48/88] ASoC: wcd938x: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:10 +0100
Message-ID: <20250317095603.20073-49-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 8B49E21F7F
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wcd938x-sdw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index 4e2ae542cee3..cabddadc90ef 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -1311,7 +1311,7 @@ static const struct sdw_device_id wcd9380_slave_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, wcd9380_slave_id);
 
-static int __maybe_unused wcd938x_sdw_runtime_suspend(struct device *dev)
+static int wcd938x_sdw_runtime_suspend(struct device *dev)
 {
 	struct wcd938x_sdw_priv *wcd = dev_get_drvdata(dev);
 
@@ -1323,7 +1323,7 @@ static int __maybe_unused wcd938x_sdw_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused wcd938x_sdw_runtime_resume(struct device *dev)
+static int wcd938x_sdw_runtime_resume(struct device *dev)
 {
 	struct wcd938x_sdw_priv *wcd = dev_get_drvdata(dev);
 
@@ -1338,7 +1338,7 @@ static int __maybe_unused wcd938x_sdw_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops wcd938x_sdw_pm_ops = {
-	SET_RUNTIME_PM_OPS(wcd938x_sdw_runtime_suspend, wcd938x_sdw_runtime_resume, NULL)
+	RUNTIME_PM_OPS(wcd938x_sdw_runtime_suspend, wcd938x_sdw_runtime_resume, NULL)
 };
 
 
@@ -1349,7 +1349,7 @@ static struct sdw_driver wcd9380_codec_driver = {
 	.id_table = wcd9380_slave_id,
 	.driver = {
 		.name	= "wcd9380-codec",
-		.pm = &wcd938x_sdw_pm_ops,
+		.pm = pm_ptr(&wcd938x_sdw_pm_ops),
 	}
 };
 module_sdw_driver(wcd9380_codec_driver);
-- 
2.43.0

