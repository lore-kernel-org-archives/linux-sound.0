Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9944722E40F
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205533; cv=none; b=J+q+3jeiStU79KcRMNSDfI9rACKkr0l8OcSAZdCoJjIEScUylFczcbwXor31q7lXVQX2O+XhpL8suBQkzaJGnggks7Pv7NB7g9Ia4eQhdv1v/PzvKew4/jV9bUiOkj4r5UBrqV3KXUaJBJuaFtCGMVKrrHh4RO2Let3U31kZv3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205533; c=relaxed/simple;
	bh=s0tuuFP0bRaw7zKXa4dkbDjKRolbYE2H7mZd0TwEYnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nEP/wf87Qd0X1/IG9x4RA/4d3ZwbsEeemHuaeeUxAC+5BfCApnpzQi7qxmBs+ZaThsCzlqTC6NKhjE1Gu+l/Fvx2bubF+B3vA2Dw8id7U9/QjCl3uE/tUBYPPOp+drNUlntg1qxLiaiSgT7RfV157ju8IIFELyeFlLZSXSwv2P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B0CDC2207A;
	Mon, 17 Mar 2025 09:56:22 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 862B8132CF;
	Mon, 17 Mar 2025 09:56:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mItxH8bx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 54/88] ASoC: wm8994: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:16 +0100
Message-ID: <20250317095603.20073-55-tiwai@suse.de>
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
X-Rspamd-Queue-Id: B0CDC2207A
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
SET_SYSTEM_SLEEP_PM_OPS() together with pm_ptr(), which allows us
superfluous CONFIG_PM_SLEEP ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wm8994.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 69a22992c281..240ec1bed234 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4662,7 +4662,6 @@ static void wm8994_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int wm8994_suspend(struct device *dev)
 {
 	struct wm8994_priv *wm8994 = dev_get_drvdata(dev);
@@ -4687,16 +4686,15 @@ static int wm8994_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops wm8994_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(wm8994_suspend, wm8994_resume)
+	SYSTEM_SLEEP_PM_OPS(wm8994_suspend, wm8994_resume)
 };
 
 static struct platform_driver wm8994_codec_driver = {
 	.driver = {
 		.name = "wm8994-codec",
-		.pm = &wm8994_pm_ops,
+		.pm = pm_ptr(&wm8994_pm_ops),
 	},
 	.probe = wm8994_probe,
 	.remove = wm8994_remove,
-- 
2.43.0

