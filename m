Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7C4199934
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887760; cv=none; b=HK5d/Hke7yepSsZpgJ9WGOEB+0jK35/NmPhq1wgskaHQnJmEVa9sM3XDdGiHaTpv1VfO6oERxnWM2XOPGm5xM72P5J6cD0S8Pwu80c+e0laKLeSWaYH+uKJx37wKikGJEGDCwvKsYTHlKpJ2aRSx2atArRtwMPwDoSVW1ZjjGus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887760; c=relaxed/simple;
	bh=g5aVvXsNESzWDXnQWTEcqSbiYGR0vdVB+hJlvaFK0o0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qHZ3PasbPceHJc7BC2Jfq1ULKQueuePSwnBdoe++l3ERZu+GILKm6l/FqjiZ8aEd1nrg7xp73v5M/EICyIGUc2TxCrg+Ttxb0wnBGHAogFAZNW3xsdxqzs7fQRVBLEfXiOkH7T9Hjme1XaiRV+W5VJCmm5+6QA27ksDyYg4UQcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E7aoNK7d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aSyLtQ+c; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E7aoNK7d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aSyLtQ+c; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E7aoNK7d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aSyLtQ+c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E7aoNK7d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aSyLtQ+c"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2DCA91F79B;
	Thu, 13 Mar 2025 17:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/nuAi7X2ybeXrtzm1kmPSEV26//B+I2i1mv12nCn+cc=;
	b=E7aoNK7d2xOt0CrLqPMKnM2TSm0vO7KwYhyDvYim9euMLGTi7nwDlS4aBb0uiZ6NFZy32c
	zZdYHuYuN9UUIcnBJ2LuQk9l8tnIwXfh1W4Esi78/J3Oud339eGVdcMZl8LJA7Vcduxf15
	DFeih5WVqyA/Uj9Za5fIwD+uDM5bMHA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/nuAi7X2ybeXrtzm1kmPSEV26//B+I2i1mv12nCn+cc=;
	b=aSyLtQ+cDHpZKwNoC2vB6jX//glbjvRlTj3AtCvm37eyXFK06E4/PW7FrKcYQrMRf4egdc
	KP7S5Rd929PSPDBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=E7aoNK7d;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=aSyLtQ+c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/nuAi7X2ybeXrtzm1kmPSEV26//B+I2i1mv12nCn+cc=;
	b=E7aoNK7d2xOt0CrLqPMKnM2TSm0vO7KwYhyDvYim9euMLGTi7nwDlS4aBb0uiZ6NFZy32c
	zZdYHuYuN9UUIcnBJ2LuQk9l8tnIwXfh1W4Esi78/J3Oud339eGVdcMZl8LJA7Vcduxf15
	DFeih5WVqyA/Uj9Za5fIwD+uDM5bMHA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/nuAi7X2ybeXrtzm1kmPSEV26//B+I2i1mv12nCn+cc=;
	b=aSyLtQ+cDHpZKwNoC2vB6jX//glbjvRlTj3AtCvm37eyXFK06E4/PW7FrKcYQrMRf4egdc
	KP7S5Rd929PSPDBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F0030139D2;
	Thu, 13 Mar 2025 17:41:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WHM8OeIY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 09/89] ASoC: cs4234: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:14 +0100
Message-ID: <20250313174139.29942-10-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 2DCA91F79B
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the newer RUNTIE_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly	when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs4234.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs4234.c b/sound/soc/codecs/cs4234.c
index df160db5bbb5..dda7f5b4f2fb 100644
--- a/sound/soc/codecs/cs4234.c
+++ b/sound/soc/codecs/cs4234.c
@@ -860,7 +860,7 @@ static void cs4234_i2c_remove(struct i2c_client *i2c_client)
 	cs4234_shutdown(cs4234);
 }
 
-static int __maybe_unused cs4234_runtime_resume(struct device *dev)
+static int cs4234_runtime_resume(struct device *dev)
 {
 	struct cs4234 *cs4234 = dev_get_drvdata(dev);
 	int ret;
@@ -881,7 +881,7 @@ static int __maybe_unused cs4234_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cs4234_runtime_suspend(struct device *dev)
+static int cs4234_runtime_suspend(struct device *dev)
 {
 	struct cs4234 *cs4234 = dev_get_drvdata(dev);
 
@@ -891,7 +891,7 @@ static int __maybe_unused cs4234_runtime_suspend(struct device *dev)
 }
 
 static const struct dev_pm_ops cs4234_pm = {
-	SET_RUNTIME_PM_OPS(cs4234_runtime_suspend, cs4234_runtime_resume, NULL)
+	RUNTIME_PM_OPS(cs4234_runtime_suspend, cs4234_runtime_resume, NULL)
 };
 
 static const struct of_device_id cs4234_of_match[] = {
@@ -903,7 +903,7 @@ MODULE_DEVICE_TABLE(of, cs4234_of_match);
 static struct i2c_driver cs4234_i2c_driver = {
 	.driver = {
 		.name = "cs4234",
-		.pm = &cs4234_pm,
+		.pm = pm_ptr(&cs4234_pm),
 		.of_match_table = cs4234_of_match,
 	},
 	.probe =	cs4234_i2c_probe,
-- 
2.43.0

