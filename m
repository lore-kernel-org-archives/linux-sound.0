Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0918A1607B4
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887806; cv=none; b=QWvWbu4IO0Opx4J46WVSZNZdNcl9C92pFQla/Z3nIfNpSIFSZl1G0fc3g4c09ipf6UYxCCeQjEIYJGRkcbRBaynWA34rd324VEo5mykAbSZzvHqnfJwAO3bcrKJVH3ThmLOu1pZPhyi2aPU/OSMDJYN3nHKwsa/B3QXLFCtwaYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887806; c=relaxed/simple;
	bh=xxMUzA9yvOg6ZSIwEnWnzcrnnvGglF5AoxyD/lpq9Jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dxqkzPbc0poQqUs7ggz1Nso5qkAiW7ZiUznX3OwQzdr5PWykOyyjdt8vqptq8q0che02aU+69ov4xmkpdnoQhTXHcQyoEbxg3hRkmcKbpubiSNTBJ/t/yoIv5wCkBTUUv/IYx3jeyYiZGb9UIUdUYyHMF0dGo/3P4kkIH227xX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=106XobYP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pm24Eq0w; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=106XobYP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pm24Eq0w; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="106XobYP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pm24Eq0w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="106XobYP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pm24Eq0w"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3441A211D6;
	Thu, 13 Mar 2025 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uFTpX2RI+ysGNORrqHPtmZLML+elMpMWUmAOjAUQT9w=;
	b=106XobYP/KhS+W+HcF2fb79Yh8BFHmIYwyNWm1zfTyK9TnAwwohEK92zQ7nSB2RonowFNa
	pRh9ZXsS+ZsxriRMMe6Uwxa0YKed0gqCmoUqFz8bVJGZ32psixTm+uyXnPYe+0in/4XWB/
	eIDPeh/Kd1td8Q/giIvMFNlfFfXrCmA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uFTpX2RI+ysGNORrqHPtmZLML+elMpMWUmAOjAUQT9w=;
	b=pm24Eq0wFCxI1ygymlbklUxVLDWwA9Vo23T8Bhop63XN3jtC6Ch2IZmbw07zXXJZurWQQL
	tY46ts+jFU8UU3Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uFTpX2RI+ysGNORrqHPtmZLML+elMpMWUmAOjAUQT9w=;
	b=106XobYP/KhS+W+HcF2fb79Yh8BFHmIYwyNWm1zfTyK9TnAwwohEK92zQ7nSB2RonowFNa
	pRh9ZXsS+ZsxriRMMe6Uwxa0YKed0gqCmoUqFz8bVJGZ32psixTm+uyXnPYe+0in/4XWB/
	eIDPeh/Kd1td8Q/giIvMFNlfFfXrCmA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uFTpX2RI+ysGNORrqHPtmZLML+elMpMWUmAOjAUQT9w=;
	b=pm24Eq0wFCxI1ygymlbklUxVLDWwA9Vo23T8Bhop63XN3jtC6Ch2IZmbw07zXXJZurWQQL
	tY46ts+jFU8UU3Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 14DF9139D2;
	Thu, 13 Mar 2025 17:41:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CHOkA+YY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 26/89] ASoC: max9860: Convert to RUNTIME_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:31 +0100
Message-ID: <20250313174139.29942-27-tiwai@suse.de>
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
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping superfluous CONFIG_PM
ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/max9860.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max9860.c b/sound/soc/codecs/max9860.c
index 4015ed2c47ec..716d16daf7d7 100644
--- a/sound/soc/codecs/max9860.c
+++ b/sound/soc/codecs/max9860.c
@@ -539,7 +539,6 @@ static const struct snd_soc_component_driver max9860_component_driver = {
 	.endianness		= 1,
 };
 
-#ifdef CONFIG_PM
 static int max9860_suspend(struct device *dev)
 {
 	struct max9860_priv *max9860 = dev_get_drvdata(dev);
@@ -584,10 +583,9 @@ static int max9860_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops max9860_pm_ops = {
-	SET_RUNTIME_PM_OPS(max9860_suspend, max9860_resume, NULL)
+	RUNTIME_PM_OPS(max9860_suspend, max9860_resume, NULL)
 };
 
 static int max9860_probe(struct i2c_client *i2c)
@@ -729,7 +727,7 @@ static struct i2c_driver max9860_i2c_driver = {
 	.driver         = {
 		.name           = "max9860",
 		.of_match_table = max9860_of_match,
-		.pm             = &max9860_pm_ops,
+		.pm             = pm_ptr(&max9860_pm_ops),
 	},
 };
 
-- 
2.43.0

