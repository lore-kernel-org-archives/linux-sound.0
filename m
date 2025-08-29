Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD65322750
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478668; cv=none; b=Vt/7cvozq21XtJAUO16R4D9MeIkxUcTTrTM6/2EAY6Y2y8UlZqA/JNEM8+Dk43pKFk16jPd1ahbbJ1YRPcoXVSI9Bf5up8lY4THpFQSZc+BWnEA+2uJSfo6w4xZoBi1kZGr4fHkGu3f8ZqEmALYcll5gXZ8wF5fjwDeKM7whhSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478668; c=relaxed/simple;
	bh=FkHhYReWewnaXTyRX6SCD7hyaf3BS5d+xzHczMFwJRo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ct4R+OvVsfjv9zq+IKno2t57Yk5LIizkaDQuRvS8MqGo9FqCFXb2/m9b64KpVNRw0TnHwHF3LlQz2g6Y/DEiq/gLHqlem6B3NDKJRcX2dbH8cFIE0vBkRAMlo8qHZHh0L6635xUqcpQ5kP08OpID4Kqp8YichI4Iu04MVSgMkX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kk1KTnbH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ka+nfst4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kk1KTnbH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ka+nfst4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kk1KTnbH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ka+nfst4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kk1KTnbH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ka+nfst4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 80B1533EC7;
	Fri, 29 Aug 2025 14:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WXQL2Lrn9v/dxZCGYdxYYiUAAM3sc01YKZUgMucgrdk=;
	b=kk1KTnbHrHZ0pvsQlKYThGM0tqcoqcH4nYG6AUlOZQYXXGZtjK3r1VAMuFqIo2gFbrk8Y2
	u0HIrCXTbYPQ1gsLuMLwS3C9GQ0bdm//l0XdzONqpgd5qC0wqSAQOYnJSEd5L/JaD3zlCr
	CGl+KnHTVsBrwQKOk9XZH/Vd2VG+7vw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478634;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WXQL2Lrn9v/dxZCGYdxYYiUAAM3sc01YKZUgMucgrdk=;
	b=ka+nfst4AnEToYUTSClp9vRKSqCBPIol/TczHA3QsNNfiAdLkbqPTawJZ8PGFY2yPLo1Wy
	hVB+6fclb5ztU4Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WXQL2Lrn9v/dxZCGYdxYYiUAAM3sc01YKZUgMucgrdk=;
	b=kk1KTnbHrHZ0pvsQlKYThGM0tqcoqcH4nYG6AUlOZQYXXGZtjK3r1VAMuFqIo2gFbrk8Y2
	u0HIrCXTbYPQ1gsLuMLwS3C9GQ0bdm//l0XdzONqpgd5qC0wqSAQOYnJSEd5L/JaD3zlCr
	CGl+KnHTVsBrwQKOk9XZH/Vd2VG+7vw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478634;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WXQL2Lrn9v/dxZCGYdxYYiUAAM3sc01YKZUgMucgrdk=;
	b=ka+nfst4AnEToYUTSClp9vRKSqCBPIol/TczHA3QsNNfiAdLkbqPTawJZ8PGFY2yPLo1Wy
	hVB+6fclb5ztU4Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6883C13A3E;
	Fri, 29 Aug 2025 14:43:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4JYvGKq8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 10/61] ALSA: atiixp: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:42:45 +0200
Message-ID: <20250829144342.4290-11-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/atiixp.c       | 31 ++++++++++++-------------------
 sound/pci/atiixp_modem.c | 17 +++++------------
 2 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
index 4f544950ee7b..38c07f3de850 100644
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -1073,9 +1073,8 @@ static int snd_atiixp_playback_open(struct snd_pcm_substream *substream)
 	struct atiixp *chip = snd_pcm_substream_chip(substream);
 	int err;
 
-	mutex_lock(&chip->open_mutex);
+	guard(mutex)(&chip->open_mutex);
 	err = snd_atiixp_pcm_open(substream, &chip->dmas[ATI_DMA_PLAYBACK], 0);
-	mutex_unlock(&chip->open_mutex);
 	if (err < 0)
 		return err;
 	substream->runtime->hw.channels_max = chip->max_channels;
@@ -1089,11 +1088,9 @@ static int snd_atiixp_playback_open(struct snd_pcm_substream *substream)
 static int snd_atiixp_playback_close(struct snd_pcm_substream *substream)
 {
 	struct atiixp *chip = snd_pcm_substream_chip(substream);
-	int err;
-	mutex_lock(&chip->open_mutex);
-	err = snd_atiixp_pcm_close(substream, &chip->dmas[ATI_DMA_PLAYBACK]);
-	mutex_unlock(&chip->open_mutex);
-	return err;
+
+	guard(mutex)(&chip->open_mutex);
+	return snd_atiixp_pcm_close(substream, &chip->dmas[ATI_DMA_PLAYBACK]);
 }
 
 static int snd_atiixp_capture_open(struct snd_pcm_substream *substream)
@@ -1111,27 +1108,23 @@ static int snd_atiixp_capture_close(struct snd_pcm_substream *substream)
 static int snd_atiixp_spdif_open(struct snd_pcm_substream *substream)
 {
 	struct atiixp *chip = snd_pcm_substream_chip(substream);
-	int err;
-	mutex_lock(&chip->open_mutex);
+
+	guard(mutex)(&chip->open_mutex);
 	if (chip->spdif_over_aclink) /* share DMA_PLAYBACK */
-		err = snd_atiixp_pcm_open(substream, &chip->dmas[ATI_DMA_PLAYBACK], 2);
+		return snd_atiixp_pcm_open(substream, &chip->dmas[ATI_DMA_PLAYBACK], 2);
 	else
-		err = snd_atiixp_pcm_open(substream, &chip->dmas[ATI_DMA_SPDIF], -1);
-	mutex_unlock(&chip->open_mutex);
-	return err;
+		return snd_atiixp_pcm_open(substream, &chip->dmas[ATI_DMA_SPDIF], -1);
 }
 
 static int snd_atiixp_spdif_close(struct snd_pcm_substream *substream)
 {
 	struct atiixp *chip = snd_pcm_substream_chip(substream);
-	int err;
-	mutex_lock(&chip->open_mutex);
+
+	guard(mutex)(&chip->open_mutex);
 	if (chip->spdif_over_aclink)
-		err = snd_atiixp_pcm_close(substream, &chip->dmas[ATI_DMA_PLAYBACK]);
+		return snd_atiixp_pcm_close(substream, &chip->dmas[ATI_DMA_PLAYBACK]);
 	else
-		err = snd_atiixp_pcm_close(substream, &chip->dmas[ATI_DMA_SPDIF]);
-	mutex_unlock(&chip->open_mutex);
-	return err;
+		return snd_atiixp_pcm_close(substream, &chip->dmas[ATI_DMA_SPDIF]);
 }
 
 /* AC97 playback */
diff --git a/sound/pci/atiixp_modem.c b/sound/pci/atiixp_modem.c
index f7417c2bb477..81a53336699e 100644
--- a/sound/pci/atiixp_modem.c
+++ b/sound/pci/atiixp_modem.c
@@ -892,24 +892,17 @@ static int snd_atiixp_pcm_close(struct snd_pcm_substream *substream,
 static int snd_atiixp_playback_open(struct snd_pcm_substream *substream)
 {
 	struct atiixp_modem *chip = snd_pcm_substream_chip(substream);
-	int err;
 
-	mutex_lock(&chip->open_mutex);
-	err = snd_atiixp_pcm_open(substream, &chip->dmas[ATI_DMA_PLAYBACK], 0);
-	mutex_unlock(&chip->open_mutex);
-	if (err < 0)
-		return err;
-	return 0;
+	guard(mutex)(&chip->open_mutex);
+	return snd_atiixp_pcm_open(substream, &chip->dmas[ATI_DMA_PLAYBACK], 0);
 }
 
 static int snd_atiixp_playback_close(struct snd_pcm_substream *substream)
 {
 	struct atiixp_modem *chip = snd_pcm_substream_chip(substream);
-	int err;
-	mutex_lock(&chip->open_mutex);
-	err = snd_atiixp_pcm_close(substream, &chip->dmas[ATI_DMA_PLAYBACK]);
-	mutex_unlock(&chip->open_mutex);
-	return err;
+
+	guard(mutex)(&chip->open_mutex);
+	return snd_atiixp_pcm_close(substream, &chip->dmas[ATI_DMA_PLAYBACK]);
 }
 
 static int snd_atiixp_capture_open(struct snd_pcm_substream *substream)
-- 
2.50.1

