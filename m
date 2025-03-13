Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C3B1DE3BC
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887869; cv=none; b=YSKbwpbiy4CKuwT9buNWtVLsMg8RVgnPiTLWwjAPz4K3iHTyvhYrt5d45Vp4XkDCfaA1TwXNwrZxQFvf95SiZQo/3XD5T1AuD0ERqxd00aXmGZ2t4Vq5F7fP1Ew2aQoZVY3JUjSSgSxouRcUHfSe+KxlLCvxplXxyLgPYQV7nq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887869; c=relaxed/simple;
	bh=bnU75/92jNpYlr6zkuNzC4Ex5MItOCOEkWYXOZ2bL5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=an7gTZxMXFv9TH34jj5nPDQBwm8VKff4SC8nHhi1HzWxAsJROus6fx69dY0xD4/P19qwkH+TPTzaVAZnWTXT/HN8S2o/+frODHU7O3ItYdWBX2aWv0fGigm9GryTneNs1nJrghKckmh+HL5mQVGZXNXnMAhWJtHrU54f7+lzkrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mb2qcGee; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z8EGpef1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mb2qcGee; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z8EGpef1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mb2qcGee";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z8EGpef1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mb2qcGee";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z8EGpef1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 251E9211E6;
	Thu, 13 Mar 2025 17:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cca5eFUhI/uPp64PuEjeeyvRJ0804EnNFKJfsNxe3xM=;
	b=mb2qcGeeaDIBx1EHFHQeKtoLCLTgT+hjjL/bL+UOXsBo/E6uGY8Z9sHd788B3SFiBqtNbZ
	igWWm7JIL1tmNnwrS2FNi1jD+fohiFtzXlTLgQ2ZOzi9FnGe3/0TInpkqJZfY/SzLI6sFD
	ORmkBYRUdvW+xfmuD8X5RYWAqfVFJ5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cca5eFUhI/uPp64PuEjeeyvRJ0804EnNFKJfsNxe3xM=;
	b=Z8EGpef1//PIsativ42FeoouyVAWEnQtKxU5DYk8FOQ0K6VMtBdxtMcXLSnkmgeJJ+a9yu
	rMCfnd+Q08OYmYBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mb2qcGee;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Z8EGpef1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cca5eFUhI/uPp64PuEjeeyvRJ0804EnNFKJfsNxe3xM=;
	b=mb2qcGeeaDIBx1EHFHQeKtoLCLTgT+hjjL/bL+UOXsBo/E6uGY8Z9sHd788B3SFiBqtNbZ
	igWWm7JIL1tmNnwrS2FNi1jD+fohiFtzXlTLgQ2ZOzi9FnGe3/0TInpkqJZfY/SzLI6sFD
	ORmkBYRUdvW+xfmuD8X5RYWAqfVFJ5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cca5eFUhI/uPp64PuEjeeyvRJ0804EnNFKJfsNxe3xM=;
	b=Z8EGpef1//PIsativ42FeoouyVAWEnQtKxU5DYk8FOQ0K6VMtBdxtMcXLSnkmgeJJ+a9yu
	rMCfnd+Q08OYmYBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EED17137BA;
	Thu, 13 Mar 2025 17:42:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6E3rOOoY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 52/89] ASoC: wm5100: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:57 +0100
Message-ID: <20250313174139.29942-53-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 251E9211E6
X-Spam-Score: -3.01
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping superfluous CONFIG_PM
ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wm5100.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index dfeec55159a6..d9e5762324df 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -2625,7 +2625,6 @@ static void wm5100_i2c_remove(struct i2c_client *i2c)
 	gpiod_set_value_cansleep(wm5100->ldo_ena, 0);
 }
 
-#ifdef CONFIG_PM
 static int wm5100_runtime_suspend(struct device *dev)
 {
 	struct wm5100_priv *wm5100 = dev_get_drvdata(dev);
@@ -2662,11 +2661,9 @@ static int wm5100_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops wm5100_pm = {
-	SET_RUNTIME_PM_OPS(wm5100_runtime_suspend, wm5100_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(wm5100_runtime_suspend, wm5100_runtime_resume, NULL)
 };
 
 static const struct i2c_device_id wm5100_i2c_id[] = {
@@ -2678,7 +2675,7 @@ MODULE_DEVICE_TABLE(i2c, wm5100_i2c_id);
 static struct i2c_driver wm5100_i2c_driver = {
 	.driver = {
 		.name = "wm5100",
-		.pm = &wm5100_pm,
+		.pm = pm_ptr(&wm5100_pm),
 	},
 	.probe =    wm5100_i2c_probe,
 	.remove =   wm5100_i2c_remove,
-- 
2.43.0

