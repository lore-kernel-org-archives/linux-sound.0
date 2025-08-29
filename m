Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF6A320CBF
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478749; cv=none; b=SB52W3GbcRCPuIzZX+LQRwHlZnpVaTVeYjCT9FAAbAMtazYYVqei7rHryCZNGSD/dFA+jl249bzRXRWmkNSjQPtql52DbcxFSMtcjf5jO5eFyhMl0fiQQVwkE3KvSCQP/bqdWQEoWzqIi7iFSe8fhwwgijePpXsQOJ6ofJsbz3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478749; c=relaxed/simple;
	bh=TJh0qZXZLynYsuzBWZRvH+q6QPwtB9mJiu03O7KUVIE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SsZp9qPsBgtukpO7lZ+tGlaNNUfh7HIIP0t8ou6MZOo3g2rRrlIXZzoLyVqMW9oz3+FZSWBK7aqg/xBj63z9UkU9kj8BWfKqU4+ytD5LAVlfVmDKbM1ZkH1V5Fej6AlM9BmWXPX172HG42DlmVHCosfuTLMARH7zq/h3PnbrnGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RE2XAiyN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N1BXpn/6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RE2XAiyN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N1BXpn/6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RE2XAiyN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N1BXpn/6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RE2XAiyN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N1BXpn/6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 735DC33ED1;
	Fri, 29 Aug 2025 14:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dq5wxB4hwE7ah6ARSGbYwmSEI7OKyM78Hqf5ZhtSHBk=;
	b=RE2XAiyNRdy6wEKQ2MICi0uanoOnPYe8YZDdZzQ/fLjBMoau+N+YaotoWPqxuz0zHS9oKY
	xBaf3shRHk+cUZYDPnI/py4Y/QKZknHP5dgoBMEc1KnNTxqdNKT4QTclQ+KNDsBgrqXmBq
	xWETXfDYGnrWR6iuIvBxZAdQ4jICF+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dq5wxB4hwE7ah6ARSGbYwmSEI7OKyM78Hqf5ZhtSHBk=;
	b=N1BXpn/6ePQrZAQJY3t7e7MzKG/NO7mAC0NbvihHsv+2GvUfqJDdeMMoehlgYSRlvQ8kRP
	j2beoeRSin0/QDCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dq5wxB4hwE7ah6ARSGbYwmSEI7OKyM78Hqf5ZhtSHBk=;
	b=RE2XAiyNRdy6wEKQ2MICi0uanoOnPYe8YZDdZzQ/fLjBMoau+N+YaotoWPqxuz0zHS9oKY
	xBaf3shRHk+cUZYDPnI/py4Y/QKZknHP5dgoBMEc1KnNTxqdNKT4QTclQ+KNDsBgrqXmBq
	xWETXfDYGnrWR6iuIvBxZAdQ4jICF+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dq5wxB4hwE7ah6ARSGbYwmSEI7OKyM78Hqf5ZhtSHBk=;
	b=N1BXpn/6ePQrZAQJY3t7e7MzKG/NO7mAC0NbvihHsv+2GvUfqJDdeMMoehlgYSRlvQ8kRP
	j2beoeRSin0/QDCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A75D13A6A;
	Fri, 29 Aug 2025 14:44:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2E0BFbK8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 45/61] ALSA: nm256: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:43:20 +0200
Message-ID: <20250829144342.4290-46-tiwai@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/nm256/nm256.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index 7b2c986bb5ef..da74b923bc88 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -544,12 +544,11 @@ snd_nm256_playback_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct nm256 *chip = snd_pcm_substream_chip(substream);
 	struct nm256_stream *s = substream->runtime->private_data;
-	int err = 0;
 
 	if (snd_BUG_ON(!s))
 		return -ENXIO;
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
 		s->suspended = 0;
@@ -570,11 +569,9 @@ snd_nm256_playback_trigger(struct snd_pcm_substream *substream, int cmd)
 		}
 		break;
 	default:
-		err = -EINVAL;
-		break;
+		return -EINVAL;
 	}
-	spin_unlock(&chip->reg_lock);
-	return err;
+	return 0;
 }
 
 static int
@@ -582,12 +579,11 @@ snd_nm256_capture_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct nm256 *chip = snd_pcm_substream_chip(substream);
 	struct nm256_stream *s = substream->runtime->private_data;
-	int err = 0;
 
 	if (snd_BUG_ON(!s))
 		return -ENXIO;
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -604,11 +600,9 @@ snd_nm256_capture_trigger(struct snd_pcm_substream *substream, int cmd)
 		}
 		break;
 	default:
-		err = -EINVAL;
-		break;
+		return -EINVAL;
 	}
-	spin_unlock(&chip->reg_lock);
-	return err;
+	return 0;
 }
 
 
@@ -628,10 +622,9 @@ static int snd_nm256_pcm_prepare(struct snd_pcm_substream *substream)
 	s->periods = substream->runtime->periods;
 	s->cur_period = 0;
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	s->running = 0;
 	snd_nm256_set_format(chip, s, substream);
-	spin_unlock_irq(&chip->reg_lock);
 
 	return 0;
 }
@@ -996,7 +989,7 @@ snd_nm256_interrupt(int irq, void *dev_id)
 
 	/* Rather boring; check for individual interrupts and process them. */
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	if (status & NM_PLAYBACK_INT) {
 		status &= ~NM_PLAYBACK_INT;
 		NM_ACK_INT(chip, NM_PLAYBACK_INT);
@@ -1035,7 +1028,6 @@ snd_nm256_interrupt(int irq, void *dev_id)
 		NM_ACK_INT(chip, status);
 	}
 
-	spin_unlock(&chip->reg_lock);
 	return IRQ_HANDLED;
 }
 
@@ -1062,7 +1054,7 @@ snd_nm256_interrupt_zx(int irq, void *dev_id)
 
 	/* Rather boring; check for individual interrupts and process them. */
 
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	if (status & NM2_PLAYBACK_INT) {
 		status &= ~NM2_PLAYBACK_INT;
 		NM2_ACK_INT(chip, NM2_PLAYBACK_INT);
@@ -1100,7 +1092,6 @@ snd_nm256_interrupt_zx(int irq, void *dev_id)
 		NM2_ACK_INT(chip, status);
 	}
 
-	spin_unlock(&chip->reg_lock);
 	return IRQ_HANDLED;
 }
 
@@ -1389,9 +1380,8 @@ static int nm256_resume(struct device *dev)
 	for (i = 0; i < 2; i++) {
 		struct nm256_stream *s = &chip->streams[i];
 		if (s->substream && s->suspended) {
-			spin_lock_irq(&chip->reg_lock);
+			guard(spinlock_irq)(&chip->reg_lock);
 			snd_nm256_set_format(chip, s, s->substream);
-			spin_unlock_irq(&chip->reg_lock);
 		}
 	}
 
-- 
2.50.1

