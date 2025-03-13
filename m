Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0581BB6BA
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887749; cv=none; b=t57hmJ+NZ6x5hYCEGWqWJqurUznIJXqd97aOQeBGiRXyAX1G04tmsytEqOnGh4qyN2GPJtwPPna9tWJCzMl3maqKHAEFQKnF+oIaMZZUrRqBfQVb1QWuXk+7QO2S9lSHkk3h/xYIsF5rFcDlQoer6CTxuD6uHcHVGpfgIbXPVwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887749; c=relaxed/simple;
	bh=BoZM7YN6tKYi4YeyGSpo1QZG1Qjp0yCo6+N/eD1jziY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUi2/ha1NVQVTcMUCbNyNhSoxerKAHoErDNJmmJW7UqGQzR5olSUWs1cR25yx6KsxOdeUwPbzs2uycsisJb/rE/3RZj3tD9B+uXd3wFeo3vIIS5gPpIurt+BiTCd3JEsdCG0a7mygo3SXB9Mtz/tLn337tAEOKI99wBHy/by2rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ASx0cHpi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VUjuqNsE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ASx0cHpi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VUjuqNsE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ASx0cHpi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VUjuqNsE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ASx0cHpi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VUjuqNsE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DC03C211CC;
	Thu, 13 Mar 2025 17:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yetasosDyatCB4jOnewxF2+DSLyeO5/d2WzABFf97hI=;
	b=ASx0cHpi3WmR1YgBrWoBC04NuvR95lFSCocHM9xxRcqvu66kON4oWOG1QYOJ9ybI4oFFvj
	3WB7oLt/xG4cmEz4DRSz+R68ZLKakRUJx1+PcxdKB9GRH0As5EH+eukH0HPQcAFMUUujvD
	fSVy9vX2YNKKpd8i/1fXzHazJzYPwig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yetasosDyatCB4jOnewxF2+DSLyeO5/d2WzABFf97hI=;
	b=VUjuqNsEamiC5TjDezw9kHmu0QXsFtRz/lzsBSZkGN6IREwmTOVEyoTv7oF5D8bl0l3rpr
	MTK+VpyPqKZxZKDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ASx0cHpi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VUjuqNsE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yetasosDyatCB4jOnewxF2+DSLyeO5/d2WzABFf97hI=;
	b=ASx0cHpi3WmR1YgBrWoBC04NuvR95lFSCocHM9xxRcqvu66kON4oWOG1QYOJ9ybI4oFFvj
	3WB7oLt/xG4cmEz4DRSz+R68ZLKakRUJx1+PcxdKB9GRH0As5EH+eukH0HPQcAFMUUujvD
	fSVy9vX2YNKKpd8i/1fXzHazJzYPwig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yetasosDyatCB4jOnewxF2+DSLyeO5/d2WzABFf97hI=;
	b=VUjuqNsEamiC5TjDezw9kHmu0QXsFtRz/lzsBSZkGN6IREwmTOVEyoTv7oF5D8bl0l3rpr
	MTK+VpyPqKZxZKDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B51F3139D2;
	Thu, 13 Mar 2025 17:41:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0PzkKuMY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 13/89] ASoC: cs42xx8: Convert to EXPORT_GPL_DEV_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:18 +0100
Message-ID: <20250313174139.29942-14-tiwai@suse.de>
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
X-Rspamd-Queue-Id: DC03C211CC
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLi691ga9brjh6qjnnbs1osk4o)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the newer EXPORT_GPL_DEV_PM_OPS() macro together with pm_ptr(),
which allows us to drop superfluous CONFIG_PM ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs42xx8-i2c.c |  2 +-
 sound/soc/codecs/cs42xx8.c     | 10 +++-------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/cs42xx8-i2c.c b/sound/soc/codecs/cs42xx8-i2c.c
index ecaebf8e1c8f..039b3ecb3b9b 100644
--- a/sound/soc/codecs/cs42xx8-i2c.c
+++ b/sound/soc/codecs/cs42xx8-i2c.c
@@ -61,7 +61,7 @@ MODULE_DEVICE_TABLE(i2c, cs42xx8_i2c_id);
 static struct i2c_driver cs42xx8_i2c_driver = {
 	.driver = {
 		.name = "cs42xx8",
-		.pm = &cs42xx8_pm,
+		.pm = pm_ptr(&cs42xx8_pm),
 		.of_match_table = cs42xx8_of_match,
 	},
 	.probe = cs42xx8_i2c_probe,
diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index 8887db653dbf..6a925f3f7137 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -606,7 +606,6 @@ int cs42xx8_probe(struct device *dev, struct regmap *regmap, struct cs42xx8_driv
 }
 EXPORT_SYMBOL_GPL(cs42xx8_probe);
 
-#ifdef CONFIG_PM
 static int cs42xx8_runtime_resume(struct device *dev)
 {
 	struct cs42xx8_priv *cs42xx8 = dev_get_drvdata(dev);
@@ -665,14 +664,11 @@ static int cs42xx8_runtime_suspend(struct device *dev)
 
 	return 0;
 }
-#endif
 
-const struct dev_pm_ops cs42xx8_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(cs42xx8_runtime_suspend, cs42xx8_runtime_resume, NULL)
+EXPORT_GPL_DEV_PM_OPS(cs42xx8_pm) = {
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	RUNTIME_PM_OPS(cs42xx8_runtime_suspend, cs42xx8_runtime_resume, NULL)
 };
-EXPORT_SYMBOL_GPL(cs42xx8_pm);
 
 MODULE_DESCRIPTION("Cirrus Logic CS42448/CS42888 ALSA SoC Codec Driver");
 MODULE_AUTHOR("Freescale Semiconductor, Inc.");
-- 
2.43.0

