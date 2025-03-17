Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9B122F16E
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205560; cv=none; b=omQBKKX8sVnNgDc72uL1cKCbFt1njW6EKf4SsVzdqTDzofdUUtMaMoOFfpBFpBVIhN77+TeAQL56rIOOAz06oU4e4tUBsXdqiwnTj11Om2bJs4nRzZ7rheuk+Prl0/ZtWfmSShL2sXdWE6cHihsrONwbQrX0lmY3YVbubusvXOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205560; c=relaxed/simple;
	bh=STIbrtp2nG3qXZNm6ZM0v8HSeDX/bPE89LchKFpldiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r/7g2Mv9K0iW0PJ/B1QZcttaQ6gEanR/g21jkeUPwrObRvLsNnDVYmjEM1RcHbrFV8WpTCy/CG2kr7nhjrjNDV/XqAyFciKYuMbj0/w8mz7D7S2Ev+DPl1otMRI6EJS9irQLeP4eWPQ+VwBCbb8SBa7Tail7bukUOdYQaMk8oHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4027F20238;
	Mon, 17 Mar 2025 09:56:23 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1A93D132CF;
	Mon, 17 Mar 2025 09:56:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WFMsBcfx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 57/88] ASoC: wsa884x: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:19 +0100
Message-ID: <20250317095603.20073-58-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 4027F20238
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
 sound/soc/codecs/wsa884x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 560a2c04b695..8051483aa1ac 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -2136,7 +2136,7 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 					       ARRAY_SIZE(wsa884x_dais));
 }
 
-static int __maybe_unused wsa884x_runtime_suspend(struct device *dev)
+static int wsa884x_runtime_suspend(struct device *dev)
 {
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
 
@@ -2146,7 +2146,7 @@ static int __maybe_unused wsa884x_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused wsa884x_runtime_resume(struct device *dev)
+static int wsa884x_runtime_resume(struct device *dev)
 {
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
 
@@ -2157,7 +2157,7 @@ static int __maybe_unused wsa884x_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops wsa884x_pm_ops = {
-	SET_RUNTIME_PM_OPS(wsa884x_runtime_suspend, wsa884x_runtime_resume, NULL)
+	RUNTIME_PM_OPS(wsa884x_runtime_suspend, wsa884x_runtime_resume, NULL)
 };
 
 static const struct sdw_device_id wsa884x_swr_id[] = {
@@ -2169,7 +2169,7 @@ MODULE_DEVICE_TABLE(sdw, wsa884x_swr_id);
 static struct sdw_driver wsa884x_codec_driver = {
 	.driver = {
 		.name = "wsa884x-codec",
-		.pm = &wsa884x_pm_ops,
+		.pm = pm_ptr(&wsa884x_pm_ops),
 	},
 	.probe = wsa884x_probe,
 	.ops = &wsa884x_slave_ops,
-- 
2.43.0

