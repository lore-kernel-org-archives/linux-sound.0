Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B4A322746
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480452; cv=none; b=OK7nIQ2hZZS67bXzlI1A1CRs85d49UYwVAjAknd+RGS6DW7rlecdpMkwx7ElZYz+YLvlPQL/0zOtkpXPOwF+QIGRuyiO+Ra2YfGCTrXjhII/OSP2MY7+LlN+W+7od8VYHjr7UQXrBf9C5ouNIlrr7wFxUD1p7kCPaT6x6G8uvq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480452; c=relaxed/simple;
	bh=N+8ft6JoJamp/h8wlRY01gL72F70r3/vSggYe4aRnuM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZyDWAvMVU8Uq22OgZ2dHqTRQveU8mhGg1/o4BHbhBYPwIZ2lq5VBzvYcH5Fw2Ht6sn2KBVujX2omMcoAZXZ8/Fm3fP8dsUeeiaJrNGQ66Y0HXQcq2pm44j8WTYtZk4oFs7MhIvCSVPiJNwJ00NHw1DjtA9y6h7kh8kQcKo3aXdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K2ioFpam; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SJdt7XgU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K2ioFpam; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SJdt7XgU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K2ioFpam";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SJdt7XgU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K2ioFpam";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SJdt7XgU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BC6FD5C26C;
	Fri, 29 Aug 2025 15:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K3ceXoxwSuANn4jszBpJNiJjUjUiKhuEQQJq/SmEfxs=;
	b=K2ioFpamkdNZ7z/q2LzsWC3T5+G4hSXmhesikWuoHtkUP5caR1nehIOUmypiEZje8e2T6u
	sVn14eJ922wjz2OixY4pQ53gbVts4twa0dyib4ui3RpIs6nP3SwbMS16ULYm16lO9hO4Ou
	aL1CZmj/XaPW3GdKbPCCkpDuJ+4/kAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K3ceXoxwSuANn4jszBpJNiJjUjUiKhuEQQJq/SmEfxs=;
	b=SJdt7XgUr1WpaJpxuU/li02QfsLchAlcyWCInkAXFJcaao3IBwzYlTFofpjtcLfWsR/Ly+
	65R9MFl3bRIVUnAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=K2ioFpam;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SJdt7XgU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K3ceXoxwSuANn4jszBpJNiJjUjUiKhuEQQJq/SmEfxs=;
	b=K2ioFpamkdNZ7z/q2LzsWC3T5+G4hSXmhesikWuoHtkUP5caR1nehIOUmypiEZje8e2T6u
	sVn14eJ922wjz2OixY4pQ53gbVts4twa0dyib4ui3RpIs6nP3SwbMS16ULYm16lO9hO4Ou
	aL1CZmj/XaPW3GdKbPCCkpDuJ+4/kAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K3ceXoxwSuANn4jszBpJNiJjUjUiKhuEQQJq/SmEfxs=;
	b=SJdt7XgUr1WpaJpxuU/li02QfsLchAlcyWCInkAXFJcaao3IBwzYlTFofpjtcLfWsR/Ly+
	65R9MFl3bRIVUnAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97F8113326;
	Fri, 29 Aug 2025 15:13:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UNLhI6bDsWiQIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:13:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 11/19] ALSA: vxpocket: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:13:25 +0200
Message-ID: <20250829151335.7342-12-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829151335.7342-1-tiwai@suse.de>
References: <20250829151335.7342-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: BC6FD5C26C
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
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
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pcmcia/vx/vxp_mixer.c | 9 +++------
 sound/pcmcia/vx/vxp_ops.c   | 6 ++----
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/pcmcia/vx/vxp_mixer.c b/sound/pcmcia/vx/vxp_mixer.c
index bc2114475810..998cea2d0318 100644
--- a/sound/pcmcia/vx/vxp_mixer.c
+++ b/sound/pcmcia/vx/vxp_mixer.c
@@ -43,14 +43,12 @@ static int vx_mic_level_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_v
 
 	if (val > MIC_LEVEL_MAX)
 		return -EINVAL;
-	mutex_lock(&_chip->mixer_mutex);
+	guard(mutex)(&_chip->mixer_mutex);
 	if (chip->mic_level != ucontrol->value.integer.value[0]) {
 		vx_set_mic_level(_chip, ucontrol->value.integer.value[0]);
 		chip->mic_level = ucontrol->value.integer.value[0];
-		mutex_unlock(&_chip->mixer_mutex);
 		return 1;
 	}
-	mutex_unlock(&_chip->mixer_mutex);
 	return 0;
 }
 
@@ -85,14 +83,13 @@ static int vx_mic_boost_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_v
 	struct vx_core *_chip = snd_kcontrol_chip(kcontrol);
 	struct snd_vxpocket *chip = to_vxpocket(_chip);
 	int val = !!ucontrol->value.integer.value[0];
-	mutex_lock(&_chip->mixer_mutex);
+
+	guard(mutex)(&_chip->mixer_mutex);
 	if (chip->mic_level != val) {
 		vx_set_mic_boost(_chip, val);
 		chip->mic_level = val;
-		mutex_unlock(&_chip->mixer_mutex);
 		return 1;
 	}
-	mutex_unlock(&_chip->mixer_mutex);
 	return 0;
 }
 
diff --git a/sound/pcmcia/vx/vxp_ops.c b/sound/pcmcia/vx/vxp_ops.c
index 0bc5c5d9d157..4211e7239138 100644
--- a/sound/pcmcia/vx/vxp_ops.c
+++ b/sound/pcmcia/vx/vxp_ops.c
@@ -463,7 +463,7 @@ void vx_set_mic_boost(struct vx_core *chip, int boost)
 	if (chip->chip_status & VX_STAT_IS_STALE)
 		return;
 
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 	if (pchip->regCDSP & P24_CDSP_MICS_SEL_MASK) {
 		if (boost) {
 			/* boost: 38 dB */
@@ -476,7 +476,6 @@ void vx_set_mic_boost(struct vx_core *chip, int boost)
                 }
 		vx_outb(chip, CDSP, pchip->regCDSP);
 	}
-	mutex_unlock(&chip->lock);
 }
 
 /*
@@ -505,12 +504,11 @@ void vx_set_mic_level(struct vx_core *chip, int level)
 	if (chip->chip_status & VX_STAT_IS_STALE)
 		return;
 
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
 	if (pchip->regCDSP & VXP_CDSP_MIC_SEL_MASK) {
 		level = vx_compute_mic_level(level);
 		vx_outb(chip, MICRO, level);
 	}
-	mutex_unlock(&chip->lock);
 }
 
 
-- 
2.50.1

