Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6F718B470
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887736; cv=none; b=piQjcK053scBt0M5hQUy6yQm/gGgZJitOsuiNTSFYVZHd3a0GKa8h9u+3OTYe7XiF2xrEuVW/6uvimW1RhRaXVYDguKmk/SlKKCEX3SzK4MZSy+8N+vm318CjLuz/8Vh1wMXlO7gW5BJuIGWMtYfgqDc6axNXrrckMv5H68q+M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887736; c=relaxed/simple;
	bh=WZLJS6v2Dqe2w6ejXigx1L7p05bDIK48eriApru4/uE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CTjelJiLZbDSFlOtncgEt37/Iu4e2eEOTh+mOA9C9Ennp6P5J7BKRb7Wjl3BU0/m/2rPoP8y0xrTTO1F5PJfIZpe5eJRXKuTkSeIdr3DYXPGzAfGLkG90TTFFW4nQMc15KrxVMjECMmdPh9i/O8Nnd+PbUSlOhlaEfTBMn2AdiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2IuSqHIs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oQoBA0D0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2IuSqHIs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oQoBA0D0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2IuSqHIs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oQoBA0D0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2IuSqHIs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oQoBA0D0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7F3E2211BF;
	Thu, 13 Mar 2025 17:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+nV58Tj3eEUhONazRBdG28zqirEiHrGNo8JKseqWXg=;
	b=2IuSqHIsVLtGFy6geWwFg1DBdkGKeel/QLMGQy9MtE1tlPdOMnytyG1MBgWXuq8A44IDNx
	kWwGIJPRGAOc96051r/icKZXbGWBIelxvmD9s2L+Y5TE6luTeIPVpHk2lc1rEH8t3pLThm
	FUUZpxqoQeZ1VSoxwDZKx5vsX2en0hM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+nV58Tj3eEUhONazRBdG28zqirEiHrGNo8JKseqWXg=;
	b=oQoBA0D0j+5JBlzstFlfa+BLhI/oyO/F+4r/PNeCg983oBLDaBlEQcOcVhdZEYOp50wW7m
	gCsSI3LFlIL9JpAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2IuSqHIs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oQoBA0D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+nV58Tj3eEUhONazRBdG28zqirEiHrGNo8JKseqWXg=;
	b=2IuSqHIsVLtGFy6geWwFg1DBdkGKeel/QLMGQy9MtE1tlPdOMnytyG1MBgWXuq8A44IDNx
	kWwGIJPRGAOc96051r/icKZXbGWBIelxvmD9s2L+Y5TE6luTeIPVpHk2lc1rEH8t3pLThm
	FUUZpxqoQeZ1VSoxwDZKx5vsX2en0hM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+nV58Tj3eEUhONazRBdG28zqirEiHrGNo8JKseqWXg=;
	b=oQoBA0D0j+5JBlzstFlfa+BLhI/oyO/F+4r/PNeCg983oBLDaBlEQcOcVhdZEYOp50wW7m
	gCsSI3LFlIL9JpAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 567FC139D2;
	Thu, 13 Mar 2025 17:41:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WMrTE+MY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 11/89] ASoC: cs42l51: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:16 +0100
Message-ID: <20250313174139.29942-12-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 7F3E2211BF
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

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
SET_SYSTEM_SLEEP_PM_OPS().

Also, drop superfluous __maybe_unused attributes to cs42l51_suspend()
and _resume() functions.

Merely a cleanup, there should be no actual code change.

Cc: patches@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs42l51-i2c.c | 2 +-
 sound/soc/codecs/cs42l51.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l51-i2c.c b/sound/soc/codecs/cs42l51-i2c.c
index f171bd66fcac..ba7e237619f2 100644
--- a/sound/soc/codecs/cs42l51-i2c.c
+++ b/sound/soc/codecs/cs42l51-i2c.c
@@ -40,7 +40,7 @@ static void cs42l51_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct dev_pm_ops cs42l51_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(cs42l51_suspend, cs42l51_resume)
+	SYSTEM_SLEEP_PM_OPS(cs42l51_suspend, cs42l51_resume)
 };
 
 static struct i2c_driver cs42l51_i2c_driver = {
diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index 0602d03095d6..8083a339dc7b 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -805,7 +805,7 @@ void cs42l51_remove(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(cs42l51_remove);
 
-int __maybe_unused cs42l51_suspend(struct device *dev)
+int cs42l51_suspend(struct device *dev)
 {
 	struct cs42l51_private *cs42l51 = dev_get_drvdata(dev);
 
@@ -816,7 +816,7 @@ int __maybe_unused cs42l51_suspend(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(cs42l51_suspend);
 
-int __maybe_unused cs42l51_resume(struct device *dev)
+int cs42l51_resume(struct device *dev)
 {
 	struct cs42l51_private *cs42l51 = dev_get_drvdata(dev);
 
-- 
2.43.0

