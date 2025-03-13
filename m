Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8478D1B6CE3
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887743; cv=none; b=hIbDA9FzbAOtwL4Tb5o7GStH76nlnj51beS+w0oY/Ol3sqNhxJZ60vREpN+FJ1Sggg7ONrwYup7sUd4BnZY+29jEnK/AghGz5x3DCFmI+GPmPir7Jt1Y4rG7IivKlLNQEmdE3hpSiJSpoPU6jqTlWyRDZJo7hyjo7foDgh3YnOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887743; c=relaxed/simple;
	bh=1tgKOJF0ha2U4PxjT6ihgxam+eVyriIl0ctYVzfiOSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sjZpOwi0L25MtmxS95+76Yf2J7aTCP5IlqdxBngJly2tK8NeJ8pB1y5UwdD36n4/ZTV72lXYTkvGyVjgjWxWEgiUmMob3rZqjgSr/G67lgixcSpK97c6kvArK3mxg02RRGmrlqLzZEH4rv6wOdCLI5Oeuqzi1z7J+o9VF2eNsyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OsUcBfmf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IKHm2QKx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OsUcBfmf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IKHm2QKx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OsUcBfmf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IKHm2QKx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OsUcBfmf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IKHm2QKx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AE7DB211C6;
	Thu, 13 Mar 2025 17:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvqg8KvNR/3pWsW/RgWoBcwRMU/y8PutngnJNx4cbsc=;
	b=OsUcBfmf+kQ+GFr3zsL//ULffSKRzK1Y2XKHZpaMAvFm8PtYP0RQRzdJrWLkP0BxT1nuHM
	fsRadx2bNLV9zlC2OK4ytLVrFEL3LAwXr8kcoKDgnJOrtXXNvZx6GzkVLTQi02bESpbNyU
	Op9Er8Nog/JhhK0w/kR9lvyjNqJNT0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvqg8KvNR/3pWsW/RgWoBcwRMU/y8PutngnJNx4cbsc=;
	b=IKHm2QKxm9BQcyjReA/yML+QGyBVaun0gH2piswCU/dV+c5UN0Wc1vqrPuUsDTRfRMg3H4
	qWDjzI91X2eU/sAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OsUcBfmf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IKHm2QKx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvqg8KvNR/3pWsW/RgWoBcwRMU/y8PutngnJNx4cbsc=;
	b=OsUcBfmf+kQ+GFr3zsL//ULffSKRzK1Y2XKHZpaMAvFm8PtYP0RQRzdJrWLkP0BxT1nuHM
	fsRadx2bNLV9zlC2OK4ytLVrFEL3LAwXr8kcoKDgnJOrtXXNvZx6GzkVLTQi02bESpbNyU
	Op9Er8Nog/JhhK0w/kR9lvyjNqJNT0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvqg8KvNR/3pWsW/RgWoBcwRMU/y8PutngnJNx4cbsc=;
	b=IKHm2QKxm9BQcyjReA/yML+QGyBVaun0gH2piswCU/dV+c5UN0Wc1vqrPuUsDTRfRMg3H4
	qWDjzI91X2eU/sAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86774137BA;
	Thu, 13 Mar 2025 17:41:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UCuDH+MY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 12/89] ASoC: cs42l83: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:17 +0100
Message-ID: <20250313174139.29942-13-tiwai@suse.de>
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
X-Rspamd-Queue-Id: AE7DB211C6
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

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
SET_SYSTEM_SLEEP_PM_OPS() together with pm_ptr(), which allows us
dropping ugly __maybe_unused attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs42l83-i2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l83-i2c.c b/sound/soc/codecs/cs42l83-i2c.c
index 42c3e1efdc08..53a7fe1ab3dd 100644
--- a/sound/soc/codecs/cs42l83-i2c.c
+++ b/sound/soc/codecs/cs42l83-i2c.c
@@ -199,7 +199,7 @@ static void cs42l83_i2c_remove(struct i2c_client *i2c_client)
 	cs42l42_common_remove(cs42l83);
 }
 
-static int __maybe_unused cs42l83_i2c_resume(struct device *dev)
+static int cs42l83_i2c_resume(struct device *dev)
 {
 	int ret;
 
@@ -213,7 +213,7 @@ static int __maybe_unused cs42l83_i2c_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops cs42l83_i2c_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(cs42l42_suspend, cs42l83_i2c_resume)
+	SYSTEM_SLEEP_PM_OPS(cs42l42_suspend, cs42l83_i2c_resume)
 };
 
 static const struct of_device_id __maybe_unused cs42l83_of_match[] = {
@@ -225,7 +225,7 @@ MODULE_DEVICE_TABLE(of, cs42l83_of_match);
 static struct i2c_driver cs42l83_i2c_driver = {
 	.driver = {
 		.name = "cs42l83",
-		.pm = &cs42l83_i2c_pm_ops,
+		.pm = pm_ptr(&cs42l83_i2c_pm_ops),
 		.of_match_table = of_match_ptr(cs42l83_of_match),
 		},
 	.probe = cs42l83_i2c_probe,
-- 
2.43.0

