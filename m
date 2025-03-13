Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E864198A2F
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887755; cv=none; b=oZwPFAN72sSij+BVnyIHvTvhp78ZalCBK4Vl0Dx4M034nJlPwoIBiVDv/oHEQmirQpppo4Q+/qzx3ieevSy9qeLB1k39Zzlezn9PpYG4jJ9MFkg07EtB+ZMAqHAGgMgsYVpbh+0U92dK3qntlDHa/vDOqwNW+m5XhzMwnpDc/v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887755; c=relaxed/simple;
	bh=TKB4uAh5piGu2OtWAmKAf40w7VHzehhP/Mrz93avI9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUt3YXAkkyP5MHXkBYU20kFu02uTXRtcbzWtmKtkRTdPyyOBpb1GqZbfK+I/kiIBG1FLvpFlisuHeVAhaiBle4LLKRpDJDMIypguKEArzuYjhtgkZ9mrNZOT8jM6NN/7gDkWKReN+NEvsjTdzfMcSVF/D42z5BQG5DRFkDtUEQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Iyr/Xh2C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EOcmcC3C; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Iyr/Xh2C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EOcmcC3C; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Iyr/Xh2C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EOcmcC3C";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Iyr/Xh2C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EOcmcC3C"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 12BD1211C4;
	Thu, 13 Mar 2025 17:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MgHxNtMkLoqxYgwegkw0r3bvApoBNxgWaEwegdYq8WE=;
	b=Iyr/Xh2CZXYzXrjUFdSRQo3/gJhQAqQRqgO0WmXJdkvho10t2eCCZ6Iv141Y9pCaY4Dc4n
	lw9ksHPZvs7cWEXaHNIYBsieimwJEHeWQon6SbUkZABwhY4qDNP4rki5Pufez+heXMaAOm
	H7Z97gy3urey9yEjhyG2TwbwyIOmHYs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MgHxNtMkLoqxYgwegkw0r3bvApoBNxgWaEwegdYq8WE=;
	b=EOcmcC3ChodboFJ6gpeGDK9DR9v/B342gdd0Qu79+qx6HwDqYkQ0KNLk4GXX7qqTbYv0rY
	oCpBI4etRIvPLoCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MgHxNtMkLoqxYgwegkw0r3bvApoBNxgWaEwegdYq8WE=;
	b=Iyr/Xh2CZXYzXrjUFdSRQo3/gJhQAqQRqgO0WmXJdkvho10t2eCCZ6Iv141Y9pCaY4Dc4n
	lw9ksHPZvs7cWEXaHNIYBsieimwJEHeWQon6SbUkZABwhY4qDNP4rki5Pufez+heXMaAOm
	H7Z97gy3urey9yEjhyG2TwbwyIOmHYs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MgHxNtMkLoqxYgwegkw0r3bvApoBNxgWaEwegdYq8WE=;
	b=EOcmcC3ChodboFJ6gpeGDK9DR9v/B342gdd0Qu79+qx6HwDqYkQ0KNLk4GXX7qqTbYv0rY
	oCpBI4etRIvPLoCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E1D15137BA;
	Thu, 13 Mar 2025 17:41:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IKvlNeMY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 14/89] ASoC: cs43130: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:19 +0100
Message-ID: <20250313174139.29942-15-tiwai@suse.de>
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIE_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs43130.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index cd535be0b4ba..d9b3d73c8388 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -2672,7 +2672,7 @@ static void cs43130_i2c_remove(struct i2c_client *client)
 	regulator_bulk_disable(CS43130_NUM_SUPPLIES, cs43130->supplies);
 }
 
-static int __maybe_unused cs43130_runtime_suspend(struct device *dev)
+static int cs43130_runtime_suspend(struct device *dev)
 {
 	struct cs43130_private *cs43130 = dev_get_drvdata(dev);
 
@@ -2691,7 +2691,7 @@ static int __maybe_unused cs43130_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cs43130_runtime_resume(struct device *dev)
+static int cs43130_runtime_resume(struct device *dev)
 {
 	struct cs43130_private *cs43130 = dev_get_drvdata(dev);
 	int ret;
@@ -2727,8 +2727,7 @@ static int __maybe_unused cs43130_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops cs43130_runtime_pm = {
-	SET_RUNTIME_PM_OPS(cs43130_runtime_suspend, cs43130_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(cs43130_runtime_suspend, cs43130_runtime_resume, NULL)
 };
 
 #if IS_ENABLED(CONFIG_OF)
@@ -2768,7 +2767,7 @@ static struct i2c_driver cs43130_i2c_driver = {
 		.name			= "cs43130",
 		.of_match_table		= of_match_ptr(cs43130_of_match),
 		.acpi_match_table	= ACPI_PTR(cs43130_acpi_match),
-		.pm			= &cs43130_runtime_pm,
+		.pm			= pm_ptr(&cs43130_runtime_pm),
 	},
 	.id_table	= cs43130_i2c_id,
 	.probe		= cs43130_i2c_probe,
-- 
2.43.0

