Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1107221D99
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 10:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205614; cv=none; b=EukafIzlVP0el2igcJ+vku9Q9TJZgmgzIhkgy3D8BgQHsVm+K87mHOW48d707m26C/LLISbhfa2e7sWcUW8fcFK0+5VROSgf31ZPG77Vv4IpE4Fka/Dnq4E2O1kw7V0k9H1uXToh2JBMhuKz3ZFfLrFJ/7cXaBKeT6dtDQN6FvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205614; c=relaxed/simple;
	bh=ElUYy0CBarBcJuLwv5LpmBIeYYMprIQh/5P3xuBA7EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tqTxBd1t2qWCo5uMyi5Ui+n89Rz2P9qrN6g+8LnB3FpAiDIYhg6gB2at1eLyxHA0cwwPhuBHG5k7A5pHYdvoRXOLovH617VSUu/gwD0Qh3aPDyyYDjqEIdqbGDxdaqE0HjkJTscQb4w8Uovb3Cu+og7GWMGz4WnloabPvSl+w8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6678520241;
	Mon, 17 Mar 2025 09:56:26 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B4C313A2C;
	Mon, 17 Mar 2025 09:56:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mErZDMrx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 74/88] ASoC: rcar: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:36 +0100
Message-ID: <20250317095603.20073-75-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 6678520241
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
SET_SYSTEM_SLEEP_PM_OPS() together with pm_ptr(), which allows us to
drop ugly __maybe_unused attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/renesas/rcar/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index f3f0c3f0bb9f..30afc942d381 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -2059,7 +2059,7 @@ static void rsnd_remove(struct platform_device *pdev)
 		remove_func[i](priv);
 }
 
-static int __maybe_unused rsnd_suspend(struct device *dev)
+static int rsnd_suspend(struct device *dev)
 {
 	struct rsnd_priv *priv = dev_get_drvdata(dev);
 
@@ -2068,7 +2068,7 @@ static int __maybe_unused rsnd_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rsnd_resume(struct device *dev)
+static int rsnd_resume(struct device *dev)
 {
 	struct rsnd_priv *priv = dev_get_drvdata(dev);
 
@@ -2076,13 +2076,13 @@ static int __maybe_unused rsnd_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rsnd_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(rsnd_suspend, rsnd_resume)
+	SYSTEM_SLEEP_PM_OPS(rsnd_suspend, rsnd_resume)
 };
 
 static struct platform_driver rsnd_driver = {
 	.driver	= {
 		.name	= "rcar_sound",
-		.pm	= &rsnd_pm_ops,
+		.pm	= pm_ptr(&rsnd_pm_ops),
 		.of_match_table = rsnd_of_match,
 	},
 	.probe		= rsnd_probe,
-- 
2.43.0

