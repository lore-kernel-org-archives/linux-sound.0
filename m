Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AAB29E110
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478844; cv=none; b=imANMaqbx0twjM8dCZ8uLwo+hCr8MMgjxro/taXHEdDNvl3+Dzc0Q2Nqczp3YtugEIN/ODg8OQNBaix/Cm0Zpb6uWKvLVDQS0HKd+uejTrL2MDaS75LMQfh0x29YUM4nks2//xPLEUXrAsKGzWtucwt6DQBSvAmBHMyCILfqB9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478844; c=relaxed/simple;
	bh=jgkM5nfHayWGRdcRVvmFcGr+4E/zDaOLX3HKiDgJyzQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UX5ttg7dpQ8pdtvqg/6Pfu1JVC+k8GXHR+lmDsEHydVsmURBCAQ5rtoRhYo2S4EInobP4Dbkis1+1B6ltqSVv2WIyfYQv5MpPHuSbk8WbBRguVlniqJ3y2Dg3IUOGI39FE/Drz20EZBVJw4nVbJAkNL9eNTRNe+S8ArG701xREU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Rpi/BmR0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A7N/q7Gx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1osqAj0+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UkP2vH+Z; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Rpi/BmR0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A7N/q7Gx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1osqAj0+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UkP2vH+Z"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EB9515C241;
	Fri, 29 Aug 2025 14:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NmDmlXjJ38RVSrZV/qe8E58bKi3CwskP54DMBOC58Yc=;
	b=Rpi/BmR0krs4+sAb1TSrwOUu4EFnOBuSAuPfGurpv0CRRNVGrNJs8CPvrdDEzgu2B3Uk+5
	G4d8/zCeeXktyC1+Bux0Ufd7rTGKCIrkLcfQtzzBv1IRsJX4dikSaUuwJtT6c7IzAKQERH
	AwCsIHmigJtBaYyZtVdZRYcZ0/P84T8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NmDmlXjJ38RVSrZV/qe8E58bKi3CwskP54DMBOC58Yc=;
	b=A7N/q7GxaFw0J2tl3N5CaIf2Cgx10IOXy7yHGndu9KsdhK81jGbl0QSkj3hibzgRex5qs6
	lMeHbquD1+42XFCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1osqAj0+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UkP2vH+Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NmDmlXjJ38RVSrZV/qe8E58bKi3CwskP54DMBOC58Yc=;
	b=1osqAj0+1HE2Sc0/Jq2Afnc3sD0qfGCPg31Hsfs5mlYFIEpCmGARydnevSHPhNIXIEm1zM
	XDcwU7ciXcHTZlYN41HqzCNFCgkIGRRxIQ9rlcX4ctpmjVzXAneFwQ+6ycHh1nkeQJRWQx
	By2rhWAOFNb96p/tl3FAHv/95bHkNJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NmDmlXjJ38RVSrZV/qe8E58bKi3CwskP54DMBOC58Yc=;
	b=UkP2vH+ZOcFZMB03VRRNJ38wbfaDWKw1fkn6lnGq1TpudMJe84+7+Lw4Ty9C4dgsKE58+d
	WNIkuhV4qxvZPkCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D3C8313A3E;
	Fri, 29 Aug 2025 14:44:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WLiZMrK8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 49/61] ALSA: rme32: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:43:24 +0200
Message-ID: <20250829144342.4290-50-tiwai@suse.de>
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: EB9515C241
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme32.c | 152 +++++++++++++++++-----------------------------
 1 file changed, 56 insertions(+), 96 deletions(-)

diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index f07b6023473a..123dddcb6972 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -646,35 +646,27 @@ snd_rme32_playback_hw_params(struct snd_pcm_substream *substream,
 		runtime->dma_bytes = RME32_BUFFER_SIZE;
 	}
 
-	spin_lock_irq(&rme32->lock);
+	guard(spinlock_irq)(&rme32->lock);
 	rate = 0;
 	if (rme32->rcreg & RME32_RCR_KMODE)
 		rate = snd_rme32_capture_getrate(rme32, &dummy);
 	if (rate > 0) {
 		/* AutoSync */
-		if ((int)params_rate(params) != rate) {
-			spin_unlock_irq(&rme32->lock);
+		if ((int)params_rate(params) != rate)
 			return -EIO;
-		}
 	} else {
 		err = snd_rme32_playback_setrate(rme32, params_rate(params));
-		if (err < 0) {
-			spin_unlock_irq(&rme32->lock);
+		if (err < 0)
 			return err;
-		}
 	}
 	err = snd_rme32_setformat(rme32, params_format(params));
-	if (err < 0) {
-		spin_unlock_irq(&rme32->lock);
+	if (err < 0)
 		return err;
-	}
 
 	snd_rme32_setframelog(rme32, params_channels(params), 1);
 	if (rme32->capture_periodsize != 0) {
-		if (params_period_size(params) << rme32->playback_frlog != rme32->capture_periodsize) {
-			spin_unlock_irq(&rme32->lock);
+		if (params_period_size(params) << rme32->playback_frlog != rme32->capture_periodsize)
 			return -EBUSY;
-		}
 	}
 	rme32->playback_periodsize = params_period_size(params) << rme32->playback_frlog;
 	/* S/PDIF setup */
@@ -683,7 +675,6 @@ snd_rme32_playback_hw_params(struct snd_pcm_substream *substream,
 		rme32->wcreg |= rme32->wcreg_spdif_stream;
 		writel(rme32->wcreg, rme32->iobase + RME32_IO_CONTROL_REGISTER);
 	}
-	spin_unlock_irq(&rme32->lock);
 
 	return 0;
 }
@@ -703,32 +694,24 @@ snd_rme32_capture_hw_params(struct snd_pcm_substream *substream,
 		runtime->dma_bytes = RME32_BUFFER_SIZE;
 	}
 
-	spin_lock_irq(&rme32->lock);
+	guard(spinlock_irq)(&rme32->lock);
 	/* enable AutoSync for record-preparing */
 	rme32->wcreg |= RME32_WCR_AUTOSYNC;
 	writel(rme32->wcreg, rme32->iobase + RME32_IO_CONTROL_REGISTER);
 
 	err = snd_rme32_setformat(rme32, params_format(params));
-	if (err < 0) {
-		spin_unlock_irq(&rme32->lock);
+	if (err < 0)
 		return err;
-	}
 	err = snd_rme32_playback_setrate(rme32, params_rate(params));
-	if (err < 0) {
-		spin_unlock_irq(&rme32->lock);
+	if (err < 0)
 		return err;
-	}
 	rate = snd_rme32_capture_getrate(rme32, &isadat);
 	if (rate > 0) {
-                if ((int)params_rate(params) != rate) {
-			spin_unlock_irq(&rme32->lock);
+		if ((int)params_rate(params) != rate)
                         return -EIO;                    
-                }
                 if ((isadat && runtime->hw.channels_min == 2) ||
-                    (!isadat && runtime->hw.channels_min == 8)) {
-			spin_unlock_irq(&rme32->lock);
+		    (!isadat && runtime->hw.channels_min == 8))
                         return -EIO;
-                }
 	}
 	/* AutoSync off for recording */
 	rme32->wcreg &= ~RME32_WCR_AUTOSYNC;
@@ -737,14 +720,11 @@ snd_rme32_capture_hw_params(struct snd_pcm_substream *substream,
 	snd_rme32_setframelog(rme32, params_channels(params), 0);
 	if (rme32->playback_periodsize != 0) {
 		if (params_period_size(params) << rme32->capture_frlog !=
-		    rme32->playback_periodsize) {
-			spin_unlock_irq(&rme32->lock);
+		    rme32->playback_periodsize)
 			return -EBUSY;
-		}
 	}
 	rme32->capture_periodsize =
 	    params_period_size(params) << rme32->capture_frlog;
-	spin_unlock_irq(&rme32->lock);
 
 	return 0;
 }
@@ -824,15 +804,13 @@ static int snd_rme32_playback_spdif_open(struct snd_pcm_substream *substream)
 
 	snd_pcm_set_sync(substream);
 
-	spin_lock_irq(&rme32->lock);
-	if (rme32->playback_substream != NULL) {
-		spin_unlock_irq(&rme32->lock);
-		return -EBUSY;
+	scoped_guard(spinlock_irq, &rme32->lock) {
+		if (rme32->playback_substream != NULL)
+			return -EBUSY;
+		rme32->wcreg &= ~RME32_WCR_ADAT;
+		writel(rme32->wcreg, rme32->iobase + RME32_IO_CONTROL_REGISTER);
+		rme32->playback_substream = substream;
 	}
-	rme32->wcreg &= ~RME32_WCR_ADAT;
-	writel(rme32->wcreg, rme32->iobase + RME32_IO_CONTROL_REGISTER);
-	rme32->playback_substream = substream;
-	spin_unlock_irq(&rme32->lock);
 
 	if (rme32->fullduplex_mode)
 		runtime->hw = snd_rme32_spdif_fd_info;
@@ -869,13 +847,11 @@ static int snd_rme32_capture_spdif_open(struct snd_pcm_substream *substream)
 
 	snd_pcm_set_sync(substream);
 
-	spin_lock_irq(&rme32->lock);
-        if (rme32->capture_substream != NULL) {
-		spin_unlock_irq(&rme32->lock);
-                return -EBUSY;
-        }
-	rme32->capture_substream = substream;
-	spin_unlock_irq(&rme32->lock);
+	scoped_guard(spinlock_irq, &rme32->lock) {
+		if (rme32->capture_substream != NULL)
+			return -EBUSY;
+		rme32->capture_substream = substream;
+	}
 
 	if (rme32->fullduplex_mode)
 		runtime->hw = snd_rme32_spdif_fd_info;
@@ -909,15 +885,13 @@ snd_rme32_playback_adat_open(struct snd_pcm_substream *substream)
 	
 	snd_pcm_set_sync(substream);
 
-	spin_lock_irq(&rme32->lock);	
-        if (rme32->playback_substream != NULL) {
-		spin_unlock_irq(&rme32->lock);
-                return -EBUSY;
-        }
-	rme32->wcreg |= RME32_WCR_ADAT;
-	writel(rme32->wcreg, rme32->iobase + RME32_IO_CONTROL_REGISTER);
-	rme32->playback_substream = substream;
-	spin_unlock_irq(&rme32->lock);
+	scoped_guard(spinlock_irq, &rme32->lock) {
+		if (rme32->playback_substream != NULL)
+			return -EBUSY;
+		rme32->wcreg |= RME32_WCR_ADAT;
+		writel(rme32->wcreg, rme32->iobase + RME32_IO_CONTROL_REGISTER);
+		rme32->playback_substream = substream;
+	}
 	
 	if (rme32->fullduplex_mode)
 		runtime->hw = snd_rme32_adat_fd_info;
@@ -960,13 +934,11 @@ snd_rme32_capture_adat_open(struct snd_pcm_substream *substream)
 
 	snd_pcm_set_sync(substream);
         
-	spin_lock_irq(&rme32->lock);	
-	if (rme32->capture_substream != NULL) {
-		spin_unlock_irq(&rme32->lock);
-		return -EBUSY;
-        }
-	rme32->capture_substream = substream;
-	spin_unlock_irq(&rme32->lock);
+	scoped_guard(spinlock_irq, &rme32->lock) {
+		if (rme32->capture_substream != NULL)
+			spin_unlock_irq(&rme32->lock);
+		rme32->capture_substream = substream;
+	}
 
 	snd_rme32_set_buffer_constraint(rme32, runtime);
 	return 0;
@@ -977,11 +949,11 @@ static int snd_rme32_playback_close(struct snd_pcm_substream *substream)
 	struct rme32 *rme32 = snd_pcm_substream_chip(substream);
 	int spdif = 0;
 
-	spin_lock_irq(&rme32->lock);
-	rme32->playback_substream = NULL;
-	rme32->playback_periodsize = 0;
-	spdif = (rme32->wcreg & RME32_WCR_ADAT) == 0;
-	spin_unlock_irq(&rme32->lock);
+	scoped_guard(spinlock_irq, &rme32->lock) {
+		rme32->playback_substream = NULL;
+		rme32->playback_periodsize = 0;
+		spdif = (rme32->wcreg & RME32_WCR_ADAT) == 0;
+	}
 	if (spdif) {
 		rme32->spdif_ctl->vd[0].access |= SNDRV_CTL_ELEM_ACCESS_INACTIVE;
 		snd_ctl_notify(rme32->card, SNDRV_CTL_EVENT_MASK_VALUE |
@@ -995,10 +967,9 @@ static int snd_rme32_capture_close(struct snd_pcm_substream *substream)
 {
 	struct rme32 *rme32 = snd_pcm_substream_chip(substream);
 
-	spin_lock_irq(&rme32->lock);
+	guard(spinlock_irq)(&rme32->lock);
 	rme32->capture_substream = NULL;
 	rme32->capture_periodsize = 0;
-	spin_unlock_irq(&rme32->lock);
 	return 0;
 }
 
@@ -1006,7 +977,7 @@ static int snd_rme32_playback_prepare(struct snd_pcm_substream *substream)
 {
 	struct rme32 *rme32 = snd_pcm_substream_chip(substream);
 
-	spin_lock_irq(&rme32->lock);
+	guard(spinlock_irq)(&rme32->lock);
 	if (rme32->fullduplex_mode) {
 		memset(&rme32->playback_pcm, 0, sizeof(rme32->playback_pcm));
 		rme32->playback_pcm.hw_buffer_size = RME32_BUFFER_SIZE;
@@ -1017,7 +988,6 @@ static int snd_rme32_playback_prepare(struct snd_pcm_substream *substream)
 	if (rme32->wcreg & RME32_WCR_SEL)
 		rme32->wcreg &= ~RME32_WCR_MUTE;
 	writel(rme32->wcreg, rme32->iobase + RME32_IO_CONTROL_REGISTER);
-	spin_unlock_irq(&rme32->lock);
 	return 0;
 }
 
@@ -1025,7 +995,7 @@ static int snd_rme32_capture_prepare(struct snd_pcm_substream *substream)
 {
 	struct rme32 *rme32 = snd_pcm_substream_chip(substream);
 
-	spin_lock_irq(&rme32->lock);
+	guard(spinlock_irq)(&rme32->lock);
 	if (rme32->fullduplex_mode) {
 		memset(&rme32->capture_pcm, 0, sizeof(rme32->capture_pcm));
 		rme32->capture_pcm.hw_buffer_size = RME32_BUFFER_SIZE;
@@ -1034,7 +1004,6 @@ static int snd_rme32_capture_prepare(struct snd_pcm_substream *substream)
 	} else {
 		writel(0, rme32->iobase + RME32_IO_RESET_POS);
 	}
-	spin_unlock_irq(&rme32->lock);
 	return 0;
 }
 
@@ -1044,7 +1013,7 @@ snd_rme32_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	struct rme32 *rme32 = snd_pcm_substream_chip(substream);
 	struct snd_pcm_substream *s;
 
-	spin_lock(&rme32->lock);
+	guard(spinlock)(&rme32->lock);
 	snd_pcm_group_for_each_entry(s, substream) {
 		if (s != rme32->playback_substream &&
 		    s != rme32->capture_substream)
@@ -1088,7 +1057,6 @@ snd_rme32_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 			snd_rme32_pcm_start(rme32, 1);
 		break;
 	}
-	spin_unlock(&rme32->lock);
 	return 0;
 }
 
@@ -1124,11 +1092,11 @@ static int snd_rme32_playback_fd_ack(struct snd_pcm_substream *substream)
 
 	rec = &rme32->playback_pcm;
 	cprec = &rme32->capture_pcm;
-	spin_lock(&rme32->lock);
-	rec->hw_queue_size = RME32_BUFFER_SIZE;
-	if (rme32->running & (1 << SNDRV_PCM_STREAM_CAPTURE))
-		rec->hw_queue_size -= cprec->hw_ready;
-	spin_unlock(&rme32->lock);
+	scoped_guard(spinlock, &rme32->lock) {
+		rec->hw_queue_size = RME32_BUFFER_SIZE;
+		if (rme32->running & (1 << SNDRV_PCM_STREAM_CAPTURE))
+			rec->hw_queue_size -= cprec->hw_ready;
+	}
 	return snd_pcm_indirect_playback_transfer(substream, rec,
 						  snd_rme32_pb_trans_copy);
 }
@@ -1513,10 +1481,9 @@ snd_rme32_get_loopback_control(struct snd_kcontrol *kcontrol,
 {
 	struct rme32 *rme32 = snd_kcontrol_chip(kcontrol);
 
-	spin_lock_irq(&rme32->lock);
+	guard(spinlock_irq)(&rme32->lock);
 	ucontrol->value.integer.value[0] =
 	    rme32->wcreg & RME32_WCR_SEL ? 0 : 1;
-	spin_unlock_irq(&rme32->lock);
 	return 0;
 }
 static int
@@ -1528,7 +1495,7 @@ snd_rme32_put_loopback_control(struct snd_kcontrol *kcontrol,
 	int change;
 
 	val = ucontrol->value.integer.value[0] ? 0 : RME32_WCR_SEL;
-	spin_lock_irq(&rme32->lock);
+	guard(spinlock_irq)(&rme32->lock);
 	val = (rme32->wcreg & ~RME32_WCR_SEL) | val;
 	change = val != rme32->wcreg;
 	if (ucontrol->value.integer.value[0])
@@ -1537,7 +1504,6 @@ snd_rme32_put_loopback_control(struct snd_kcontrol *kcontrol,
 		val |= RME32_WCR_MUTE;
 	rme32->wcreg = val;
 	writel(val, rme32->iobase + RME32_IO_CONTROL_REGISTER);
-	spin_unlock_irq(&rme32->lock);
 	return change;
 }
 
@@ -1572,7 +1538,7 @@ snd_rme32_get_inputtype_control(struct snd_kcontrol *kcontrol,
 	struct rme32 *rme32 = snd_kcontrol_chip(kcontrol);
 	unsigned int items = 3;
 
-	spin_lock_irq(&rme32->lock);
+	guard(spinlock_irq)(&rme32->lock);
 	ucontrol->value.enumerated.item[0] = snd_rme32_getinputtype(rme32);
 
 	switch (rme32->pci->device) {
@@ -1591,7 +1557,6 @@ snd_rme32_get_inputtype_control(struct snd_kcontrol *kcontrol,
 		ucontrol->value.enumerated.item[0] = items - 1;
 	}
 
-	spin_unlock_irq(&rme32->lock);
 	return 0;
 }
 static int
@@ -1616,10 +1581,9 @@ snd_rme32_put_inputtype_control(struct snd_kcontrol *kcontrol,
 	}
 	val = ucontrol->value.enumerated.item[0] % items;
 
-	spin_lock_irq(&rme32->lock);
+	guard(spinlock_irq)(&rme32->lock);
 	change = val != (unsigned int)snd_rme32_getinputtype(rme32);
 	snd_rme32_setinputtype(rme32, val);
-	spin_unlock_irq(&rme32->lock);
 	return change;
 }
 
@@ -1640,9 +1604,8 @@ snd_rme32_get_clockmode_control(struct snd_kcontrol *kcontrol,
 {
 	struct rme32 *rme32 = snd_kcontrol_chip(kcontrol);
 
-	spin_lock_irq(&rme32->lock);
+	guard(spinlock_irq)(&rme32->lock);
 	ucontrol->value.enumerated.item[0] = snd_rme32_getclockmode(rme32);
-	spin_unlock_irq(&rme32->lock);
 	return 0;
 }
 static int
@@ -1654,10 +1617,9 @@ snd_rme32_put_clockmode_control(struct snd_kcontrol *kcontrol,
 	int change;
 
 	val = ucontrol->value.enumerated.item[0] % 3;
-	spin_lock_irq(&rme32->lock);
+	guard(spinlock_irq)(&rme32->lock);
 	change = val != (unsigned int)snd_rme32_getclockmode(rme32);
 	snd_rme32_setclockmode(rme32, val);
-	spin_unlock_irq(&rme32->lock);
 	return change;
 }
 
@@ -1707,10 +1669,9 @@ static int snd_rme32_control_spdif_put(struct snd_kcontrol *kcontrol,
 	u32 val;
 
 	val = snd_rme32_convert_from_aes(&ucontrol->value.iec958);
-	spin_lock_irq(&rme32->lock);
+	guard(spinlock_irq)(&rme32->lock);
 	change = val != rme32->wcreg_spdif;
 	rme32->wcreg_spdif = val;
-	spin_unlock_irq(&rme32->lock);
 	return change;
 }
 
@@ -1742,13 +1703,12 @@ static int snd_rme32_control_spdif_stream_put(struct snd_kcontrol *kcontrol,
 	u32 val;
 
 	val = snd_rme32_convert_from_aes(&ucontrol->value.iec958);
-	spin_lock_irq(&rme32->lock);
+	guard(spinlock_irq)(&rme32->lock);
 	change = val != rme32->wcreg_spdif_stream;
 	rme32->wcreg_spdif_stream = val;
 	rme32->wcreg &= ~(RME32_WCR_PRO | RME32_WCR_EMP);
 	rme32->wcreg |= val;
 	writel(rme32->wcreg, rme32->iobase + RME32_IO_CONTROL_REGISTER);
-	spin_unlock_irq(&rme32->lock);
 	return change;
 }
 
-- 
2.50.1

