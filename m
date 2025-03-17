Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AFD225A32
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205557; cv=none; b=amDB9vgzEkdGJI7s8f8mSMUxMZam6kMC9l40ocBp0/oHAXvyO423BoL22CXCFbwcCm8XVInVks+uYzmyLT/Rx0agZisPaQ7OUm8yfAiZ+ESfcVWh89AqLR/N9IXtML1q1gM8UkpensYHa013Zqq/vjm3V8YqAaqox2Q7IxG63vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205557; c=relaxed/simple;
	bh=BEL6JiUdbowwg62DkWoNPPN+GG0Vx1XyJiulOabQRiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SonPsePRdDF9Z4qGbQTbBPPNWeAjZIW7dgp6O6YF4BZ2RWgtX2t5HQgTSswqRPBnLzLGOhZh5nO5A3eZZY5LhPjD/fsHeXBtSH2lzlhcH2NxWzPUIbiLdRLMFNkg9ArQaOZXksL+iYHUGWb9Ax7qlBenG3jN92v/maeBkChCLeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A4E5D22084;
	Mon, 17 Mar 2025 09:56:24 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 832D8132CF;
	Mon, 17 Mar 2025 09:56:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EAnIHsjx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 64/88] ASoC: mediatek: mt6797: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:26 +0100
Message-ID: <20250317095603.20073-65-tiwai@suse.de>
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
X-Rspamd-Queue-Id: A4E5D22084
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr().

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index 9159b42adf6a..f62a32f2f2b6 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -879,15 +879,15 @@ static const struct of_device_id mt6797_afe_pcm_dt_match[] = {
 MODULE_DEVICE_TABLE(of, mt6797_afe_pcm_dt_match);
 
 static const struct dev_pm_ops mt6797_afe_pm_ops = {
-	SET_RUNTIME_PM_OPS(mt6797_afe_runtime_suspend,
-			   mt6797_afe_runtime_resume, NULL)
+	RUNTIME_PM_OPS(mt6797_afe_runtime_suspend,
+		       mt6797_afe_runtime_resume, NULL)
 };
 
 static struct platform_driver mt6797_afe_pcm_driver = {
 	.driver = {
 		   .name = "mt6797-audio",
 		   .of_match_table = mt6797_afe_pcm_dt_match,
-		   .pm = &mt6797_afe_pm_ops,
+		   .pm = pm_ptr(&mt6797_afe_pm_ops),
 	},
 	.probe = mt6797_afe_pcm_dev_probe,
 	.remove = mt6797_afe_pcm_dev_remove,
-- 
2.43.0

