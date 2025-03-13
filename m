Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60481DB125
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887881; cv=none; b=MEAnSdwYx0r6rW/Q5+rVxNxrvuLVpGYvImclcG79FRIsBQVOhk+hqbhQ9g71vvM9BQvO68n1UkE74wHNmX/ZLkvRaYaCRVMkBMOOkj23gOgIth0X+MEmE7zqvY0reIgk37/DX1M36kjmR2DCsJxotbrk6GDaCAEI403N0LScCxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887881; c=relaxed/simple;
	bh=SkeisvqmKDl4E785j1pZdfWTXR9dfWWxqALTMIz4kmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MswblPiXKeC3oc5WMx7ON649qpV/I9hHoYScOC8JQfcUvmW4BmY+t/d7J1kdKARjedCZTdZGVM0i7MnIIvhjg6uDbZhDOIQ9t3JwTLOmIzU6BQtPM6IER/m/Bpgt7xFHaVr5BPGte/6FSjqadQd1fXTJzKKNmydeoGa/NFpyl8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Iur2S6hf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AOOMPf7Z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Iur2S6hf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AOOMPf7Z; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Iur2S6hf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AOOMPf7Z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Iur2S6hf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AOOMPf7Z"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AD6FF211EB;
	Thu, 13 Mar 2025 17:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YiLFY1pSPHECq3tXsO3uKYKb1Dlhs/zDOF66tuH+oi0=;
	b=Iur2S6hfibOTE+HQXVVeuilYs1lYr7IhvQ6K7MO4TjHe9QQh5pyp2R/0CFEtPx93tr4lcN
	KhLFfT0DekwdnlZNCcVHCPi3vJACnJBX6KJ3c+tuRkFOBd/MC2yxHCT2VpMBqHpJQs0Egn
	w1rTIR56i21x/Gc/togLBlp2Sya+eBs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YiLFY1pSPHECq3tXsO3uKYKb1Dlhs/zDOF66tuH+oi0=;
	b=AOOMPf7ZioszGrryiqYoWbNdelfqBTteNrPNhHM5DXc0WjHCzU2RT6D3XA+4Fr8dK4KySC
	ecAC8UvMkwj97dBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Iur2S6hf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AOOMPf7Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YiLFY1pSPHECq3tXsO3uKYKb1Dlhs/zDOF66tuH+oi0=;
	b=Iur2S6hfibOTE+HQXVVeuilYs1lYr7IhvQ6K7MO4TjHe9QQh5pyp2R/0CFEtPx93tr4lcN
	KhLFfT0DekwdnlZNCcVHCPi3vJACnJBX6KJ3c+tuRkFOBd/MC2yxHCT2VpMBqHpJQs0Egn
	w1rTIR56i21x/Gc/togLBlp2Sya+eBs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YiLFY1pSPHECq3tXsO3uKYKb1Dlhs/zDOF66tuH+oi0=;
	b=AOOMPf7ZioszGrryiqYoWbNdelfqBTteNrPNhHM5DXc0WjHCzU2RT6D3XA+4Fr8dK4KySC
	ecAC8UvMkwj97dBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 881F3139D2;
	Thu, 13 Mar 2025 17:42:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YJT1H+sY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 55/89] ASoC: wm8994: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Thu, 13 Mar 2025 18:41:00 +0100
Message-ID: <20250313174139.29942-56-tiwai@suse.de>
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
X-Rspamd-Queue-Id: AD6FF211EB
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
SET_SYSTEM_SLEEP_PM_OPS() together with pm_ptr(), which allows us
superfluous CONFIG_PM_SLEEP ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
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

