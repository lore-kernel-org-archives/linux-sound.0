Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768D11E0DE8
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479635; cv=none; b=YjH7UCEk6GI0eRIWiHr1fvc52sRA5vdGzVZubcnE8iHuEwlwR3JZtinP/QS/Al9iAl5xuBB9QAmgi8GhfhussD2Anb89KWW5cP+DsHqjCD9mJCK3DaH/6/Gfg0nX+e3jzJu67poJUUKjr6yxT5dQ/D26iRKInEt3goemU9TS4cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479635; c=relaxed/simple;
	bh=NLMtIuqGpY5KNstt69t1rUnOlKy4LXzWJ1+NM8VdVMA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XiToS6ZplOnGRGto1PA6VuGgioDVi/A6fh13GcxCyoSNeGG3pYUmvgl7X7VGnX/8qh1PF3peoKjWxZhwduW8HBn2DNZqIm57Qn6sg4PuAVSkdaElOdbkPd46SECZPl+pf9ztCdxNORsR10T6w2Z97HCnXHMRYH0sncUpkg/SgSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fPQTGzgy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8N2FvSGd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fPQTGzgy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8N2FvSGd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fPQTGzgy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8N2FvSGd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fPQTGzgy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8N2FvSGd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7A60B33EDB;
	Fri, 29 Aug 2025 15:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WmPanEdBKuKzYGMqGc+m8ABcz5n+OrLifEk2FkHMqQY=;
	b=fPQTGzgyxp6maX7qIYWr+M/d2GUeO5dfvM5SjUGQ2QR9TrkfH/ybRSQ5nKeAOn1HzyrZGI
	eZk91zr1/MBbNnKiML28xQRmqRNnhLN/e8BvDf6FzhtX6YVgoX2qlde6ILttfmfdHQEYq+
	qccAVqZ0Mf+vBFCcS8Tw2Tvk6WwhAMg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WmPanEdBKuKzYGMqGc+m8ABcz5n+OrLifEk2FkHMqQY=;
	b=8N2FvSGdaXzVKUcm5naiuvxVf05GvziCktX0ftTnJqvV6M+BiXc+uRaWhG9jSrRn08iKkc
	Tn8veLn1GCKwhyAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WmPanEdBKuKzYGMqGc+m8ABcz5n+OrLifEk2FkHMqQY=;
	b=fPQTGzgyxp6maX7qIYWr+M/d2GUeO5dfvM5SjUGQ2QR9TrkfH/ybRSQ5nKeAOn1HzyrZGI
	eZk91zr1/MBbNnKiML28xQRmqRNnhLN/e8BvDf6FzhtX6YVgoX2qlde6ILttfmfdHQEYq+
	qccAVqZ0Mf+vBFCcS8Tw2Tvk6WwhAMg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WmPanEdBKuKzYGMqGc+m8ABcz5n+OrLifEk2FkHMqQY=;
	b=8N2FvSGdaXzVKUcm5naiuvxVf05GvziCktX0ftTnJqvV6M+BiXc+uRaWhG9jSrRn08iKkc
	Tn8veLn1GCKwhyAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6060713A54;
	Fri, 29 Aug 2025 15:00:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eIhcFo/AsWjjHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:00:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 01/13] ALSA: aloop: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:00:12 +0200
Message-ID: <20250829150026.6379-2-tiwai@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/aloop.c | 83 +++++++++++++++++--------------------------
 1 file changed, 33 insertions(+), 50 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index a8902dc45dc1..79e7f03e51e9 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -511,13 +511,12 @@ static int loopback_prepare(struct snd_pcm_substream *substream)
 	dpcm->pcm_salign = salign;
 	dpcm->pcm_period_size = frames_to_bytes(runtime, runtime->period_size);
 
-	mutex_lock(&dpcm->loopback->cable_lock);
+	guard(mutex)(&dpcm->loopback->cable_lock);
 	if (!(cable->valid & ~(1 << substream->stream)) ||
             (get_setup(dpcm)->notify &&
 	     substream->stream == SNDRV_PCM_STREAM_PLAYBACK))
 		params_change(substream);
 	cable->valid |= 1 << substream->stream;
-	mutex_unlock(&dpcm->loopback->cable_lock);
 
 	return 0;
 }
@@ -958,9 +957,8 @@ static int loopback_hw_free(struct snd_pcm_substream *substream)
 	struct loopback_pcm *dpcm = runtime->private_data;
 	struct loopback_cable *cable = dpcm->cable;
 
-	mutex_lock(&dpcm->loopback->cable_lock);
+	guard(mutex)(&dpcm->loopback->cable_lock);
 	cable->valid &= ~(1 << substream->stream);
-	mutex_unlock(&dpcm->loopback->cable_lock);
 	return 0;
 }
 
@@ -980,10 +978,10 @@ static int rule_format(struct snd_pcm_hw_params *params,
 	struct snd_mask m;
 
 	snd_mask_none(&m);
-	mutex_lock(&dpcm->loopback->cable_lock);
-	m.bits[0] = (u_int32_t)cable->hw.formats;
-	m.bits[1] = (u_int32_t)(cable->hw.formats >> 32);
-	mutex_unlock(&dpcm->loopback->cable_lock);
+	scoped_guard(mutex, &dpcm->loopback->cable_lock) {
+		m.bits[0] = (u_int32_t)cable->hw.formats;
+		m.bits[1] = (u_int32_t)(cable->hw.formats >> 32);
+	}
 	return snd_mask_refine(hw_param_mask(params, rule->var), &m);
 }
 
@@ -994,10 +992,10 @@ static int rule_rate(struct snd_pcm_hw_params *params,
 	struct loopback_cable *cable = dpcm->cable;
 	struct snd_interval t;
 
-	mutex_lock(&dpcm->loopback->cable_lock);
-	t.min = cable->hw.rate_min;
-	t.max = cable->hw.rate_max;
-	mutex_unlock(&dpcm->loopback->cable_lock);
+	scoped_guard(mutex, &dpcm->loopback->cable_lock) {
+		t.min = cable->hw.rate_min;
+		t.max = cable->hw.rate_max;
+	}
         t.openmin = t.openmax = 0;
         t.integer = 0;
 	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
@@ -1010,10 +1008,10 @@ static int rule_channels(struct snd_pcm_hw_params *params,
 	struct loopback_cable *cable = dpcm->cable;
 	struct snd_interval t;
 
-	mutex_lock(&dpcm->loopback->cable_lock);
-	t.min = cable->hw.channels_min;
-	t.max = cable->hw.channels_max;
-	mutex_unlock(&dpcm->loopback->cable_lock);
+	scoped_guard(mutex, &dpcm->loopback->cable_lock) {
+		t.min = cable->hw.channels_min;
+		t.max = cable->hw.channels_max;
+	}
         t.openmin = t.openmax = 0;
         t.integer = 0;
 	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
@@ -1026,10 +1024,10 @@ static int rule_period_bytes(struct snd_pcm_hw_params *params,
 	struct loopback_cable *cable = dpcm->cable;
 	struct snd_interval t;
 
-	mutex_lock(&dpcm->loopback->cable_lock);
-	t.min = cable->hw.period_bytes_min;
-	t.max = cable->hw.period_bytes_max;
-	mutex_unlock(&dpcm->loopback->cable_lock);
+	scoped_guard(mutex, &dpcm->loopback->cable_lock) {
+		t.min = cable->hw.period_bytes_min;
+		t.max = cable->hw.period_bytes_max;
+	}
 	t.openmin = 0;
 	t.openmax = 0;
 	t.integer = 0;
@@ -1238,12 +1236,10 @@ static int loopback_open(struct snd_pcm_substream *substream)
 	int err = 0;
 	int dev = get_cable_index(substream);
 
-	mutex_lock(&loopback->cable_lock);
+	guard(mutex)(&loopback->cable_lock);
 	dpcm = kzalloc(sizeof(*dpcm), GFP_KERNEL);
-	if (!dpcm) {
-		err = -ENOMEM;
-		goto unlock;
-	}
+	if (!dpcm)
+		return -ENOMEM;
 	dpcm->loopback = loopback;
 	dpcm->substream = substream;
 
@@ -1326,7 +1322,6 @@ static int loopback_open(struct snd_pcm_substream *substream)
 		free_cable(substream);
 		kfree(dpcm);
 	}
-	mutex_unlock(&loopback->cable_lock);
 	return err;
 }
 
@@ -1338,9 +1333,8 @@ static int loopback_close(struct snd_pcm_substream *substream)
 
 	if (dpcm->cable->ops->close_substream)
 		err = dpcm->cable->ops->close_substream(dpcm);
-	mutex_lock(&loopback->cable_lock);
+	guard(mutex)(&loopback->cable_lock);
 	free_cable(substream);
-	mutex_unlock(&loopback->cable_lock);
 	return err;
 }
 
@@ -1391,11 +1385,10 @@ static int loopback_rate_shift_get(struct snd_kcontrol *kcontrol,
 {
 	struct loopback *loopback = snd_kcontrol_chip(kcontrol);
 	
-	mutex_lock(&loopback->cable_lock);
+	guard(mutex)(&loopback->cable_lock);
 	ucontrol->value.integer.value[0] =
 		loopback->setup[kcontrol->id.subdevice]
 			       [kcontrol->id.device].rate_shift;
-	mutex_unlock(&loopback->cable_lock);
 	return 0;
 }
 
@@ -1411,14 +1404,13 @@ static int loopback_rate_shift_put(struct snd_kcontrol *kcontrol,
 		val = 80000;
 	if (val > 120000)
 		val = 120000;	
-	mutex_lock(&loopback->cable_lock);
+	guard(mutex)(&loopback->cable_lock);
 	if (val != loopback->setup[kcontrol->id.subdevice]
 				  [kcontrol->id.device].rate_shift) {
 		loopback->setup[kcontrol->id.subdevice]
 			       [kcontrol->id.device].rate_shift = val;
 		change = 1;
 	}
-	mutex_unlock(&loopback->cable_lock);
 	return change;
 }
 
@@ -1427,11 +1419,10 @@ static int loopback_notify_get(struct snd_kcontrol *kcontrol,
 {
 	struct loopback *loopback = snd_kcontrol_chip(kcontrol);
 	
-	mutex_lock(&loopback->cable_lock);
+	guard(mutex)(&loopback->cable_lock);
 	ucontrol->value.integer.value[0] =
 		loopback->setup[kcontrol->id.subdevice]
 			       [kcontrol->id.device].notify;
-	mutex_unlock(&loopback->cable_lock);
 	return 0;
 }
 
@@ -1443,14 +1434,13 @@ static int loopback_notify_put(struct snd_kcontrol *kcontrol,
 	int change = 0;
 
 	val = ucontrol->value.integer.value[0] ? 1 : 0;
-	mutex_lock(&loopback->cable_lock);
+	guard(mutex)(&loopback->cable_lock);
 	if (val != loopback->setup[kcontrol->id.subdevice]
 				[kcontrol->id.device].notify) {
 		loopback->setup[kcontrol->id.subdevice]
 			[kcontrol->id.device].notify = val;
 		change = 1;
 	}
-	mutex_unlock(&loopback->cable_lock);
 	return change;
 }
 
@@ -1462,14 +1452,13 @@ static int loopback_active_get(struct snd_kcontrol *kcontrol,
 
 	unsigned int val = 0;
 
-	mutex_lock(&loopback->cable_lock);
+	guard(mutex)(&loopback->cable_lock);
 	cable = loopback->cables[kcontrol->id.subdevice][kcontrol->id.device ^ 1];
 	if (cable != NULL) {
 		unsigned int running = cable->running ^ cable->pause;
 
 		val = (running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) ? 1 : 0;
 	}
-	mutex_unlock(&loopback->cable_lock);
 	ucontrol->value.integer.value[0] = val;
 	return 0;
 }
@@ -1512,11 +1501,10 @@ static int loopback_rate_get(struct snd_kcontrol *kcontrol,
 {
 	struct loopback *loopback = snd_kcontrol_chip(kcontrol);
 	
-	mutex_lock(&loopback->cable_lock);
+	guard(mutex)(&loopback->cable_lock);
 	ucontrol->value.integer.value[0] =
 		loopback->setup[kcontrol->id.subdevice]
 			       [kcontrol->id.device].rate;
-	mutex_unlock(&loopback->cable_lock);
 	return 0;
 }
 
@@ -1536,11 +1524,10 @@ static int loopback_channels_get(struct snd_kcontrol *kcontrol,
 {
 	struct loopback *loopback = snd_kcontrol_chip(kcontrol);
 	
-	mutex_lock(&loopback->cable_lock);
+	guard(mutex)(&loopback->cable_lock);
 	ucontrol->value.integer.value[0] =
 		loopback->setup[kcontrol->id.subdevice]
 			       [kcontrol->id.device].channels;
-	mutex_unlock(&loopback->cable_lock);
 	return 0;
 }
 
@@ -1558,12 +1545,11 @@ static int loopback_access_get(struct snd_kcontrol *kcontrol,
 	struct loopback *loopback = snd_kcontrol_chip(kcontrol);
 	snd_pcm_access_t access;
 
-	mutex_lock(&loopback->cable_lock);
+	guard(mutex)(&loopback->cable_lock);
 	access = loopback->setup[kcontrol->id.subdevice][kcontrol->id.device].access;
 
 	ucontrol->value.enumerated.item[0] = !is_access_interleaved(access);
 
-	mutex_unlock(&loopback->cable_lock);
 	return 0;
 }
 
@@ -1731,12 +1717,11 @@ static void print_cable_info(struct snd_info_entry *entry,
 	struct loopback *loopback = entry->private_data;
 	int sub, num;
 
-	mutex_lock(&loopback->cable_lock);
+	guard(mutex)(&loopback->cable_lock);
 	num = entry->name[strlen(entry->name)-1];
 	num = num == '0' ? 0 : 1;
 	for (sub = 0; sub < MAX_PCM_SUBSTREAMS; sub++)
 		print_substream_info(buffer, loopback, sub, num);
-	mutex_unlock(&loopback->cable_lock);
 }
 
 static int loopback_cable_proc_new(struct loopback *loopback, int cidx)
@@ -1765,10 +1750,9 @@ static void print_timer_source_info(struct snd_info_entry *entry,
 {
 	struct loopback *loopback = entry->private_data;
 
-	mutex_lock(&loopback->cable_lock);
+	guard(mutex)(&loopback->cable_lock);
 	snd_iprintf(buffer, "%s\n",
 		    loopback->timer_source ? loopback->timer_source : "");
-	mutex_unlock(&loopback->cable_lock);
 }
 
 static void change_timer_source_info(struct snd_info_entry *entry,
@@ -1777,10 +1761,9 @@ static void change_timer_source_info(struct snd_info_entry *entry,
 	struct loopback *loopback = entry->private_data;
 	char line[64];
 
-	mutex_lock(&loopback->cable_lock);
+	guard(mutex)(&loopback->cable_lock);
 	if (!snd_info_get_line(buffer, line, sizeof(line)))
 		loopback_set_timer_source(loopback, strim(line));
-	mutex_unlock(&loopback->cable_lock);
 }
 
 static int loopback_timer_source_proc_new(struct loopback *loopback)
-- 
2.50.1

