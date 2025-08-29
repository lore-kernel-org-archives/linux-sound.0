Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7224D2FF17F
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478867; cv=none; b=UvqAXXthhArOnv/6TNhTIFxqfbIBMGhOLaYnhUZvphjsT0BFn33YVtHUjm5iGUZPLWnqFLqBb+dsYP4tVDorfRTUQkwNTlSkc52xSIeBTLLVvrCdDm+hV1+QHiLfXoFvaemSrirSKpKo6DSKVvDNPvt8yRhfa1SyO0qLheRlwpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478867; c=relaxed/simple;
	bh=KIY2bmYsK5dm3MndFKYuRuDwb96uAJkQR6Xcn9hPGR8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZcWUeeujn66kBxwmb+vH+1nGzuAkhzsetdPa1EhQi+ny4yNZLat34GOgh2ZATInG9CMHU9BE2N6spA5KpBxRWQqExjSMhLWadZ7jvGHi0RD7v6UfRyfRLNGEyvQ+ZoJ5y/9NTL3KzAb1ueSqHQqm0UQoFbu8FbcWYv9JvTtJiPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L0teNtXX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rEKULJAD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L0teNtXX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rEKULJAD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L0teNtXX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rEKULJAD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L0teNtXX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rEKULJAD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6ED635C246;
	Fri, 29 Aug 2025 14:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EeKZY7ZGLYNG24TF6UclXq/1Sb7kJ2EvNf5/512Vq8w=;
	b=L0teNtXXKMpHLntsJ0EkzFoCrgxTWah1Tdl6En/c/j40zsvVD7xWWCWO+4ad0wXnZ4h7Dc
	vzagIoFd2pDR34LybIo7+8IuWf+QzUokoQwxPX+PPtREZ04JGR9K3BzfJBQNh/pHfVtvVZ
	K1JzLiNn989zT0ysi263QGU7NeG0s0A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EeKZY7ZGLYNG24TF6UclXq/1Sb7kJ2EvNf5/512Vq8w=;
	b=rEKULJADObeYpTMh9vz3WzWz282vfOL2+b0xN15uDXwJLVtfnrz27Jn2v0+El/zT7ESn61
	XaKfQF5343I2d0CA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=L0teNtXX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rEKULJAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EeKZY7ZGLYNG24TF6UclXq/1Sb7kJ2EvNf5/512Vq8w=;
	b=L0teNtXXKMpHLntsJ0EkzFoCrgxTWah1Tdl6En/c/j40zsvVD7xWWCWO+4ad0wXnZ4h7Dc
	vzagIoFd2pDR34LybIo7+8IuWf+QzUokoQwxPX+PPtREZ04JGR9K3BzfJBQNh/pHfVtvVZ
	K1JzLiNn989zT0ysi263QGU7NeG0s0A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EeKZY7ZGLYNG24TF6UclXq/1Sb7kJ2EvNf5/512Vq8w=;
	b=rEKULJADObeYpTMh9vz3WzWz282vfOL2+b0xN15uDXwJLVtfnrz27Jn2v0+El/zT7ESn61
	XaKfQF5343I2d0CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 558C313A3E;
	Fri, 29 Aug 2025 14:44:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uAOzE7O8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 53/61] ALSA: rme9652: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:43:28 +0200
Message-ID: <20250829144342.4290-54-tiwai@suse.de>
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
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.de:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 6ED635C246
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/rme9652.c | 203 ++++++++++++++----------------------
 1 file changed, 80 insertions(+), 123 deletions(-)

diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index 7dc8e3777c37..3be30cb57a2e 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -308,16 +308,11 @@ static inline unsigned int rme9652_read(struct snd_rme9652 *rme9652, int reg)
 
 static inline int snd_rme9652_use_is_exclusive(struct snd_rme9652 *rme9652)
 {
-	unsigned long flags;
-	int ret = 1;
-
-	spin_lock_irqsave(&rme9652->lock, flags);
+	guard(spinlock_irqsave)(&rme9652->lock);
 	if ((rme9652->playback_pid != rme9652->capture_pid) &&
-	    (rme9652->playback_pid >= 0) && (rme9652->capture_pid >= 0)) {
-		ret = 0;
-	}
-	spin_unlock_irqrestore(&rme9652->lock, flags);
-	return ret;
+	    (rme9652->playback_pid >= 0) && (rme9652->capture_pid >= 0))
+		return 0;
+	return 1;
 }
 
 static inline int rme9652_adat_sample_rate(struct snd_rme9652 *rme9652)
@@ -428,7 +423,7 @@ static int rme9652_set_interrupt_interval(struct snd_rme9652 *s,
 	int restart = 0;
 	int n;
 
-	spin_lock_irq(&s->lock);
+	guard(spinlock_irq)(&s->lock);
 
 	restart = s->running;
 	if (restart)
@@ -451,8 +446,6 @@ static int rme9652_set_interrupt_interval(struct snd_rme9652 *s,
 	if (restart)
 		rme9652_start(s);
 
-	spin_unlock_irq(&s->lock);
-
 	return 0;
 }
 
@@ -477,7 +470,7 @@ static int rme9652_set_rate(struct snd_rme9652 *rme9652, int rate)
 	   is to flag rate changes in the read/write routines.
 	 */
 
-	spin_lock_irq(&rme9652->lock);
+	guard(spinlock_irq)(&rme9652->lock);
 	xrate = rme9652_adat_sample_rate(rme9652);
 
 	switch (rate) {
@@ -506,14 +499,11 @@ static int rme9652_set_rate(struct snd_rme9652 *rme9652, int rate)
 		rate = RME9652_DS | RME9652_freq;
 		break;
 	default:
-		spin_unlock_irq(&rme9652->lock);
 		return -EINVAL;
 	}
 
-	if (reject_if_open && (rme9652->capture_pid >= 0 || rme9652->playback_pid >= 0)) {
-		spin_unlock_irq(&rme9652->lock);
+	if (reject_if_open && (rme9652->capture_pid >= 0 || rme9652->playback_pid >= 0))
 		return -EBUSY;
-	}
 
 	restart = rme9652->running;
 	if (restart)
@@ -539,7 +529,6 @@ static int rme9652_set_rate(struct snd_rme9652 *rme9652, int rate)
 		}
 	}
 
-	spin_unlock_irq(&rme9652->lock);
 	return 0;
 }
 
@@ -798,10 +787,9 @@ static int snd_rme9652_control_spdif_put(struct snd_kcontrol *kcontrol, struct s
 	u32 val;
 	
 	val = snd_rme9652_convert_from_aes(&ucontrol->value.iec958);
-	spin_lock_irq(&rme9652->lock);
+	guard(spinlock_irq)(&rme9652->lock);
 	change = val != rme9652->creg_spdif;
 	rme9652->creg_spdif = val;
-	spin_unlock_irq(&rme9652->lock);
 	return change;
 }
 
@@ -827,12 +815,11 @@ static int snd_rme9652_control_spdif_stream_put(struct snd_kcontrol *kcontrol, s
 	u32 val;
 	
 	val = snd_rme9652_convert_from_aes(&ucontrol->value.iec958);
-	spin_lock_irq(&rme9652->lock);
+	guard(spinlock_irq)(&rme9652->lock);
 	change = val != rme9652->creg_spdif_stream;
 	rme9652->creg_spdif_stream = val;
 	rme9652->control_register &= ~(RME9652_PRO | RME9652_Dolby | RME9652_EMP);
 	rme9652_write(rme9652, RME9652_control_register, rme9652->control_register |= val);
-	spin_unlock_irq(&rme9652->lock);
 	return change;
 }
 
@@ -897,9 +884,8 @@ static int snd_rme9652_get_adat1_in(struct snd_kcontrol *kcontrol, struct snd_ct
 {
 	struct snd_rme9652 *rme9652 = snd_kcontrol_chip(kcontrol);
 	
-	spin_lock_irq(&rme9652->lock);
+	guard(spinlock_irq)(&rme9652->lock);
 	ucontrol->value.enumerated.item[0] = rme9652_adat1_in(rme9652);
-	spin_unlock_irq(&rme9652->lock);
 	return 0;
 }
 
@@ -912,11 +898,10 @@ static int snd_rme9652_put_adat1_in(struct snd_kcontrol *kcontrol, struct snd_ct
 	if (!snd_rme9652_use_is_exclusive(rme9652))
 		return -EBUSY;
 	val = ucontrol->value.enumerated.item[0] % 2;
-	spin_lock_irq(&rme9652->lock);
+	guard(spinlock_irq)(&rme9652->lock);
 	change = val != rme9652_adat1_in(rme9652);
 	if (change)
 		rme9652_set_adat1_input(rme9652, val);
-	spin_unlock_irq(&rme9652->lock);
 	return change;
 }
 
@@ -961,9 +946,8 @@ static int snd_rme9652_get_spdif_in(struct snd_kcontrol *kcontrol, struct snd_ct
 {
 	struct snd_rme9652 *rme9652 = snd_kcontrol_chip(kcontrol);
 	
-	spin_lock_irq(&rme9652->lock);
+	guard(spinlock_irq)(&rme9652->lock);
 	ucontrol->value.enumerated.item[0] = rme9652_spdif_in(rme9652);
-	spin_unlock_irq(&rme9652->lock);
 	return 0;
 }
 
@@ -976,11 +960,10 @@ static int snd_rme9652_put_spdif_in(struct snd_kcontrol *kcontrol, struct snd_ct
 	if (!snd_rme9652_use_is_exclusive(rme9652))
 		return -EBUSY;
 	val = ucontrol->value.enumerated.item[0] % 3;
-	spin_lock_irq(&rme9652->lock);
+	guard(spinlock_irq)(&rme9652->lock);
 	change = val != rme9652_spdif_in(rme9652);
 	if (change)
 		rme9652_set_spdif_input(rme9652, val);
-	spin_unlock_irq(&rme9652->lock);
 	return change;
 }
 
@@ -1022,9 +1005,8 @@ static int snd_rme9652_get_spdif_out(struct snd_kcontrol *kcontrol, struct snd_c
 {
 	struct snd_rme9652 *rme9652 = snd_kcontrol_chip(kcontrol);
 	
-	spin_lock_irq(&rme9652->lock);
+	guard(spinlock_irq)(&rme9652->lock);
 	ucontrol->value.integer.value[0] = rme9652_spdif_out(rme9652);
-	spin_unlock_irq(&rme9652->lock);
 	return 0;
 }
 
@@ -1037,10 +1019,9 @@ static int snd_rme9652_put_spdif_out(struct snd_kcontrol *kcontrol, struct snd_c
 	if (!snd_rme9652_use_is_exclusive(rme9652))
 		return -EBUSY;
 	val = ucontrol->value.integer.value[0] & 1;
-	spin_lock_irq(&rme9652->lock);
+	guard(spinlock_irq)(&rme9652->lock);
 	change = (int)val != rme9652_spdif_out(rme9652);
 	rme9652_set_spdif_output(rme9652, val);
-	spin_unlock_irq(&rme9652->lock);
 	return change;
 }
 
@@ -1104,9 +1085,8 @@ static int snd_rme9652_get_sync_mode(struct snd_kcontrol *kcontrol, struct snd_c
 {
 	struct snd_rme9652 *rme9652 = snd_kcontrol_chip(kcontrol);
 	
-	spin_lock_irq(&rme9652->lock);
+	guard(spinlock_irq)(&rme9652->lock);
 	ucontrol->value.enumerated.item[0] = rme9652_sync_mode(rme9652);
-	spin_unlock_irq(&rme9652->lock);
 	return 0;
 }
 
@@ -1117,10 +1097,9 @@ static int snd_rme9652_put_sync_mode(struct snd_kcontrol *kcontrol, struct snd_c
 	unsigned int val;
 	
 	val = ucontrol->value.enumerated.item[0] % 3;
-	spin_lock_irq(&rme9652->lock);
+	guard(spinlock_irq)(&rme9652->lock);
 	change = (int)val != rme9652_sync_mode(rme9652);
 	rme9652_set_sync_mode(rme9652, val);
-	spin_unlock_irq(&rme9652->lock);
 	return change;
 }
 
@@ -1193,9 +1172,8 @@ static int snd_rme9652_get_sync_pref(struct snd_kcontrol *kcontrol, struct snd_c
 {
 	struct snd_rme9652 *rme9652 = snd_kcontrol_chip(kcontrol);
 	
-	spin_lock_irq(&rme9652->lock);
+	guard(spinlock_irq)(&rme9652->lock);
 	ucontrol->value.enumerated.item[0] = rme9652_sync_pref(rme9652);
-	spin_unlock_irq(&rme9652->lock);
 	return 0;
 }
 
@@ -1209,10 +1187,9 @@ static int snd_rme9652_put_sync_pref(struct snd_kcontrol *kcontrol, struct snd_c
 		return -EBUSY;
 	max = rme9652->ss_channels == RME9652_NCHANNELS ? 4 : 3;
 	val = ucontrol->value.enumerated.item[0] % max;
-	spin_lock_irq(&rme9652->lock);
+	guard(spinlock_irq)(&rme9652->lock);
 	change = (int)val != rme9652_sync_pref(rme9652);
 	rme9652_set_sync_pref(rme9652, val);
-	spin_unlock_irq(&rme9652->lock);
 	return change;
 }
 
@@ -1253,7 +1230,7 @@ static int snd_rme9652_put_thru(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 			thru_bits |= 1 << chn;
 	}
 	
-	spin_lock_irq(&rme9652->lock);
+	guard(spinlock_irq)(&rme9652->lock);
 	change = thru_bits ^ rme9652->thru_bits;
 	if (change) {
 		for (chn = 0; chn < rme9652->ss_channels; ++chn) {
@@ -1262,7 +1239,6 @@ static int snd_rme9652_put_thru(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 			rme9652_set_thru(rme9652,chn,thru_bits&(1<<chn));
 		}
 	}
-	spin_unlock_irq(&rme9652->lock);
 	return !!change;
 }
 
@@ -1278,9 +1254,8 @@ static int snd_rme9652_get_passthru(struct snd_kcontrol *kcontrol, struct snd_ct
 {
 	struct snd_rme9652 *rme9652 = snd_kcontrol_chip(kcontrol);
 
-	spin_lock_irq(&rme9652->lock);
+	guard(spinlock_irq)(&rme9652->lock);
 	ucontrol->value.integer.value[0] = rme9652->passthru;
-	spin_unlock_irq(&rme9652->lock);
 	return 0;
 }
 
@@ -1295,11 +1270,10 @@ static int snd_rme9652_put_passthru(struct snd_kcontrol *kcontrol, struct snd_ct
 		return -EBUSY;
 
 	val = ucontrol->value.integer.value[0] & 1;
-	spin_lock_irq(&rme9652->lock);
+	guard(spinlock_irq)(&rme9652->lock);
 	change = (ucontrol->value.integer.value[0] != rme9652->passthru);
 	if (change)
 		err = rme9652_set_passthru(rme9652, val);
-	spin_unlock_irq(&rme9652->lock);
 	return err ? err : change;
 }
 
@@ -1324,9 +1298,8 @@ static int snd_rme9652_get_spdif_rate(struct snd_kcontrol *kcontrol, struct snd_
 {
 	struct snd_rme9652 *rme9652 = snd_kcontrol_chip(kcontrol);
 	
-	spin_lock_irq(&rme9652->lock);
+	guard(spinlock_irq)(&rme9652->lock);
 	ucontrol->value.integer.value[0] = rme9652_spdif_sample_rate(rme9652);
-	spin_unlock_irq(&rme9652->lock);
 	return 0;
 }
 
@@ -1931,45 +1904,39 @@ static int snd_rme9652_hw_params(struct snd_pcm_substream *substream,
 	pid_t this_pid;
 	pid_t other_pid;
 
-	spin_lock_irq(&rme9652->lock);
+	scoped_guard(spinlock_irq, &rme9652->lock) {
 
-	if (substream->pstr->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		rme9652->control_register &= ~(RME9652_PRO | RME9652_Dolby | RME9652_EMP);
-		rme9652_write(rme9652, RME9652_control_register, rme9652->control_register |= rme9652->creg_spdif_stream);
-		this_pid = rme9652->playback_pid;
-		other_pid = rme9652->capture_pid;
-	} else {
-		this_pid = rme9652->capture_pid;
-		other_pid = rme9652->playback_pid;
-	}
-
-	if ((other_pid > 0) && (this_pid != other_pid)) {
-
-		/* The other stream is open, and not by the same
-		   task as this one. Make sure that the parameters
-		   that matter are the same.
-		 */
-
-		if ((int)params_rate(params) !=
-		    rme9652_adat_sample_rate(rme9652)) {
-			spin_unlock_irq(&rme9652->lock);
-			_snd_pcm_hw_param_setempty(params, SNDRV_PCM_HW_PARAM_RATE);
-			return -EBUSY;
+		if (substream->pstr->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			rme9652->control_register &= ~(RME9652_PRO | RME9652_Dolby | RME9652_EMP);
+			rme9652_write(rme9652, RME9652_control_register, rme9652->control_register |= rme9652->creg_spdif_stream);
+			this_pid = rme9652->playback_pid;
+			other_pid = rme9652->capture_pid;
+		} else {
+			this_pid = rme9652->capture_pid;
+			other_pid = rme9652->playback_pid;
 		}
 
-		if (params_period_size(params) != rme9652->period_bytes / 4) {
-			spin_unlock_irq(&rme9652->lock);
-			_snd_pcm_hw_param_setempty(params, SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
-			return -EBUSY;
+		if ((other_pid > 0) && (this_pid != other_pid)) {
+
+			/* The other stream is open, and not by the same
+			   task as this one. Make sure that the parameters
+			   that matter are the same.
+			*/
+
+			if ((int)params_rate(params) !=
+			    rme9652_adat_sample_rate(rme9652)) {
+				_snd_pcm_hw_param_setempty(params, SNDRV_PCM_HW_PARAM_RATE);
+				return -EBUSY;
+			}
+
+			if (params_period_size(params) != rme9652->period_bytes / 4) {
+				_snd_pcm_hw_param_setempty(params, SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
+				return -EBUSY;
+			}
+
+			/* We're fine. */
+			return 0;
 		}
-
-		/* We're fine. */
-
-		spin_unlock_irq(&rme9652->lock);
- 		return 0;
-
-	} else {
-		spin_unlock_irq(&rme9652->lock);
 	}
 
 	/* how to make sure that the rate matches an externally-set one ?
@@ -2041,7 +2008,8 @@ static int snd_rme9652_trigger(struct snd_pcm_substream *substream,
 	struct snd_rme9652 *rme9652 = snd_pcm_substream_chip(substream);
 	struct snd_pcm_substream *other;
 	int running;
-	spin_lock(&rme9652->lock);
+
+	guard(spinlock)(&rme9652->lock);
 	running = rme9652->running;
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -2052,7 +2020,6 @@ static int snd_rme9652_trigger(struct snd_pcm_substream *substream,
 		break;
 	default:
 		snd_BUG();
-		spin_unlock(&rme9652->lock);
 		return -EINVAL;
 	}
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -2092,7 +2059,6 @@ static int snd_rme9652_trigger(struct snd_pcm_substream *substream,
 	else if (rme9652->running && !running)
 		rme9652_stop(rme9652);
 	rme9652->running = running;
-	spin_unlock(&rme9652->lock);
 
 	return 0;
 }
@@ -2100,12 +2066,10 @@ static int snd_rme9652_trigger(struct snd_pcm_substream *substream,
 static int snd_rme9652_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_rme9652 *rme9652 = snd_pcm_substream_chip(substream);
-	unsigned long flags;
 
-	spin_lock_irqsave(&rme9652->lock, flags);
+	guard(spinlock_irqsave)(&rme9652->lock);
 	if (!rme9652->running)
 		rme9652_reset_hw_pointer(rme9652);
-	spin_unlock_irqrestore(&rme9652->lock, flags);
 	return 0;
 }
 
@@ -2226,23 +2190,21 @@ static int snd_rme9652_playback_open(struct snd_pcm_substream *substream)
 	struct snd_rme9652 *rme9652 = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	spin_lock_irq(&rme9652->lock);
+	scoped_guard(spinlock_irq, &rme9652->lock) {
+		snd_pcm_set_sync(substream);
 
-	snd_pcm_set_sync(substream);
+		runtime->hw = snd_rme9652_playback_subinfo;
+		snd_pcm_set_runtime_buffer(substream, &rme9652->playback_dma_buf);
 
-        runtime->hw = snd_rme9652_playback_subinfo;
-	snd_pcm_set_runtime_buffer(substream, &rme9652->playback_dma_buf);
+		if (rme9652->capture_substream == NULL) {
+			rme9652_stop(rme9652);
+			rme9652_set_thru(rme9652, -1, 0);
+		}
 
-	if (rme9652->capture_substream == NULL) {
-		rme9652_stop(rme9652);
-		rme9652_set_thru(rme9652, -1, 0);
+		rme9652->playback_pid = current->pid;
+		rme9652->playback_substream = substream;
 	}
 
-	rme9652->playback_pid = current->pid;
-	rme9652->playback_substream = substream;
-
-	spin_unlock_irq(&rme9652->lock);
-
 	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, &hw_constraints_period_sizes);
 	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
@@ -2266,12 +2228,10 @@ static int snd_rme9652_playback_release(struct snd_pcm_substream *substream)
 {
 	struct snd_rme9652 *rme9652 = snd_pcm_substream_chip(substream);
 
-	spin_lock_irq(&rme9652->lock);
-
-	rme9652->playback_pid = -1;
-	rme9652->playback_substream = NULL;
-
-	spin_unlock_irq(&rme9652->lock);
+	scoped_guard(spinlock_irq, &rme9652->lock) {
+		rme9652->playback_pid = -1;
+		rme9652->playback_substream = NULL;
+	}
 
 	rme9652->spdif_ctl->vd[0].access |= SNDRV_CTL_ELEM_ACCESS_INACTIVE;
 	snd_ctl_notify(rme9652->card, SNDRV_CTL_EVENT_MASK_VALUE |
@@ -2285,23 +2245,21 @@ static int snd_rme9652_capture_open(struct snd_pcm_substream *substream)
 	struct snd_rme9652 *rme9652 = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	spin_lock_irq(&rme9652->lock);
+	scoped_guard(spinlock_irq, &rme9652->lock) {
+		snd_pcm_set_sync(substream);
 
-	snd_pcm_set_sync(substream);
+		runtime->hw = snd_rme9652_capture_subinfo;
+		snd_pcm_set_runtime_buffer(substream, &rme9652->capture_dma_buf);
 
-	runtime->hw = snd_rme9652_capture_subinfo;
-	snd_pcm_set_runtime_buffer(substream, &rme9652->capture_dma_buf);
+		if (rme9652->playback_substream == NULL) {
+			rme9652_stop(rme9652);
+			rme9652_set_thru(rme9652, -1, 0);
+		}
 
-	if (rme9652->playback_substream == NULL) {
-		rme9652_stop(rme9652);
-		rme9652_set_thru(rme9652, -1, 0);
+		rme9652->capture_pid = current->pid;
+		rme9652->capture_substream = substream;
 	}
 
-	rme9652->capture_pid = current->pid;
-	rme9652->capture_substream = substream;
-
-	spin_unlock_irq(&rme9652->lock);
-
 	snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, &hw_constraints_period_sizes);
 	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
@@ -2320,12 +2278,11 @@ static int snd_rme9652_capture_release(struct snd_pcm_substream *substream)
 {
 	struct snd_rme9652 *rme9652 = snd_pcm_substream_chip(substream);
 
-	spin_lock_irq(&rme9652->lock);
+	guard(spinlock_irq)(&rme9652->lock);
 
 	rme9652->capture_pid = -1;
 	rme9652->capture_substream = NULL;
 
-	spin_unlock_irq(&rme9652->lock);
 	return 0;
 }
 
-- 
2.50.1

