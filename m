Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C819122ACEF
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205482; cv=none; b=YjmHQAskyFm1+b313zTTP8PxBnFV9nD9Ubb9HsB4/nyYDIHw9TvYniVEKWad8d28gvx6GGENGGHALasBaqhMBq6+GinhT0lR441zirUv7ia/MPNpqQ53TnvyTWR+BBrLNVHsP8DwlZc4107PRldejDIcXnpAVOF3NgeNEissi/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205482; c=relaxed/simple;
	bh=9oRT/5c+mglXcnGUFXrbh4lRlA9FgVOoR0QP9lfCBE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=my+iz904nCXtN9rx4zeLiPxVVuozpzi1q5ZOLr1Quu/s4BaYymJRGQ7K+sVlnL8rKd6kl31nuTSFVGjZ39OTLoNkJN/UWmJ0BFLx4Tpt8sv8IiIV2fUZfyJ/HtHFX42fQsSLErCihGrk5U+p42sRv8YRbEPzNCAkwau4Bg/uheA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 33D422022C;
	Mon, 17 Mar 2025 09:56:18 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D60213A2C;
	Mon, 17 Mar 2025 09:56:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aDULAsLx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 29/88] ASoC: rt1017-sdca-sdw: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:54:51 +0100
Message-ID: <20250317095603.20073-30-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 33D422022C
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
 sound/soc/codecs/rt1017-sdca-sdw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt1017-sdca-sdw.c b/sound/soc/codecs/rt1017-sdca-sdw.c
index 7c8103a0d562..88fc23a4999f 100644
--- a/sound/soc/codecs/rt1017-sdca-sdw.c
+++ b/sound/soc/codecs/rt1017-sdca-sdw.c
@@ -758,7 +758,7 @@ static const struct sdw_device_id rt1017_sdca_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt1017_sdca_id);
 
-static int __maybe_unused rt1017_sdca_dev_suspend(struct device *dev)
+static int rt1017_sdca_dev_suspend(struct device *dev)
 {
 	struct rt1017_sdca_priv *rt1017 = dev_get_drvdata(dev);
 
@@ -772,7 +772,7 @@ static int __maybe_unused rt1017_sdca_dev_suspend(struct device *dev)
 
 #define RT1017_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt1017_sdca_dev_resume(struct device *dev)
+static int rt1017_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1017_sdca_priv *rt1017 = dev_get_drvdata(dev);
@@ -802,14 +802,14 @@ static int __maybe_unused rt1017_sdca_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt1017_sdca_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt1017_sdca_dev_suspend, rt1017_sdca_dev_resume)
-	SET_RUNTIME_PM_OPS(rt1017_sdca_dev_suspend, rt1017_sdca_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt1017_sdca_dev_suspend, rt1017_sdca_dev_resume)
+	RUNTIME_PM_OPS(rt1017_sdca_dev_suspend, rt1017_sdca_dev_resume, NULL)
 };
 
 static struct sdw_driver rt1017_sdca_sdw_driver = {
 	.driver = {
 		.name = "rt1017-sdca",
-		.pm = &rt1017_sdca_pm,
+		.pm = pm_ptr(&rt1017_sdca_pm),
 	},
 	.probe = rt1017_sdca_sdw_probe,
 	.remove = rt1017_sdca_sdw_remove,
-- 
2.43.0

