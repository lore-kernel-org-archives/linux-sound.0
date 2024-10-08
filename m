Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943F51DED76
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 12:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728390370; cv=none; b=HFvDNgWwRY4Pe9Ta6rBS4zJ64WJHMs1L4GwjsHD26kmSBlbFcAWQ4Puo9bs6xKCK+e9BTMF6l353ddb30gVtALYv35OAPao+QZzXIe18JMZpa9igv8l70HFCmGiGT5XSuXRX8MXM9ltqSUpRlOvspnY1PJjPZpwbpmXWCWuolHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728390370; c=relaxed/simple;
	bh=yRMuugJJs5toETM0RB9He5peuJmB0Pf1GzAvLMRQyQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vzk/ZBbc/mQ5IkvCU7dVcY3KYUOJ5k66/yKKxpiocqpCUw8n7IgPuTv9qQF35lIiOPJHBGWKZyxavraYmsh6PGd0ylfCInkw7qZ926UtpU9+Hzh6rpLtK7Y7sF4iQshqH48FX9/KyuekTMBREA6NNpp7CESgzB8myDuLnL/22cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2Fb6DPrJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=90FGjFi1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2Fb6DPrJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=90FGjFi1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2Fb6DPrJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="90FGjFi1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2Fb6DPrJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="90FGjFi1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D50B821BEC;
	Tue,  8 Oct 2024 12:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728390366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dCelbCbO4GMMVyLL8bJbmswNWjnJydj6g+9jfpixGOY=;
	b=2Fb6DPrJx3ULPQFYtNO8EXvUUvKaF8KR5HltFAD9rosOfBTgy4zNDSWjnLPuaAYeHEYsh8
	gKm2OZnqjrN1wPtaO5j+XVd0OLWd7d1IovzQDNXTNeDJu+hLtrlWNKDYoPQ8zwPY6PwDRt
	7YneLeX/8h30rVVBOAgqyGQXUjbns+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728390366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dCelbCbO4GMMVyLL8bJbmswNWjnJydj6g+9jfpixGOY=;
	b=90FGjFi103fFX6egkPb/OV2hFPjzqadX3WSQNNZ3d8leBFN8o3kdyBHvFCTrSZGyXpSAsZ
	18insOErPK+t5PAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2Fb6DPrJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=90FGjFi1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728390366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dCelbCbO4GMMVyLL8bJbmswNWjnJydj6g+9jfpixGOY=;
	b=2Fb6DPrJx3ULPQFYtNO8EXvUUvKaF8KR5HltFAD9rosOfBTgy4zNDSWjnLPuaAYeHEYsh8
	gKm2OZnqjrN1wPtaO5j+XVd0OLWd7d1IovzQDNXTNeDJu+hLtrlWNKDYoPQ8zwPY6PwDRt
	7YneLeX/8h30rVVBOAgqyGQXUjbns+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728390366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dCelbCbO4GMMVyLL8bJbmswNWjnJydj6g+9jfpixGOY=;
	b=90FGjFi103fFX6egkPb/OV2hFPjzqadX3WSQNNZ3d8leBFN8o3kdyBHvFCTrSZGyXpSAsZ
	18insOErPK+t5PAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C043A137CF;
	Tue,  8 Oct 2024 12:26:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uGGqBN4kBWeNdAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 08 Oct 2024 12:26:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 2/2] ALSA: hda: tas2781: Simplify system PM with runtime PM
Date: Tue,  8 Oct 2024 14:26:56 +0200
Message-ID: <20241008122658.9549-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241008122658.9549-1-tiwai@suse.de>
References: <20241008122658.9549-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D50B821BEC
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Now most of the calls in both system and runtime PMs are identical,
use pm_runtime_force_suspend() and *_resume() for simplifying the
code.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/tas2781_hda_i2c.c | 27 ++-------------------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 6d173b721fd0..c35c676202b7 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -901,19 +901,7 @@ static int tas2781_system_suspend(struct device *dev)
 
 	dev_dbg(tas_hda->priv->dev, "System Suspend\n");
 
-	mutex_lock(&tas_hda->priv->codec_lock);
-
-	/* Shutdown chip before system suspend */
-	if (tas_hda->priv->playback_started)
-		tasdevice_tuning_switch(tas_hda->priv, 1);
-
-	mutex_unlock(&tas_hda->priv->codec_lock);
-
-	/*
-	 * Reset GPIO may be shared, so cannot reset here.
-	 * However beyond this point, amps may be powered down.
-	 */
-	return 0;
+	return pm_runtime_force_suspend(dev);
 }
 
 static int tas2781_system_resume(struct device *dev)
@@ -924,26 +912,15 @@ static int tas2781_system_resume(struct device *dev)
 	dev_dbg(tas_hda->priv->dev, "System Resume\n");
 
 	mutex_lock(&tas_hda->priv->codec_lock);
-
 	for (i = 0; i < tas_hda->priv->ndev; i++) {
 		tas_hda->priv->tasdevice[i].cur_book = -1;
 		tas_hda->priv->tasdevice[i].cur_prog = -1;
 		tas_hda->priv->tasdevice[i].cur_conf = -1;
 	}
 	tasdevice_reset(tas_hda->priv);
-	tasdevice_prmg_load(tas_hda->priv, tas_hda->priv->cur_prog);
-
-	/* If calibrated data occurs error, dsp will still work with default
-	 * calibrated data inside algo.
-	 */
-	tasdevice_apply_calibration(tas_hda->priv);
-
-	if (tas_hda->priv->playback_started)
-		tasdevice_tuning_switch(tas_hda->priv, 0);
-
 	mutex_unlock(&tas_hda->priv->codec_lock);
 
-	return 0;
+	return pm_runtime_force_resume(dev);
 }
 
 static const struct dev_pm_ops tas2781_hda_pm_ops = {
-- 
2.43.0

