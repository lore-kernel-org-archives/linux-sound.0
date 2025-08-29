Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7384B320CDA
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479663; cv=none; b=sU1G9TJNbbLtMc+vu3F4FwAqAcjno7t1dawXdwUM2uybjfUQ34AV7TCfz9Oyglh6DGgtRavm7ncn+9ED1D/nWGxLNW6DwgD+QZPjwuv3UxQis2OB9t+19CpDH2osXYLIrrU4KZDBUYv/hxRS6CIn/OeUWwRaL81q3T4ETQJgnsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479663; c=relaxed/simple;
	bh=k4PKzA2VV6Yf5+C1ba3Owaog6r7z42UGurQaENobF2w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jRtQNu6/a7AvvDDiR3dnRWTHlNmm98hphWD8fwuiPlV3L34zMfgU0I/fqKr/Uxag8VtNC3ZdbhM83fQfkCgyXjPZ69oooHV6Go0AfuOVZ4tpHk2wGLUySiwjqVsgswxMOIr5ETTI4rHzObAZJgD+dg4EDReBJyUXBLLRTG/f8m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RslSicFQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bOXj0t/U; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RslSicFQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bOXj0t/U; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RslSicFQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bOXj0t/U";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RslSicFQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bOXj0t/U"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 94A615C246;
	Fri, 29 Aug 2025 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9jSdLCGsFES2RKXFVTiDlMNKZslW36efrcEQo5fEa2c=;
	b=RslSicFQEoTE+LJO7B+CRoDyPorahdfT++BLcRFWSnQn9r0z71nklj0wEWnL+oaX1ViJz1
	bjfReVikrq4+EdHlLZUKSNFS6ANzTvXlOWLeGSyP/co7wsUMjFD8Yb+VxxxeiR+fZXFyOD
	pkwBd1vFvKFphGH9e1ElpWz6BuuuI7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9jSdLCGsFES2RKXFVTiDlMNKZslW36efrcEQo5fEa2c=;
	b=bOXj0t/UWU8HPn5Heo3OQcK5PQbzkm6/2D4LZ6JzZ5g/xrQX0lGCAodrE1KG5jBtBrul5L
	hYbq8sLd5c3Ly1Bw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RslSicFQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="bOXj0t/U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9jSdLCGsFES2RKXFVTiDlMNKZslW36efrcEQo5fEa2c=;
	b=RslSicFQEoTE+LJO7B+CRoDyPorahdfT++BLcRFWSnQn9r0z71nklj0wEWnL+oaX1ViJz1
	bjfReVikrq4+EdHlLZUKSNFS6ANzTvXlOWLeGSyP/co7wsUMjFD8Yb+VxxxeiR+fZXFyOD
	pkwBd1vFvKFphGH9e1ElpWz6BuuuI7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9jSdLCGsFES2RKXFVTiDlMNKZslW36efrcEQo5fEa2c=;
	b=bOXj0t/UWU8HPn5Heo3OQcK5PQbzkm6/2D4LZ6JzZ5g/xrQX0lGCAodrE1KG5jBtBrul5L
	hYbq8sLd5c3Ly1Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7CFD113A6A;
	Fri, 29 Aug 2025 15:00:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ON5dHZDAsWjjHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:00:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 10/13] ALSA: mtpav: Use guard() for spin locks
Date: Fri, 29 Aug 2025 17:00:21 +0200
Message-ID: <20250829150026.6379-11-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 94A615C246
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/mtpav.c | 59 +++++++++++++++----------------------------
 1 file changed, 20 insertions(+), 39 deletions(-)

diff --git a/sound/drivers/mtpav.c b/sound/drivers/mtpav.c
index 91828f496738..d31eadf4be5f 100644
--- a/sound/drivers/mtpav.c
+++ b/sound/drivers/mtpav.c
@@ -304,11 +304,9 @@ static void snd_mtpav_output_write(struct snd_rawmidi_substream *substream)
 {
 	struct mtpav *mtp_card = substream->rmidi->private_data;
 	struct mtpav_port *portp = &mtp_card->ports[substream->number];
-	unsigned long flags;
 
-	spin_lock_irqsave(&mtp_card->spinlock, flags);
+	guard(spinlock_irqsave)(&mtp_card->spinlock);
 	snd_mtpav_output_port_write(mtp_card, portp, substream);
-	spin_unlock_irqrestore(&mtp_card->spinlock, flags);
 }
 
 
@@ -334,14 +332,12 @@ static int snd_mtpav_input_open(struct snd_rawmidi_substream *substream)
 {
 	struct mtpav *mtp_card = substream->rmidi->private_data;
 	struct mtpav_port *portp = &mtp_card->ports[substream->number];
-	unsigned long flags;
 
-	spin_lock_irqsave(&mtp_card->spinlock, flags);
+	guard(spinlock_irqsave)(&mtp_card->spinlock);
 	portp->mode |= MTPAV_MODE_INPUT_OPENED;
 	portp->input = substream;
 	if (mtp_card->share_irq++ == 0)
 		snd_mtpav_mputreg(mtp_card, CREG, (SIGC_INTEN | SIGC_WRITE));	// enable pport interrupts
-	spin_unlock_irqrestore(&mtp_card->spinlock, flags);
 	return 0;
 }
 
@@ -352,14 +348,12 @@ static int snd_mtpav_input_close(struct snd_rawmidi_substream *substream)
 {
 	struct mtpav *mtp_card = substream->rmidi->private_data;
 	struct mtpav_port *portp = &mtp_card->ports[substream->number];
-	unsigned long flags;
 
-	spin_lock_irqsave(&mtp_card->spinlock, flags);
+	guard(spinlock_irqsave)(&mtp_card->spinlock);
 	portp->mode &= ~MTPAV_MODE_INPUT_OPENED;
 	portp->input = NULL;
 	if (--mtp_card->share_irq == 0)
 		snd_mtpav_mputreg(mtp_card, CREG, 0);	// disable pport interrupts
-	spin_unlock_irqrestore(&mtp_card->spinlock, flags);
 	return 0;
 }
 
@@ -370,15 +364,12 @@ static void snd_mtpav_input_trigger(struct snd_rawmidi_substream *substream, int
 {
 	struct mtpav *mtp_card = substream->rmidi->private_data;
 	struct mtpav_port *portp = &mtp_card->ports[substream->number];
-	unsigned long flags;
 
-	spin_lock_irqsave(&mtp_card->spinlock, flags);
+	guard(spinlock_irqsave)(&mtp_card->spinlock);
 	if (up)
 		portp->mode |= MTPAV_MODE_INPUT_TRIGGERED;
 	else
 		portp->mode &= ~MTPAV_MODE_INPUT_TRIGGERED;
-	spin_unlock_irqrestore(&mtp_card->spinlock, flags);
-
 }
 
 
@@ -388,11 +379,10 @@ static void snd_mtpav_input_trigger(struct snd_rawmidi_substream *substream, int
 
 static void snd_mtpav_output_timer(struct timer_list *t)
 {
-	unsigned long flags;
 	struct mtpav *chip = timer_container_of(chip, t, timer);
 	int p;
 
-	spin_lock_irqsave(&chip->spinlock, flags);
+	guard(spinlock_irqsave)(&chip->spinlock);
 	/* reprogram timer */
 	mod_timer(&chip->timer, 1 + jiffies);
 	/* process each port */
@@ -401,7 +391,6 @@ static void snd_mtpav_output_timer(struct timer_list *t)
 		if ((portp->mode & MTPAV_MODE_OUTPUT_TRIGGERED) && portp->output)
 			snd_mtpav_output_port_write(chip, portp, portp->output);
 	}
-	spin_unlock_irqrestore(&chip->spinlock, flags);
 }
 
 /* spinlock held! */
@@ -423,12 +412,10 @@ static int snd_mtpav_output_open(struct snd_rawmidi_substream *substream)
 {
 	struct mtpav *mtp_card = substream->rmidi->private_data;
 	struct mtpav_port *portp = &mtp_card->ports[substream->number];
-	unsigned long flags;
 
-	spin_lock_irqsave(&mtp_card->spinlock, flags);
+	guard(spinlock_irqsave)(&mtp_card->spinlock);
 	portp->mode |= MTPAV_MODE_OUTPUT_OPENED;
 	portp->output = substream;
-	spin_unlock_irqrestore(&mtp_card->spinlock, flags);
 	return 0;
 };
 
@@ -439,12 +426,10 @@ static int snd_mtpav_output_close(struct snd_rawmidi_substream *substream)
 {
 	struct mtpav *mtp_card = substream->rmidi->private_data;
 	struct mtpav_port *portp = &mtp_card->ports[substream->number];
-	unsigned long flags;
 
-	spin_lock_irqsave(&mtp_card->spinlock, flags);
+	guard(spinlock_irqsave)(&mtp_card->spinlock);
 	portp->mode &= ~MTPAV_MODE_OUTPUT_OPENED;
 	portp->output = NULL;
-	spin_unlock_irqrestore(&mtp_card->spinlock, flags);
 	return 0;
 };
 
@@ -455,21 +440,20 @@ static void snd_mtpav_output_trigger(struct snd_rawmidi_substream *substream, in
 {
 	struct mtpav *mtp_card = substream->rmidi->private_data;
 	struct mtpav_port *portp = &mtp_card->ports[substream->number];
-	unsigned long flags;
 
-	spin_lock_irqsave(&mtp_card->spinlock, flags);
-	if (up) {
-		if (! (portp->mode & MTPAV_MODE_OUTPUT_TRIGGERED)) {
-			if (mtp_card->istimer++ == 0)
-				snd_mtpav_add_output_timer(mtp_card);
-			portp->mode |= MTPAV_MODE_OUTPUT_TRIGGERED;
+	scoped_guard(spinlock_irqsave, &mtp_card->spinlock) {
+		if (up) {
+			if ((portp->mode & MTPAV_MODE_OUTPUT_TRIGGERED)) {
+				if (mtp_card->istimer++ == 0)
+					snd_mtpav_add_output_timer(mtp_card);
+				portp->mode |= MTPAV_MODE_OUTPUT_TRIGGERED;
+			}
+		} else {
+			portp->mode &= ~MTPAV_MODE_OUTPUT_TRIGGERED;
+			if (--mtp_card->istimer == 0)
+				snd_mtpav_remove_output_timer(mtp_card);
 		}
-	} else {
-		portp->mode &= ~MTPAV_MODE_OUTPUT_TRIGGERED;
-		if (--mtp_card->istimer == 0)
-			snd_mtpav_remove_output_timer(mtp_card);
 	}
-	spin_unlock_irqrestore(&mtp_card->spinlock, flags);
 
 	if (up)
 		snd_mtpav_output_write(substream);
@@ -550,9 +534,8 @@ static irqreturn_t snd_mtpav_irqh(int irq, void *dev_id)
 {
 	struct mtpav *mcard = dev_id;
 
-	spin_lock(&mcard->spinlock);
+	guard(spinlock)(&mcard->spinlock);
 	snd_mtpav_read_bytes(mcard);
-	spin_unlock(&mcard->spinlock);
 	return IRQ_HANDLED;
 }
 
@@ -658,12 +641,10 @@ static int snd_mtpav_get_RAWMIDI(struct mtpav *mcard)
 static void snd_mtpav_free(struct snd_card *card)
 {
 	struct mtpav *crd = card->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&crd->spinlock, flags);
+	guard(spinlock_irqsave)(&crd->spinlock);
 	if (crd->istimer > 0)
 		snd_mtpav_remove_output_timer(crd);
-	spin_unlock_irqrestore(&crd->spinlock, flags);
 }
 
 /*
-- 
2.50.1

