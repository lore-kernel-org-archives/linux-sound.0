Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049E11E25F9
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480459; cv=none; b=rw/WGtTHTfRubzwdE/xilNSY3VKFSA4XN5TKJDsLeHKuqjsSCfBpgsdYlNQRbc6h7MOKDnTN9rX1VX/S8XHPXadPrmWzC1/derwptoVzlbPvWk7wVBh0I/hK0FL8NWQv4nADaQDa3B0FEEJPu23pRxBhbyFhy76at13gHfKsnyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480459; c=relaxed/simple;
	bh=2Wax4pwZKsn9DPJQ87dm8Lh7DK3nj3HMceVmpb4divo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ObRhMrYINL3tPjMAjglWaQmDzsvzahS3H3bFkRv14b/CJNWtn8xgw//hVxhe/9zpYksLbiM+4uaCivKQm1iTEsWCXD17OqV/8U4ZywuvIbhnvm0qAf20Ea+hVEkIxWESuwUQLY/j6lZvtBChJWiPNM36/1pWOsHi6l1U/QycIGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HDgTRgHo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xlDNAtuE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HDgTRgHo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xlDNAtuE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HDgTRgHo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xlDNAtuE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HDgTRgHo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xlDNAtuE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D25FD5C26D;
	Fri, 29 Aug 2025 15:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=03AKOMSXyVGSZbN3L4GVnT0ir0TWsm08OMH3Ck9Sh9I=;
	b=HDgTRgHoxdFO0Kt4HwXda5c8wcSbSEwyZcUh+YzlfCMIBlbC4Hh+LKWQw7yz+5bL5gyZBF
	W3CqRdjfFx9zF1BPiMGciGOBxaMcz0Wyjmx20S721WwqdOuJj89yuo01o9/CiGTgrlwjwj
	IzViK7+ZGKAMD1THyLlm1XuFsYsBIVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=03AKOMSXyVGSZbN3L4GVnT0ir0TWsm08OMH3Ck9Sh9I=;
	b=xlDNAtuEa+IpvJ6CQ5VBV6CddlbCniBZ27mNZwNJiYHoj3FjpKPKSAnJ1NeBSi+FrPxbTT
	jjV9xUMT/PU9Z4Cw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HDgTRgHo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xlDNAtuE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=03AKOMSXyVGSZbN3L4GVnT0ir0TWsm08OMH3Ck9Sh9I=;
	b=HDgTRgHoxdFO0Kt4HwXda5c8wcSbSEwyZcUh+YzlfCMIBlbC4Hh+LKWQw7yz+5bL5gyZBF
	W3CqRdjfFx9zF1BPiMGciGOBxaMcz0Wyjmx20S721WwqdOuJj89yuo01o9/CiGTgrlwjwj
	IzViK7+ZGKAMD1THyLlm1XuFsYsBIVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=03AKOMSXyVGSZbN3L4GVnT0ir0TWsm08OMH3Ck9Sh9I=;
	b=xlDNAtuEa+IpvJ6CQ5VBV6CddlbCniBZ27mNZwNJiYHoj3FjpKPKSAnJ1NeBSi+FrPxbTT
	jjV9xUMT/PU9Z4Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B7F2B13A6A;
	Fri, 29 Aug 2025 15:13:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yPqnK6bDsWiQIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:13:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 12/19] ALSA: sparc: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:13:26 +0200
Message-ID: <20250829151335.7342-13-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: D25FD5C26D
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/sparc/cs4231.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/sound/sparc/cs4231.c b/sound/sparc/cs4231.c
index 1a1fe3ceb76c..8d54617e2526 100644
--- a/sound/sparc/cs4231.c
+++ b/sound/sparc/cs4231.c
@@ -608,7 +608,7 @@ static void snd_cs4231_playback_format(struct snd_cs4231 *chip,
 {
 	unsigned long flags;
 
-	mutex_lock(&chip->mce_mutex);
+	guard(mutex)(&chip->mce_mutex);
 	snd_cs4231_calibrate_mute(chip, 1);
 
 	snd_cs4231_mce_up(chip);
@@ -623,7 +623,6 @@ static void snd_cs4231_playback_format(struct snd_cs4231 *chip,
 	snd_cs4231_mce_down(chip);
 
 	snd_cs4231_calibrate_mute(chip, 0);
-	mutex_unlock(&chip->mce_mutex);
 }
 
 static void snd_cs4231_capture_format(struct snd_cs4231 *chip,
@@ -632,7 +631,7 @@ static void snd_cs4231_capture_format(struct snd_cs4231 *chip,
 {
 	unsigned long flags;
 
-	mutex_lock(&chip->mce_mutex);
+	guard(mutex)(&chip->mce_mutex);
 	snd_cs4231_calibrate_mute(chip, 1);
 
 	snd_cs4231_mce_up(chip);
@@ -653,7 +652,6 @@ static void snd_cs4231_capture_format(struct snd_cs4231 *chip,
 	snd_cs4231_mce_down(chip);
 
 	snd_cs4231_calibrate_mute(chip, 0);
-	mutex_unlock(&chip->mce_mutex);
 }
 
 /*
@@ -775,14 +773,11 @@ static int snd_cs4231_open(struct snd_cs4231 *chip, unsigned int mode)
 {
 	unsigned long flags;
 
-	mutex_lock(&chip->open_mutex);
-	if ((chip->mode & mode)) {
-		mutex_unlock(&chip->open_mutex);
+	guard(mutex)(&chip->open_mutex);
+	if ((chip->mode & mode))
 		return -EAGAIN;
-	}
 	if (chip->mode & CS4231_MODE_OPEN) {
 		chip->mode |= mode;
-		mutex_unlock(&chip->open_mutex);
 		return 0;
 	}
 	/* ok. now enable and ack CODEC IRQ */
@@ -802,7 +797,6 @@ static int snd_cs4231_open(struct snd_cs4231 *chip, unsigned int mode)
 	spin_unlock_irqrestore(&chip->lock, flags);
 
 	chip->mode = mode;
-	mutex_unlock(&chip->open_mutex);
 	return 0;
 }
 
@@ -810,12 +804,10 @@ static void snd_cs4231_close(struct snd_cs4231 *chip, unsigned int mode)
 {
 	unsigned long flags;
 
-	mutex_lock(&chip->open_mutex);
+	guard(mutex)(&chip->open_mutex);
 	chip->mode &= ~mode;
-	if (chip->mode & CS4231_MODE_OPEN) {
-		mutex_unlock(&chip->open_mutex);
+	if (chip->mode & CS4231_MODE_OPEN)
 		return;
-	}
 	snd_cs4231_calibrate_mute(chip, 1);
 
 	/* disable IRQ */
@@ -851,7 +843,6 @@ static void snd_cs4231_close(struct snd_cs4231 *chip, unsigned int mode)
 	snd_cs4231_calibrate_mute(chip, 0);
 
 	chip->mode = 0;
-	mutex_unlock(&chip->open_mutex);
 }
 
 /*
-- 
2.50.1

