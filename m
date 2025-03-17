Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D68E22FE06
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205587; cv=none; b=t6hWvHNP4fc3Wqs/FyDEnHgLwLu2WauUKbyp4TkFzIKrrlrllOgd2smuU9cJiHeo7HHMB+jX0VBHVprF9z8cIVsecIUM21KDqx0J07KVBhS6aphDORt/72mZuGB44nUIcoTNx1LqaPORGkf9So2+2M105J/VEzGXx1FHAUcaOEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205587; c=relaxed/simple;
	bh=8LRporsHito/33pLv3lQATRo8Df/6O4qAq3vo59ubiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+6qQuX1YLpwJ0rcDL/mqxAoO7+3VNuzJiSqcnTmlWBeonBpGXO8gYqZmfrn5v1UCox0wcpu/L5FCNdgdQNvflRWqvRBchRhIp3k0qLbFKkeGF00ekp1sIGHufi+A8iMoS0FuEIg8o91n3xw2XGV6fj0MJ1hbIYjdeY/jYP8/3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VqkGA+WU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uAlTZz1r; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VqkGA+WU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uAlTZz1r; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VqkGA+WU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uAlTZz1r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VqkGA+WU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uAlTZz1r"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 001AF22107;
	Mon, 17 Mar 2025 09:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5eNFSFjUX/siCv5xJzUGxQ0xFJsH9MpwXfm4dJzoXcQ=;
	b=VqkGA+WUIGw+KJMWEiRhtw3E8ro+TZfGyp9b1DBEhjxWeIDAwd31aWm5ge+WMcwlVq95lB
	YK7CMXztZss1dFyK2+TvjX0ZRtYKSmwRb8TUm0DGR85qfeKJb28qjdsqaNNVDjVewi7gUy
	7X8+e6T7OFfCHVkrUdLEfv0pl/r+mJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205386;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5eNFSFjUX/siCv5xJzUGxQ0xFJsH9MpwXfm4dJzoXcQ=;
	b=uAlTZz1reUxDBfXM96FUeaWe7X27X4ltSLgIJDliwOW//alQ/wUzkA+dBemNp8/9BMHPE9
	XsHCb9f/+jJ1uNCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5eNFSFjUX/siCv5xJzUGxQ0xFJsH9MpwXfm4dJzoXcQ=;
	b=VqkGA+WUIGw+KJMWEiRhtw3E8ro+TZfGyp9b1DBEhjxWeIDAwd31aWm5ge+WMcwlVq95lB
	YK7CMXztZss1dFyK2+TvjX0ZRtYKSmwRb8TUm0DGR85qfeKJb28qjdsqaNNVDjVewi7gUy
	7X8+e6T7OFfCHVkrUdLEfv0pl/r+mJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205386;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5eNFSFjUX/siCv5xJzUGxQ0xFJsH9MpwXfm4dJzoXcQ=;
	b=uAlTZz1reUxDBfXM96FUeaWe7X27X4ltSLgIJDliwOW//alQ/wUzkA+dBemNp8/9BMHPE9
	XsHCb9f/+jJ1uNCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D1E0113A2C;
	Mon, 17 Mar 2025 09:56:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IB3rMcnx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 72/88] ASoC: mediatek: mt8365: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:55:34 +0100
Message-ID: <20250317095603.20073-73-tiwai@suse.de>
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
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us to drop ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index 743b46572144..10793bbe9275 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -1957,7 +1957,7 @@ static irqreturn_t mt8365_afe_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int __maybe_unused mt8365_afe_runtime_suspend(struct device *dev)
+static int mt8365_afe_runtime_suspend(struct device *dev)
 {
 	return 0;
 }
@@ -1967,7 +1967,7 @@ static int mt8365_afe_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mt8365_afe_suspend(struct device *dev)
+static int mt8365_afe_suspend(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
 	struct regmap *regmap = afe->regmap;
@@ -1989,7 +1989,7 @@ static int __maybe_unused mt8365_afe_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mt8365_afe_resume(struct device *dev)
+static int mt8365_afe_resume(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
 	struct regmap *regmap = afe->regmap;
@@ -2009,7 +2009,7 @@ static int __maybe_unused mt8365_afe_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mt8365_afe_dev_runtime_suspend(struct device *dev)
+static int mt8365_afe_dev_runtime_suspend(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
 
@@ -2021,7 +2021,7 @@ static int __maybe_unused mt8365_afe_dev_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mt8365_afe_dev_runtime_resume(struct device *dev)
+static int mt8365_afe_dev_runtime_resume(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
 
@@ -2250,17 +2250,16 @@ static const struct of_device_id mt8365_afe_pcm_dt_match[] = {
 MODULE_DEVICE_TABLE(of, mt8365_afe_pcm_dt_match);
 
 static const struct dev_pm_ops mt8365_afe_pm_ops = {
-	SET_RUNTIME_PM_OPS(mt8365_afe_dev_runtime_suspend,
-			   mt8365_afe_dev_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(mt8365_afe_suspend,
-				mt8365_afe_resume)
+	RUNTIME_PM_OPS(mt8365_afe_dev_runtime_suspend,
+		       mt8365_afe_dev_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(mt8365_afe_suspend, mt8365_afe_resume)
 };
 
 static struct platform_driver mt8365_afe_pcm_driver = {
 	.driver = {
 		   .name = "mt8365-afe-pcm",
 		   .of_match_table = mt8365_afe_pcm_dt_match,
-		   .pm = &mt8365_afe_pm_ops,
+		   .pm = pm_ptr(&mt8365_afe_pm_ops),
 	},
 	.probe = mt8365_afe_pcm_dev_probe,
 	.remove = mt8365_afe_pcm_dev_remove,
-- 
2.43.0

