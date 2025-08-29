Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5176314A9B
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479667; cv=none; b=sA/m89dg+O5kC35t7bSghw97LOgbbInpl4uHFzCMyBg8ZLCIsAKmQeGze/onQB3vZ1BsnXnqAdHDbLAmwaa7zk2dXNEk4nfNqshPMqTLnBmzuXWayGj+uyq/l05LTT5xBcoeLMAXF4q8SXNsj61hNQSxsIV0phqjVSfdT7vA6Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479667; c=relaxed/simple;
	bh=670y2/LtFAGYt8MTA/ZWS3Sqt22jIC3dvqO14ioK5E0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aj3vlFYnK62vQSA9S0STqxThRBMuUIO0C7RFtI+LqMUWuE/+9wygtHq5QqyQOp9sPzFnBfJxFRcTVOHihIC58G1KFfjKvctQM67Yytw8tHwa02jp9XdM/R7kus/yfGFAhO3M9jwDG0+TsztJ53aMkqyie9EISB9y9pqp6tg8tzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BbzOrABb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Bcecgm40; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BbzOrABb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Bcecgm40; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BbzOrABb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bcecgm40";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BbzOrABb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bcecgm40"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 649CB33EE1;
	Fri, 29 Aug 2025 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/NTVvzbYRt2tpQUe4idw5JfFTbyiY3O0CPJwScQ8zHQ=;
	b=BbzOrABbmSrlWVZuLZtwZpahHuHUOrHRXulHd7lCu2jzpaND6qoTiBXNV+KAou2781R1UB
	f9zbHmfHbF2c9sO1dZpbnS/qjcXG2Br2tpR9InsCEbAwXWaoaye7vOrwuuBtPh1MqEZ/u7
	Yr3zLZhDk5Fs2ITEkDVKy+LikytJZaQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/NTVvzbYRt2tpQUe4idw5JfFTbyiY3O0CPJwScQ8zHQ=;
	b=Bcecgm405Cmew8rZcXTQW/adqhTbpVAYEC7bj/G90qYmppYyWkiAYTqqQB9BuwZ0MSCNE6
	q2s1Rq6DxMEmlKBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BbzOrABb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Bcecgm40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/NTVvzbYRt2tpQUe4idw5JfFTbyiY3O0CPJwScQ8zHQ=;
	b=BbzOrABbmSrlWVZuLZtwZpahHuHUOrHRXulHd7lCu2jzpaND6qoTiBXNV+KAou2781R1UB
	f9zbHmfHbF2c9sO1dZpbnS/qjcXG2Br2tpR9InsCEbAwXWaoaye7vOrwuuBtPh1MqEZ/u7
	Yr3zLZhDk5Fs2ITEkDVKy+LikytJZaQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/NTVvzbYRt2tpQUe4idw5JfFTbyiY3O0CPJwScQ8zHQ=;
	b=Bcecgm405Cmew8rZcXTQW/adqhTbpVAYEC7bj/G90qYmppYyWkiAYTqqQB9BuwZ0MSCNE6
	q2s1Rq6DxMEmlKBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40A1A13A54;
	Fri, 29 Aug 2025 15:00:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aOmfDpDAsWjjHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:00:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 08/13] ALSA: dummy: Use guard() for spin locks
Date: Fri, 29 Aug 2025 17:00:19 +0200
Message-ID: <20250829150026.6379-9-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
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
X-Rspamd-Queue-Id: 649CB33EE1
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/dummy.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 6dac0b2523c1..1860ff75fe15 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -269,19 +269,19 @@ static void dummy_systimer_update(struct dummy_systimer_pcm *dpcm)
 static int dummy_systimer_start(struct snd_pcm_substream *substream)
 {
 	struct dummy_systimer_pcm *dpcm = substream->runtime->private_data;
-	spin_lock(&dpcm->lock);
+
+	guard(spinlock)(&dpcm->lock);
 	dpcm->base_time = jiffies;
 	dummy_systimer_rearm(dpcm);
-	spin_unlock(&dpcm->lock);
 	return 0;
 }
 
 static int dummy_systimer_stop(struct snd_pcm_substream *substream)
 {
 	struct dummy_systimer_pcm *dpcm = substream->runtime->private_data;
-	spin_lock(&dpcm->lock);
+
+	guard(spinlock)(&dpcm->lock);
 	timer_delete(&dpcm->timer);
-	spin_unlock(&dpcm->lock);
 	return 0;
 }
 
@@ -303,15 +303,14 @@ static int dummy_systimer_prepare(struct snd_pcm_substream *substream)
 static void dummy_systimer_callback(struct timer_list *t)
 {
 	struct dummy_systimer_pcm *dpcm = timer_container_of(dpcm, t, timer);
-	unsigned long flags;
 	int elapsed = 0;
 
-	spin_lock_irqsave(&dpcm->lock, flags);
-	dummy_systimer_update(dpcm);
-	dummy_systimer_rearm(dpcm);
-	elapsed = dpcm->elapsed;
-	dpcm->elapsed = 0;
-	spin_unlock_irqrestore(&dpcm->lock, flags);
+	scoped_guard(spinlock_irqsave, &dpcm->lock) {
+		dummy_systimer_update(dpcm);
+		dummy_systimer_rearm(dpcm);
+		elapsed = dpcm->elapsed;
+		dpcm->elapsed = 0;
+	}
 	if (elapsed)
 		snd_pcm_period_elapsed(dpcm->substream);
 }
@@ -320,13 +319,10 @@ static snd_pcm_uframes_t
 dummy_systimer_pointer(struct snd_pcm_substream *substream)
 {
 	struct dummy_systimer_pcm *dpcm = substream->runtime->private_data;
-	snd_pcm_uframes_t pos;
 
-	spin_lock(&dpcm->lock);
+	guard(spinlock)(&dpcm->lock);
 	dummy_systimer_update(dpcm);
-	pos = dpcm->frac_pos / HZ;
-	spin_unlock(&dpcm->lock);
-	return pos;
+	return dpcm->frac_pos / HZ;
 }
 
 static int dummy_systimer_create(struct snd_pcm_substream *substream)
@@ -724,10 +720,9 @@ static int snd_dummy_volume_get(struct snd_kcontrol *kcontrol,
 	struct snd_dummy *dummy = snd_kcontrol_chip(kcontrol);
 	int addr = kcontrol->private_value;
 
-	spin_lock_irq(&dummy->mixer_lock);
+	guard(spinlock_irq)(&dummy->mixer_lock);
 	ucontrol->value.integer.value[0] = dummy->mixer_volume[addr][0];
 	ucontrol->value.integer.value[1] = dummy->mixer_volume[addr][1];
-	spin_unlock_irq(&dummy->mixer_lock);
 	return 0;
 }
 
@@ -748,12 +743,11 @@ static int snd_dummy_volume_put(struct snd_kcontrol *kcontrol,
 		right = mixer_volume_level_min;
 	if (right > mixer_volume_level_max)
 		right = mixer_volume_level_max;
-	spin_lock_irq(&dummy->mixer_lock);
+	guard(spinlock_irq)(&dummy->mixer_lock);
 	change = dummy->mixer_volume[addr][0] != left ||
 	         dummy->mixer_volume[addr][1] != right;
 	dummy->mixer_volume[addr][0] = left;
 	dummy->mixer_volume[addr][1] = right;
-	spin_unlock_irq(&dummy->mixer_lock);
 	return change;
 }
 
@@ -773,10 +767,9 @@ static int snd_dummy_capsrc_get(struct snd_kcontrol *kcontrol,
 	struct snd_dummy *dummy = snd_kcontrol_chip(kcontrol);
 	int addr = kcontrol->private_value;
 
-	spin_lock_irq(&dummy->mixer_lock);
+	guard(spinlock_irq)(&dummy->mixer_lock);
 	ucontrol->value.integer.value[0] = dummy->capture_source[addr][0];
 	ucontrol->value.integer.value[1] = dummy->capture_source[addr][1];
-	spin_unlock_irq(&dummy->mixer_lock);
 	return 0;
 }
 
@@ -788,12 +781,11 @@ static int snd_dummy_capsrc_put(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 
 	left = ucontrol->value.integer.value[0] & 1;
 	right = ucontrol->value.integer.value[1] & 1;
-	spin_lock_irq(&dummy->mixer_lock);
+	guard(spinlock_irq)(&dummy->mixer_lock);
 	change = dummy->capture_source[addr][0] != left &&
 	         dummy->capture_source[addr][1] != right;
 	dummy->capture_source[addr][0] = left;
 	dummy->capture_source[addr][1] = right;
-	spin_unlock_irq(&dummy->mixer_lock);
 	return change;
 }
 
-- 
2.50.1

