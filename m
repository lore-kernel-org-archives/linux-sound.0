Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D48422F152
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205554; cv=none; b=mIoCoI8NUzWGaizmQ8G9db9LFCw6tm1qbOl5HVRCf2LVHC0sJaNtfEdECpsdw5mU/19DxnrvNl8QcCOqfeV5aCtS4eUKiHXl+LQm5p8HSHJydiJ0PxIEheAYGxhLtpYz21MzNIY//vF1xeLcsq7VGh4EvHHSBq9FnpK0ssVXxH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205554; c=relaxed/simple;
	bh=kHVSGMiI0ShAwQesyuGTdnCEliu+6FKRcQeShXV5CBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Adt03JTZRDCJ6X5Pa6sfZf2vgWgSPI1hYwCRIP5V35tOv7LF9rt5qNYBaeOu0mct7NKm+BGiHwRI8PHZfS5L54jk9bz5/uYG/fM3DMtjcC+lYzHqAVQy5Qd+PDTqzY9X04xAvty7H6xRMKhKPyo1i4R1XVb/I1fV6X+nYkF4F+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1EEA420237;
	Mon, 17 Mar 2025 09:56:23 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E226913A2C;
	Mon, 17 Mar 2025 09:56:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aBDoNcbx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 56/88] ASoC: wsa883x: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:18 +0100
Message-ID: <20250317095603.20073-57-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 1EEA420237
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wsa883x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index a5a6cb90bb43..d259e1d4d83d 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1636,7 +1636,7 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 
 }
 
-static int __maybe_unused wsa883x_runtime_suspend(struct device *dev)
+static int wsa883x_runtime_suspend(struct device *dev)
 {
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
 
@@ -1646,7 +1646,7 @@ static int __maybe_unused wsa883x_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused wsa883x_runtime_resume(struct device *dev)
+static int wsa883x_runtime_resume(struct device *dev)
 {
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
 
@@ -1657,7 +1657,7 @@ static int __maybe_unused wsa883x_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops wsa883x_pm_ops = {
-	SET_RUNTIME_PM_OPS(wsa883x_runtime_suspend, wsa883x_runtime_resume, NULL)
+	RUNTIME_PM_OPS(wsa883x_runtime_suspend, wsa883x_runtime_resume, NULL)
 };
 
 static const struct sdw_device_id wsa883x_swr_id[] = {
@@ -1670,7 +1670,7 @@ MODULE_DEVICE_TABLE(sdw, wsa883x_swr_id);
 static struct sdw_driver wsa883x_codec_driver = {
 	.driver = {
 		.name = "wsa883x-codec",
-		.pm = &wsa883x_pm_ops,
+		.pm = pm_ptr(&wsa883x_pm_ops),
 		.suppress_bind_attrs = true,
 	},
 	.probe = wsa883x_probe,
-- 
2.43.0

