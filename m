Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1220922DF94
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205545; cv=none; b=L8vO7r2iz0HD9/DpquKfoVYBYJdISdxh5BS+69LNJ2TP5F1Dq5gDBMj9AheG/6US4fu0b+uVw99ARyTbZQDefYrLx+hKljgagCLiTL6lXg+BrNc0dctFaZrUQhEx8fywosfJ/IP8hMHWpKbMu3XMlEfQ9ekoZtVF2tAcmZ0yL3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205545; c=relaxed/simple;
	bh=xCyKN9HjDiAG+dmWnuuVjDNS2OQOIsnp22WD/wi9734=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DvUrCd1kYxX6JQND9ejKXqW/GEgUGDcsPtmACIvgMD4vNsl5RjFpBJP71ZomBVXj1ShOyYD770u8oBYAa9D1lRqrHdW4bgiGh/MURbewaqfVA7uQy+OOs8B4xfWYuC3CjlNPML2b6yIH8S17QNshfek+KgP8WUDgMZ9qxrpIn+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 677072207E;
	Mon, 17 Mar 2025 09:56:23 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4669A132CF;
	Mon, 17 Mar 2025 09:56:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qKvnD8fx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 58/88] ASoC: dwc: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:20 +0100
Message-ID: <20250317095603.20073-59-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 677072207E
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping superfluous CONFIG_PM
ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/dwc/dwc-i2s.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 57b789d7fbed..4c4171bb3fbb 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -478,7 +478,6 @@ static const struct snd_soc_dai_ops dw_i2s_dai_ops = {
 	.set_tdm_slot	= dw_i2s_set_tdm_slot,
 };
 
-#ifdef CONFIG_PM
 static int dw_i2s_runtime_suspend(struct device *dev)
 {
 	struct dw_i2s_dev *dw_dev = dev_get_drvdata(dev);
@@ -501,6 +500,7 @@ static int dw_i2s_runtime_resume(struct device *dev)
 	return 0;
 }
 
+#ifdef CONFIG_PM
 static int dw_i2s_suspend(struct snd_soc_component *component)
 {
 	struct dw_i2s_dev *dev = snd_soc_component_get_drvdata(component);
@@ -1084,7 +1084,7 @@ MODULE_DEVICE_TABLE(of, dw_i2s_of_match);
 #endif
 
 static const struct dev_pm_ops dwc_pm_ops = {
-	SET_RUNTIME_PM_OPS(dw_i2s_runtime_suspend, dw_i2s_runtime_resume, NULL)
+	RUNTIME_PM_OPS(dw_i2s_runtime_suspend, dw_i2s_runtime_resume, NULL)
 };
 
 static struct platform_driver dw_i2s_driver = {
@@ -1093,7 +1093,7 @@ static struct platform_driver dw_i2s_driver = {
 	.driver		= {
 		.name	= "designware-i2s",
 		.of_match_table = of_match_ptr(dw_i2s_of_match),
-		.pm = &dwc_pm_ops,
+		.pm = pm_ptr(&dwc_pm_ops),
 	},
 };
 
-- 
2.43.0

