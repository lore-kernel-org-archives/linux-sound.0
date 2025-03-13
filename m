Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CC518F2FC
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887832; cv=none; b=qpvkUm69/yu+VYTNgxHgE8i2xLU0njve/EWsLJ0+0KusqozMCZwoKBVQbpQacybqUCKF3NnsnvkJYP0RCn0Z5JKRseeoHywnu/byCcNeVP4/TyKab+LAx3wbuwgeLi0LlFS2DJR3mfYSByGI04cTpQd57P0QcSFlKfibfnRoDWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887832; c=relaxed/simple;
	bh=lGQm0vu2MPU6v2OpUJEgZRifvyjxdBZxqWgPe6Y/rp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YYkp6Q/xa/T4gMHgpAzC70gNzmGgfigBNFLIKfojtUlz51vZWyvZbnbvvxaBTu+xzCW4nEusKYJb1HolB3RdTSVdOTNXQ9rWwU312Y9fGTxsgT8zBrqTHaPCaEM9qotdfvbPKrtpN6WhN2BL4Oxdu1R7fIsswu9wsyqPi4PaSwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ISImHjU/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jKyWT/X/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ISImHjU/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jKyWT/X/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ISImHjU/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jKyWT/X/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ISImHjU/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jKyWT/X/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 58AF7211E3;
	Thu, 13 Mar 2025 17:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rT0bfTJcPw2ieHNn+Vp7icDddPRsUCiOnr5XOu7kLbM=;
	b=ISImHjU/Jwn0eqNXFrSOj6Kano0oEBHzcPeX+5UaWCqqw6BoWCPdplxtC4qTwcqhJ0VKfm
	/2D+uhz8XKrwB7OxdJYZgi5f0PamUDoAzUmKB316MopaC4iwEruTz6QXVL6FmZ04Rr4/qP
	sfTKFrYFbO/3+UhOJPPz28q5roUMw3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rT0bfTJcPw2ieHNn+Vp7icDddPRsUCiOnr5XOu7kLbM=;
	b=jKyWT/X/xUQ//u8El4jDhW+kUvRMVrVN/Bf6TOUIgxFiqRoj8Kh5fBMJIeFy8peVdYrtgs
	Say8Swg2CCCb2iAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ISImHjU/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="jKyWT/X/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rT0bfTJcPw2ieHNn+Vp7icDddPRsUCiOnr5XOu7kLbM=;
	b=ISImHjU/Jwn0eqNXFrSOj6Kano0oEBHzcPeX+5UaWCqqw6BoWCPdplxtC4qTwcqhJ0VKfm
	/2D+uhz8XKrwB7OxdJYZgi5f0PamUDoAzUmKB316MopaC4iwEruTz6QXVL6FmZ04Rr4/qP
	sfTKFrYFbO/3+UhOJPPz28q5roUMw3E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rT0bfTJcPw2ieHNn+Vp7icDddPRsUCiOnr5XOu7kLbM=;
	b=jKyWT/X/xUQ//u8El4jDhW+kUvRMVrVN/Bf6TOUIgxFiqRoj8Kh5fBMJIeFy8peVdYrtgs
	Say8Swg2CCCb2iAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 316CE137BA;
	Thu, 13 Mar 2025 17:42:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EMHOCugY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 37/89] ASoC: rt5682-sdw: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:40:42 +0100
Message-ID: <20250313174139.29942-38-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 58AF7211E3
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt5682-sdw.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 5edf11e136b4..aa229894129b 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -709,7 +709,7 @@ static const struct sdw_device_id rt5682_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt5682_id);
 
-static int __maybe_unused rt5682_dev_suspend(struct device *dev)
+static int rt5682_dev_suspend(struct device *dev)
 {
 	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
 
@@ -725,7 +725,7 @@ static int __maybe_unused rt5682_dev_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt5682_dev_system_suspend(struct device *dev)
+static int rt5682_dev_system_suspend(struct device *dev)
 {
 	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
@@ -753,7 +753,7 @@ static int __maybe_unused rt5682_dev_system_suspend(struct device *dev)
 	return rt5682_dev_suspend(dev);
 }
 
-static int __maybe_unused rt5682_dev_resume(struct device *dev)
+static int rt5682_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
@@ -791,14 +791,14 @@ static int __maybe_unused rt5682_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt5682_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt5682_dev_system_suspend, rt5682_dev_resume)
-	SET_RUNTIME_PM_OPS(rt5682_dev_suspend, rt5682_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt5682_dev_system_suspend, rt5682_dev_resume)
+	RUNTIME_PM_OPS(rt5682_dev_suspend, rt5682_dev_resume, NULL)
 };
 
 static struct sdw_driver rt5682_sdw_driver = {
 	.driver = {
 		.name = "rt5682",
-		.pm = &rt5682_pm,
+		.pm = pm_ptr(&rt5682_pm),
 	},
 	.probe = rt5682_sdw_probe,
 	.remove = rt5682_sdw_remove,
-- 
2.43.0

