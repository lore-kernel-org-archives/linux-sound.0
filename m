Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14612288F4
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205400; cv=none; b=FmliUmDFa0fKipN6Asvk1669DXf05FzefzrXdcl4MOAoC6gjKWp81k++RLxlo0cHurD5cfqYf0r6EPMvIFtsesVtccLtw1+6sKA9E0+fh7mMCU8LozMu19qnBqAkQHC5xBWkAJFNQ4MICQERNCgbdtuDUBaUtW7bUlEgJBUdots=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205400; c=relaxed/simple;
	bh=RhpIct4XqKRGcp0dqGEnnHjnwNgOGVK4RO4aUj7iFwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4eEKKxiq1d0231kNRiCspW9zVGYic9oB1JrHT04UuZiQ/p9OD9FEJ3rZJz/WYgJYuMf8KA0bmud452jM5FsLngwZ29PMJ/n/X7DPIAUCW9wQA+ndoVkShKM/24ZWYJ9jX3waczGEwtgPJmUauQy/SZDB6/VZ+TNQ0hjGS7T+ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6CD3B21D95;
	Mon, 17 Mar 2025 09:56:15 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4309A132CF;
	Mon, 17 Mar 2025 09:56:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cEEcD7/x12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 13/88] ASoC: cs43130: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:35 +0100
Message-ID: <20250317095603.20073-14-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 6CD3B21D95
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs43130.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index cd535be0b4ba..d9b3d73c8388 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -2672,7 +2672,7 @@ static void cs43130_i2c_remove(struct i2c_client *client)
 	regulator_bulk_disable(CS43130_NUM_SUPPLIES, cs43130->supplies);
 }
 
-static int __maybe_unused cs43130_runtime_suspend(struct device *dev)
+static int cs43130_runtime_suspend(struct device *dev)
 {
 	struct cs43130_private *cs43130 = dev_get_drvdata(dev);
 
@@ -2691,7 +2691,7 @@ static int __maybe_unused cs43130_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cs43130_runtime_resume(struct device *dev)
+static int cs43130_runtime_resume(struct device *dev)
 {
 	struct cs43130_private *cs43130 = dev_get_drvdata(dev);
 	int ret;
@@ -2727,8 +2727,7 @@ static int __maybe_unused cs43130_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops cs43130_runtime_pm = {
-	SET_RUNTIME_PM_OPS(cs43130_runtime_suspend, cs43130_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(cs43130_runtime_suspend, cs43130_runtime_resume, NULL)
 };
 
 #if IS_ENABLED(CONFIG_OF)
@@ -2768,7 +2767,7 @@ static struct i2c_driver cs43130_i2c_driver = {
 		.name			= "cs43130",
 		.of_match_table		= of_match_ptr(cs43130_of_match),
 		.acpi_match_table	= ACPI_PTR(cs43130_acpi_match),
-		.pm			= &cs43130_runtime_pm,
+		.pm			= pm_ptr(&cs43130_runtime_pm),
 	},
 	.id_table	= cs43130_i2c_id,
 	.probe		= cs43130_i2c_probe,
-- 
2.43.0

