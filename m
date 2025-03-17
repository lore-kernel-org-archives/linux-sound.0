Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2C922E41D
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205538; cv=none; b=q1ckA9sjgKytuTdOpPJDJSkL7ZkMQNDlOtyGMetjHbZwaD+4dQGhjEGOBvNRe9U5OTDM6U/Q59FE9JOyWjSvgSor4QyS8NsghDRPIASjey+mm3OHzY6JanR9PD9kSDVMUqi3i+k9JZMqAHhqVGNYXGxAeUmNB36H3SBaVXJjXas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205538; c=relaxed/simple;
	bh=uF1BxHuwmghaFEziZfN9TuXIHk98gn9NF+btJKtLtDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OeQXbwqGfGFB/rtPlMJydZ1Bke9zkMEKYfO6Lui8PeflrfrLv1uU1z0TG8v1c9yAQW7P+qgks7qu+Zhgdt7q+c5svFD80O7raZvdlcf1SMmmSgr1vFqSyU2Ig0moXqh82CGrEVbzKeKXL1+eur8NspUJGfW+aAXKQJwfl3cmp3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DC2422207C;
	Mon, 17 Mar 2025 09:56:22 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B68B1132CF;
	Mon, 17 Mar 2025 09:56:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wNE4K8bx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 55/88] ASoC: wsa881x: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:17 +0100
Message-ID: <20250317095603.20073-56-tiwai@suse.de>
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
X-Rspamd-Queue-Id: DC2422207C
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

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wsa881x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index a3999bb6d5e2..6627d2da3722 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1169,7 +1169,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 					       ARRAY_SIZE(wsa881x_dais));
 }
 
-static int __maybe_unused wsa881x_runtime_suspend(struct device *dev)
+static int wsa881x_runtime_suspend(struct device *dev)
 {
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
 	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
@@ -1182,7 +1182,7 @@ static int __maybe_unused wsa881x_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused wsa881x_runtime_resume(struct device *dev)
+static int wsa881x_runtime_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
@@ -1206,7 +1206,7 @@ static int __maybe_unused wsa881x_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops wsa881x_pm_ops = {
-	SET_RUNTIME_PM_OPS(wsa881x_runtime_suspend, wsa881x_runtime_resume, NULL)
+	RUNTIME_PM_OPS(wsa881x_runtime_suspend, wsa881x_runtime_resume, NULL)
 };
 
 static const struct sdw_device_id wsa881x_slave_id[] = {
@@ -1222,7 +1222,7 @@ static struct sdw_driver wsa881x_codec_driver = {
 	.id_table = wsa881x_slave_id,
 	.driver = {
 		.name	= "wsa881x-codec",
-		.pm = &wsa881x_pm_ops,
+		.pm = pm_ptr(&wsa881x_pm_ops),
 	}
 };
 module_sdw_driver(wsa881x_codec_driver);
-- 
2.43.0

