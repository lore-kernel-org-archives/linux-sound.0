Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1362A32039E
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478690; cv=none; b=GmkNiLVeru31itmVkoMEFx9zC0IXSqfdMxwuKFOdYizCqOc+NGhpzOgvHaZTxu1we94j6j1rff8I+7EWW10Y5GjyaFcKdIjij+9fJrpxhR0i8W3Iz0V7hHqhFk7XN1fdX4qkUWJFHHaNlHM/E6vLW7FMk4f7CH0Plo/hz6dTxNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478690; c=relaxed/simple;
	bh=5ilRbQV9MD/aiohB8Ob9FNq6iZXOo/QLvBwTtw0+DRM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IzvmxdAjP2U0G7CZZPATOc7Pd1CcZIA6S4hzPfXzBUfoxyAjGX8a3jeJqEHRupgTks7JC4KvP9n4HUmcRTIRruSxMbb6m2enOCtFAYrH9gRTtplhkD9MILeKxa1TUth7aLp5Tl6QbM/S4dd3/0klCSoIZY1gNN+RRrpISafeXm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=baSp2bIS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7Q1gs5w0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=baSp2bIS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7Q1gs5w0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="baSp2bIS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7Q1gs5w0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="baSp2bIS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7Q1gs5w0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 31F355C22F;
	Fri, 29 Aug 2025 14:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fcvDCqAgFHMuA5SqVum0u/oSGdGrzKX9dttjDFm61q4=;
	b=baSp2bISOhKuD9+kpNzwB8utMgmyNrsV//U0HjBuVDau5roE2pb0S5SFQKnz070syEXpZY
	e2wJy9mcJfkhCk7CYfgtVzveG5ZaEBMgCMEz58fdJ8EPRf5Kfs+3JSoZTxBp6OedAkUY3V
	bGMlp8KvDlHK7gRKGRMA3+GE5TeY/xo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478637;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fcvDCqAgFHMuA5SqVum0u/oSGdGrzKX9dttjDFm61q4=;
	b=7Q1gs5w02JopFP927JydZVSOQOgRqqhhfZUf49FFqq9UiZ+mQ5F27cR0ZWlkXVjc4hLib/
	qSIQMvXgw5cmYGDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fcvDCqAgFHMuA5SqVum0u/oSGdGrzKX9dttjDFm61q4=;
	b=baSp2bISOhKuD9+kpNzwB8utMgmyNrsV//U0HjBuVDau5roE2pb0S5SFQKnz070syEXpZY
	e2wJy9mcJfkhCk7CYfgtVzveG5ZaEBMgCMEz58fdJ8EPRf5Kfs+3JSoZTxBp6OedAkUY3V
	bGMlp8KvDlHK7gRKGRMA3+GE5TeY/xo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478637;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fcvDCqAgFHMuA5SqVum0u/oSGdGrzKX9dttjDFm61q4=;
	b=7Q1gs5w02JopFP927JydZVSOQOgRqqhhfZUf49FFqq9UiZ+mQ5F27cR0ZWlkXVjc4hLib/
	qSIQMvXgw5cmYGDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19A5913A3E;
	Fri, 29 Aug 2025 14:43:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sGMZBa28sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 16/61] ALSA: cmipci: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:42:51 +0200
Message-ID: <20250829144342.4290-17-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
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
 sound/pci/cmipci.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index c4ee550d7c96..cfd80a24580c 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -664,14 +664,11 @@ static int snd_cmipci_playback2_hw_params(struct snd_pcm_substream *substream,
 {
 	struct cmipci *cm = snd_pcm_substream_chip(substream);
 	if (params_channels(hw_params) > 2) {
-		mutex_lock(&cm->open_mutex);
-		if (cm->opened[CM_CH_PLAY]) {
-			mutex_unlock(&cm->open_mutex);
+		guard(mutex)(&cm->open_mutex);
+		if (cm->opened[CM_CH_PLAY])
 			return -EBUSY;
-		}
 		/* reserve the channel A */
 		cm->opened[CM_CH_PLAY] = CM_OPEN_PLAYBACK_MULTI;
-		mutex_unlock(&cm->open_mutex);
 	}
 	return 0;
 }
@@ -1582,11 +1579,9 @@ static int open_device_check(struct cmipci *cm, int mode, struct snd_pcm_substre
 	 * pcm framework doesn't pass file pointer before actually opened,
 	 * we can't know whether blocking mode or not in open callback..
 	 */
-	mutex_lock(&cm->open_mutex);
-	if (cm->opened[ch]) {
-		mutex_unlock(&cm->open_mutex);
+	guard(mutex)(&cm->open_mutex);
+	if (cm->opened[ch])
 		return -EBUSY;
-	}
 	cm->opened[ch] = mode;
 	cm->channel[ch].substream = subs;
 	if (! (mode & CM_OPEN_DAC)) {
@@ -1596,7 +1591,6 @@ static int open_device_check(struct cmipci *cm, int mode, struct snd_pcm_substre
 		snd_cmipci_clear_bit(cm, CM_REG_MISC_CTRL, CM_ENDBDAC);
 		spin_unlock_irq(&cm->reg_lock);
 	}
-	mutex_unlock(&cm->open_mutex);
 	return 0;
 }
 
@@ -1604,7 +1598,7 @@ static void close_device_check(struct cmipci *cm, int mode)
 {
 	int ch = mode & CM_OPEN_CH_MASK;
 
-	mutex_lock(&cm->open_mutex);
+	guard(mutex)(&cm->open_mutex);
 	if (cm->opened[ch] == mode) {
 		if (cm->channel[ch].substream) {
 			snd_cmipci_ch_reset(cm, ch);
@@ -1620,7 +1614,6 @@ static void close_device_check(struct cmipci *cm, int mode)
 			spin_unlock_irq(&cm->reg_lock);
 		}
 	}
-	mutex_unlock(&cm->open_mutex);
 }
 
 /*
@@ -1685,7 +1678,7 @@ static int snd_cmipci_playback2_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		return err;
 	runtime->hw = snd_cmipci_playback2;
-	mutex_lock(&cm->open_mutex);
+	guard(mutex)(&cm->open_mutex);
 	if (! cm->opened[CM_CH_PLAY]) {
 		if (cm->can_multi_ch) {
 			runtime->hw.channels_max = cm->max_channels;
@@ -1697,7 +1690,6 @@ static int snd_cmipci_playback2_open(struct snd_pcm_substream *substream)
 				snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS, &hw_constraints_channels_8);
 		}
 	}
-	mutex_unlock(&cm->open_mutex);
 	if (cm->chip_version == 68) {
 		runtime->hw.rates |= SNDRV_PCM_RATE_88200 |
 				     SNDRV_PCM_RATE_96000;
-- 
2.50.1

