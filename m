Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28B822E3F3
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205536; cv=none; b=Vp3pl9u001C2bXZ6vabrfV2J7jkCjmTjNAUfIyivV3lzWSJx00Tal8qmcgfXho5xYnD0W3Cdj2/QCJGhJK3lwtnoVOuShV6CGx8RtMcvlHDI3YUv0IL4i48LvGT15kF6T7hIntj3b9Sh1BPnk2XaI/qspkLo6YaYe8mPX3X++Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205536; c=relaxed/simple;
	bh=Rco2S2QBD/VJqA4HWtVariCutQ6fg0MzStVYGuh6sxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a4xisiQJmLXDAcGnqtUnoj+bnF1jDFR6fPqgSUmIe7dQqtfWf8sRbHkw2/7FVwnzRb8Jw+BYj3M4fEmR2BFA9GRLJca4I5e9pWrhAEbuyedITq8fuQLtiY5tPqU8J5Qw0qgnoZyeb9Wa/EVMMWNEBh0OGzSDrpUuDOBjVqyPDS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DB6B320234;
	Mon, 17 Mar 2025 09:56:20 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B7B39132CF;
	Mon, 17 Mar 2025 09:56:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ACetK8Tx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 44/88] ASoC: rtq9128: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:06 +0100
Message-ID: <20250317095603.20073-45-tiwai@suse.de>
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
X-Rspamd-Queue-Id: DB6B320234
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS(),
which allows us dropping ugly __maybe_unsed attributes.

Merely a cleanup, there should be no actual code change.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rtq9128.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rtq9128.c b/sound/soc/codecs/rtq9128.c
index aa3eadecd974..391cc03d687f 100644
--- a/sound/soc/codecs/rtq9128.c
+++ b/sound/soc/codecs/rtq9128.c
@@ -729,7 +729,7 @@ static int rtq9128_probe(struct i2c_client *i2c)
 	return devm_snd_soc_register_component(dev, &rtq9128_comp_driver, &rtq9128_dai, 1);
 }
 
-static int __maybe_unused rtq9128_pm_runtime_suspend(struct device *dev)
+static int rtq9128_pm_runtime_suspend(struct device *dev)
 {
 	struct rtq9128_data *data = dev_get_drvdata(dev);
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
@@ -746,7 +746,7 @@ static int __maybe_unused rtq9128_pm_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rtq9128_pm_runtime_resume(struct device *dev)
+static int rtq9128_pm_runtime_resume(struct device *dev)
 {
 	struct rtq9128_data *data = dev_get_drvdata(dev);
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
@@ -764,8 +764,8 @@ static int __maybe_unused rtq9128_pm_runtime_resume(struct device *dev)
 	return regcache_sync(regmap);
 }
 
-static const struct dev_pm_ops __maybe_unused rtq9128_pm_ops = {
-	SET_RUNTIME_PM_OPS(rtq9128_pm_runtime_suspend, rtq9128_pm_runtime_resume, NULL)
+static const struct dev_pm_ops rtq9128_pm_ops = {
+	RUNTIME_PM_OPS(rtq9128_pm_runtime_suspend, rtq9128_pm_runtime_resume, NULL)
 };
 
 static const struct of_device_id rtq9128_device_table[] = {
-- 
2.43.0

