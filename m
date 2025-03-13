Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0C01B3F3D
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887839; cv=none; b=C4nYoMSg/Ila0y5oIfAnBnKTS+840KQbsS8wVsSF1ML3omjV50XRIbMic6yZuUoA1wP694r0csC9gcbBfQNVCc/PJjiMhLMY3qRnz5DQpZ/jG6da64eQC/sK4A1kRYzvyl/9Zm0G5HQ/gnMEy6yfeMpla4yBTH6xT1+WEyiT+H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887839; c=relaxed/simple;
	bh=gYBnuLRuaLh9jFY6jeMzAeSTB1bIkzp1Jnps1FLM2gE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c40bA/uwy5Az6IrXACgnQOy7FckhZekg7/4MhxtUgive07Hj0Bhoctzhtl7fPhV7JP/maznECDXFUNg6hsmqugGADEEE9VBgsJ0BWNj3G+cIXiUDsthBPTI2iiuEWlN6fSpB06PJiRk39dk099v/S0o5gcnUFGS1jJe74xh2fQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yWxdXje3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nE9XNFCN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yWxdXje3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nE9XNFCN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yWxdXje3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nE9XNFCN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yWxdXje3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nE9XNFCN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E131A1F76B;
	Thu, 13 Mar 2025 17:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5S5xtFw62rzQ3TnIe/iZpBMxpbkcueUfsxmwKmq4R0=;
	b=yWxdXje3OfF4IjVxU+I/DPyGohPnY/Gd7hJazbZ0u9OFVO3y2CF1HAtq8FXTPbxClbZxP0
	CgE688+R5s1mOGwaYwZy+H1Waob+HmHtJT18H9E/AgdQn1yU/7zDPG2ouKM6kZDLoU6TLk
	z6YbhHPoWEXTOGfRh4qqJXoHYbgMcUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5S5xtFw62rzQ3TnIe/iZpBMxpbkcueUfsxmwKmq4R0=;
	b=nE9XNFCNxkFLMb2pKp5B1cBEC26E+MxCNxI0YKg+VqHmqCXrF9h2XYJW46L5ukEVWPODwv
	sL2vcKBBr6u7v4AQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5S5xtFw62rzQ3TnIe/iZpBMxpbkcueUfsxmwKmq4R0=;
	b=yWxdXje3OfF4IjVxU+I/DPyGohPnY/Gd7hJazbZ0u9OFVO3y2CF1HAtq8FXTPbxClbZxP0
	CgE688+R5s1mOGwaYwZy+H1Waob+HmHtJT18H9E/AgdQn1yU/7zDPG2ouKM6kZDLoU6TLk
	z6YbhHPoWEXTOGfRh4qqJXoHYbgMcUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5S5xtFw62rzQ3TnIe/iZpBMxpbkcueUfsxmwKmq4R0=;
	b=nE9XNFCNxkFLMb2pKp5B1cBEC26E+MxCNxI0YKg+VqHmqCXrF9h2XYJW46L5ukEVWPODwv
	sL2vcKBBr6u7v4AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA8D6139D2;
	Thu, 13 Mar 2025 17:42:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GKs9LOgY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 40/89] ASoC: rt712: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:40:45 +0100
Message-ID: <20250313174139.29942-41-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313174139.29942-1-tiwai@suse.de>
References: <20250313174139.29942-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt712-sdca-dmic.c | 12 ++++++------
 sound/soc/codecs/rt712-sdca-sdw.c  | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-dmic.c b/sound/soc/codecs/rt712-sdca-dmic.c
index ee5435f3a80a..db011da63bd9 100644
--- a/sound/soc/codecs/rt712-sdca-dmic.c
+++ b/sound/soc/codecs/rt712-sdca-dmic.c
@@ -884,7 +884,7 @@ static const struct sdw_device_id rt712_sdca_dmic_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt712_sdca_dmic_id);
 
-static int __maybe_unused rt712_sdca_dmic_dev_suspend(struct device *dev)
+static int rt712_sdca_dmic_dev_suspend(struct device *dev)
 {
 	struct rt712_sdca_dmic_priv *rt712 = dev_get_drvdata(dev);
 
@@ -897,7 +897,7 @@ static int __maybe_unused rt712_sdca_dmic_dev_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt712_sdca_dmic_dev_system_suspend(struct device *dev)
+static int rt712_sdca_dmic_dev_system_suspend(struct device *dev)
 {
 	struct rt712_sdca_dmic_priv *rt712_sdca = dev_get_drvdata(dev);
 
@@ -909,7 +909,7 @@ static int __maybe_unused rt712_sdca_dmic_dev_system_suspend(struct device *dev)
 
 #define RT712_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt712_sdca_dmic_dev_resume(struct device *dev)
+static int rt712_sdca_dmic_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt712_sdca_dmic_priv *rt712 = dev_get_drvdata(dev);
@@ -941,8 +941,8 @@ static int __maybe_unused rt712_sdca_dmic_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt712_sdca_dmic_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt712_sdca_dmic_dev_system_suspend, rt712_sdca_dmic_dev_resume)
-	SET_RUNTIME_PM_OPS(rt712_sdca_dmic_dev_suspend, rt712_sdca_dmic_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt712_sdca_dmic_dev_system_suspend, rt712_sdca_dmic_dev_resume)
+	RUNTIME_PM_OPS(rt712_sdca_dmic_dev_suspend, rt712_sdca_dmic_dev_resume, NULL)
 };
 
 
@@ -978,7 +978,7 @@ static int rt712_sdca_dmic_sdw_remove(struct sdw_slave *slave)
 static struct sdw_driver rt712_sdca_dmic_sdw_driver = {
 	.driver = {
 		.name = "rt712-sdca-dmic",
-		.pm = &rt712_sdca_dmic_pm,
+		.pm = pm_ptr(&rt712_sdca_dmic_pm),
 	},
 	.probe = rt712_sdca_dmic_sdw_probe,
 	.remove = rt712_sdca_dmic_sdw_remove,
diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index b584a3f854b8..ea07131edfa2 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -400,7 +400,7 @@ static const struct sdw_device_id rt712_sdca_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt712_sdca_id);
 
-static int __maybe_unused rt712_sdca_dev_suspend(struct device *dev)
+static int rt712_sdca_dev_suspend(struct device *dev)
 {
 	struct rt712_sdca_priv *rt712 = dev_get_drvdata(dev);
 
@@ -416,7 +416,7 @@ static int __maybe_unused rt712_sdca_dev_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt712_sdca_dev_system_suspend(struct device *dev)
+static int rt712_sdca_dev_system_suspend(struct device *dev)
 {
 	struct rt712_sdca_priv *rt712_sdca = dev_get_drvdata(dev);
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
@@ -448,7 +448,7 @@ static int __maybe_unused rt712_sdca_dev_system_suspend(struct device *dev)
 
 #define RT712_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt712_sdca_dev_resume(struct device *dev)
+static int rt712_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt712_sdca_priv *rt712 = dev_get_drvdata(dev);
@@ -488,14 +488,14 @@ static int __maybe_unused rt712_sdca_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt712_sdca_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt712_sdca_dev_system_suspend, rt712_sdca_dev_resume)
-	SET_RUNTIME_PM_OPS(rt712_sdca_dev_suspend, rt712_sdca_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt712_sdca_dev_system_suspend, rt712_sdca_dev_resume)
+	RUNTIME_PM_OPS(rt712_sdca_dev_suspend, rt712_sdca_dev_resume, NULL)
 };
 
 static struct sdw_driver rt712_sdca_sdw_driver = {
 	.driver = {
 		.name = "rt712-sdca",
-		.pm = &rt712_sdca_pm,
+		.pm = pm_ptr(&rt712_sdca_pm),
 	},
 	.probe = rt712_sdca_sdw_probe,
 	.remove = rt712_sdca_sdw_remove,
-- 
2.43.0

