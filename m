Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B4222ACEF
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205430; cv=none; b=FEnqS9SUNf76x/iOwoa+ZuRZY5nEZ8ObgGEfAM03BqPv8iBhzY37lPFOyvCYKpGOREb4i+/HGUfzYjhQdL2HbNzn1lO3ag+3cQqNeBCRsE9S/2n8sDqKCjE0HkCwNZDSagTLLe1BirsdanLEq68GfgsU3AD5B2JtWPnIibkhwpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205430; c=relaxed/simple;
	bh=NXUkwcyR+9NqNaVG2Y5Ceu3qHstSM2Y7EYyXgFr/9VY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gugPTIAnCWbVVEymRDUXGRzZF32nkvG/istmy2r+dYxxgOFP/xKvRYBYVHKouBxnHF1Brm4lM4C/VhAuNCOpwW7NlRNBla2LFOfUYoWEj9vE28aIcjfL50gg6vly3qazF6zl405/iT9BpigvZ4yNilduHpsCAt9ycJH73CN4qDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CM/RtW5J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fKLQbdYc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CM/RtW5J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fKLQbdYc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CM/RtW5J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fKLQbdYc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CM/RtW5J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fKLQbdYc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2967B21E5E;
	Mon, 17 Mar 2025 09:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CnBfk7DzmeeyAbQ9o60ukPFsF+uIZz3IECf6dT7rY1k=;
	b=CM/RtW5JW7KKnI7QHZjC00ipj1VSoyXD21FX70fmtbQ74GjBEhH4GFoK6gKOz5FF6c+tju
	cb9oW4MCe0d4HoNWOMmVwpdGoAlaSUSyuBjuD3Jl4jA1gr5ckHSiNTzGKWmvD9rjgBuBSi
	yhrAMD+gu/Wat1BMQhDuO2RuwUDTNN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205377;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CnBfk7DzmeeyAbQ9o60ukPFsF+uIZz3IECf6dT7rY1k=;
	b=fKLQbdYckISTsmxMUgjMoPwJbGEEBo/qftllrTB1Hn0aE8r+bJR+y95zZyJFRqYNYUT+BX
	0XoEncciAkUsQoDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CnBfk7DzmeeyAbQ9o60ukPFsF+uIZz3IECf6dT7rY1k=;
	b=CM/RtW5JW7KKnI7QHZjC00ipj1VSoyXD21FX70fmtbQ74GjBEhH4GFoK6gKOz5FF6c+tju
	cb9oW4MCe0d4HoNWOMmVwpdGoAlaSUSyuBjuD3Jl4jA1gr5ckHSiNTzGKWmvD9rjgBuBSi
	yhrAMD+gu/Wat1BMQhDuO2RuwUDTNN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205377;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CnBfk7DzmeeyAbQ9o60ukPFsF+uIZz3IECf6dT7rY1k=;
	b=fKLQbdYckISTsmxMUgjMoPwJbGEEBo/qftllrTB1Hn0aE8r+bJR+y95zZyJFRqYNYUT+BX
	0XoEncciAkUsQoDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B43113A2C;
	Mon, 17 Mar 2025 09:56:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uByJAcHx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 23/88] ASoC: max98396: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:45 +0100
Message-ID: <20250317095603.20073-24-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317095603.20073-1-tiwai@suse.de>
References: <20250317095603.20073-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
SET_SYSTEM_SLEEP_PM_OPS() together with pm_ptr(), which allows us
dropping superfluous CONFIG_PM_SLEEP ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/max98396.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
index e52bb2266fa1..c1888cd83dbc 100644
--- a/sound/soc/codecs/max98396.c
+++ b/sound/soc/codecs/max98396.c
@@ -1571,7 +1571,6 @@ static int max98396_probe(struct snd_soc_component *component)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int max98396_suspend(struct device *dev)
 {
 	struct max98396_priv *max98396 = dev_get_drvdata(dev);
@@ -1616,10 +1615,9 @@ static int max98396_resume(struct device *dev)
 	regcache_sync(max98396->regmap);
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops max98396_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(max98396_suspend, max98396_resume)
+	SYSTEM_SLEEP_PM_OPS(max98396_suspend, max98396_resume)
 };
 
 static const struct snd_soc_component_driver soc_codec_dev_max98396 = {
@@ -1904,7 +1902,7 @@ static struct i2c_driver max98396_i2c_driver = {
 		.name = "max98396",
 		.of_match_table = of_match_ptr(max98396_of_match),
 		.acpi_match_table = ACPI_PTR(max98396_acpi_match),
-		.pm = &max98396_pm,
+		.pm = pm_ptr(&max98396_pm),
 	},
 	.probe = max98396_i2c_probe,
 	.id_table = max98396_i2c_id,
-- 
2.43.0

