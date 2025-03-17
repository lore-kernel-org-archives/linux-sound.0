Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263D5221F15
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205596; cv=none; b=cArl3AVSYjeI0SlWG2aJT2jtYprrak9TgQwDwbwtqOBPEDxl/BG653dXT2KrP5qHdhMHQ9zFr6e2MtT40m7JF8WKqlplTkJWtyM2RkgRl8znndpkFV1aZlv86ll+mzcBOkpHdaStd/EBdSpCixguH8uVMyEspO0eeY3aU0ajb10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205596; c=relaxed/simple;
	bh=kWG4EMlqwHMCDZhtS+ktGQ63fdbIrk+uXLol54ifXNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RxZHdU77TYPr3dsFIdGpXuwz9ddTgLBkAH3U5a4GUJVdgdTTkVUvR2xTA+SoxRTswdLBzVl7G7MgWoYZ9d8H5fZYZlZsEx8M1RR8b7wrGGIdL3GV3t8SyOToFxfZBgDfK0wzbXz/A3bMxC1Z4+rGDijs5SrCgRKKsYkiTPvC0XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 363E42023E;
	Mon, 17 Mar 2025 09:56:25 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 09CF813A2C;
	Mon, 17 Mar 2025 09:56:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uAMlAcnx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 67/88] ASoC: mediatek: mt8183: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:29 +0100
Message-ID: <20250317095603.20073-68-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 363E42023E
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr().

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 3f377ba4ad53..d083b4bf0f95 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1257,15 +1257,15 @@ static const struct of_device_id mt8183_afe_pcm_dt_match[] = {
 MODULE_DEVICE_TABLE(of, mt8183_afe_pcm_dt_match);
 
 static const struct dev_pm_ops mt8183_afe_pm_ops = {
-	SET_RUNTIME_PM_OPS(mt8183_afe_runtime_suspend,
-			   mt8183_afe_runtime_resume, NULL)
+	RUNTIME_PM_OPS(mt8183_afe_runtime_suspend,
+		       mt8183_afe_runtime_resume, NULL)
 };
 
 static struct platform_driver mt8183_afe_pcm_driver = {
 	.driver = {
 		   .name = "mt8183-audio",
 		   .of_match_table = mt8183_afe_pcm_dt_match,
-		   .pm = &mt8183_afe_pm_ops,
+		   .pm = pm_ptr(&mt8183_afe_pm_ops),
 	},
 	.probe = mt8183_afe_pcm_dev_probe,
 	.remove = mt8183_afe_pcm_dev_remove,
-- 
2.43.0

