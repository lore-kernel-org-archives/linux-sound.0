Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51081D5146
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887851; cv=none; b=rTuTJHN5Fakixt4WYtD0t3u90YTuByFkW3/UIZ9mXfiAgDb/XipWU30MsaUJmCrGIn3CQsLi36V2+X748LObS3SvSEQVtbxcBQxTLAFON8rBWLy1OZ4juxx9fU8KjbblfF+EFM2Ryo+Rb+iq+TeSxJelrB+8RJRX/j3DhCcpvk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887851; c=relaxed/simple;
	bh=Bl7uUD4oRXnXKCc2cf1V48p1tZF4MO4jUGlzF++GSf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=baEJAeJ4k/NozLAFdzHmDmqXdJLyuonaTJbjZO8IfL1WCLxY2u+AxKBMteGGMRPJRyBX+CDMZlhvPfjBCLvLTa3dhkpprknmLvoBE7oQ0yPr+5qsQp9R68ij7F4hf1vFHSUY01yk2g931L505FpZcXN+Y1wXIspkmA8+YGYjW8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AaGebP72; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4Cr9uzmp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AaGebP72; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4Cr9uzmp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AaGebP72";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4Cr9uzmp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AaGebP72";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4Cr9uzmp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 45391211D1;
	Thu, 13 Mar 2025 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gksWPjFGo5eKgOSoouF97EUSTuS9GyPt2k9sER5SUgw=;
	b=AaGebP72uE2qSNQR9yZvbfmR+ZDOFMSEin/Rz3rX8OPOOjINHv1HM3KZceUImDhPrWPlgA
	xkq7+AjPlZ3prfhlXIGwXZB/D82AowBszfmx/0/Syimnv7LQZdxmVNbtBsejSxhC4bpi3P
	vCi3YrDgjhmCdJTWty8VxJKQnOZLGvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gksWPjFGo5eKgOSoouF97EUSTuS9GyPt2k9sER5SUgw=;
	b=4Cr9uzmp9bJgLsO9JjQDq8R26Ggj6a9/w4epi5DEgtIjXK6+Eq3SENHOf7tMh/7vpRqchr
	yoqiri9gfR+o0fDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gksWPjFGo5eKgOSoouF97EUSTuS9GyPt2k9sER5SUgw=;
	b=AaGebP72uE2qSNQR9yZvbfmR+ZDOFMSEin/Rz3rX8OPOOjINHv1HM3KZceUImDhPrWPlgA
	xkq7+AjPlZ3prfhlXIGwXZB/D82AowBszfmx/0/Syimnv7LQZdxmVNbtBsejSxhC4bpi3P
	vCi3YrDgjhmCdJTWty8VxJKQnOZLGvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gksWPjFGo5eKgOSoouF97EUSTuS9GyPt2k9sER5SUgw=;
	b=4Cr9uzmp9bJgLsO9JjQDq8R26Ggj6a9/w4epi5DEgtIjXK6+Eq3SENHOf7tMh/7vpRqchr
	yoqiri9gfR+o0fDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 242A4139D2;
	Thu, 13 Mar 2025 17:42:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +C2RB+oY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 47/89] ASoC: ts3a227e: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:52 +0100
Message-ID: <20250313174139.29942-48-tiwai@suse.de>
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
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
SET_SYSTEM_SLEEP_PM_OPS() together with pm_ptr(), which allows us
dropping superfluous CONFIG_PM_SLEEP ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/ts3a227e.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/ts3a227e.c b/sound/soc/codecs/ts3a227e.c
index b9eb59e3bfa0..5ce0db9326fd 100644
--- a/sound/soc/codecs/ts3a227e.c
+++ b/sound/soc/codecs/ts3a227e.c
@@ -399,7 +399,6 @@ static int ts3a227e_i2c_probe(struct i2c_client *i2c)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int ts3a227e_suspend(struct device *dev)
 {
 	struct ts3a227e *ts3a227e = dev_get_drvdata(dev);
@@ -419,10 +418,9 @@ static int ts3a227e_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops ts3a227e_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(ts3a227e_suspend, ts3a227e_resume)
+	SYSTEM_SLEEP_PM_OPS(ts3a227e_suspend, ts3a227e_resume)
 };
 
 static const struct i2c_device_id ts3a227e_i2c_ids[] = {
@@ -450,7 +448,7 @@ MODULE_DEVICE_TABLE(acpi, ts3a227e_acpi_match);
 static struct i2c_driver ts3a227e_driver = {
 	.driver = {
 		.name = "ts3a227e",
-		.pm = &ts3a227e_pm,
+		.pm = pm_ptr(&ts3a227e_pm),
 		.of_match_table = of_match_ptr(ts3a227e_of_match),
 		.acpi_match_table = ACPI_PTR(ts3a227e_acpi_match),
 	},
-- 
2.43.0

