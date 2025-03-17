Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F254F22F178
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205542; cv=none; b=UpSS75mWxF4z8Zo8cv7LACQdsXtmZ/3rVgd2Kl23CwxISZ9pF+ttm5fhgje/+gTRMyLjdJJ+ShfGyA/dMJvpldvsFECFPAdPnrgOHR50V0SSiajXqVhtTWBgLRtOgVRMUmw3UQ23tgeU1iZaNnQzSQQoeeMTDO8hRiBeXGp90zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205542; c=relaxed/simple;
	bh=7lFGrMeR9BeZJi16vlYeONBYirmcKgKF00kUl3WrOsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UjhdXE7I+j1T3gJmgvOUo+IuQSoBqdLWgvIqGEhFw241FCx9YL6ZGaDAS3l1AlI7o+2HiomMUBVQJrrT0qJISJJkktcAuAN5UYCpUwkFL7pbkFDTxD2/5kEBFwEK01f4tMULkwmLnOlXsPs8bLBDmJjwg0jvh5jflU+V4mF9+7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 67CE820235;
	Mon, 17 Mar 2025 09:56:21 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4961613A2C;
	Mon, 17 Mar 2025 09:56:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GLx6EMXx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 47/88] ASoC: wcd937x: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:09 +0100
Message-ID: <20250317095603.20073-48-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 67CE820235
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

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wcd937x-sdw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sdw.c
index 4891fa0c963f..1bfe7383b311 100644
--- a/sound/soc/codecs/wcd937x-sdw.c
+++ b/sound/soc/codecs/wcd937x-sdw.c
@@ -1124,7 +1124,7 @@ static const struct sdw_device_id wcd9370_slave_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, wcd9370_slave_id);
 
-static int __maybe_unused wcd937x_sdw_runtime_suspend(struct device *dev)
+static int wcd937x_sdw_runtime_suspend(struct device *dev)
 {
 	struct wcd937x_sdw_priv *wcd = dev_get_drvdata(dev);
 
@@ -1136,7 +1136,7 @@ static int __maybe_unused wcd937x_sdw_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused wcd937x_sdw_runtime_resume(struct device *dev)
+static int wcd937x_sdw_runtime_resume(struct device *dev)
 {
 	struct wcd937x_sdw_priv *wcd = dev_get_drvdata(dev);
 
@@ -1149,7 +1149,7 @@ static int __maybe_unused wcd937x_sdw_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops wcd937x_sdw_pm_ops = {
-	SET_RUNTIME_PM_OPS(wcd937x_sdw_runtime_suspend, wcd937x_sdw_runtime_resume, NULL)
+	RUNTIME_PM_OPS(wcd937x_sdw_runtime_suspend, wcd937x_sdw_runtime_resume, NULL)
 };
 
 static struct sdw_driver wcd9370_codec_driver = {
@@ -1159,7 +1159,7 @@ static struct sdw_driver wcd9370_codec_driver = {
 	.id_table = wcd9370_slave_id,
 	.driver = {
 		.name = "wcd9370-codec",
-		.pm = &wcd937x_sdw_pm_ops,
+		.pm = pm_ptr(&wcd937x_sdw_pm_ops),
 	}
 };
 module_sdw_driver(wcd9370_codec_driver);
-- 
2.43.0

