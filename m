Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC98217654
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478718; cv=none; b=bZ+HGhabg1r695fXZn7OZ/7GlPk8WhIo1rDGxbHqPeITfoO7Kl5EMW3FWLWGdTS2OswxrJxjhTt04znjbFIMDODw153KIIphxO7Ln+fJyBniPMMjZGsVk0kHeNRoo1k7bleaROUwRqJ2H3FzhDcS40hoGVAXo4ZuLp2mfp5XgKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478718; c=relaxed/simple;
	bh=MFmIbjz5ahd+icATX55iZa07Bl9ESaayPQBSIzp1CSI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbOg2p93QYsZ5mfjsNlJasl73mFDoUSeqLXqh6JaUeuM+dQCQJFzYvwTQ8XofB5zvSc94tKpEWapljAJEfSOWZtGruy4nww1jw1MusthWoLeyz+ThuXHoVZ9pfZnOJA8ezDkwXTPZ6LSm3uiVfFmOkDVMhz6t2aWqOr7M2VhNgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0Hrr0tdM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L/poh4CD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0Hrr0tdM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L/poh4CD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0Hrr0tdM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L/poh4CD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0Hrr0tdM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L/poh4CD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 60CBA5C22E;
	Fri, 29 Aug 2025 14:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QKIQflcXAfgoztZl578pQE6e/ENVjhh8fTJlTJovQlE=;
	b=0Hrr0tdMd41oSK0sI9lFu/gn5WlM4BM/MsCz6cz+OziBY/BcDkLpeNgfR5Wd6GMT5XvJEI
	0MoXEvd9u/wOrhlhDXflouwMzya6lek8uwr815TLI9ck+FruDQdqqfsr3/HRwJL50p5sfl
	zzaG/w7Jrjm2lc2vDR4NSXxHlJipH7k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QKIQflcXAfgoztZl578pQE6e/ENVjhh8fTJlTJovQlE=;
	b=L/poh4CD9es3XsYl4B3qp1kTCmU7HIY0uNaO/SXdW3vv2fiZRmorh8DJFes6u10/9Hzduv
	shntI4c6LIoKy7Cg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0Hrr0tdM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="L/poh4CD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QKIQflcXAfgoztZl578pQE6e/ENVjhh8fTJlTJovQlE=;
	b=0Hrr0tdMd41oSK0sI9lFu/gn5WlM4BM/MsCz6cz+OziBY/BcDkLpeNgfR5Wd6GMT5XvJEI
	0MoXEvd9u/wOrhlhDXflouwMzya6lek8uwr815TLI9ck+FruDQdqqfsr3/HRwJL50p5sfl
	zzaG/w7Jrjm2lc2vDR4NSXxHlJipH7k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QKIQflcXAfgoztZl578pQE6e/ENVjhh8fTJlTJovQlE=;
	b=L/poh4CD9es3XsYl4B3qp1kTCmU7HIY0uNaO/SXdW3vv2fiZRmorh8DJFes6u10/9Hzduv
	shntI4c6LIoKy7Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4927413A3E;
	Fri, 29 Aug 2025 14:43:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qPq/EK+8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 21/61] ALSA: cs5535audio: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:42:56 +0200
Message-ID: <20250829144342.4290-22-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 60CBA5C22E
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
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

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs5535audio/cs5535audio.c     | 14 ++++++++------
 sound/pci/cs5535audio/cs5535audio_pcm.c | 12 ++++--------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/sound/pci/cs5535audio/cs5535audio.c b/sound/pci/cs5535audio/cs5535audio.c
index 76566e7baea0..0ebf6c02b1ef 100644
--- a/sound/pci/cs5535audio/cs5535audio.c
+++ b/sound/pci/cs5535audio/cs5535audio.c
@@ -176,9 +176,10 @@ static int snd_cs5535audio_mixer(struct cs5535audio *cs5535au)
 static void process_bm0_irq(struct cs5535audio *cs5535au)
 {
 	u8 bm_stat;
-	spin_lock(&cs5535au->reg_lock);
-	bm_stat = cs_readb(cs5535au, ACC_BM0_STATUS);
-	spin_unlock(&cs5535au->reg_lock);
+
+	scoped_guard(spinlock, &cs5535au->reg_lock) {
+		bm_stat = cs_readb(cs5535au, ACC_BM0_STATUS);
+	}
 	if (bm_stat & EOP) {
 		snd_pcm_period_elapsed(cs5535au->playback_substream);
 	} else {
@@ -191,9 +192,10 @@ static void process_bm0_irq(struct cs5535audio *cs5535au)
 static void process_bm1_irq(struct cs5535audio *cs5535au)
 {
 	u8 bm_stat;
-	spin_lock(&cs5535au->reg_lock);
-	bm_stat = cs_readb(cs5535au, ACC_BM1_STATUS);
-	spin_unlock(&cs5535au->reg_lock);
+
+	scoped_guard(spinlock, &cs5535au->reg_lock) {
+		bm_stat = cs_readb(cs5535au, ACC_BM1_STATUS);
+	}
 	if (bm_stat & EOP)
 		snd_pcm_period_elapsed(cs5535au->capture_substream);
 }
diff --git a/sound/pci/cs5535audio/cs5535audio_pcm.c b/sound/pci/cs5535audio/cs5535audio_pcm.c
index f296b2c63026..48b99a07e3bc 100644
--- a/sound/pci/cs5535audio/cs5535audio_pcm.c
+++ b/sound/pci/cs5535audio/cs5535audio_pcm.c
@@ -150,10 +150,9 @@ static int cs5535audio_build_dma_packets(struct cs5535audio *cs5535au,
 	dma->substream = substream;
 	dma->period_bytes = period_bytes;
 	dma->periods = periods;
-	spin_lock_irq(&cs5535au->reg_lock);
+	guard(spinlock_irq)(&cs5535au->reg_lock);
 	dma->ops->disable_dma(cs5535au);
 	dma->ops->setup_prd(cs5535au, jmpprd_addr);
-	spin_unlock_irq(&cs5535au->reg_lock);
 	return 0;
 }
 
@@ -276,9 +275,8 @@ static int snd_cs5535audio_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct cs5535audio *cs5535au = snd_pcm_substream_chip(substream);
 	struct cs5535audio_dma *dma = substream->runtime->private_data;
-	int err = 0;
 
-	spin_lock(&cs5535au->reg_lock);
+	guard(spinlock)(&cs5535au->reg_lock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		dma->ops->pause_dma(cs5535au);
@@ -300,11 +298,9 @@ static int snd_cs5535audio_trigger(struct snd_pcm_substream *substream, int cmd)
 		break;
 	default:
 		dev_err(cs5535au->card->dev, "unhandled trigger\n");
-		err = -EINVAL;
-		break;
+		return -EINVAL;
 	}
-	spin_unlock(&cs5535au->reg_lock);
-	return err;
+	return 0;
 }
 
 static snd_pcm_uframes_t snd_cs5535audio_pcm_pointer(struct snd_pcm_substream
-- 
2.50.1

