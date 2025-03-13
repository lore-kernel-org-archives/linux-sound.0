Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1021DB13E
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887888; cv=none; b=D2XyenYxmGsczgehr/7GZgcF6Ek6ydXiMH1AjAi/l01XYlqhZX22haJy7Dhusa2SZKh2o6TGs792AUWgt/g6yfm2DGwTHrasPkabRW5nwmlfalWjHUews+/aDKWr/MHH+9ptdEMvnjKRBA48vdrSXPxID7ox9+c75hHguGGsuwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887888; c=relaxed/simple;
	bh=/tBhmf3Ovdo4VEPSDkJe4Y9L/HdJHDsJDQm8KoALQWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cCwzQATJmsd7SOrPhltErFeSwRgfx/KVyT3v9fCyHuFTUFj/pPwqvvqMQ78gYfZdEQhoRUVq2mMPF9sAm2pU8Vr2wNg94OZ1MzqXZRsNOkY4c4UbEGsfokywaWRlZzwl/5nN73XjP0mQoid8yt52uKYDc1MrA43mUD+k1DK51uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dEoFDuA+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+hAE0Ypu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dEoFDuA+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+hAE0Ypu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dEoFDuA+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+hAE0Ypu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dEoFDuA+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+hAE0Ypu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8085A1F7A9;
	Thu, 13 Mar 2025 17:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mz4PcbJhYo7DkMxaR2N/QXrTiOXmI1qE0Po9st5Jraw=;
	b=dEoFDuA+k7v+nkKPlcH9yCibmY3OrKG8ZEIFJosal+tydteIP0jE58a2KzR7cWITJDDR3i
	p6gdvLfUSdfRGYNzdhmnI+QrJW4VGMDlhXUO8r2lo+9ANsaQ9FzAmBEqBMgD7OyazyXVdH
	4bRoEG9r6B4OL2Tfn6d/gqcOJpM+1Yk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mz4PcbJhYo7DkMxaR2N/QXrTiOXmI1qE0Po9st5Jraw=;
	b=+hAE0YpuuhYUpQhRdzmm3UxVYYzUaVt/vF74qOPDDjJQiAu8CkUor0kqhKrSeJxr/8MH07
	lLGNZ5BRNMtlwEBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dEoFDuA+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+hAE0Ypu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mz4PcbJhYo7DkMxaR2N/QXrTiOXmI1qE0Po9st5Jraw=;
	b=dEoFDuA+k7v+nkKPlcH9yCibmY3OrKG8ZEIFJosal+tydteIP0jE58a2KzR7cWITJDDR3i
	p6gdvLfUSdfRGYNzdhmnI+QrJW4VGMDlhXUO8r2lo+9ANsaQ9FzAmBEqBMgD7OyazyXVdH
	4bRoEG9r6B4OL2Tfn6d/gqcOJpM+1Yk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mz4PcbJhYo7DkMxaR2N/QXrTiOXmI1qE0Po9st5Jraw=;
	b=+hAE0YpuuhYUpQhRdzmm3UxVYYzUaVt/vF74qOPDDjJQiAu8CkUor0kqhKrSeJxr/8MH07
	lLGNZ5BRNMtlwEBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5ACD9137BA;
	Thu, 13 Mar 2025 17:42:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OHviFOsY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 54/89] ASoC: wm8962: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:40:59 +0100
Message-ID: <20250313174139.29942-55-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 8085A1F7A9
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
with pm_ptr(), which allows us dropping superfluous CONFIG_PM ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wm8962.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 0aaac24eeb5a..68f746626c33 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3850,7 +3850,6 @@ static void wm8962_i2c_remove(struct i2c_client *client)
 	pm_runtime_disable(&client->dev);
 }
 
-#ifdef CONFIG_PM
 static int wm8962_runtime_resume(struct device *dev)
 {
 	struct wm8962_priv *wm8962 = dev_get_drvdata(dev);
@@ -3930,11 +3929,10 @@ static int wm8962_runtime_suspend(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops wm8962_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(wm8962_runtime_suspend, wm8962_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	RUNTIME_PM_OPS(wm8962_runtime_suspend, wm8962_runtime_resume, NULL)
 };
 
 static const struct i2c_device_id wm8962_i2c_id[] = {
@@ -3953,7 +3951,7 @@ static struct i2c_driver wm8962_i2c_driver = {
 	.driver = {
 		.name = "wm8962",
 		.of_match_table = wm8962_of_match,
-		.pm = &wm8962_pm,
+		.pm = pm_ptr(&wm8962_pm),
 	},
 	.probe =    wm8962_i2c_probe,
 	.remove =   wm8962_i2c_remove,
-- 
2.43.0

