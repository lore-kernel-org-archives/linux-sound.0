Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD02322774
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478654; cv=none; b=GcJkCXMPxuTOpeUQTa930oAe7WDyvYJ2qRF4EQCEINzdlJZwhB+SId4Y6kjOfJ9IY39nu4Hqcg13icxsYb8mzvg7I73AA1vDhUFU5radeMs+OijM70ZWMvIpktxqehmvBkguM6qwaulFv7Y3/rfWi+IeKG2y4O7w0MNNpag8wN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478654; c=relaxed/simple;
	bh=M+Lq+uwfib4668+I/ExVYHer5VHS86C9Le4F6OBjABA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OYH2DTSj94RW3HqkUxHW9zStCxHGS57bPw9yBAUmCo4sed7/SyvThRHx1ztEjSxZC58Q/qq65ydlYwt2vSwkJtuugwb6R1SgRNHcFvF3aKI2qVXt7rF9lnx+m8O0Ox2W4XccS40Sim+yZdlutrf2RAy65ABb+Ssa37LBp110X+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xCjTftS3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/pZimhQv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xCjTftS3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/pZimhQv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xCjTftS3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/pZimhQv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xCjTftS3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/pZimhQv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BBB115C164;
	Fri, 29 Aug 2025 14:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wq2FdpByqStGM0A23Qlao+GBS6ww92yl0mXYoiIn6nE=;
	b=xCjTftS3Wq0mJYuHmsH95N0Qd/1R8bMNF0T3YSM+pp4f8Y61InNMXNdHPEGfwUCZv1EFQj
	6S8/X/i0oC8ZFeoLob51TVwDx8AQaqcdh7uJQi33qWM73dxUCKDBKTyvz/Hj1Ax2oFKNKG
	3uPuGskMH4WSq3ELs3t9fUIyDhN4+zM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wq2FdpByqStGM0A23Qlao+GBS6ww92yl0mXYoiIn6nE=;
	b=/pZimhQv9MSEUABQxFw2GiLB7Tvk00ElYYOOhlF3btWcvuEyoQPYzzVB/k7fGp2tkov5sc
	N32K5yxklCznYrDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xCjTftS3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/pZimhQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wq2FdpByqStGM0A23Qlao+GBS6ww92yl0mXYoiIn6nE=;
	b=xCjTftS3Wq0mJYuHmsH95N0Qd/1R8bMNF0T3YSM+pp4f8Y61InNMXNdHPEGfwUCZv1EFQj
	6S8/X/i0oC8ZFeoLob51TVwDx8AQaqcdh7uJQi33qWM73dxUCKDBKTyvz/Hj1Ax2oFKNKG
	3uPuGskMH4WSq3ELs3t9fUIyDhN4+zM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wq2FdpByqStGM0A23Qlao+GBS6ww92yl0mXYoiIn6nE=;
	b=/pZimhQv9MSEUABQxFw2GiLB7Tvk00ElYYOOhlF3btWcvuEyoQPYzzVB/k7fGp2tkov5sc
	N32K5yxklCznYrDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 88E1713A3E;
	Fri, 29 Aug 2025 14:43:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EGhEIKi8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:43:52 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 06/61] ALSA: ens137x: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:42:41 +0200
Message-ID: <20250829144342.4290-7-tiwai@suse.de>
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
X-Rspamd-Queue-Id: BBB115C164
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
 sound/pci/ens1370.c | 303 ++++++++++++++++++++------------------------
 1 file changed, 138 insertions(+), 165 deletions(-)

diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 23a756ece3c5..657056a59175 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -799,13 +799,13 @@ static int snd_ensoniq_trigger(struct snd_pcm_substream *substream, int cmd)
 			} else if (s == ensoniq->capture_substream)
 				return -EINVAL;
 		}
-		spin_lock(&ensoniq->reg_lock);
-		if (cmd == SNDRV_PCM_TRIGGER_PAUSE_PUSH)
-			ensoniq->sctrl |= what;
-		else
-			ensoniq->sctrl &= ~what;
-		outl(ensoniq->sctrl, ES_REG(ensoniq, SERIAL));
-		spin_unlock(&ensoniq->reg_lock);
+		scoped_guard(spinlock, &ensoniq->reg_lock) {
+			if (cmd == SNDRV_PCM_TRIGGER_PAUSE_PUSH)
+				ensoniq->sctrl |= what;
+			else
+				ensoniq->sctrl &= ~what;
+			outl(ensoniq->sctrl, ES_REG(ensoniq, SERIAL));
+		}
 		break;
 	}
 	case SNDRV_PCM_TRIGGER_START:
@@ -825,13 +825,13 @@ static int snd_ensoniq_trigger(struct snd_pcm_substream *substream, int cmd)
 				snd_pcm_trigger_done(s, substream);
 			}
 		}
-		spin_lock(&ensoniq->reg_lock);
-		if (cmd == SNDRV_PCM_TRIGGER_START)
-			ensoniq->ctrl |= what;
-		else
-			ensoniq->ctrl &= ~what;
-		outl(ensoniq->ctrl, ES_REG(ensoniq, CONTROL));
-		spin_unlock(&ensoniq->reg_lock);
+		scoped_guard(spinlock, &ensoniq->reg_lock) {
+			if (cmd == SNDRV_PCM_TRIGGER_START)
+				ensoniq->ctrl |= what;
+			else
+				ensoniq->ctrl &= ~what;
+			outl(ensoniq->ctrl, ES_REG(ensoniq, CONTROL));
+		}
 		break;
 	}
 	default:
@@ -856,36 +856,36 @@ static int snd_ensoniq_playback1_prepare(struct snd_pcm_substream *substream)
 		mode |= 0x02;
 	if (runtime->channels > 1)
 		mode |= 0x01;
-	spin_lock_irq(&ensoniq->reg_lock);
-	ensoniq->ctrl &= ~ES_DAC1_EN;
+	scoped_guard(spinlock_irq, &ensoniq->reg_lock) {
+		ensoniq->ctrl &= ~ES_DAC1_EN;
 #ifdef CHIP1371
-	/* 48k doesn't need SRC (it breaks AC3-passthru) */
-	if (runtime->rate == 48000)
-		ensoniq->ctrl |= ES_1373_BYPASS_P1;
-	else
-		ensoniq->ctrl &= ~ES_1373_BYPASS_P1;
+		/* 48k doesn't need SRC (it breaks AC3-passthru) */
+		if (runtime->rate == 48000)
+			ensoniq->ctrl |= ES_1373_BYPASS_P1;
+		else
+			ensoniq->ctrl &= ~ES_1373_BYPASS_P1;
 #endif
-	outl(ensoniq->ctrl, ES_REG(ensoniq, CONTROL));
-	outl(ES_MEM_PAGEO(ES_PAGE_DAC), ES_REG(ensoniq, MEM_PAGE));
-	outl(runtime->dma_addr, ES_REG(ensoniq, DAC1_FRAME));
-	outl((ensoniq->p1_dma_size >> 2) - 1, ES_REG(ensoniq, DAC1_SIZE));
-	ensoniq->sctrl &= ~(ES_P1_LOOP_SEL | ES_P1_PAUSE | ES_P1_SCT_RLD | ES_P1_MODEM);
-	ensoniq->sctrl |= ES_P1_INT_EN | ES_P1_MODEO(mode);
-	outl(ensoniq->sctrl, ES_REG(ensoniq, SERIAL));
-	outl((ensoniq->p1_period_size >> snd_ensoniq_sample_shift[mode]) - 1,
-	     ES_REG(ensoniq, DAC1_COUNT));
+		outl(ensoniq->ctrl, ES_REG(ensoniq, CONTROL));
+		outl(ES_MEM_PAGEO(ES_PAGE_DAC), ES_REG(ensoniq, MEM_PAGE));
+		outl(runtime->dma_addr, ES_REG(ensoniq, DAC1_FRAME));
+		outl((ensoniq->p1_dma_size >> 2) - 1, ES_REG(ensoniq, DAC1_SIZE));
+		ensoniq->sctrl &= ~(ES_P1_LOOP_SEL | ES_P1_PAUSE | ES_P1_SCT_RLD | ES_P1_MODEM);
+		ensoniq->sctrl |= ES_P1_INT_EN | ES_P1_MODEO(mode);
+		outl(ensoniq->sctrl, ES_REG(ensoniq, SERIAL));
+		outl((ensoniq->p1_period_size >> snd_ensoniq_sample_shift[mode]) - 1,
+		     ES_REG(ensoniq, DAC1_COUNT));
 #ifdef CHIP1370
-	ensoniq->ctrl &= ~ES_1370_WTSRSELM;
-	switch (runtime->rate) {
-	case 5512: ensoniq->ctrl |= ES_1370_WTSRSEL(0); break;
-	case 11025: ensoniq->ctrl |= ES_1370_WTSRSEL(1); break;
-	case 22050: ensoniq->ctrl |= ES_1370_WTSRSEL(2); break;
-	case 44100: ensoniq->ctrl |= ES_1370_WTSRSEL(3); break;
-	default: snd_BUG();
-	}
+		ensoniq->ctrl &= ~ES_1370_WTSRSELM;
+		switch (runtime->rate) {
+		case 5512: ensoniq->ctrl |= ES_1370_WTSRSEL(0); break;
+		case 11025: ensoniq->ctrl |= ES_1370_WTSRSEL(1); break;
+		case 22050: ensoniq->ctrl |= ES_1370_WTSRSEL(2); break;
+		case 44100: ensoniq->ctrl |= ES_1370_WTSRSEL(3); break;
+		default: snd_BUG();
+		}
 #endif
-	outl(ensoniq->ctrl, ES_REG(ensoniq, CONTROL));
-	spin_unlock_irq(&ensoniq->reg_lock);
+		outl(ensoniq->ctrl, ES_REG(ensoniq, CONTROL));
+	}
 #ifndef CHIP1370
 	snd_es1371_dac1_rate(ensoniq, runtime->rate);
 #endif
@@ -904,28 +904,28 @@ static int snd_ensoniq_playback2_prepare(struct snd_pcm_substream *substream)
 		mode |= 0x02;
 	if (runtime->channels > 1)
 		mode |= 0x01;
-	spin_lock_irq(&ensoniq->reg_lock);
-	ensoniq->ctrl &= ~ES_DAC2_EN;
-	outl(ensoniq->ctrl, ES_REG(ensoniq, CONTROL));
-	outl(ES_MEM_PAGEO(ES_PAGE_DAC), ES_REG(ensoniq, MEM_PAGE));
-	outl(runtime->dma_addr, ES_REG(ensoniq, DAC2_FRAME));
-	outl((ensoniq->p2_dma_size >> 2) - 1, ES_REG(ensoniq, DAC2_SIZE));
-	ensoniq->sctrl &= ~(ES_P2_LOOP_SEL | ES_P2_PAUSE | ES_P2_DAC_SEN |
-			    ES_P2_END_INCM | ES_P2_ST_INCM | ES_P2_MODEM);
-	ensoniq->sctrl |= ES_P2_INT_EN | ES_P2_MODEO(mode) |
-			  ES_P2_END_INCO(mode & 2 ? 2 : 1) | ES_P2_ST_INCO(0);
-	outl(ensoniq->sctrl, ES_REG(ensoniq, SERIAL));
-	outl((ensoniq->p2_period_size >> snd_ensoniq_sample_shift[mode]) - 1,
-	     ES_REG(ensoniq, DAC2_COUNT));
+	scoped_guard(spinlock_irq, &ensoniq->reg_lock) {
+		ensoniq->ctrl &= ~ES_DAC2_EN;
+		outl(ensoniq->ctrl, ES_REG(ensoniq, CONTROL));
+		outl(ES_MEM_PAGEO(ES_PAGE_DAC), ES_REG(ensoniq, MEM_PAGE));
+		outl(runtime->dma_addr, ES_REG(ensoniq, DAC2_FRAME));
+		outl((ensoniq->p2_dma_size >> 2) - 1, ES_REG(ensoniq, DAC2_SIZE));
+		ensoniq->sctrl &= ~(ES_P2_LOOP_SEL | ES_P2_PAUSE | ES_P2_DAC_SEN |
+				    ES_P2_END_INCM | ES_P2_ST_INCM | ES_P2_MODEM);
+		ensoniq->sctrl |= ES_P2_INT_EN | ES_P2_MODEO(mode) |
+			ES_P2_END_INCO(mode & 2 ? 2 : 1) | ES_P2_ST_INCO(0);
+		outl(ensoniq->sctrl, ES_REG(ensoniq, SERIAL));
+		outl((ensoniq->p2_period_size >> snd_ensoniq_sample_shift[mode]) - 1,
+		     ES_REG(ensoniq, DAC2_COUNT));
 #ifdef CHIP1370
-	if (!(ensoniq->u.es1370.pclkdiv_lock & ES_MODE_CAPTURE)) {
-		ensoniq->ctrl &= ~ES_1370_PCLKDIVM;
-		ensoniq->ctrl |= ES_1370_PCLKDIVO(ES_1370_SRTODIV(runtime->rate));
-		ensoniq->u.es1370.pclkdiv_lock |= ES_MODE_PLAY2;
-	}
+		if (!(ensoniq->u.es1370.pclkdiv_lock & ES_MODE_CAPTURE)) {
+			ensoniq->ctrl &= ~ES_1370_PCLKDIVM;
+			ensoniq->ctrl |= ES_1370_PCLKDIVO(ES_1370_SRTODIV(runtime->rate));
+			ensoniq->u.es1370.pclkdiv_lock |= ES_MODE_PLAY2;
+		}
 #endif
-	outl(ensoniq->ctrl, ES_REG(ensoniq, CONTROL));
-	spin_unlock_irq(&ensoniq->reg_lock);
+		outl(ensoniq->ctrl, ES_REG(ensoniq, CONTROL));
+	}
 #ifndef CHIP1370
 	snd_es1371_dac2_rate(ensoniq, runtime->rate);
 #endif
@@ -944,26 +944,26 @@ static int snd_ensoniq_capture_prepare(struct snd_pcm_substream *substream)
 		mode |= 0x02;
 	if (runtime->channels > 1)
 		mode |= 0x01;
-	spin_lock_irq(&ensoniq->reg_lock);
-	ensoniq->ctrl &= ~ES_ADC_EN;
-	outl(ensoniq->ctrl, ES_REG(ensoniq, CONTROL));
-	outl(ES_MEM_PAGEO(ES_PAGE_ADC), ES_REG(ensoniq, MEM_PAGE));
-	outl(runtime->dma_addr, ES_REG(ensoniq, ADC_FRAME));
-	outl((ensoniq->c_dma_size >> 2) - 1, ES_REG(ensoniq, ADC_SIZE));
-	ensoniq->sctrl &= ~(ES_R1_LOOP_SEL | ES_R1_MODEM);
-	ensoniq->sctrl |= ES_R1_INT_EN | ES_R1_MODEO(mode);
-	outl(ensoniq->sctrl, ES_REG(ensoniq, SERIAL));
-	outl((ensoniq->c_period_size >> snd_ensoniq_sample_shift[mode]) - 1,
-	     ES_REG(ensoniq, ADC_COUNT));
+	scoped_guard(spinlock_irq, &ensoniq->reg_lock) {
+		ensoniq->ctrl &= ~ES_ADC_EN;
+		outl(ensoniq->ctrl, ES_REG(ensoniq, CONTROL));
+		outl(ES_MEM_PAGEO(ES_PAGE_ADC), ES_REG(ensoniq, MEM_PAGE));
+		outl(runtime->dma_addr, ES_REG(ensoniq, ADC_FRAME));
+		outl((ensoniq->c_dma_size >> 2) - 1, ES_REG(ensoniq, ADC_SIZE));
+		ensoniq->sctrl &= ~(ES_R1_LOOP_SEL | ES_R1_MODEM);
+		ensoniq->sctrl |= ES_R1_INT_EN | ES_R1_MODEO(mode);
+		outl(ensoniq->sctrl, ES_REG(ensoniq, SERIAL));
+		outl((ensoniq->c_period_size >> snd_ensoniq_sample_shift[mode]) - 1,
+		     ES_REG(ensoniq, ADC_COUNT));
 #ifdef CHIP1370
-	if (!(ensoniq->u.es1370.pclkdiv_lock & ES_MODE_PLAY2)) {
-		ensoniq->ctrl &= ~ES_1370_PCLKDIVM;
-		ensoniq->ctrl |= ES_1370_PCLKDIVO(ES_1370_SRTODIV(runtime->rate));
-		ensoniq->u.es1370.pclkdiv_lock |= ES_MODE_CAPTURE;
-	}
+		if (!(ensoniq->u.es1370.pclkdiv_lock & ES_MODE_PLAY2)) {
+			ensoniq->ctrl &= ~ES_1370_PCLKDIVM;
+			ensoniq->ctrl |= ES_1370_PCLKDIVO(ES_1370_SRTODIV(runtime->rate));
+			ensoniq->u.es1370.pclkdiv_lock |= ES_MODE_CAPTURE;
+		}
 #endif
-	outl(ensoniq->ctrl, ES_REG(ensoniq, CONTROL));
-	spin_unlock_irq(&ensoniq->reg_lock);
+		outl(ensoniq->ctrl, ES_REG(ensoniq, CONTROL));
+	}
 #ifndef CHIP1370
 	snd_es1371_adc_rate(ensoniq, runtime->rate);
 #endif
@@ -975,16 +975,14 @@ static snd_pcm_uframes_t snd_ensoniq_playback1_pointer(struct snd_pcm_substream
 	struct ensoniq *ensoniq = snd_pcm_substream_chip(substream);
 	size_t ptr;
 
-	spin_lock(&ensoniq->reg_lock);
+	guard(spinlock)(&ensoniq->reg_lock);
 	if (inl(ES_REG(ensoniq, CONTROL)) & ES_DAC1_EN) {
 		outl(ES_MEM_PAGEO(ES_PAGE_DAC), ES_REG(ensoniq, MEM_PAGE));
 		ptr = ES_REG_FCURR_COUNTI(inl(ES_REG(ensoniq, DAC1_SIZE)));
-		ptr = bytes_to_frames(substream->runtime, ptr);
+		return bytes_to_frames(substream->runtime, ptr);
 	} else {
-		ptr = 0;
+		return 0;
 	}
-	spin_unlock(&ensoniq->reg_lock);
-	return ptr;
 }
 
 static snd_pcm_uframes_t snd_ensoniq_playback2_pointer(struct snd_pcm_substream *substream)
@@ -992,16 +990,14 @@ static snd_pcm_uframes_t snd_ensoniq_playback2_pointer(struct snd_pcm_substream
 	struct ensoniq *ensoniq = snd_pcm_substream_chip(substream);
 	size_t ptr;
 
-	spin_lock(&ensoniq->reg_lock);
+	guard(spinlock)(&ensoniq->reg_lock);
 	if (inl(ES_REG(ensoniq, CONTROL)) & ES_DAC2_EN) {
 		outl(ES_MEM_PAGEO(ES_PAGE_DAC), ES_REG(ensoniq, MEM_PAGE));
 		ptr = ES_REG_FCURR_COUNTI(inl(ES_REG(ensoniq, DAC2_SIZE)));
-		ptr = bytes_to_frames(substream->runtime, ptr);
+		return bytes_to_frames(substream->runtime, ptr);
 	} else {
-		ptr = 0;
+		return 0;
 	}
-	spin_unlock(&ensoniq->reg_lock);
-	return ptr;
 }
 
 static snd_pcm_uframes_t snd_ensoniq_capture_pointer(struct snd_pcm_substream *substream)
@@ -1009,16 +1005,14 @@ static snd_pcm_uframes_t snd_ensoniq_capture_pointer(struct snd_pcm_substream *s
 	struct ensoniq *ensoniq = snd_pcm_substream_chip(substream);
 	size_t ptr;
 
-	spin_lock(&ensoniq->reg_lock);
+	guard(spinlock)(&ensoniq->reg_lock);
 	if (inl(ES_REG(ensoniq, CONTROL)) & ES_ADC_EN) {
 		outl(ES_MEM_PAGEO(ES_PAGE_ADC), ES_REG(ensoniq, MEM_PAGE));
 		ptr = ES_REG_FCURR_COUNTI(inl(ES_REG(ensoniq, ADC_SIZE)));
-		ptr = bytes_to_frames(substream->runtime, ptr);
+		return bytes_to_frames(substream->runtime, ptr);
 	} else {
-		ptr = 0;
+		return 0;
 	}
-	spin_unlock(&ensoniq->reg_lock);
-	return ptr;
 }
 
 static const struct snd_pcm_hardware snd_ensoniq_playback1 =
@@ -1096,10 +1090,10 @@ static int snd_ensoniq_playback1_open(struct snd_pcm_substream *substream)
 	ensoniq->playback1_substream = substream;
 	runtime->hw = snd_ensoniq_playback1;
 	snd_pcm_set_sync(substream);
-	spin_lock_irq(&ensoniq->reg_lock);
-	if (ensoniq->spdif && ensoniq->playback2_substream == NULL)
-		ensoniq->spdif_stream = ensoniq->spdif_default;
-	spin_unlock_irq(&ensoniq->reg_lock);
+	scoped_guard(spinlock_irq, &ensoniq->reg_lock) {
+		if (ensoniq->spdif && ensoniq->playback2_substream == NULL)
+			ensoniq->spdif_stream = ensoniq->spdif_default;
+	}
 #ifdef CHIP1370
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
 				   &snd_es1370_hw_constraints_rates);
@@ -1119,10 +1113,10 @@ static int snd_ensoniq_playback2_open(struct snd_pcm_substream *substream)
 	ensoniq->playback2_substream = substream;
 	runtime->hw = snd_ensoniq_playback2;
 	snd_pcm_set_sync(substream);
-	spin_lock_irq(&ensoniq->reg_lock);
-	if (ensoniq->spdif && ensoniq->playback1_substream == NULL)
-		ensoniq->spdif_stream = ensoniq->spdif_default;
-	spin_unlock_irq(&ensoniq->reg_lock);
+	scoped_guard(spinlock_irq, &ensoniq->reg_lock) {
+		if (ensoniq->spdif && ensoniq->playback1_substream == NULL)
+			ensoniq->spdif_stream = ensoniq->spdif_default;
+	}
 #ifdef CHIP1370
 	snd_pcm_hw_constraint_ratnums(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
 				      &snd_es1370_hw_constraints_clock);
@@ -1166,12 +1160,11 @@ static int snd_ensoniq_playback2_close(struct snd_pcm_substream *substream)
 	struct ensoniq *ensoniq = snd_pcm_substream_chip(substream);
 
 	ensoniq->playback2_substream = NULL;
-	spin_lock_irq(&ensoniq->reg_lock);
+	guard(spinlock_irq)(&ensoniq->reg_lock);
 #ifdef CHIP1370
 	ensoniq->u.es1370.pclkdiv_lock &= ~ES_MODE_PLAY2;
 #endif
 	ensoniq->mode &= ~ES_MODE_PLAY2;
-	spin_unlock_irq(&ensoniq->reg_lock);
 	return 0;
 }
 
@@ -1180,12 +1173,11 @@ static int snd_ensoniq_capture_close(struct snd_pcm_substream *substream)
 	struct ensoniq *ensoniq = snd_pcm_substream_chip(substream);
 
 	ensoniq->capture_substream = NULL;
-	spin_lock_irq(&ensoniq->reg_lock);
+	guard(spinlock_irq)(&ensoniq->reg_lock);
 #ifdef CHIP1370
 	ensoniq->u.es1370.pclkdiv_lock &= ~ES_MODE_CAPTURE;
 #endif
 	ensoniq->mode &= ~ES_MODE_CAPTURE;
-	spin_unlock_irq(&ensoniq->reg_lock);
 	return 0;
 }
 
@@ -1307,12 +1299,12 @@ static int snd_ens1373_spdif_default_get(struct snd_kcontrol *kcontrol,
                                          struct snd_ctl_elem_value *ucontrol)
 {
 	struct ensoniq *ensoniq = snd_kcontrol_chip(kcontrol);
-	spin_lock_irq(&ensoniq->reg_lock);
+
+	guard(spinlock_irq)(&ensoniq->reg_lock);
 	ucontrol->value.iec958.status[0] = (ensoniq->spdif_default >> 0) & 0xff;
 	ucontrol->value.iec958.status[1] = (ensoniq->spdif_default >> 8) & 0xff;
 	ucontrol->value.iec958.status[2] = (ensoniq->spdif_default >> 16) & 0xff;
 	ucontrol->value.iec958.status[3] = (ensoniq->spdif_default >> 24) & 0xff;
-	spin_unlock_irq(&ensoniq->reg_lock);
 	return 0;
 }
 
@@ -1327,13 +1319,12 @@ static int snd_ens1373_spdif_default_put(struct snd_kcontrol *kcontrol,
 	      ((u32)ucontrol->value.iec958.status[1] << 8) |
 	      ((u32)ucontrol->value.iec958.status[2] << 16) |
 	      ((u32)ucontrol->value.iec958.status[3] << 24);
-	spin_lock_irq(&ensoniq->reg_lock);
+	guard(spinlock_irq)(&ensoniq->reg_lock);
 	change = ensoniq->spdif_default != val;
 	ensoniq->spdif_default = val;
 	if (change && ensoniq->playback1_substream == NULL &&
 	    ensoniq->playback2_substream == NULL)
 		outl(val, ES_REG(ensoniq, CHANNEL_STATUS));
-	spin_unlock_irq(&ensoniq->reg_lock);
 	return change;
 }
 
@@ -1351,12 +1342,12 @@ static int snd_ens1373_spdif_stream_get(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
 	struct ensoniq *ensoniq = snd_kcontrol_chip(kcontrol);
-	spin_lock_irq(&ensoniq->reg_lock);
+
+	guard(spinlock_irq)(&ensoniq->reg_lock);
 	ucontrol->value.iec958.status[0] = (ensoniq->spdif_stream >> 0) & 0xff;
 	ucontrol->value.iec958.status[1] = (ensoniq->spdif_stream >> 8) & 0xff;
 	ucontrol->value.iec958.status[2] = (ensoniq->spdif_stream >> 16) & 0xff;
 	ucontrol->value.iec958.status[3] = (ensoniq->spdif_stream >> 24) & 0xff;
-	spin_unlock_irq(&ensoniq->reg_lock);
 	return 0;
 }
 
@@ -1371,13 +1362,12 @@ static int snd_ens1373_spdif_stream_put(struct snd_kcontrol *kcontrol,
 	      ((u32)ucontrol->value.iec958.status[1] << 8) |
 	      ((u32)ucontrol->value.iec958.status[2] << 16) |
 	      ((u32)ucontrol->value.iec958.status[3] << 24);
-	spin_lock_irq(&ensoniq->reg_lock);
+	guard(spinlock_irq)(&ensoniq->reg_lock);
 	change = ensoniq->spdif_stream != val;
 	ensoniq->spdif_stream = val;
 	if (change && (ensoniq->playback1_substream != NULL ||
 		       ensoniq->playback2_substream != NULL))
 		outl(val, ES_REG(ensoniq, CHANNEL_STATUS));
-	spin_unlock_irq(&ensoniq->reg_lock);
 	return change;
 }
 
@@ -1392,9 +1382,8 @@ static int snd_es1371_spdif_get(struct snd_kcontrol *kcontrol,
 {
 	struct ensoniq *ensoniq = snd_kcontrol_chip(kcontrol);
 	
-	spin_lock_irq(&ensoniq->reg_lock);
+	guard(spinlock_irq)(&ensoniq->reg_lock);
 	ucontrol->value.integer.value[0] = ensoniq->ctrl & ES_1373_SPDIF_THRU ? 1 : 0;
-	spin_unlock_irq(&ensoniq->reg_lock);
 	return 0;
 }
 
@@ -1407,7 +1396,7 @@ static int snd_es1371_spdif_put(struct snd_kcontrol *kcontrol,
 	
 	nval1 = ucontrol->value.integer.value[0] ? ES_1373_SPDIF_THRU : 0;
 	nval2 = ucontrol->value.integer.value[0] ? ES_1373_SPDIF_EN : 0;
-	spin_lock_irq(&ensoniq->reg_lock);
+	guard(spinlock_irq)(&ensoniq->reg_lock);
 	change = (ensoniq->ctrl & ES_1373_SPDIF_THRU) != nval1;
 	ensoniq->ctrl &= ~ES_1373_SPDIF_THRU;
 	ensoniq->ctrl |= nval1;
@@ -1415,7 +1404,6 @@ static int snd_es1371_spdif_put(struct snd_kcontrol *kcontrol,
 	ensoniq->cssr |= nval2;
 	outl(ensoniq->ctrl, ES_REG(ensoniq, CONTROL));
 	outl(ensoniq->cssr, ES_REG(ensoniq, STATUS));
-	spin_unlock_irq(&ensoniq->reg_lock);
 	return change;
 }
 
@@ -1455,12 +1443,11 @@ static int snd_es1373_rear_get(struct snd_kcontrol *kcontrol,
 	struct ensoniq *ensoniq = snd_kcontrol_chip(kcontrol);
 	int val = 0;
 	
-	spin_lock_irq(&ensoniq->reg_lock);
+	guard(spinlock_irq)(&ensoniq->reg_lock);
 	if ((ensoniq->cssr & (ES_1373_REAR_BIT27|ES_1373_REAR_BIT26|
 			      ES_1373_REAR_BIT24)) == ES_1373_REAR_BIT26)
 	    	val = 1;
 	ucontrol->value.integer.value[0] = val;
-	spin_unlock_irq(&ensoniq->reg_lock);
 	return 0;
 }
 
@@ -1473,13 +1460,12 @@ static int snd_es1373_rear_put(struct snd_kcontrol *kcontrol,
 	
 	nval1 = ucontrol->value.integer.value[0] ?
 		ES_1373_REAR_BIT26 : (ES_1373_REAR_BIT27|ES_1373_REAR_BIT24);
-	spin_lock_irq(&ensoniq->reg_lock);
+	guard(spinlock_irq)(&ensoniq->reg_lock);
 	change = (ensoniq->cssr & (ES_1373_REAR_BIT27|
 				   ES_1373_REAR_BIT26|ES_1373_REAR_BIT24)) != nval1;
 	ensoniq->cssr &= ~(ES_1373_REAR_BIT27|ES_1373_REAR_BIT26|ES_1373_REAR_BIT24);
 	ensoniq->cssr |= nval1;
 	outl(ensoniq->cssr, ES_REG(ensoniq, STATUS));
-	spin_unlock_irq(&ensoniq->reg_lock);
 	return change;
 }
 
@@ -1500,11 +1486,10 @@ static int snd_es1373_line_get(struct snd_kcontrol *kcontrol,
 	struct ensoniq *ensoniq = snd_kcontrol_chip(kcontrol);
 	int val = 0;
 	
-	spin_lock_irq(&ensoniq->reg_lock);
+	guard(spinlock_irq)(&ensoniq->reg_lock);
 	if (ensoniq->ctrl & ES_1371_GPIO_OUT(4))
 	    	val = 1;
 	ucontrol->value.integer.value[0] = val;
-	spin_unlock_irq(&ensoniq->reg_lock);
 	return 0;
 }
 
@@ -1515,7 +1500,7 @@ static int snd_es1373_line_put(struct snd_kcontrol *kcontrol,
 	int changed;
 	unsigned int ctrl;
 	
-	spin_lock_irq(&ensoniq->reg_lock);
+	guard(spinlock_irq)(&ensoniq->reg_lock);
 	ctrl = ensoniq->ctrl;
 	if (ucontrol->value.integer.value[0])
 		ensoniq->ctrl |= ES_1371_GPIO_OUT(4);	/* switch line-in -> rear out */
@@ -1524,7 +1509,6 @@ static int snd_es1373_line_put(struct snd_kcontrol *kcontrol,
 	changed = (ctrl != ensoniq->ctrl);
 	if (changed)
 		outl(ensoniq->ctrl, ES_REG(ensoniq, CONTROL));
-	spin_unlock_irq(&ensoniq->reg_lock);
 	return changed;
 }
 
@@ -1660,9 +1644,8 @@ static int snd_ensoniq_control_get(struct snd_kcontrol *kcontrol,
 	struct ensoniq *ensoniq = snd_kcontrol_chip(kcontrol);
 	int mask = kcontrol->private_value;
 	
-	spin_lock_irq(&ensoniq->reg_lock);
+	guard(spinlock_irq)(&ensoniq->reg_lock);
 	ucontrol->value.integer.value[0] = ensoniq->ctrl & mask ? 1 : 0;
-	spin_unlock_irq(&ensoniq->reg_lock);
 	return 0;
 }
 
@@ -1675,12 +1658,11 @@ static int snd_ensoniq_control_put(struct snd_kcontrol *kcontrol,
 	int change;
 	
 	nval = ucontrol->value.integer.value[0] ? mask : 0;
-	spin_lock_irq(&ensoniq->reg_lock);
+	guard(spinlock_irq)(&ensoniq->reg_lock);
 	change = (ensoniq->ctrl & mask) != nval;
 	ensoniq->ctrl &= ~mask;
 	ensoniq->ctrl |= nval;
 	outl(ensoniq->ctrl, ES_REG(ensoniq, CONTROL));
-	spin_unlock_irq(&ensoniq->reg_lock);
 	return change;
 }
 
@@ -2074,19 +2056,19 @@ static void snd_ensoniq_midi_interrupt(struct ensoniq * ensoniq)
 	if (rmidi == NULL)
 		return;
 	/* do Rx at first */
-	spin_lock(&ensoniq->reg_lock);
-	mask = ensoniq->uartm & ES_MODE_INPUT ? ES_RXRDY : 0;
-	while (mask) {
-		status = inb(ES_REG(ensoniq, UART_STATUS));
-		if ((status & mask) == 0)
-			break;
-		byte = inb(ES_REG(ensoniq, UART_DATA));
-		snd_rawmidi_receive(ensoniq->midi_input, &byte, 1);
+	scoped_guard(spinlock, &ensoniq->reg_lock) {
+		mask = ensoniq->uartm & ES_MODE_INPUT ? ES_RXRDY : 0;
+		while (mask) {
+			status = inb(ES_REG(ensoniq, UART_STATUS));
+			if ((status & mask) == 0)
+				break;
+			byte = inb(ES_REG(ensoniq, UART_DATA));
+			snd_rawmidi_receive(ensoniq->midi_input, &byte, 1);
+		}
 	}
-	spin_unlock(&ensoniq->reg_lock);
 
 	/* do Tx at second */
-	spin_lock(&ensoniq->reg_lock);
+	guard(spinlock)(&ensoniq->reg_lock);
 	mask = ensoniq->uartm & ES_MODE_OUTPUT ? ES_TXRDY : 0;
 	while (mask) {
 		status = inb(ES_REG(ensoniq, UART_STATUS));
@@ -2100,14 +2082,13 @@ static void snd_ensoniq_midi_interrupt(struct ensoniq * ensoniq)
 			outb(byte, ES_REG(ensoniq, UART_DATA));
 		}
 	}
-	spin_unlock(&ensoniq->reg_lock);
 }
 
 static int snd_ensoniq_midi_input_open(struct snd_rawmidi_substream *substream)
 {
 	struct ensoniq *ensoniq = substream->rmidi->private_data;
 
-	spin_lock_irq(&ensoniq->reg_lock);
+	guard(spinlock_irq)(&ensoniq->reg_lock);
 	ensoniq->uartm |= ES_MODE_INPUT;
 	ensoniq->midi_input = substream;
 	if (!(ensoniq->uartm & ES_MODE_OUTPUT)) {
@@ -2115,7 +2096,6 @@ static int snd_ensoniq_midi_input_open(struct snd_rawmidi_substream *substream)
 		outb(ensoniq->uartc = 0, ES_REG(ensoniq, UART_CONTROL));
 		outl(ensoniq->ctrl |= ES_UART_EN, ES_REG(ensoniq, CONTROL));
 	}
-	spin_unlock_irq(&ensoniq->reg_lock);
 	return 0;
 }
 
@@ -2123,7 +2103,7 @@ static int snd_ensoniq_midi_input_close(struct snd_rawmidi_substream *substream)
 {
 	struct ensoniq *ensoniq = substream->rmidi->private_data;
 
-	spin_lock_irq(&ensoniq->reg_lock);
+	guard(spinlock_irq)(&ensoniq->reg_lock);
 	if (!(ensoniq->uartm & ES_MODE_OUTPUT)) {
 		outb(ensoniq->uartc = 0, ES_REG(ensoniq, UART_CONTROL));
 		outl(ensoniq->ctrl &= ~ES_UART_EN, ES_REG(ensoniq, CONTROL));
@@ -2132,7 +2112,6 @@ static int snd_ensoniq_midi_input_close(struct snd_rawmidi_substream *substream)
 	}
 	ensoniq->midi_input = NULL;
 	ensoniq->uartm &= ~ES_MODE_INPUT;
-	spin_unlock_irq(&ensoniq->reg_lock);
 	return 0;
 }
 
@@ -2140,7 +2119,7 @@ static int snd_ensoniq_midi_output_open(struct snd_rawmidi_substream *substream)
 {
 	struct ensoniq *ensoniq = substream->rmidi->private_data;
 
-	spin_lock_irq(&ensoniq->reg_lock);
+	guard(spinlock_irq)(&ensoniq->reg_lock);
 	ensoniq->uartm |= ES_MODE_OUTPUT;
 	ensoniq->midi_output = substream;
 	if (!(ensoniq->uartm & ES_MODE_INPUT)) {
@@ -2148,7 +2127,6 @@ static int snd_ensoniq_midi_output_open(struct snd_rawmidi_substream *substream)
 		outb(ensoniq->uartc = 0, ES_REG(ensoniq, UART_CONTROL));
 		outl(ensoniq->ctrl |= ES_UART_EN, ES_REG(ensoniq, CONTROL));
 	}
-	spin_unlock_irq(&ensoniq->reg_lock);
 	return 0;
 }
 
@@ -2156,7 +2134,7 @@ static int snd_ensoniq_midi_output_close(struct snd_rawmidi_substream *substream
 {
 	struct ensoniq *ensoniq = substream->rmidi->private_data;
 
-	spin_lock_irq(&ensoniq->reg_lock);
+	guard(spinlock_irq)(&ensoniq->reg_lock);
 	if (!(ensoniq->uartm & ES_MODE_INPUT)) {
 		outb(ensoniq->uartc = 0, ES_REG(ensoniq, UART_CONTROL));
 		outl(ensoniq->ctrl &= ~ES_UART_EN, ES_REG(ensoniq, CONTROL));
@@ -2165,17 +2143,15 @@ static int snd_ensoniq_midi_output_close(struct snd_rawmidi_substream *substream
 	}
 	ensoniq->midi_output = NULL;
 	ensoniq->uartm &= ~ES_MODE_OUTPUT;
-	spin_unlock_irq(&ensoniq->reg_lock);
 	return 0;
 }
 
 static void snd_ensoniq_midi_input_trigger(struct snd_rawmidi_substream *substream, int up)
 {
-	unsigned long flags;
 	struct ensoniq *ensoniq = substream->rmidi->private_data;
 	int idx;
 
-	spin_lock_irqsave(&ensoniq->reg_lock, flags);
+	guard(spinlock_irqsave)(&ensoniq->reg_lock);
 	if (up) {
 		if ((ensoniq->uartc & ES_RXINTEN) == 0) {
 			/* empty input FIFO */
@@ -2190,16 +2166,14 @@ static void snd_ensoniq_midi_input_trigger(struct snd_rawmidi_substream *substre
 			outb(ensoniq->uartc, ES_REG(ensoniq, UART_CONTROL));
 		}
 	}
-	spin_unlock_irqrestore(&ensoniq->reg_lock, flags);
 }
 
 static void snd_ensoniq_midi_output_trigger(struct snd_rawmidi_substream *substream, int up)
 {
-	unsigned long flags;
 	struct ensoniq *ensoniq = substream->rmidi->private_data;
 	unsigned char byte;
 
-	spin_lock_irqsave(&ensoniq->reg_lock, flags);
+	guard(spinlock_irqsave)(&ensoniq->reg_lock);
 	if (up) {
 		if (ES_TXINTENI(ensoniq->uartc) == 0) {
 			ensoniq->uartc |= ES_TXINTENO(1);
@@ -2220,7 +2194,6 @@ static void snd_ensoniq_midi_output_trigger(struct snd_rawmidi_substream *substr
 			outb(ensoniq->uartc, ES_REG(ensoniq, UART_CONTROL));
 		}
 	}
-	spin_unlock_irqrestore(&ensoniq->reg_lock, flags);
 }
 
 static const struct snd_rawmidi_ops snd_ensoniq_midi_output =
@@ -2271,17 +2244,17 @@ static irqreturn_t snd_audiopci_interrupt(int irq, void *dev_id)
 	if (!(status & ES_INTR))
 		return IRQ_NONE;
 
-	spin_lock(&ensoniq->reg_lock);
-	sctrl = ensoniq->sctrl;
-	if (status & ES_DAC1)
-		sctrl &= ~ES_P1_INT_EN;
-	if (status & ES_DAC2)
-		sctrl &= ~ES_P2_INT_EN;
-	if (status & ES_ADC)
-		sctrl &= ~ES_R1_INT_EN;
-	outl(sctrl, ES_REG(ensoniq, SERIAL));
-	outl(ensoniq->sctrl, ES_REG(ensoniq, SERIAL));
-	spin_unlock(&ensoniq->reg_lock);
+	scoped_guard(spinlock, &ensoniq->reg_lock) {
+		sctrl = ensoniq->sctrl;
+		if (status & ES_DAC1)
+			sctrl &= ~ES_P1_INT_EN;
+		if (status & ES_DAC2)
+			sctrl &= ~ES_P2_INT_EN;
+		if (status & ES_ADC)
+			sctrl &= ~ES_R1_INT_EN;
+		outl(sctrl, ES_REG(ensoniq, SERIAL));
+		outl(ensoniq->sctrl, ES_REG(ensoniq, SERIAL));
+	}
 
 	if (status & ES_UART)
 		snd_ensoniq_midi_interrupt(ensoniq);
-- 
2.50.1

