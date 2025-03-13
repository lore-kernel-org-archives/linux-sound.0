Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43E41B3F3D
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887784; cv=none; b=O3/VH1Idb9D5AK9mtAM4yfyD01gCdjS47JWNkYl4rF+0b7OX3BB/GkMBLTrw/pPPgo/zChaN3bK/HCJe/Vt5D+s1FlpifcXXegIpx0i4+BHRuaPLHfAEq6DnormK3i99zcCuERbAi8i2TErVByQQKgIKVQiQHXIiJcvQzPpGuOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887784; c=relaxed/simple;
	bh=NXUkwcyR+9NqNaVG2Y5Ceu3qHstSM2Y7EYyXgFr/9VY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H2Lh21L+/xzI8UjSfFZ4wcTIxkDHMBUzNXP2QSjFYF07uWCI6qgAGYrQgZcl37gKp3FvyFDzIIghv6uTOnXeLI1TpzTpLeuo+mTjb9ONHDjD2C7+BJK0G/BspCPV1Iefz1GgutaePzbnY8I3HVhsCOiNO+8JL/kChvXZBJHSEn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FgzPZRdr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aRE4m+Nc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FgzPZRdr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aRE4m+Nc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FgzPZRdr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aRE4m+Nc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FgzPZRdr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aRE4m+Nc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CF3B31F789;
	Thu, 13 Mar 2025 17:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CnBfk7DzmeeyAbQ9o60ukPFsF+uIZz3IECf6dT7rY1k=;
	b=FgzPZRdryEwQFE65UiHTy1j4nQrPR4225pesM+aHXYY0jsoYPk5iYisAsbFhmCE/Ys023J
	zCQWS7UjT3ADkJTHMnPceyeSOg5yn6nnk7Eu8Dje9oeKCwx64f8XsOcTu++7SO7oGovvLO
	HTTb+3P1piKXjtWVLmZeACmf6gBAzTM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CnBfk7DzmeeyAbQ9o60ukPFsF+uIZz3IECf6dT7rY1k=;
	b=aRE4m+NcneHgyugCOSNCj2EiDuDQY6t0PELyjm3J7XRNlLqoLDq+93G5bphIMLqnp/51NY
	9T7tr19rpciTaBBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FgzPZRdr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=aRE4m+Nc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CnBfk7DzmeeyAbQ9o60ukPFsF+uIZz3IECf6dT7rY1k=;
	b=FgzPZRdryEwQFE65UiHTy1j4nQrPR4225pesM+aHXYY0jsoYPk5iYisAsbFhmCE/Ys023J
	zCQWS7UjT3ADkJTHMnPceyeSOg5yn6nnk7Eu8Dje9oeKCwx64f8XsOcTu++7SO7oGovvLO
	HTTb+3P1piKXjtWVLmZeACmf6gBAzTM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CnBfk7DzmeeyAbQ9o60ukPFsF+uIZz3IECf6dT7rY1k=;
	b=aRE4m+NcneHgyugCOSNCj2EiDuDQY6t0PELyjm3J7XRNlLqoLDq+93G5bphIMLqnp/51NY
	9T7tr19rpciTaBBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE0A1139D2;
	Thu, 13 Mar 2025 17:41:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wCU3KeUY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 24/89] ASoC: max98396: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:29 +0100
Message-ID: <20250313174139.29942-25-tiwai@suse.de>
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
X-Rspamd-Queue-Id: CF3B31F789
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
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLi691ga9brjh6qjnnbs1osk4o)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

