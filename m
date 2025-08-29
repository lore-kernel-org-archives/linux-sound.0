Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4F831A550
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478776; cv=none; b=NUr1PAmGmBFOOnoxmmRDZNEaOiUma/szLg4a+J9BufTBdTQRdj0ojkNfbV/MmmysVyIXGGCTwbB3IivTRCxPyxwvBDGtxiOWWM5shugGi2uJjmI2q52pM6SZjdrB4cXp7+LKUGG1YLs23gl6if6HOnbAJH3WVl500y1eMCOZ96s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478776; c=relaxed/simple;
	bh=d0JqjbHUXVAG/nMbVU/E7ViAluOkL+Pdur+1fYOqwYc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MXi4+80mIbkqtL4WaJtb6hGny8ew73hmb02GbUB8OFhXC7X38voni9SNS73Bua3EV/2WRmNaLzH+5BUpMUSaLu+mAJUs42DRiyRzVqdcaCLqolE49tiXdWQhsIKiz4fnhPFK90v5zWm5JmWXylchLGAlMTjWxFWt7Or43lSuZ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=twmEOVfl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kDpm6pvQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=twmEOVfl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kDpm6pvQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="twmEOVfl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kDpm6pvQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="twmEOVfl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kDpm6pvQ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AEAFE33ED5;
	Fri, 29 Aug 2025 14:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ikcOy78kVbaGRlfss4U8KzqdVzF1rcI1ELeC1oe2Tqo=;
	b=twmEOVfllZmHXAFQqzKtCX2J/l1FAIf4kO1o+KLzTUiTjlenfY1Kp/gRFpRR/Nsf1BOLTx
	hj6+RyirU8rGdmrvBRIoIdyRtn/5Zj6tIULOUOuSg4qPquhm2EhfbrIkArIkSqFI2DISfz
	QpB84RWXwW5ISgeRx+PfH1EcYW4hSYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ikcOy78kVbaGRlfss4U8KzqdVzF1rcI1ELeC1oe2Tqo=;
	b=kDpm6pvQ1Brh21sF8qvIvakVGH0ufqRaYa7/bPQRrVkNeax3xZ3a1+LMUREIIkq/cSbH+Y
	ClD/xW+YFjpkPTAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=twmEOVfl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kDpm6pvQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ikcOy78kVbaGRlfss4U8KzqdVzF1rcI1ELeC1oe2Tqo=;
	b=twmEOVfllZmHXAFQqzKtCX2J/l1FAIf4kO1o+KLzTUiTjlenfY1Kp/gRFpRR/Nsf1BOLTx
	hj6+RyirU8rGdmrvBRIoIdyRtn/5Zj6tIULOUOuSg4qPquhm2EhfbrIkArIkSqFI2DISfz
	QpB84RWXwW5ISgeRx+PfH1EcYW4hSYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ikcOy78kVbaGRlfss4U8KzqdVzF1rcI1ELeC1oe2Tqo=;
	b=kDpm6pvQ1Brh21sF8qvIvakVGH0ufqRaYa7/bPQRrVkNeax3xZ3a1+LMUREIIkq/cSbH+Y
	ClD/xW+YFjpkPTAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 93B6B13A3E;
	Fri, 29 Aug 2025 14:44:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0E1MIrO8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 55/61] ALSA: sis7019: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:43:30 +0200
Message-ID: <20250829144342.4290-56-tiwai@suse.de>
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
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: AEAFE33ED5
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/sis7019.c | 39 ++++++++++++++-------------------------
 1 file changed, 14 insertions(+), 25 deletions(-)

diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index a1341af8c41f..4be085d27712 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -383,9 +383,7 @@ static void __sis_unmap_silence(struct sis7019 *sis)
 
 static void sis_free_voice(struct sis7019 *sis, struct voice *voice)
 {
-	unsigned long flags;
-
-	spin_lock_irqsave(&sis->voice_lock, flags);
+	guard(spinlock_irqsave)(&sis->voice_lock);
 	if (voice->timing) {
 		__sis_unmap_silence(sis);
 		voice->timing->flags &= ~(VOICE_IN_USE | VOICE_SSO_TIMING |
@@ -393,7 +391,6 @@ static void sis_free_voice(struct sis7019 *sis, struct voice *voice)
 		voice->timing = NULL;
 	}
 	voice->flags &= ~(VOICE_IN_USE | VOICE_SSO_TIMING | VOICE_SYNC_TIMING);
-	spin_unlock_irqrestore(&sis->voice_lock, flags);
 }
 
 static struct voice *__sis_alloc_playback_voice(struct sis7019 *sis)
@@ -417,14 +414,8 @@ static struct voice *__sis_alloc_playback_voice(struct sis7019 *sis)
 
 static struct voice *sis_alloc_playback_voice(struct sis7019 *sis)
 {
-	struct voice *voice;
-	unsigned long flags;
-
-	spin_lock_irqsave(&sis->voice_lock, flags);
-	voice = __sis_alloc_playback_voice(sis);
-	spin_unlock_irqrestore(&sis->voice_lock, flags);
-
-	return voice;
+	guard(spinlock_irqsave)(&sis->voice_lock);
+	return __sis_alloc_playback_voice(sis);
 }
 
 static int sis_alloc_timing_voice(struct snd_pcm_substream *substream,
@@ -434,7 +425,6 @@ static int sis_alloc_timing_voice(struct snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct voice *voice = runtime->private_data;
 	unsigned int period_size, buffer_size;
-	unsigned long flags;
 	int needed;
 
 	/* If there are one or two periods per buffer, we don't need a
@@ -447,11 +437,11 @@ static int sis_alloc_timing_voice(struct snd_pcm_substream *substream,
 			period_size != (buffer_size / 2));
 
 	if (needed && !voice->timing) {
-		spin_lock_irqsave(&sis->voice_lock, flags);
-		voice->timing = __sis_alloc_playback_voice(sis);
-		if (voice->timing)
-			__sis_map_silence(sis);
-		spin_unlock_irqrestore(&sis->voice_lock, flags);
+		scoped_guard(spinlock_irqsave, &sis->voice_lock) {
+			voice->timing = __sis_alloc_playback_voice(sis);
+			if (voice->timing)
+				__sis_map_silence(sis);
+		}
 		if (!voice->timing)
 			return -ENOMEM;
 		voice->timing->substream = substream;
@@ -645,17 +635,16 @@ static int sis_capture_open(struct snd_pcm_substream *substream)
 	struct sis7019 *sis = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct voice *voice = &sis->capture_voice;
-	unsigned long flags;
 
 	/* FIXME: The driver only supports recording from one channel
 	 * at the moment, but it could support more.
 	 */
-	spin_lock_irqsave(&sis->voice_lock, flags);
-	if (voice->flags & VOICE_IN_USE)
-		voice = NULL;
-	else
-		voice->flags |= VOICE_IN_USE;
-	spin_unlock_irqrestore(&sis->voice_lock, flags);
+	scoped_guard(spinlock_irqsave, &sis->voice_lock) {
+		if (voice->flags & VOICE_IN_USE)
+			voice = NULL;
+		else
+			voice->flags |= VOICE_IN_USE;
+	}
 
 	if (!voice)
 		return -EAGAIN;
-- 
2.50.1

