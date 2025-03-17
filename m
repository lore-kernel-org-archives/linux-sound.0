Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D8422B585
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205470; cv=none; b=n9xgh7eTvjkkQqpMIsmu6WcdVTxKA5XzOrHV8Wy2XfrusINHIlhRoasBoHr1yHw3hQ0wXu+2LniEJgO+LskAsGk9NCIKUto50s9h86Ok1m0jYBXqVHabWtQK4uQSrkks3KMiN5lDFHDCkUBChO29kMgfx8RpPYiM8Z9j+FbuJ9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205470; c=relaxed/simple;
	bh=lzP++nsp8ZDWtNHn2vlRy+P6/grNsjRL2WEosnj+yyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i79LSaEsENQZk1Z5I1nXV55NvNUgQjBdQ3Bfp4Jj8Q2yKX1M4f2as92eY0JPsq9EGpETXOhpCqTRKdEjbvMrA4JN6XE2gHLYmfewpGxdi81AhENBzYiOfqjl3ultNDZkaIW8km8FbXGXdzHeDlF23aAXro6rpI5g+CfMTem09Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4F8772022A;
	Mon, 17 Mar 2025 09:56:17 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 30750132CF;
	Mon, 17 Mar 2025 09:56:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qKB1CsHx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 24/88] ASoC: max98520: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:46 +0100
Message-ID: <20250317095603.20073-25-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 4F8772022A
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
SET_SYSTEM_SLEEP_PM_OPS() together with pm_ptr(), which allows us
dropping ugly __maybe_unsed attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/max98520.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max98520.c b/sound/soc/codecs/max98520.c
index 479ded22672e..adf5a898c6df 100644
--- a/sound/soc/codecs/max98520.c
+++ b/sound/soc/codecs/max98520.c
@@ -621,7 +621,7 @@ static int max98520_probe(struct snd_soc_component *component)
 	return 0;
 }
 
-static int __maybe_unused max98520_suspend(struct device *dev)
+static int max98520_suspend(struct device *dev)
 {
 	struct max98520_priv *max98520 = dev_get_drvdata(dev);
 
@@ -630,7 +630,7 @@ static int __maybe_unused max98520_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused max98520_resume(struct device *dev)
+static int max98520_resume(struct device *dev)
 {
 	struct max98520_priv *max98520 = dev_get_drvdata(dev);
 
@@ -641,7 +641,7 @@ static int __maybe_unused max98520_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops max98520_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(max98520_suspend, max98520_resume)
+	SYSTEM_SLEEP_PM_OPS(max98520_suspend, max98520_resume)
 };
 
 static const struct snd_soc_component_driver soc_codec_dev_max98520 = {
@@ -752,7 +752,7 @@ static struct i2c_driver max98520_i2c_driver = {
 	.driver = {
 		.name = "max98520",
 		.of_match_table = of_match_ptr(max98520_of_match),
-		.pm = &max98520_pm,
+		.pm = pm_ptr(&max98520_pm),
 	},
 	.probe = max98520_i2c_probe,
 	.id_table = max98520_i2c_id,
-- 
2.43.0

