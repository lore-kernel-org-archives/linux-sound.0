Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B41F318139
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 07:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756280017; cv=none; b=hKw947r/VbGUZnS0PJ2rrS+bow1PCIJLw/9R+o0/O6fXCFCSwETlC/ahpOWWydu7wPZxtvgZriV8XCkQR2WV3o6rx1eVOXWFZWqTVtRhXVajPvMXxk9Oe3LmZ9OUge/tCTAW7xBZIfhujM4zkPs3naOguF3YtUAan3T0XPTS3VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756280017; c=relaxed/simple;
	bh=yp/wxRNlMWb2b3vSdpc7klYJwAyyz9dOU5lh9VmKwjQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LRVbMZk2F1WGncmMp+TLctKPzO+sLUPUSCwswlKwEFA1gApqod/x8c/P2674iUa9s8Y3d2hXHMKRg5TGcnoV+M27U17G3f7HjnKXBuRvB0hAXrMs6TFKbgCaj4kaDUJ0a9LwHLOzHn0lxKKXa7DkyUS/PbC68OgV1wlAisW6Lmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yxw50TnN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eY/l1nnP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yxw50TnN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eY/l1nnP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yxw50TnN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eY/l1nnP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yxw50TnN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eY/l1nnP"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 27AF8223F9;
	Wed, 27 Aug 2025 07:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XTxWkiUrh5Us5kEKPAu5pHsqGlHwmLWntOHhHSSbTVA=;
	b=Yxw50TnNB26xlIzVOLb+5OXsLk6KK8GoSMFwmw/Ly6oK6XwrXnyfCTfJTfeoWhxTum0H/5
	3XSxriuMNznFS9ols/f14ANR8AlgACkUR1WEp82Nqu7T1S1KJsH/EW3Bul82dZdaDeh08x
	i6oeo67EmVoilJRBZprnYLhNl3dfvSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279764;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XTxWkiUrh5Us5kEKPAu5pHsqGlHwmLWntOHhHSSbTVA=;
	b=eY/l1nnPfn1PkhsV43Sa2ot7SjHf2I7O60eNyflpq7AhsRVr+dADzBV9NPRJWD0ngX3WV9
	3q4f5YPwMxpDISDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XTxWkiUrh5Us5kEKPAu5pHsqGlHwmLWntOHhHSSbTVA=;
	b=Yxw50TnNB26xlIzVOLb+5OXsLk6KK8GoSMFwmw/Ly6oK6XwrXnyfCTfJTfeoWhxTum0H/5
	3XSxriuMNznFS9ols/f14ANR8AlgACkUR1WEp82Nqu7T1S1KJsH/EW3Bul82dZdaDeh08x
	i6oeo67EmVoilJRBZprnYLhNl3dfvSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279764;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XTxWkiUrh5Us5kEKPAu5pHsqGlHwmLWntOHhHSSbTVA=;
	b=eY/l1nnPfn1PkhsV43Sa2ot7SjHf2I7O60eNyflpq7AhsRVr+dADzBV9NPRJWD0ngX3WV9
	3q4f5YPwMxpDISDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BDAA913867;
	Wed, 27 Aug 2025 07:29:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wLz3K9OzrmjoagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 07:29:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 24/25] ALSA: hda/common: Use guard() for spinlocks
Date: Wed, 27 Aug 2025 09:29:04 +0200
Message-ID: <20250827072916.31933-25-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827072916.31933-1-tiwai@suse.de>
References: <20250827072916.31933-1-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
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

Replace the manual spin lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/common/codec.c      | 10 ++-----
 sound/hda/common/controller.c | 53 +++++++++++++++--------------------
 2 files changed, 26 insertions(+), 37 deletions(-)

diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index f6c9230f04cc..c6d44168c7f9 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -1748,9 +1748,9 @@ int snd_hda_lock_devices(struct hda_bus *bus)
 	struct snd_card *card = bus->card;
 	struct hda_codec *codec;
 
-	spin_lock(&card->files_lock);
+	guard(spinlock)(&card->files_lock);
 	if (card->shutdown)
-		goto err_unlock;
+		return -EINVAL;
 	card->shutdown = 1;
 	if (!list_empty(&card->ctl_files))
 		goto err_clear;
@@ -1765,13 +1765,10 @@ int snd_hda_lock_devices(struct hda_bus *bus)
 				goto err_clear;
 		}
 	}
-	spin_unlock(&card->files_lock);
 	return 0;
 
  err_clear:
 	card->shutdown = 0;
- err_unlock:
-	spin_unlock(&card->files_lock);
 	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(snd_hda_lock_devices);
@@ -1784,9 +1781,8 @@ void snd_hda_unlock_devices(struct hda_bus *bus)
 {
 	struct snd_card *card = bus->card;
 
-	spin_lock(&card->files_lock);
+	guard(spinlock)(&card->files_lock);
 	card->shutdown = 0;
-	spin_unlock(&card->files_lock);
 }
 EXPORT_SYMBOL_GPL(snd_hda_unlock_devices);
 
diff --git a/sound/hda/common/controller.c b/sound/hda/common/controller.c
index a5693c9ca400..b1cfd9bd4dcb 100644
--- a/sound/hda/common/controller.c
+++ b/sound/hda/common/controller.c
@@ -245,31 +245,29 @@ static int azx_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 		snd_pcm_trigger_done(s, substream);
 	}
 
-	spin_lock(&bus->reg_lock);
+	scoped_guard(spinlock, &bus->reg_lock) {
+		/* first, set SYNC bits of corresponding streams */
+		snd_hdac_stream_sync_trigger(hstr, true, sbits, sync_reg);
 
-	/* first, set SYNC bits of corresponding streams */
-	snd_hdac_stream_sync_trigger(hstr, true, sbits, sync_reg);
-
-	snd_pcm_group_for_each_entry(s, substream) {
-		if (s->pcm->card != substream->pcm->card)
-			continue;
-		azx_dev = get_azx_dev(s);
-		if (start) {
-			azx_dev->insufficient = 1;
-			snd_hdac_stream_start(azx_stream(azx_dev));
-		} else {
-			snd_hdac_stream_stop(azx_stream(azx_dev));
+		snd_pcm_group_for_each_entry(s, substream) {
+			if (s->pcm->card != substream->pcm->card)
+				continue;
+			azx_dev = get_azx_dev(s);
+			if (start) {
+				azx_dev->insufficient = 1;
+				snd_hdac_stream_start(azx_stream(azx_dev));
+			} else {
+				snd_hdac_stream_stop(azx_stream(azx_dev));
+			}
 		}
 	}
-	spin_unlock(&bus->reg_lock);
 
 	snd_hdac_stream_sync(hstr, start, sbits);
 
-	spin_lock(&bus->reg_lock);
+	guard(spinlock)(&bus->reg_lock);
 	/* reset SYNC bits */
 	snd_hdac_stream_sync_trigger(hstr, false, sbits, sync_reg);
 	snd_hdac_stream_timecounter_init(hstr, sbits, start);
-	spin_unlock(&bus->reg_lock);
 	return 0;
 }
 
@@ -964,19 +962,18 @@ int snd_hda_codec_load_dsp_prepare(struct hda_codec *codec, unsigned int format,
 
 	azx_dev = azx_get_dsp_loader_dev(chip);
 	hstr = azx_stream(azx_dev);
-	spin_lock_irq(&bus->reg_lock);
-	if (hstr->opened) {
-		chip->saved_azx_dev = *azx_dev;
-		saved = true;
+	scoped_guard(spinlock_irq, &bus->reg_lock) {
+		if (hstr->opened) {
+			chip->saved_azx_dev = *azx_dev;
+			saved = true;
+		}
 	}
-	spin_unlock_irq(&bus->reg_lock);
 
 	err = snd_hdac_dsp_prepare(hstr, format, byte_size, bufp);
 	if (err < 0) {
-		spin_lock_irq(&bus->reg_lock);
+		guard(spinlock_irq)(&bus->reg_lock);
 		if (saved)
 			*azx_dev = chip->saved_azx_dev;
-		spin_unlock_irq(&bus->reg_lock);
 		return err;
 	}
 
@@ -1007,11 +1004,10 @@ void snd_hda_codec_load_dsp_cleanup(struct hda_codec *codec,
 		return;
 
 	snd_hdac_dsp_cleanup(hstr, dmab);
-	spin_lock_irq(&bus->reg_lock);
+	guard(spinlock_irq)(&bus->reg_lock);
 	if (hstr->opened)
 		*azx_dev = chip->saved_azx_dev;
 	hstr->locked = false;
-	spin_unlock_irq(&bus->reg_lock);
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_load_dsp_cleanup);
 #endif /* CONFIG_SND_HDA_DSP_LOADER */
@@ -1072,10 +1068,10 @@ irqreturn_t azx_interrupt(int irq, void *dev_id)
 		if (!pm_runtime_active(chip->card->dev))
 			return IRQ_NONE;
 
-	spin_lock(&bus->reg_lock);
+	guard(spinlock)(&bus->reg_lock);
 
 	if (chip->disabled)
-		goto unlock;
+		return IRQ_NONE;
 
 	do {
 		status = azx_readl(chip, INTSTS);
@@ -1107,9 +1103,6 @@ irqreturn_t azx_interrupt(int irq, void *dev_id)
 		}
 	} while (active && ++repeat < 10);
 
- unlock:
-	spin_unlock(&bus->reg_lock);
-
 	return IRQ_RETVAL(handled);
 }
 EXPORT_SYMBOL_GPL(azx_interrupt);
-- 
2.50.1

