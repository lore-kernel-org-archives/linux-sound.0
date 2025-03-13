Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E278E1D86F7
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887864; cv=none; b=rwooOPA96wVrN5bfKasYDYZdV9Bh0di9tWvIhrWbbBShc3upvHE2qSkBdCYG6avTLmKWYduBQf2eUuvQ4kM/+VhIWCYnui7U2amENPvuVFcKwn+jUX4SpdVlOIvGU2sgzea/MYCPFKHvExO3Iqk6WkmJ2tjyvVWtvbncBXPtliI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887864; c=relaxed/simple;
	bh=0HFHK+hM3hI/HJpDWjv+DM/c5ioMHsHDg2XNYGUBoug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ncaFBNj9OaKx1UgH9N+WXNVhBgD4ECYDLaYLGQYnLA/uMEFSfdlsHMCWtDwstOy2ihc1uc/AargcFgaVnnupCzONMKInFexsztuUy//dpv6gxd96WP02aZGEpN1qb8JljquQFmYyzNaxRRVAbLhh3fXq5ez38X/6uiPczDsQr7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Rkj4+Osa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=j7LeHebF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Rkj4+Osa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=j7LeHebF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Rkj4+Osa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j7LeHebF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Rkj4+Osa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j7LeHebF"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AE5401F7A3;
	Thu, 13 Mar 2025 17:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2k6Vt6Q57OliwEE3khZVWGRv7GOozX//jklQTrhxKY=;
	b=Rkj4+Osa2Bhuwgh9gR+pQg8pW0K441yA16D5ploEzu3vm3CMW+1crb/aBnSjQXJDZqurSA
	80Cexoi0adkQNklCkt+ZmVOmmOXWBTkonaEY0TcBoZnn2d1N16Z1YoVleuvNWE9SHjdIJ+
	Y947EXdfIwCaab5vSjO3cNk+1Q0XAwg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887721;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2k6Vt6Q57OliwEE3khZVWGRv7GOozX//jklQTrhxKY=;
	b=j7LeHebFIIWGYp+Sh1oeXXu4oCCB0faI1fVZMN+5TImxu2SwJ+TbFs2T8UDqw8WLEycQCV
	TfKmcNnWA/DE3vAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2k6Vt6Q57OliwEE3khZVWGRv7GOozX//jklQTrhxKY=;
	b=Rkj4+Osa2Bhuwgh9gR+pQg8pW0K441yA16D5ploEzu3vm3CMW+1crb/aBnSjQXJDZqurSA
	80Cexoi0adkQNklCkt+ZmVOmmOXWBTkonaEY0TcBoZnn2d1N16Z1YoVleuvNWE9SHjdIJ+
	Y947EXdfIwCaab5vSjO3cNk+1Q0XAwg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887721;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2k6Vt6Q57OliwEE3khZVWGRv7GOozX//jklQTrhxKY=;
	b=j7LeHebFIIWGYp+Sh1oeXXu4oCCB0faI1fVZMN+5TImxu2SwJ+TbFs2T8UDqw8WLEycQCV
	TfKmcNnWA/DE3vAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8648E139D2;
	Thu, 13 Mar 2025 17:42:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GGguH+kY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 44/89] ASoC: rt9120: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:49 +0100
Message-ID: <20250313174139.29942-45-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt9120.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt9120.c b/sound/soc/codecs/rt9120.c
index 733a7d130a95..97f56af25577 100644
--- a/sound/soc/codecs/rt9120.c
+++ b/sound/soc/codecs/rt9120.c
@@ -590,7 +590,7 @@ static void rt9120_remove(struct i2c_client *i2c)
 	pm_runtime_set_suspended(&i2c->dev);
 }
 
-static int __maybe_unused rt9120_runtime_suspend(struct device *dev)
+static int rt9120_runtime_suspend(struct device *dev)
 {
 	struct rt9120_data *data = dev_get_drvdata(dev);
 
@@ -603,7 +603,7 @@ static int __maybe_unused rt9120_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt9120_runtime_resume(struct device *dev)
+static int rt9120_runtime_resume(struct device *dev)
 {
 	struct rt9120_data *data = dev_get_drvdata(dev);
 
@@ -618,7 +618,7 @@ static int __maybe_unused rt9120_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt9120_pm_ops = {
-	SET_RUNTIME_PM_OPS(rt9120_runtime_suspend, rt9120_runtime_resume, NULL)
+	RUNTIME_PM_OPS(rt9120_runtime_suspend, rt9120_runtime_resume, NULL)
 };
 
 static const struct of_device_id __maybe_unused rt9120_device_table[] = {
@@ -631,7 +631,7 @@ static struct i2c_driver rt9120_driver = {
 	.driver = {
 		.name = "rt9120",
 		.of_match_table = rt9120_device_table,
-		.pm = &rt9120_pm_ops,
+		.pm = pm_ptr(&rt9120_pm_ops),
 	},
 	.probe = rt9120_probe,
 	.remove = rt9120_remove,
-- 
2.43.0

