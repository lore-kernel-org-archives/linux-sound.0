Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939043203A4
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478701; cv=none; b=cPSo8lJxCLt5tvdIeRaxYeMf8VxgCUICXHBcX9Aq3Vyk0CEFSvPkdfjqoqHVR0QIj8MJZYICxvpuMuwdhM7lgaKmCf9caWIvWHqXw698TyeJhYOzdffK5Ztz398QfLYaoM4cRrPxXPIZGvY+lbie74XXhR/OfRhLgsTqs0/qlpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478701; c=relaxed/simple;
	bh=yc2K5eU51MBtGj5PGM/9SZxV5SE8N8l3oew05uyBGH4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B1HITr1YNDSxvdVlEoSPfxo9lGhvEzBT9yysMIm6FkCyT3ltS9xyU/ifai0/6TLPO97qF7b0Pu6NsHPOUCWn/AGwlZMeFYaZeCdzbhoeoFXaXyzGx3YpslAjdunsNcRvDVEvQ7nN2ucS7wVR5PmXVRkDrbBSo50I+L0RqgPW8zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lyl1WM8d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2HGP8OW+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lyl1WM8d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2HGP8OW+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lyl1WM8d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2HGP8OW+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lyl1WM8d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2HGP8OW+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C74CB33ECB;
	Fri, 29 Aug 2025 14:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JFM3vT4yjBr74DTEyyEYSRMYxuDY8ZcfF6RFGvfHMYo=;
	b=lyl1WM8dxB80vS52YbEUPo3Vm5sUGP/vzA2iUWOo3mi163bOOnUYB0kGxE6atOhIzyg8Wo
	OyYp2Ad6NHqcMVAtBRS098KdSfJw+X2yQpF6Y+0fVwa+Tv4rz8weRDETvB9kx8Nz8nFRs3
	9+S25b/jo2K+0W/NbHjhT5pLvT92kVE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JFM3vT4yjBr74DTEyyEYSRMYxuDY8ZcfF6RFGvfHMYo=;
	b=2HGP8OW+V8NM/eXcFWTipv8rA+YAzoB5qAp0rgrY/VpFbwtos7uzW/wgUEThUjq4xxgigv
	pSNeQSZUEEgOweCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lyl1WM8d;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2HGP8OW+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JFM3vT4yjBr74DTEyyEYSRMYxuDY8ZcfF6RFGvfHMYo=;
	b=lyl1WM8dxB80vS52YbEUPo3Vm5sUGP/vzA2iUWOo3mi163bOOnUYB0kGxE6atOhIzyg8Wo
	OyYp2Ad6NHqcMVAtBRS098KdSfJw+X2yQpF6Y+0fVwa+Tv4rz8weRDETvB9kx8Nz8nFRs3
	9+S25b/jo2K+0W/NbHjhT5pLvT92kVE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JFM3vT4yjBr74DTEyyEYSRMYxuDY8ZcfF6RFGvfHMYo=;
	b=2HGP8OW+V8NM/eXcFWTipv8rA+YAzoB5qAp0rgrY/VpFbwtos7uzW/wgUEThUjq4xxgigv
	pSNeQSZUEEgOweCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A487813A54;
	Fri, 29 Aug 2025 14:43:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ED8MJ6+8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 24/61] ALSA: echoaudio: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:42:59 +0200
Message-ID: <20250829144342.4290-25-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829144342.4290-1-tiwai@suse.de>
References: <20250829144342.4290-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: C74CB33ECB
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/echoaudio/echoaudio.c | 36 +++++++++++++--------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 2b33ef588ac3..4cfe8ad97069 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -237,7 +237,7 @@ static int hw_rule_sample_rate(struct snd_pcm_hw_params *params,
 	struct snd_interval fixed;
 	int err;
 
-	mutex_lock(&chip->mode_mutex);
+	guard(mutex)(&chip->mode_mutex);
 
 	if (chip->can_set_rate) {
 		err = 0;
@@ -247,7 +247,6 @@ static int hw_rule_sample_rate(struct snd_pcm_hw_params *params,
 		err = snd_interval_refine(rate, &fixed);
 	}
 
-	mutex_unlock(&chip->mode_mutex);
 	return err;
 }
 
@@ -415,7 +414,7 @@ static int pcm_digital_in_open(struct snd_pcm_substream *substream)
 	int err, max_channels;
 
 	max_channels = num_digital_busses_in(chip) - substream->number;
-	mutex_lock(&chip->mode_mutex);
+	guard(mutex)(&chip->mode_mutex);
 	if (chip->digital_mode == DIGITAL_MODE_ADAT)
 		err = pcm_open(substream, max_channels);
 	else	/* If the card has ADAT, subtract the 6 channels
@@ -424,24 +423,22 @@ static int pcm_digital_in_open(struct snd_pcm_substream *substream)
 		err = pcm_open(substream, max_channels - ECHOCARD_HAS_ADAT);
 
 	if (err < 0)
-		goto din_exit;
+		return err;
 
 	err = snd_pcm_hw_rule_add(substream->runtime, 0,
 				  SNDRV_PCM_HW_PARAM_CHANNELS,
 				  hw_rule_capture_channels_by_format, NULL,
 				  SNDRV_PCM_HW_PARAM_FORMAT, -1);
 	if (err < 0)
-		goto din_exit;
+		return err;
 	err = snd_pcm_hw_rule_add(substream->runtime, 0,
 				  SNDRV_PCM_HW_PARAM_FORMAT,
 				  hw_rule_capture_format_by_channels, NULL,
 				  SNDRV_PCM_HW_PARAM_CHANNELS, -1);
 	if (err < 0)
-		goto din_exit;
+		return err;
 
-din_exit:
-	mutex_unlock(&chip->mode_mutex);
-	return err;
+	return 0;
 }
 
 
@@ -454,7 +451,7 @@ static int pcm_digital_out_open(struct snd_pcm_substream *substream)
 	int err, max_channels;
 
 	max_channels = num_digital_busses_out(chip) - substream->number;
-	mutex_lock(&chip->mode_mutex);
+	guard(mutex)(&chip->mode_mutex);
 	if (chip->digital_mode == DIGITAL_MODE_ADAT)
 		err = pcm_open(substream, max_channels);
 	else	/* If the card has ADAT, subtract the 6 channels
@@ -463,7 +460,7 @@ static int pcm_digital_out_open(struct snd_pcm_substream *substream)
 		err = pcm_open(substream, max_channels - ECHOCARD_HAS_ADAT);
 
 	if (err < 0)
-		goto dout_exit;
+		return err;
 
 	err = snd_pcm_hw_rule_add(substream->runtime, 0,
 				  SNDRV_PCM_HW_PARAM_CHANNELS,
@@ -471,18 +468,16 @@ static int pcm_digital_out_open(struct snd_pcm_substream *substream)
 				  NULL, SNDRV_PCM_HW_PARAM_FORMAT,
 				  -1);
 	if (err < 0)
-		goto dout_exit;
+		return err;
 	err = snd_pcm_hw_rule_add(substream->runtime, 0,
 				  SNDRV_PCM_HW_PARAM_FORMAT,
 				  hw_rule_playback_format_by_channels,
 				  NULL, SNDRV_PCM_HW_PARAM_CHANNELS,
 				  -1);
 	if (err < 0)
-		goto dout_exit;
+		return err;
 
-dout_exit:
-	mutex_unlock(&chip->mode_mutex);
-	return err;
+	return 0;
 }
 
 #endif /* !ECHOCARD_HAS_VMIXER */
@@ -499,7 +494,7 @@ static int pcm_close(struct snd_pcm_substream *substream)
 	 * freed by its callback
 	 */
 
-	mutex_lock(&chip->mode_mutex);
+	guard(mutex)(&chip->mode_mutex);
 
 	dev_dbg(chip->card->dev, "pcm_open opencount=%d can_set_rate=%d, rate_set=%d",
 		chip->opencount, chip->can_set_rate, chip->rate_set);
@@ -516,7 +511,6 @@ static int pcm_close(struct snd_pcm_substream *substream)
 		break;
 	}
 
-	mutex_unlock(&chip->mode_mutex);
 	return 0;
 }
 
@@ -1440,7 +1434,7 @@ static int snd_echo_digital_mode_put(struct snd_kcontrol *kcontrol,
 	if (dmode != chip->digital_mode) {
 		/* mode_mutex is required to make this operation atomic wrt
 		pcm_digital_*_open() and set_input_clock() functions. */
-		mutex_lock(&chip->mode_mutex);
+		guard(mutex)(&chip->mode_mutex);
 
 		/* Do not allow the user to change the digital mode when a pcm
 		device is open because it also changes the number of channels
@@ -1460,7 +1454,6 @@ static int snd_echo_digital_mode_put(struct snd_kcontrol *kcontrol,
 			if (changed >= 0)
 				changed = 1;	/* No errors */
 		}
-		mutex_unlock(&chip->mode_mutex);
 	}
 	return changed;
 }
@@ -1573,13 +1566,12 @@ static int snd_echo_clock_source_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	dclock = chip->clock_source_list[eclock];
 	if (chip->input_clock != dclock) {
-		mutex_lock(&chip->mode_mutex);
+		guard(mutex)(&chip->mode_mutex);
 		spin_lock_irq(&chip->lock);
 		changed = set_input_clock(chip, dclock);
 		if (!changed)
 			changed = 1;	/* no errors */
 		spin_unlock_irq(&chip->lock);
-		mutex_unlock(&chip->mode_mutex);
 	}
 
 	if (changed < 0)
-- 
2.50.1

