Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE61322ACEF
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205467; cv=none; b=paKDuydHUtbkPpyBk2jbugJdu/m7+poppTrroII5bwAyHqLOj4v2mXaA3VN7XMzMDZoi6yuvDQeGDrrmOnF/5+rMt6Hx8wYjH994jfndQNqZQ7ia/Krsv9P2ph3Oa+dm5k0aef+5laJhG7k0uSvvZsHQK8LsmeDHnlF6adIkbHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205467; c=relaxed/simple;
	bh=SGiu7wyxmA0vVffRNTaOq7+hyShILm2BlmSJSR6MsSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ry9JwJXLKb66Pv3VPS3M1nc7tQjg0ZlBM/mJYfJok5kmXgRW5oV0Npe33uxlg53r1yEw0BaB9j/bHcpNtUtgsT8OrFMiikyRYncjstdYxwfYi1AXn/jF3UKpmHslF7lXImlakD3UaQoGIJ6MPFNTjQmPiQY1OkGP4oHX6kyKsOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4E1DE21E85;
	Mon, 17 Mar 2025 09:56:19 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1ECA3132CF;
	Mon, 17 Mar 2025 09:56:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OEYwBsPx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 35/88] ASoC: rt5645: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:57 +0100
Message-ID: <20250317095603.20073-36-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 4E1DE21E85
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
SET_SYSTEM_SLEEP_PM_OPS() together with pm_ptr(), which allows us
dropping ugly __maybe_unused attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt5645.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 2680bcce4c95..343e3bcef0ca 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -4314,7 +4314,7 @@ static void rt5645_i2c_shutdown(struct i2c_client *i2c)
 		gpiod_set_value(rt5645->gpiod_cbj_sleeve, 0);
 }
 
-static int __maybe_unused rt5645_sys_suspend(struct device *dev)
+static int rt5645_sys_suspend(struct device *dev)
 {
 	struct rt5645_priv *rt5645 = dev_get_drvdata(dev);
 
@@ -4327,7 +4327,7 @@ static int __maybe_unused rt5645_sys_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt5645_sys_resume(struct device *dev)
+static int rt5645_sys_resume(struct device *dev)
 {
 	struct rt5645_priv *rt5645 = dev_get_drvdata(dev);
 
@@ -4342,7 +4342,7 @@ static int __maybe_unused rt5645_sys_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt5645_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt5645_sys_suspend, rt5645_sys_resume)
+	SYSTEM_SLEEP_PM_OPS(rt5645_sys_suspend, rt5645_sys_resume)
 };
 
 static struct i2c_driver rt5645_i2c_driver = {
@@ -4350,7 +4350,7 @@ static struct i2c_driver rt5645_i2c_driver = {
 		.name = "rt5645",
 		.of_match_table = of_match_ptr(rt5645_of_match),
 		.acpi_match_table = ACPI_PTR(rt5645_acpi_match),
-		.pm = &rt5645_pm,
+		.pm = pm_ptr(&rt5645_pm),
 	},
 	.probe = rt5645_i2c_probe,
 	.remove = rt5645_i2c_remove,
-- 
2.43.0

