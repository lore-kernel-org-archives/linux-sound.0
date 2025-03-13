Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57581C863F
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887863; cv=none; b=MCPC25FQRiAeDqFBihHOdHuk1slOP/HCIyjwjpYWNQM5k3Bn8qJI3CQUVrRs/LpwAxEKJ3pTf7haOzm27YKl3u/ROAxLQGpaf43/NQ/5RuXXYdmtkWigTfchxlNkAK1rI29ud3BTjWV307AClXzO+ghG9850wihfMzaMfDaWx5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887863; c=relaxed/simple;
	bh=JeEmFGWXcr1ksjTRIB5NIAk1cCx5Om14dTFVXMjcUAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrgRSRgEC1W2B8dQhrhp8bQ5lLyAPQ7VLN8g51oyW5uE8jthBj8gYklX9ui7vQheNPUqj5qfb4N3e2VOHMdts6Z7dRMRboWBH6B0sdQvsPSdKt69fVbb7bktpdZW92CGAaz30++gzWpOjZHg77oio+SscAxY7IJ5S1z3aeq1pJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gi76Sc5K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pQwPdSxs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z0BBW9QI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6FUFIlqd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gi76Sc5K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pQwPdSxs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z0BBW9QI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6FUFIlqd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E8B8A211D3;
	Thu, 13 Mar 2025 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3wUhDYMbL7wBRFASjlxY65pJ3wIBOqfHfUl3NPhKOs=;
	b=gi76Sc5Kg8th48TmQ/2GgzvS+uRjhQYMn2PQZNyVEZ/n+jlrNy8tOhMbAduIVwKjCy7Uym
	pLIiRvL7lksqaUNDwBewnL5eW0jgmuPzEIXYtcNQZ1HuVVLZ0ORKO8WLUB7leKEQEwiA5Z
	2dqSKn3dcqfExhDYV8B1RO4pp2HkI4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3wUhDYMbL7wBRFASjlxY65pJ3wIBOqfHfUl3NPhKOs=;
	b=pQwPdSxsf036km245K/jH5G1R2Dml64qpLMJYpaYOrBMNkyR6IHOkYR5lXVvFHrAH7zBQc
	hI2rERzCE2J8W2CA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Z0BBW9QI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6FUFIlqd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3wUhDYMbL7wBRFASjlxY65pJ3wIBOqfHfUl3NPhKOs=;
	b=Z0BBW9QIr4r+UQnuQfRNIb8PmMiJ3BbWA8531cZZ3RGP7WTduRJZN6PzPltzvz0c4+xesJ
	oGD16z/k+brSUqDPcPcVn1Z/zH+u0/+eck18jnfLWE0z4GmwEgJvGFc052CHvYfjRRYhED
	hLuJ1wNtCiio2eMnFwKYcPhmZPoye2I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3wUhDYMbL7wBRFASjlxY65pJ3wIBOqfHfUl3NPhKOs=;
	b=6FUFIlqdZmDfpKaIx+U2Sk8AX+tBuGhp3/Cg4wlwPRf7K/w+UPe/bf0HJBzyUDnzyVKflg
	9Ar5a4S+fKIMDpCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C1ADD139D2;
	Thu, 13 Mar 2025 17:42:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iF8DLuoY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 51/89] ASoC: wm2200: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:56 +0100
Message-ID: <20250313174139.29942-52-tiwai@suse.de>
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
X-Rspamd-Queue-Id: E8B8A211D3
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
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes and superfluous CONFIG_PM ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wm2200.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm2200.c b/sound/soc/codecs/wm2200.c
index 7ed4ac5cce3c..87418c838ca0 100644
--- a/sound/soc/codecs/wm2200.c
+++ b/sound/soc/codecs/wm2200.c
@@ -2429,7 +2429,6 @@ static void wm2200_i2c_remove(struct i2c_client *i2c)
 			       wm2200->core_supplies);
 }
 
-#ifdef CONFIG_PM
 static int wm2200_runtime_suspend(struct device *dev)
 {
 	struct wm2200_priv *wm2200 = dev_get_drvdata(dev);
@@ -2466,11 +2465,9 @@ static int wm2200_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops wm2200_pm = {
-	SET_RUNTIME_PM_OPS(wm2200_runtime_suspend, wm2200_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(wm2200_runtime_suspend, wm2200_runtime_resume, NULL)
 };
 
 static const struct i2c_device_id wm2200_i2c_id[] = {
@@ -2482,7 +2479,7 @@ MODULE_DEVICE_TABLE(i2c, wm2200_i2c_id);
 static struct i2c_driver wm2200_i2c_driver = {
 	.driver = {
 		.name = "wm2200",
-		.pm = &wm2200_pm,
+		.pm = pm_ptr(&wm2200_pm),
 	},
 	.probe =    wm2200_i2c_probe,
 	.remove =   wm2200_i2c_remove,
-- 
2.43.0

