Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52DD31DD83
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478645; cv=none; b=Lpr1hrnSwIAMB+xEiKIU+Jirnnew8SZkPIOZvlGeiIwl8bcZW8ckidrIvj0ARapsqYJdl+zs+NOlbtIKnYiHqTcQu051SnB9BveMqw/iuhGJLkUetOVe2ypDlCbTw+WNt/5Ct0fOi24o43xjJ6xhyoPNmQe+YeOzR+ieNqpc9kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478645; c=relaxed/simple;
	bh=iwOo/utTHL0STN8GhMHFn0YQqkILJeT6veiOUGYkCS4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aAe6szgcJ3ORWKou69d3GGO3dVJY83Qhz3A/C7J9aKadWk+09KK9+HC9cztTKodhDqkOOPR7kpwPGKmVikDbwaDOzRzS8E84qMkaKBI3NAnafP9sjV+fLHlmSIac3GIEYCHz/PuttZdGxFNQL32QtrjDM7p2w5Y8BTs/+ubbCb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zkYfBnoQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CLM7M7a2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zkYfBnoQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CLM7M7a2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zkYfBnoQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CLM7M7a2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zkYfBnoQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CLM7M7a2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E505233EC3;
	Fri, 29 Aug 2025 14:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPxLXc0Jw5CS5vWyDMdaKVuDrNIMIv8X0oJPQl6zRh8=;
	b=zkYfBnoQH5P1oXPVDDIiId5YXuIU3Ge5TMEi8/orY/IeGOewAagEnHyXLCJAjoUB2UW4Nx
	dif/DW7VyoucrwZzi58eQLkLwz4e1XE0/471CmBF2Yt5Jj29qHZIzF4Y3NtjKONMautnRn
	I5us5Wy+Y0XF/2yDvVsEt6JaDcrNwH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478630;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPxLXc0Jw5CS5vWyDMdaKVuDrNIMIv8X0oJPQl6zRh8=;
	b=CLM7M7a2EZ50PSGEoeiqOIFaSoF4Y6P1PYdWu+g7BauNfGdKWj/qE32YDVnneOkcpzDA0S
	kGM1rLY05W1qh+AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPxLXc0Jw5CS5vWyDMdaKVuDrNIMIv8X0oJPQl6zRh8=;
	b=zkYfBnoQH5P1oXPVDDIiId5YXuIU3Ge5TMEi8/orY/IeGOewAagEnHyXLCJAjoUB2UW4Nx
	dif/DW7VyoucrwZzi58eQLkLwz4e1XE0/471CmBF2Yt5Jj29qHZIzF4Y3NtjKONMautnRn
	I5us5Wy+Y0XF/2yDvVsEt6JaDcrNwH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478630;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPxLXc0Jw5CS5vWyDMdaKVuDrNIMIv8X0oJPQl6zRh8=;
	b=CLM7M7a2EZ50PSGEoeiqOIFaSoF4Y6P1PYdWu+g7BauNfGdKWj/qE32YDVnneOkcpzDA0S
	kGM1rLY05W1qh+AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CBFF813A3E;
	Fri, 29 Aug 2025 14:43:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MDPlL6a8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 03/61] ALSA: ali5451: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:42:38 +0200
Message-ID: <20250829144342.4290-4-tiwai@suse.de>
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

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ali5451/ali5451.c | 92 +++++++++++++++----------------------
 1 file changed, 38 insertions(+), 54 deletions(-)

diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index a6e499e0ceda..571d89a6a8da 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -911,13 +911,12 @@ static struct snd_ali_voice *snd_ali_alloc_voice(struct snd_ali * codec,
 
 	dev_dbg(codec->card->dev, "alloc_voice: type=%d rec=%d\n", type, rec);
 
-	spin_lock_irq(&codec->voice_alloc);
+	guard(spinlock_irq)(&codec->voice_alloc);
 	if (type == SNDRV_ALI_VOICE_TYPE_PCM) {
 		idx = channel > 0 ? snd_ali_alloc_pcm_channel(codec, channel) :
 			snd_ali_find_free_channel(codec,rec);
 		if (idx < 0) {
 			dev_err(codec->card->dev, "ali_alloc_voice: err.\n");
-			spin_unlock_irq(&codec->voice_alloc);
 			return NULL;
 		}
 		pvoice = &(codec->synth.voices[idx]);
@@ -925,10 +924,8 @@ static struct snd_ali_voice *snd_ali_alloc_voice(struct snd_ali * codec,
 		pvoice->use = 1;
 		pvoice->pcm = 1;
 		pvoice->mode = rec;
-		spin_unlock_irq(&codec->voice_alloc);
 		return pvoice;
 	}
-	spin_unlock_irq(&codec->voice_alloc);
 	return NULL;
 }
 
@@ -943,16 +940,16 @@ static void snd_ali_free_voice(struct snd_ali * codec,
 	if (!pvoice->use)
 		return;
 	snd_ali_clear_voices(codec, pvoice->number, pvoice->number);
-	spin_lock_irq(&codec->voice_alloc);
-	private_free = pvoice->private_free;
-	private_data = pvoice->private_data;
-	pvoice->private_free = NULL;
-	pvoice->private_data = NULL;
-	if (pvoice->pcm)
-		snd_ali_free_channel_pcm(codec, pvoice->number);
-	pvoice->use = pvoice->pcm = pvoice->synth = 0;
-	pvoice->substream = NULL;
-	spin_unlock_irq(&codec->voice_alloc);
+	scoped_guard(spinlock_irq, &codec->voice_alloc) {
+		private_free = pvoice->private_free;
+		private_data = pvoice->private_data;
+		pvoice->private_free = NULL;
+		pvoice->private_data = NULL;
+		if (pvoice->pcm)
+			snd_ali_free_channel_pcm(codec, pvoice->number);
+		pvoice->use = pvoice->pcm = pvoice->synth = 0;
+		pvoice->substream = NULL;
+	}
 	if (private_free)
 		private_free(private_data);
 }
@@ -1109,7 +1106,7 @@ static int snd_ali_trigger(struct snd_pcm_substream *substream,
 			snd_pcm_trigger_done(s, substream);
 		}
 	}
-	spin_lock(&codec->reg_lock);
+	guard(spinlock)(&codec->reg_lock);
 	if (!do_start)
 		outl(what, ALI_REG(codec, ALI_STOP));
 	val = inl(ALI_REG(codec, ALI_AINTEN));
@@ -1121,7 +1118,6 @@ static int snd_ali_trigger(struct snd_pcm_substream *substream,
 	if (do_start)
 		outl(what, ALI_REG(codec, ALI_START));
 	dev_dbg(codec->card->dev, "trigger: what=%xh whati=%xh\n", what, whati);
-	spin_unlock(&codec->reg_lock);
 
 	return 0;
 }
@@ -1189,8 +1185,8 @@ static int snd_ali_playback_prepare(struct snd_pcm_substream *substream)
 	
 	dev_dbg(codec->card->dev, "playback_prepare ...\n");
 
-	spin_lock_irq(&codec->reg_lock);	
-	
+	guard(spinlock_irq)(&codec->reg_lock);
+
 	/* set Delta (rate) value */
 	Delta = snd_ali_convert_rate(runtime->rate, 0);
 
@@ -1259,7 +1255,6 @@ static int snd_ali_playback_prepare(struct snd_pcm_substream *substream)
 					 CTRL,
 					 EC);
 	}
-	spin_unlock_irq(&codec->reg_lock);
 	return 0;
 }
 
@@ -1360,14 +1355,11 @@ snd_ali_playback_pointer(struct snd_pcm_substream *substream)
 	struct snd_ali_voice *pvoice = runtime->private_data;
 	unsigned int cso;
 
-	spin_lock(&codec->reg_lock);
-	if (!pvoice->running) {
-		spin_unlock(&codec->reg_lock);
+	guard(spinlock)(&codec->reg_lock);
+	if (!pvoice->running)
 		return 0;
-	}
 	outb(pvoice->number, ALI_REG(codec, ALI_GC_CIR));
 	cso = inw(ALI_REG(codec, ALI_CSO_ALPHA_FMS + 2));
-	spin_unlock(&codec->reg_lock);
 	dev_dbg(codec->card->dev, "playback pointer returned cso=%xh.\n", cso);
 
 	cso %= runtime->buffer_size;
@@ -1382,14 +1374,11 @@ static snd_pcm_uframes_t snd_ali_pointer(struct snd_pcm_substream *substream)
 	struct snd_ali_voice *pvoice = runtime->private_data;
 	unsigned int cso;
 
-	spin_lock(&codec->reg_lock);
-	if (!pvoice->running) {
-		spin_unlock(&codec->reg_lock);
+	guard(spinlock)(&codec->reg_lock);
+	if (!pvoice->running)
 		return 0;
-	}
 	outb(pvoice->number, ALI_REG(codec, ALI_GC_CIR));
 	cso = inw(ALI_REG(codec, ALI_CSO_ALPHA_FMS + 2));
-	spin_unlock(&codec->reg_lock);
 
 	cso %= runtime->buffer_size;
 	return cso;
@@ -1693,7 +1682,7 @@ static int snd_ali5451_spdif_get(struct snd_kcontrol *kcontrol,
 
 	spdif_enable = ucontrol->value.integer.value[0] ? 1 : 0;
 
-	spin_lock_irq(&codec->reg_lock);
+	guard(spinlock_irq)(&codec->reg_lock);
 	switch (kcontrol->private_value) {
 	case 0:
 		spdif_enable = (codec->spdif_mask & 0x02) ? 1 : 0;
@@ -1709,7 +1698,6 @@ static int snd_ali5451_spdif_get(struct snd_kcontrol *kcontrol,
 		break;
 	}
 	ucontrol->value.integer.value[0] = spdif_enable;
-	spin_unlock_irq(&codec->reg_lock);
 	return 0;
 }
 
@@ -1721,7 +1709,7 @@ static int snd_ali5451_spdif_put(struct snd_kcontrol *kcontrol,
 
 	spdif_enable = ucontrol->value.integer.value[0] ? 1 : 0;
 
-	spin_lock_irq(&codec->reg_lock);
+	guard(spinlock_irq)(&codec->reg_lock);
 	switch (kcontrol->private_value) {
 	case 0:
 		change = (codec->spdif_mask & 0x02) ? 1 : 0;
@@ -1766,7 +1754,6 @@ static int snd_ali5451_spdif_put(struct snd_kcontrol *kcontrol,
 	default:
 		break;
 	}
-	spin_unlock_irq(&codec->reg_lock);
 	
 	return change;
 }
@@ -1833,7 +1820,7 @@ static int ali_suspend(struct device *dev)
 	for (i = 0; i < chip->num_of_codecs; i++)
 		snd_ac97_suspend(chip->ac97[i]);
 
-	spin_lock_irq(&chip->reg_lock);
+	guard(spinlock_irq)(&chip->reg_lock);
 	
 	im->regs[ALI_MISCINT >> 2] = inl(ALI_REG(chip, ALI_MISCINT));
 	/* im->regs[ALI_START >> 2] = inl(ALI_REG(chip, ALI_START)); */
@@ -1857,7 +1844,6 @@ static int ali_suspend(struct device *dev)
 	/* stop all HW channel */
 	outl(0xffffffff, ALI_REG(chip, ALI_STOP));
 
-	spin_unlock_irq(&chip->reg_lock);
 	return 0;
 }
 
@@ -1868,27 +1854,25 @@ static int ali_resume(struct device *dev)
 	struct snd_ali_image *im = &chip->image;
 	int i, j;
 
-	spin_lock_irq(&chip->reg_lock);
+	scoped_guard(spinlock_irq, &chip->reg_lock) {
+		for (i = 0; i < ALI_CHANNELS; i++) {
+			outb(i, ALI_REG(chip, ALI_GC_CIR));
+			for (j = 0; j < ALI_CHANNEL_REGS; j++)
+				outl(im->channel_regs[i][j], ALI_REG(chip, j*4 + 0xe0));
+		}
 	
-	for (i = 0; i < ALI_CHANNELS; i++) {
-		outb(i, ALI_REG(chip, ALI_GC_CIR));
-		for (j = 0; j < ALI_CHANNEL_REGS; j++) 
-			outl(im->channel_regs[i][j], ALI_REG(chip, j*4 + 0xe0));
+		for (i = 0; i < ALI_GLOBAL_REGS; i++) {
+			if ((i*4 == ALI_MISCINT) || (i*4 == ALI_STOP) ||
+			    (i*4 == ALI_START))
+				continue;
+			outl(im->regs[i], ALI_REG(chip, i*4));
+		}
+
+		/* start HW channel */
+		outl(im->regs[ALI_START >> 2], ALI_REG(chip, ALI_START));
+		/* restore IRQ enable bits */
+		outl(im->regs[ALI_MISCINT >> 2], ALI_REG(chip, ALI_MISCINT));
 	}
-	
-	for (i = 0; i < ALI_GLOBAL_REGS; i++) {	
-		if ((i*4 == ALI_MISCINT) || (i*4 == ALI_STOP) ||
-		    (i*4 == ALI_START))
-			continue;
-		outl(im->regs[i], ALI_REG(chip, i*4));
-	}
-	
-	/* start HW channel */
-	outl(im->regs[ALI_START >> 2], ALI_REG(chip, ALI_START));
-	/* restore IRQ enable bits */
-	outl(im->regs[ALI_MISCINT >> 2], ALI_REG(chip, ALI_MISCINT));
-	
-	spin_unlock_irq(&chip->reg_lock);
 
 	for (i = 0 ; i < chip->num_of_codecs; i++)
 		snd_ac97_resume(chip->ac97[i]);
-- 
2.50.1

