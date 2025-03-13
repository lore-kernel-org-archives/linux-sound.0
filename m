Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0F51C57B2
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887761; cv=none; b=lvVwGi9kr2dlgp/dMPLpKvDPzESAOiH94ozWYaInq0wiZvNAI8uocQzlBpAmu+ZIjNG/Kuh2JEP/o0PBDlZ0M4ofVIRqAMmZ9cfToLeOV28O3nkfT7jwqAmVOXYyWCHzKWRJVtyJlT1Lv3v3oG5aySKMek0aQNQc2OdTxCMEOWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887761; c=relaxed/simple;
	bh=AbT0iHBFwPap6hLM1PyHw5x0AKjQQp4IrP34SJoH7+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=azdv9fDmNXJfShLyX7o7MCTVgrWWdcllkGr6xwWY/ElWCOCmnBTgwNjlXn9JLU+DxouYt4F69aH2qB+HZMY+mN7rSNXYh3P8G5KWeXFn1YQmHRdCmONexDhlFHumigYmhF+hZp7r2S2v0Jw9ufh6fBLMbv5ytRZLBJvU9ud2o0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iiegpCGR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eRmojU4o; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iiegpCGR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eRmojU4o; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iiegpCGR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eRmojU4o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iiegpCGR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eRmojU4o"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3FDB3211C9;
	Thu, 13 Mar 2025 17:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M96ixhZ6XvpK4kM5hmUpx0wepBg+OUe6u8i+/Y/FKm8=;
	b=iiegpCGRDj1NcJ6R081X6J2Qw8fo9y6GOSt4j4i2NipuT8pulMAyzqTJFolNJXR/InBh2+
	0sspbcqiwkleCC3YibawjsdIog3nrIoizuBZfxk9HuE3NRN9PvkjGcnCa8QrrEoRD4W43S
	ux5/mX86fr3xWIXKXsn8paxZL6wQjE4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M96ixhZ6XvpK4kM5hmUpx0wepBg+OUe6u8i+/Y/FKm8=;
	b=eRmojU4oR/QawjpdjwRHPvxnvNFVSJjIPBjVdersu+tX4NdSUX/+FxJetLFMyTv5inPdg0
	uZVRKDhKvmgqDfBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M96ixhZ6XvpK4kM5hmUpx0wepBg+OUe6u8i+/Y/FKm8=;
	b=iiegpCGRDj1NcJ6R081X6J2Qw8fo9y6GOSt4j4i2NipuT8pulMAyzqTJFolNJXR/InBh2+
	0sspbcqiwkleCC3YibawjsdIog3nrIoizuBZfxk9HuE3NRN9PvkjGcnCa8QrrEoRD4W43S
	ux5/mX86fr3xWIXKXsn8paxZL6wQjE4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M96ixhZ6XvpK4kM5hmUpx0wepBg+OUe6u8i+/Y/FKm8=;
	b=eRmojU4oR/QawjpdjwRHPvxnvNFVSJjIPBjVdersu+tX4NdSUX/+FxJetLFMyTv5inPdg0
	uZVRKDhKvmgqDfBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19C6C139D2;
	Thu, 13 Mar 2025 17:41:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2FL4BOQY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 15/89] ASoC: cs4349: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:20 +0100
Message-ID: <20250313174139.29942-16-tiwai@suse.de>
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
together with pm_ptr(), which allows us dropping superfluous CONFIG_PM
ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs4349.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs4349.c b/sound/soc/codecs/cs4349.c
index a134ca722892..d9a9c34fffe3 100644
--- a/sound/soc/codecs/cs4349.c
+++ b/sound/soc/codecs/cs4349.c
@@ -312,7 +312,6 @@ static void cs4349_i2c_remove(struct i2c_client *client)
 	gpiod_set_value_cansleep(cs4349->reset_gpio, 0);
 }
 
-#ifdef CONFIG_PM
 static int cs4349_runtime_suspend(struct device *dev)
 {
 	struct cs4349_private *cs4349 = dev_get_drvdata(dev);
@@ -346,11 +345,9 @@ static int cs4349_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops cs4349_runtime_pm = {
-	SET_RUNTIME_PM_OPS(cs4349_runtime_suspend, cs4349_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(cs4349_runtime_suspend, cs4349_runtime_resume, NULL)
 };
 
 static const struct of_device_id cs4349_of_match[] = {
@@ -371,7 +368,7 @@ static struct i2c_driver cs4349_i2c_driver = {
 	.driver = {
 		.name		= "cs4349",
 		.of_match_table	= cs4349_of_match,
-		.pm = &cs4349_runtime_pm,
+		.pm = pm_ptr(&cs4349_runtime_pm),
 	},
 	.id_table	= cs4349_i2c_id,
 	.probe		= cs4349_i2c_probe,
-- 
2.43.0

