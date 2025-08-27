Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36471CD215
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 07:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756280026; cv=none; b=EuuR9u3If69yPzqBspLTJ1S50W+FMxeu2MVdwV4HHwt7dcw/Xd/Ixq2bgWJswU7sh9j5n9qGPMpudJYWzO2wClSOgDSKcnBsLQT77sRii5FYS3buXmTRdCJ4msM9bW4ulTjbfBbAvv7LOUak81bBnzSytY9DGGv6RUS1rqf0c5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756280026; c=relaxed/simple;
	bh=fojbwhXbGX/9HvoRv0JHVJhM645ewvLys5wtlpMbqqw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGyzNg4/A+lRz4nj8ILcrrkVJRfbCcSbV/nJCcYaeWruSpKadC07V5Dkc/HmsVFGbvVTQEPlqkB4WXCiSkrrT6AOiLEJPtrsJXkY4NZK6vURO8U6zPtVVP0s72Xmjh2M3JO+cu9Z0sNgjujPRcRgH0qKlvIMg8PSSdV3Bk15Us4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o+JSFg4S; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ytU8sMeZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o+JSFg4S; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ytU8sMeZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o+JSFg4S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ytU8sMeZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o+JSFg4S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ytU8sMeZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5A693223CF;
	Wed, 27 Aug 2025 07:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MFj92CyFBcV0QRA7v7zOmjAB16Thwc7ob/ppByDN/JY=;
	b=o+JSFg4Sjc1ua5C1O9FOdNWp9ym2+QFwP5oL8mTfS1W5FsrTjZFW/o8LA1YHRofC6OJWmy
	yOmn6yJfLoSzunAl4DXxKiyKVNIdheaCRy3t8cvWZrgRibU78Hpv6LIqW7PPoIdpMp/sdW
	KS0iG7DMfzdXYXiznrkq12OamvcpMZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279761;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MFj92CyFBcV0QRA7v7zOmjAB16Thwc7ob/ppByDN/JY=;
	b=ytU8sMeZx7XIS9dt7pI+EfW8U3/l3nQtiTOcRdwdMP1lVxZa7wdXBiRhjqmOO1tljwRrc0
	rrzhrpSlafv0M4BA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=o+JSFg4S;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ytU8sMeZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MFj92CyFBcV0QRA7v7zOmjAB16Thwc7ob/ppByDN/JY=;
	b=o+JSFg4Sjc1ua5C1O9FOdNWp9ym2+QFwP5oL8mTfS1W5FsrTjZFW/o8LA1YHRofC6OJWmy
	yOmn6yJfLoSzunAl4DXxKiyKVNIdheaCRy3t8cvWZrgRibU78Hpv6LIqW7PPoIdpMp/sdW
	KS0iG7DMfzdXYXiznrkq12OamvcpMZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279761;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MFj92CyFBcV0QRA7v7zOmjAB16Thwc7ob/ppByDN/JY=;
	b=ytU8sMeZx7XIS9dt7pI+EfW8U3/l3nQtiTOcRdwdMP1lVxZa7wdXBiRhjqmOO1tljwRrc0
	rrzhrpSlafv0M4BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F45913A31;
	Wed, 27 Aug 2025 07:29:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gKoXDtGzrmjoagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 07:29:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 13/25] ALSA: hda/tas2781: Use guard() for mutex locks
Date: Wed, 27 Aug 2025 09:28:53 +0200
Message-ID: <20250827072916.31933-14-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827072916.31933-1-tiwai@suse.de>
References: <20250827072916.31933-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 5A693223CF
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard().

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 .../hda/codecs/side-codecs/tas2781_hda_i2c.c  | 53 ++++++-------------
 1 file changed, 17 insertions(+), 36 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index ed7771ab9475..fb3439161490 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -158,16 +158,16 @@ static void tas2781_hda_playback_hook(struct device *dev, int action)
 	switch (action) {
 	case HDA_GEN_PCM_ACT_OPEN:
 		pm_runtime_get_sync(dev);
-		mutex_lock(&tas_hda->priv->codec_lock);
-		tasdevice_tuning_switch(tas_hda->priv, 0);
-		tas_hda->priv->playback_started = true;
-		mutex_unlock(&tas_hda->priv->codec_lock);
+		scoped_guard(mutex, &tas_hda->priv->codec_lock) {
+			tasdevice_tuning_switch(tas_hda->priv, 0);
+			tas_hda->priv->playback_started = true;
+		}
 		break;
 	case HDA_GEN_PCM_ACT_CLOSE:
-		mutex_lock(&tas_hda->priv->codec_lock);
-		tasdevice_tuning_switch(tas_hda->priv, 1);
-		tas_hda->priv->playback_started = false;
-		mutex_unlock(&tas_hda->priv->codec_lock);
+		scoped_guard(mutex, &tas_hda->priv->codec_lock) {
+			tasdevice_tuning_switch(tas_hda->priv, 1);
+			tas_hda->priv->playback_started = false;
+		}
 
 		pm_runtime_put_autosuspend(dev);
 		break;
@@ -184,15 +184,13 @@ static int tas2781_amp_getvol(struct snd_kcontrol *kcontrol,
 		(struct soc_mixer_control *)kcontrol->private_value;
 	int ret;
 
-	mutex_lock(&tas_priv->codec_lock);
+	guard(mutex)(&tas_priv->codec_lock);
 
 	ret = tasdevice_amp_getvol(tas_priv, ucontrol, mc);
 
 	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %ld\n",
 		__func__, kcontrol->id.name, ucontrol->value.integer.value[0]);
 
-	mutex_unlock(&tas_priv->codec_lock);
-
 	return ret;
 }
 
@@ -202,19 +200,14 @@ static int tas2781_amp_putvol(struct snd_kcontrol *kcontrol,
 	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	int ret;
 
-	mutex_lock(&tas_priv->codec_lock);
+	guard(mutex)(&tas_priv->codec_lock);
 
 	dev_dbg(tas_priv->dev, "%s: kcontrol %s: -> %ld\n",
 		__func__, kcontrol->id.name, ucontrol->value.integer.value[0]);
 
 	/* The check of the given value is in tasdevice_amp_putvol. */
-	ret = tasdevice_amp_putvol(tas_priv, ucontrol, mc);
-
-	mutex_unlock(&tas_priv->codec_lock);
-
-	return ret;
+	return tasdevice_amp_putvol(tas_priv, ucontrol, mc);
 }
 
 static int tas2781_force_fwload_get(struct snd_kcontrol *kcontrol,
@@ -222,14 +215,12 @@ static int tas2781_force_fwload_get(struct snd_kcontrol *kcontrol,
 {
 	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&tas_priv->codec_lock);
+	guard(mutex)(&tas_priv->codec_lock);
 
 	ucontrol->value.integer.value[0] = (int)tas_priv->force_fwload_status;
 	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d\n",
 		__func__, kcontrol->id.name, tas_priv->force_fwload_status);
 
-	mutex_unlock(&tas_priv->codec_lock);
-
 	return 0;
 }
 
@@ -239,7 +230,7 @@ static int tas2781_force_fwload_put(struct snd_kcontrol *kcontrol,
 	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
 	bool change, val = (bool)ucontrol->value.integer.value[0];
 
-	mutex_lock(&tas_priv->codec_lock);
+	guard(mutex)(&tas_priv->codec_lock);
 
 	dev_dbg(tas_priv->dev, "%s: kcontrol %s: %d -> %d\n",
 		__func__, kcontrol->id.name,
@@ -252,8 +243,6 @@ static int tas2781_force_fwload_put(struct snd_kcontrol *kcontrol,
 		tas_priv->force_fwload_status = val;
 	}
 
-	mutex_unlock(&tas_priv->codec_lock);
-
 	return change;
 }
 
@@ -711,7 +700,7 @@ static int tas2781_runtime_suspend(struct device *dev)
 
 	dev_dbg(tas_hda->dev, "Runtime Suspend\n");
 
-	mutex_lock(&tas_hda->priv->codec_lock);
+	guard(mutex)(&tas_hda->priv->codec_lock);
 
 	/* The driver powers up the amplifiers at module load time.
 	 * Stop the playback if it's unused.
@@ -721,8 +710,6 @@ static int tas2781_runtime_suspend(struct device *dev)
 		tas_hda->priv->playback_started = false;
 	}
 
-	mutex_unlock(&tas_hda->priv->codec_lock);
-
 	return 0;
 }
 
@@ -732,12 +719,10 @@ static int tas2781_runtime_resume(struct device *dev)
 
 	dev_dbg(tas_hda->dev, "Runtime Resume\n");
 
-	mutex_lock(&tas_hda->priv->codec_lock);
+	guard(mutex)(&tas_hda->priv->codec_lock);
 
 	tasdevice_prmg_load(tas_hda->priv, tas_hda->priv->cur_prog);
 
-	mutex_unlock(&tas_hda->priv->codec_lock);
-
 	return 0;
 }
 
@@ -747,14 +732,12 @@ static int tas2781_system_suspend(struct device *dev)
 
 	dev_dbg(tas_hda->priv->dev, "System Suspend\n");
 
-	mutex_lock(&tas_hda->priv->codec_lock);
+	guard(mutex)(&tas_hda->priv->codec_lock);
 
 	/* Shutdown chip before system suspend */
 	if (tas_hda->priv->playback_started)
 		tasdevice_tuning_switch(tas_hda->priv, 1);
 
-	mutex_unlock(&tas_hda->priv->codec_lock);
-
 	/*
 	 * Reset GPIO may be shared, so cannot reset here.
 	 * However beyond this point, amps may be powered down.
@@ -769,7 +752,7 @@ static int tas2781_system_resume(struct device *dev)
 
 	dev_dbg(tas_hda->priv->dev, "System Resume\n");
 
-	mutex_lock(&tas_hda->priv->codec_lock);
+	guard(mutex)(&tas_hda->priv->codec_lock);
 
 	for (i = 0; i < tas_hda->priv->ndev; i++) {
 		tas_hda->priv->tasdevice[i].cur_book = -1;
@@ -782,8 +765,6 @@ static int tas2781_system_resume(struct device *dev)
 	if (tas_hda->priv->playback_started)
 		tasdevice_tuning_switch(tas_hda->priv, 0);
 
-	mutex_unlock(&tas_hda->priv->codec_lock);
-
 	return 0;
 }
 
-- 
2.50.1

