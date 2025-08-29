Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36C1320CD5
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479649; cv=none; b=oqvCV1WYIw9otNpP2iY6Syo9FuhSlUTPNL7zFwOwit/CzIJUR63oWefpfe+hDtwfnWAFzQ/F2R9XO05kM/mWLCgd2Ox7Uho33lSgpWzaFWEm8uMXTjJOXhOZQ9jx/9twO3BxO2mOQ6QbO6XLWiE0L7X7WgyUADzzJ7wZsTaGWXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479649; c=relaxed/simple;
	bh=M58o0pYRUmzVG1HBH1x4nLnpJPrtppClvBePDN819uA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B92P+yFuHqE+NrH3UOiA/k4UiEA9Cq4pe0VJYtsIqUGONVafYxxOauNhcdFTTB7TUOIh1wbqEmDSZhI7J1q0XFpwqPSRGGoBZBTG5H4+HpSMYDneWEp5w+h9N8X8NPPFc7348dVAihHyjUgnN9BuviUI0pDPi64iCjL1k5+Q+FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DFdQkvuu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1XT+7h/w; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DFdQkvuu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1XT+7h/w; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DFdQkvuu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1XT+7h/w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DFdQkvuu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1XT+7h/w"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3DD6E5C243;
	Fri, 29 Aug 2025 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n8u0Os+/uvXeS0nQFG26Y5o6yEkLEtYJZx30JTMy65w=;
	b=DFdQkvuuwP3AmLnLCZuui3IpJn8EYrTh+Mj/BI7PEJDI2qPgpPCek13MEi/0cgPJJCkWGI
	YYOJDxZ6q3HNXsIOqi5zh9BwcAOzyBz9TCf7dv/3/OSW0EXs9ZHHCjWWxlnAgXNQ4pAdgV
	lUtGyVNwo/VB3Ch7ykmN4aG3Ei+8Qg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n8u0Os+/uvXeS0nQFG26Y5o6yEkLEtYJZx30JTMy65w=;
	b=1XT+7h/wmZ4KOPkHhQitpSBDCNNg28uf0Vf4fklRE1OvzK+Plt6rI+lxbM9loWlruOiGWy
	4qvLBv5wBkVJ7wCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DFdQkvuu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="1XT+7h/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n8u0Os+/uvXeS0nQFG26Y5o6yEkLEtYJZx30JTMy65w=;
	b=DFdQkvuuwP3AmLnLCZuui3IpJn8EYrTh+Mj/BI7PEJDI2qPgpPCek13MEi/0cgPJJCkWGI
	YYOJDxZ6q3HNXsIOqi5zh9BwcAOzyBz9TCf7dv/3/OSW0EXs9ZHHCjWWxlnAgXNQ4pAdgV
	lUtGyVNwo/VB3Ch7ykmN4aG3Ei+8Qg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n8u0Os+/uvXeS0nQFG26Y5o6yEkLEtYJZx30JTMy65w=;
	b=1XT+7h/wmZ4KOPkHhQitpSBDCNNg28uf0Vf4fklRE1OvzK+Plt6rI+lxbM9loWlruOiGWy
	4qvLBv5wBkVJ7wCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2296313326;
	Fri, 29 Aug 2025 15:00:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8HlNB5DAsWjjHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:00:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 07/13] ALSA: vx: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:00:18 +0200
Message-ID: <20250829150026.6379-8-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829150026.6379-1-tiwai@suse.de>
References: <20250829150026.6379-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3DD6E5C243
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
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
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/vx/vx_core.c  | 19 ++++---------
 sound/drivers/vx/vx_mixer.c | 57 +++++++++++--------------------------
 sound/drivers/vx/vx_pcm.c   |  3 +-
 sound/drivers/vx/vx_uer.c   | 17 +++++------
 4 files changed, 30 insertions(+), 66 deletions(-)

diff --git a/sound/drivers/vx/vx_core.c b/sound/drivers/vx/vx_core.c
index 7f25fa7c0404..52b93407bfe3 100644
--- a/sound/drivers/vx/vx_core.c
+++ b/sound/drivers/vx/vx_core.c
@@ -344,12 +344,8 @@ int vx_send_msg_nolock(struct vx_core *chip, struct vx_rmh *rmh)
  */
 int vx_send_msg(struct vx_core *chip, struct vx_rmh *rmh)
 {
-	int err;
-
-	mutex_lock(&chip->lock);
-	err = vx_send_msg_nolock(chip, rmh);
-	mutex_unlock(&chip->lock);
-	return err;
+	guard(mutex)(&chip->lock);
+	return vx_send_msg_nolock(chip, rmh);
 }
 
 
@@ -404,12 +400,8 @@ int vx_send_rih_nolock(struct vx_core *chip, int cmd)
  */
 int vx_send_rih(struct vx_core *chip, int cmd)
 {
-	int err;
-
-	mutex_lock(&chip->lock);
-	err = vx_send_rih_nolock(chip, cmd);
-	mutex_unlock(&chip->lock);
-	return err;
+	guard(mutex)(&chip->lock);
+	return vx_send_rih_nolock(chip, cmd);
 }
 
 #define END_OF_RESET_WAIT_TIME		500	/* us */
@@ -481,13 +473,12 @@ static int vx_test_irq_src(struct vx_core *chip, unsigned int *ret)
 	int err;
 
 	vx_init_rmh(&chip->irq_rmh, CMD_TEST_IT);
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 	err = vx_send_msg_nolock(chip, &chip->irq_rmh);
 	if (err < 0)
 		*ret = 0;
 	else
 		*ret = chip->irq_rmh.Stat[0];
-	mutex_unlock(&chip->lock);
 	return err;
 }
 
diff --git a/sound/drivers/vx/vx_mixer.c b/sound/drivers/vx/vx_mixer.c
index 0a51ecdc084a..9dc5cecaa86a 100644
--- a/sound/drivers/vx/vx_mixer.c
+++ b/sound/drivers/vx/vx_mixer.c
@@ -25,9 +25,8 @@ static void vx_write_codec_reg(struct vx_core *chip, int codec, unsigned int dat
 	if (chip->chip_status & VX_STAT_IS_STALE)
 		return;
 
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 	chip->ops->write_codec(chip, codec, data);
-	mutex_unlock(&chip->lock);
 }
 
 /*
@@ -166,9 +165,8 @@ static void vx_change_audio_source(struct vx_core *chip, int src)
 	if (chip->chip_status & VX_STAT_IS_STALE)
 		return;
 
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 	chip->ops->change_audio_source(chip, src);
-	mutex_unlock(&chip->lock);
 }
 
 
@@ -411,10 +409,10 @@ static int vx_output_level_get(struct snd_kcontrol *kcontrol, struct snd_ctl_ele
 {
 	struct vx_core *chip = snd_kcontrol_chip(kcontrol);
 	int codec = kcontrol->id.index;
-	mutex_lock(&chip->mixer_mutex);
+
+	guard(mutex)(&chip->mixer_mutex);
 	ucontrol->value.integer.value[0] = chip->output_level[codec][0];
 	ucontrol->value.integer.value[1] = chip->output_level[codec][1];
-	mutex_unlock(&chip->mixer_mutex);
 	return 0;
 }
 
@@ -429,16 +427,14 @@ static int vx_output_level_put(struct snd_kcontrol *kcontrol, struct snd_ctl_ele
 	val[1] = ucontrol->value.integer.value[1];
 	if (val[0] > vmax || val[1] > vmax)
 		return -EINVAL;
-	mutex_lock(&chip->mixer_mutex);
+	guard(mutex)(&chip->mixer_mutex);
 	if (val[0] != chip->output_level[codec][0] ||
 	    val[1] != chip->output_level[codec][1]) {
 		vx_set_analog_output_level(chip, codec, val[0], val[1]);
 		chip->output_level[codec][0] = val[0];
 		chip->output_level[codec][1] = val[1];
-		mutex_unlock(&chip->mixer_mutex);
 		return 1;
 	}
-	mutex_unlock(&chip->mixer_mutex);
 	return 0;
 }
 
@@ -490,14 +486,12 @@ static int vx_audio_src_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_v
 		if (ucontrol->value.enumerated.item[0] > 1)
 			return -EINVAL;
 	}
-	mutex_lock(&chip->mixer_mutex);
+	guard(mutex)(&chip->mixer_mutex);
 	if (chip->audio_source_target != ucontrol->value.enumerated.item[0]) {
 		chip->audio_source_target = ucontrol->value.enumerated.item[0];
 		vx_sync_audio_source(chip);
-		mutex_unlock(&chip->mixer_mutex);
 		return 1;
 	}
-	mutex_unlock(&chip->mixer_mutex);
 	return 0;
 }
 
@@ -534,14 +528,12 @@ static int vx_clock_mode_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_
 
 	if (ucontrol->value.enumerated.item[0] > 2)
 		return -EINVAL;
-	mutex_lock(&chip->mixer_mutex);
+	guard(mutex)(&chip->mixer_mutex);
 	if (chip->clock_mode != ucontrol->value.enumerated.item[0]) {
 		chip->clock_mode = ucontrol->value.enumerated.item[0];
 		vx_set_clock(chip, chip->freq);
-		mutex_unlock(&chip->mixer_mutex);
 		return 1;
 	}
-	mutex_unlock(&chip->mixer_mutex);
 	return 0;
 }
 
@@ -571,10 +563,9 @@ static int vx_audio_gain_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_
 	int audio = kcontrol->private_value & 0xff;
 	int capture = (kcontrol->private_value >> 8) & 1;
 
-	mutex_lock(&chip->mixer_mutex);
+	guard(mutex)(&chip->mixer_mutex);
 	ucontrol->value.integer.value[0] = chip->audio_gain[capture][audio];
 	ucontrol->value.integer.value[1] = chip->audio_gain[capture][audio+1];
-	mutex_unlock(&chip->mixer_mutex);
 	return 0;
 }
 
@@ -589,15 +580,13 @@ static int vx_audio_gain_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_
 	val[1] = ucontrol->value.integer.value[1];
 	if (val[0] > CVAL_MAX || val[1] > CVAL_MAX)
 		return -EINVAL;
-	mutex_lock(&chip->mixer_mutex);
+	guard(mutex)(&chip->mixer_mutex);
 	if (val[0] != chip->audio_gain[capture][audio] ||
 	    val[1] != chip->audio_gain[capture][audio+1]) {
 		vx_set_audio_gain(chip, audio, capture, val[0]);
 		vx_set_audio_gain(chip, audio+1, capture, val[1]);
-		mutex_unlock(&chip->mixer_mutex);
 		return 1;
 	}
-	mutex_unlock(&chip->mixer_mutex);
 	return 0;
 }
 
@@ -606,10 +595,9 @@ static int vx_audio_monitor_get(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 	struct vx_core *chip = snd_kcontrol_chip(kcontrol);
 	int audio = kcontrol->private_value & 0xff;
 
-	mutex_lock(&chip->mixer_mutex);
+	guard(mutex)(&chip->mixer_mutex);
 	ucontrol->value.integer.value[0] = chip->audio_monitor[audio];
 	ucontrol->value.integer.value[1] = chip->audio_monitor[audio+1];
-	mutex_unlock(&chip->mixer_mutex);
 	return 0;
 }
 
@@ -624,17 +612,15 @@ static int vx_audio_monitor_put(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 	if (val[0] > CVAL_MAX || val[1] > CVAL_MAX)
 		return -EINVAL;
 
-	mutex_lock(&chip->mixer_mutex);
+	guard(mutex)(&chip->mixer_mutex);
 	if (val[0] != chip->audio_monitor[audio] ||
 	    val[1] != chip->audio_monitor[audio+1]) {
 		vx_set_monitor_level(chip, audio, val[0],
 				     chip->audio_monitor_active[audio]);
 		vx_set_monitor_level(chip, audio+1, val[1],
 				     chip->audio_monitor_active[audio+1]);
-		mutex_unlock(&chip->mixer_mutex);
 		return 1;
 	}
-	mutex_unlock(&chip->mixer_mutex);
 	return 0;
 }
 
@@ -645,10 +631,9 @@ static int vx_audio_sw_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_va
 	struct vx_core *chip = snd_kcontrol_chip(kcontrol);
 	int audio = kcontrol->private_value & 0xff;
 
-	mutex_lock(&chip->mixer_mutex);
+	guard(mutex)(&chip->mixer_mutex);
 	ucontrol->value.integer.value[0] = chip->audio_active[audio];
 	ucontrol->value.integer.value[1] = chip->audio_active[audio+1];
-	mutex_unlock(&chip->mixer_mutex);
 	return 0;
 }
 
@@ -657,17 +642,15 @@ static int vx_audio_sw_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_va
 	struct vx_core *chip = snd_kcontrol_chip(kcontrol);
 	int audio = kcontrol->private_value & 0xff;
 
-	mutex_lock(&chip->mixer_mutex);
+	guard(mutex)(&chip->mixer_mutex);
 	if (ucontrol->value.integer.value[0] != chip->audio_active[audio] ||
 	    ucontrol->value.integer.value[1] != chip->audio_active[audio+1]) {
 		vx_set_audio_switch(chip, audio,
 				    !!ucontrol->value.integer.value[0]);
 		vx_set_audio_switch(chip, audio+1,
 				    !!ucontrol->value.integer.value[1]);
-		mutex_unlock(&chip->mixer_mutex);
 		return 1;
 	}
-	mutex_unlock(&chip->mixer_mutex);
 	return 0;
 }
 
@@ -676,10 +659,9 @@ static int vx_monitor_sw_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_
 	struct vx_core *chip = snd_kcontrol_chip(kcontrol);
 	int audio = kcontrol->private_value & 0xff;
 
-	mutex_lock(&chip->mixer_mutex);
+	guard(mutex)(&chip->mixer_mutex);
 	ucontrol->value.integer.value[0] = chip->audio_monitor_active[audio];
 	ucontrol->value.integer.value[1] = chip->audio_monitor_active[audio+1];
-	mutex_unlock(&chip->mixer_mutex);
 	return 0;
 }
 
@@ -688,17 +670,15 @@ static int vx_monitor_sw_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_
 	struct vx_core *chip = snd_kcontrol_chip(kcontrol);
 	int audio = kcontrol->private_value & 0xff;
 
-	mutex_lock(&chip->mixer_mutex);
+	guard(mutex)(&chip->mixer_mutex);
 	if (ucontrol->value.integer.value[0] != chip->audio_monitor_active[audio] ||
 	    ucontrol->value.integer.value[1] != chip->audio_monitor_active[audio+1]) {
 		vx_set_monitor_level(chip, audio, chip->audio_monitor[audio],
 				     !!ucontrol->value.integer.value[0]);
 		vx_set_monitor_level(chip, audio+1, chip->audio_monitor[audio+1],
 				     !!ucontrol->value.integer.value[1]);
-		mutex_unlock(&chip->mixer_mutex);
 		return 1;
 	}
-	mutex_unlock(&chip->mixer_mutex);
 	return 0;
 }
 
@@ -754,12 +734,11 @@ static int vx_iec958_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_valu
 {
 	struct vx_core *chip = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&chip->mixer_mutex);
+	guard(mutex)(&chip->mixer_mutex);
 	ucontrol->value.iec958.status[0] = (chip->uer_bits >> 0) & 0xff;
 	ucontrol->value.iec958.status[1] = (chip->uer_bits >> 8) & 0xff;
 	ucontrol->value.iec958.status[2] = (chip->uer_bits >> 16) & 0xff;
 	ucontrol->value.iec958.status[3] = (chip->uer_bits >> 24) & 0xff;
-	mutex_unlock(&chip->mixer_mutex);
         return 0;
 }
 
@@ -781,14 +760,12 @@ static int vx_iec958_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_valu
 	      (ucontrol->value.iec958.status[1] << 8) |
 	      (ucontrol->value.iec958.status[2] << 16) |
 	      (ucontrol->value.iec958.status[3] << 24);
-	mutex_lock(&chip->mixer_mutex);
+	guard(mutex)(&chip->mixer_mutex);
 	if (chip->uer_bits != val) {
 		chip->uer_bits = val;
 		vx_set_iec958_status(chip, val);
-		mutex_unlock(&chip->mixer_mutex);
 		return 1;
 	}
-	mutex_unlock(&chip->mixer_mutex);
 	return 0;
 }
 
diff --git a/sound/drivers/vx/vx_pcm.c b/sound/drivers/vx/vx_pcm.c
index defc489494af..7fd8f413d6cf 100644
--- a/sound/drivers/vx/vx_pcm.c
+++ b/sound/drivers/vx/vx_pcm.c
@@ -630,12 +630,11 @@ static int vx_pcm_playback_transfer_chunk(struct vx_core *chip,
 	/* we don't need irqsave here, because this function
 	 * is called from either trigger callback or irq handler
 	 */
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 	vx_pseudo_dma_write(chip, runtime, pipe, size);
 	err = vx_notify_end_of_buffer(chip, pipe);
 	/* disconnect the host, SIZE_HBUF command always switches to the stream mode */
 	vx_send_rih_nolock(chip, IRQ_CONNECT_STREAM_NEXT);
-	mutex_unlock(&chip->lock);
 	return err;
 }
 
diff --git a/sound/drivers/vx/vx_uer.c b/sound/drivers/vx/vx_uer.c
index 3eca22151225..1d90db3b0abd 100644
--- a/sound/drivers/vx/vx_uer.c
+++ b/sound/drivers/vx/vx_uer.c
@@ -49,7 +49,7 @@ static int vx_read_one_cbit(struct vx_core *chip, int index)
 {
 	int val;
 
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 	if (chip->type >= VX_TYPE_VXPOCKET) {
 		vx_outb(chip, CSUER, 1); /* read */
 		vx_outb(chip, RUER, index & XX_UER_CBITS_OFFSET_MASK);
@@ -59,7 +59,6 @@ static int vx_read_one_cbit(struct vx_core *chip, int index)
 		vx_outl(chip, RUER, index & XX_UER_CBITS_OFFSET_MASK);
 		val = (vx_inl(chip, RUER) >> 7) & 0x01;
 	}
-	mutex_unlock(&chip->lock);
 	return val;
 }
 
@@ -71,7 +70,7 @@ static int vx_read_one_cbit(struct vx_core *chip, int index)
 static void vx_write_one_cbit(struct vx_core *chip, int index, int val)
 {
 	val = !!val;	/* 0 or 1 */
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 	if (vx_is_pcmcia(chip)) {
 		vx_outb(chip, CSUER, 0); /* write */
 		vx_outb(chip, RUER, (val << 7) | (index & XX_UER_CBITS_OFFSET_MASK));
@@ -79,7 +78,6 @@ static void vx_write_one_cbit(struct vx_core *chip, int index, int val)
 		vx_outl(chip, CSUER, 0); /* write */
 		vx_outl(chip, RUER, (val << 7) | (index & XX_UER_CBITS_OFFSET_MASK));
 	}
-	mutex_unlock(&chip->lock);
 }
 
 /*
@@ -178,10 +176,10 @@ static void vx_change_clock_source(struct vx_core *chip, int source)
 {
 	/* we mute DAC to prevent clicks */
 	vx_toggle_dac_mute(chip, 1);
-	mutex_lock(&chip->lock);
-	chip->ops->set_clock_source(chip, source);
-	chip->clock_source = source;
-	mutex_unlock(&chip->lock);
+	scoped_guard(mutex, &chip->lock) {
+		chip->ops->set_clock_source(chip, source);
+		chip->clock_source = source;
+	}
 	/* unmute */
 	vx_toggle_dac_mute(chip, 0);
 }
@@ -198,7 +196,7 @@ void vx_set_internal_clock(struct vx_core *chip, unsigned int freq)
 	clock = vx_calc_clock_from_freq(chip, freq);
 	dev_dbg(chip->card->dev,
 		"set internal clock to 0x%x from freq %d\n", clock, freq);
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 	if (vx_is_pcmcia(chip)) {
 		vx_outb(chip, HIFREQ, (clock >> 8) & 0x0f);
 		vx_outb(chip, LOFREQ, clock & 0xff);
@@ -206,7 +204,6 @@ void vx_set_internal_clock(struct vx_core *chip, unsigned int freq)
 		vx_outl(chip, HIFREQ, (clock >> 8) & 0x0f);
 		vx_outl(chip, LOFREQ, clock & 0xff);
 	}
-	mutex_unlock(&chip->lock);
 }
 
 
-- 
2.50.1

