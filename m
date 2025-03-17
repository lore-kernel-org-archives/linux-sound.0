Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8731F22A80E
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205424; cv=none; b=RcVc6V83RAU4JjcUsXaoI+TOeg/dhF8OAJC474Zub9kLrwEiDisGttc8T2pcEQGARYiCNy5p4uT/8y1w0HnjNAVG3TSVDiHNag/H7LSHvmctj6uiCrIdrhUn2SLappp3X8y5eR6daXZimxflRmZJFs/xXPArD0UPOEEMTfUCCVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205424; c=relaxed/simple;
	bh=ysCmnx/5FN7lATd5UDe50taoejiOQwRmwg65YEBDeKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FfS68fX032xqv8Cp9qHeRNgBtPt32nEexatXQTW7Ea/M6fn/nj+6LHLkIxHKxxBsUMVE8f2CPCu6cLGN5xHnOXSDaCLP9oX3D5jxUgGpWQIb74Lcm3kkzURbZg5FzHDUkJqB3ZWcjIYu0yRUdFLGtNUv0v5/RPGgba2RH1ap18I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zQYufxUQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8ltY/IFv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zQYufxUQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8ltY/IFv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zQYufxUQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8ltY/IFv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zQYufxUQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8ltY/IFv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0602A21E5C;
	Mon, 17 Mar 2025 09:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Th6Lt7gQvv4PObPjiw4wch/j9nA9MlQoExJQrTmdOo=;
	b=zQYufxUQnKUjqPPxHX6z/r5WmouNCDt+3HTMExcnPGJNkGDsIONhF4x5walFUuoz0dIOVv
	m2dKROEhPibUtHfuaR6wThlLHGKZZzOif0U5lQrertrO1ZLSkpeSrRV70A8F117Im3BrhF
	fs2VKhQ7d2Fp6ggWZkrxfa1y7g36DLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205377;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Th6Lt7gQvv4PObPjiw4wch/j9nA9MlQoExJQrTmdOo=;
	b=8ltY/IFvvQnHCEaEQytvpgnb/6vhdr63DGi2LcRTemBKczvs5Onb9fC54hK9iJrNZ/R7j5
	p7i/sTVoGnO8KqAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Th6Lt7gQvv4PObPjiw4wch/j9nA9MlQoExJQrTmdOo=;
	b=zQYufxUQnKUjqPPxHX6z/r5WmouNCDt+3HTMExcnPGJNkGDsIONhF4x5walFUuoz0dIOVv
	m2dKROEhPibUtHfuaR6wThlLHGKZZzOif0U5lQrertrO1ZLSkpeSrRV70A8F117Im3BrhF
	fs2VKhQ7d2Fp6ggWZkrxfa1y7g36DLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205377;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Th6Lt7gQvv4PObPjiw4wch/j9nA9MlQoExJQrTmdOo=;
	b=8ltY/IFvvQnHCEaEQytvpgnb/6vhdr63DGi2LcRTemBKczvs5Onb9fC54hK9iJrNZ/R7j5
	p7i/sTVoGnO8KqAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D99FA132CF;
	Mon, 17 Mar 2025 09:56:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AGvFM8Dx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 22/88] ASoC: max98390: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:44 +0100
Message-ID: <20250317095603.20073-23-tiwai@suse.de>
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
X-Spam-Score: -6.80
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
SET_SYSTEM_SLEEP_PM_OPS() together with pm_ptr(), which allows us
dropping superfluous CONFIG_PM_SLEEP ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/max98390.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 1bae253618fd..76296176f948 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -943,7 +943,6 @@ static int max98390_probe(struct snd_soc_component *component)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int max98390_suspend(struct device *dev)
 {
 	struct max98390_priv *max98390 = dev_get_drvdata(dev);
@@ -967,10 +966,9 @@ static int max98390_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops max98390_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(max98390_suspend, max98390_resume)
+	SYSTEM_SLEEP_PM_OPS(max98390_suspend, max98390_resume)
 };
 
 static const struct snd_soc_component_driver soc_codec_dev_max98390 = {
@@ -1130,7 +1128,7 @@ static struct i2c_driver max98390_i2c_driver = {
 		.name = "max98390",
 		.of_match_table = of_match_ptr(max98390_of_match),
 		.acpi_match_table = ACPI_PTR(max98390_acpi_match),
-		.pm = &max98390_pm,
+		.pm = pm_ptr(&max98390_pm),
 	},
 	.probe = max98390_i2c_probe,
 	.id_table = max98390_i2c_id,
-- 
2.43.0

