Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461A5250EC
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741885661; cv=none; b=B9MMSaKijpCIEcwXLZHZwguadXPDVSI6034367hpZ2xePZB8qpgF/p19AGklfOHlY/xeaQ9yi809XVYzZ8JzQuKcd43RO/02CEJV5b4j2QKPtyjiirF23H1iG3wHI8jD1PFtwJhvRbJ5HNGNlSG9zcjUm965yjbO/i4AJ7zVsHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741885661; c=relaxed/simple;
	bh=VfccZbqgbqHU5PyPyodD6QxWoPnbVisKf7xDo9h2wfk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USqTv5wyMOx7Wjhm7hxbAoH3X3yIyDaGIV9O2i3QSUXiq2di5ikbONW2zmPkruoMGa++eGoYAYIG63FHeQTeROqQSLMp9UkL93eP2WZzdG/zIjz2TEYU/sfz6NA/+Dp6jR76qciOQSUXWcP37V1s/wuEeBHlCiRqjmDEXHFVbcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SEaNGgad; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VVRQsO3b; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SEaNGgad; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VVRQsO3b; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SEaNGgad";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VVRQsO3b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SEaNGgad";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VVRQsO3b"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 324C91F457;
	Thu, 13 Mar 2025 17:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0tIdmW8IFTW50t8F1isJIl1dsKmb8Cju1daVpQl1gys=;
	b=SEaNGgadBSYHXspUpNGwAjce7LTQdj5iEaTvLeOHViMv+G4Io7RstS2wCYuTvDmjrjCUY/
	7WUG4rWpGro48GKXI3cYGaktDAsHbFyHDZePgQ2WlIWF1QojMxHBDhSp5hoDWNVJCdmWTO
	5KuipxactEgL3tCuiKCCaPWR+gDyaIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0tIdmW8IFTW50t8F1isJIl1dsKmb8Cju1daVpQl1gys=;
	b=VVRQsO3bYe4ujCJEKBhaKi6ZGoo2yrIQwrXrghjE6UWmU0xosWtjTrZJXx/cX4npcjGqlc
	gnC3uZyTXFQjZqBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SEaNGgad;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VVRQsO3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0tIdmW8IFTW50t8F1isJIl1dsKmb8Cju1daVpQl1gys=;
	b=SEaNGgadBSYHXspUpNGwAjce7LTQdj5iEaTvLeOHViMv+G4Io7RstS2wCYuTvDmjrjCUY/
	7WUG4rWpGro48GKXI3cYGaktDAsHbFyHDZePgQ2WlIWF1QojMxHBDhSp5hoDWNVJCdmWTO
	5KuipxactEgL3tCuiKCCaPWR+gDyaIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0tIdmW8IFTW50t8F1isJIl1dsKmb8Cju1daVpQl1gys=;
	b=VVRQsO3bYe4ujCJEKBhaKi6ZGoo2yrIQwrXrghjE6UWmU0xosWtjTrZJXx/cX4npcjGqlc
	gnC3uZyTXFQjZqBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 14C70139D2;
	Thu, 13 Mar 2025 17:07:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aL/oA9gQ02ciOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:07:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/9] ALSA: ac97: Convert to RUNTIME_PM_OPS() macro
Date: Thu, 13 Mar 2025 18:07:19 +0100
Message-ID: <20250313170731.26943-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313170731.26943-1-tiwai@suse.de>
References: <20250313170731.26943-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 324C91F457
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use a newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which makes CONFIG_PM ifdefs superfluous.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/ac97/bus.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/ac97/bus.c b/sound/ac97/bus.c
index 8dfffdc101a2..47c6787158a7 100644
--- a/sound/ac97/bus.c
+++ b/sound/ac97/bus.c
@@ -387,7 +387,6 @@ void snd_ac97_controller_unregister(struct ac97_controller *ac97_ctrl)
 }
 EXPORT_SYMBOL_GPL(snd_ac97_controller_unregister);
 
-#ifdef CONFIG_PM
 static int ac97_pm_runtime_suspend(struct device *dev)
 {
 	struct ac97_codec_device *codec = to_ac97_device(dev);
@@ -419,7 +418,6 @@ static int ac97_pm_runtime_resume(struct device *dev)
 
 	return pm_generic_runtime_resume(dev);
 }
-#endif /* CONFIG_PM */
 
 static const struct dev_pm_ops ac97_pm = {
 	.suspend	= pm_generic_suspend,
@@ -428,10 +426,7 @@ static const struct dev_pm_ops ac97_pm = {
 	.thaw		= pm_generic_thaw,
 	.poweroff	= pm_generic_poweroff,
 	.restore	= pm_generic_restore,
-	SET_RUNTIME_PM_OPS(
-		ac97_pm_runtime_suspend,
-		ac97_pm_runtime_resume,
-		NULL)
+	RUNTIME_PM_OPS(ac97_pm_runtime_suspend, ac97_pm_runtime_resume, NULL)
 };
 
 static int ac97_get_enable_clk(struct ac97_codec_device *adev)
@@ -535,7 +530,7 @@ const struct bus_type ac97_bus_type = {
 	.name		= "ac97bus",
 	.dev_groups	= ac97_dev_groups,
 	.match		= ac97_bus_match,
-	.pm		= &ac97_pm,
+	.pm		= pm_ptr(&ac97_pm),
 	.probe		= ac97_bus_probe,
 	.remove		= ac97_bus_remove,
 };
-- 
2.43.0

