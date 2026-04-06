Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB392DECC2
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 03:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775445619; cv=none; b=OKgOpW1gEGhzWRXAsTtVKGkJY0LMhBxkGdW5L4KY+Ju6TmV51g8Ydjyu6maw4Lfxhpm2PI2CEgKjLPFEytheZrc3lRfWbvqo7PhTg0o2bkUtPZFn6umSJGCy5QzD1VK209LCL3bVKHO6iQrQnZSenG5u61PuQnTCRyl8DpGcu1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775445619; c=relaxed/simple;
	bh=ZJsXuAOnzKe7VNcjOOvgpbIj4nvUPV0wpNzyd65c2Xo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KAKx41HctdFvzn/LhCXdeHtzFsuT1Y+Z0XqWto9VCXbVGySJ8Szcp2RPLLrit0IBF2obI5DLvQp5Ndpo1D/TmBQ0p2xCbBNwvUSRsKIkUUUz6Q85JmyLv4Kbs20EYLt47IhJUt7zE4HzXyEHAbThNS3lFD2L4OfQOljlggv9WWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEXRkMuu; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEXRkMuu"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-953943f7a33so1591220241.0
        for <linux-sound@vger.kernel.org>; Sun, 05 Apr 2026 20:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775445616; x=1776050416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQXVPyJKbYWfAKG1sfpIlUyWhhnLyrzOHWVzvosbwME=;
        b=sEXRkMuuE1HoqEj2QIbKWiLsLfGcBWli8/CnYQQITVH71kiWfxjnVLSUTFqM8G0nkL
         U+xEG8fBSccEJl4oSKNOUL+FS1kthfgY+wtvomAByCq0rNqUMJO0/8qX5KoEgH/3fljC
         jNYG8HE1JL71ZfPa27lKhqYClsV0xywUhyrZZJIYeAU14xp+7bUhQ57wb7WLzt6omesR
         agjFe9aMmpNwiC6bB0FfafVv4yvLt1UQuW15dlJ6hA96SeZdvH9og7jw1RZ0vabV62rI
         R1fLh5+zIzbW5c2SwtwE6h7GD1I5cgRqzSAImgs6B4rJN8XS0bEwTffiY7AMTB07C51d
         +AAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775445616; x=1776050416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HQXVPyJKbYWfAKG1sfpIlUyWhhnLyrzOHWVzvosbwME=;
        b=MFN88TtiumzWS+BoK1lxe9V4mQwBOcIaV6ERz2KweidvObJxM6s9wWLVefaMCQQmCS
         PIGkL/+mdRVO0Zb+1pczFganFtFVPeT3zUIoI+ncGw60w7/Pv354nscYthlKYoVwCjEv
         r3N7aIcXHGjK3k68F+RVEXL45tEIoJeCQ6J4jgbl9hrJ3uyF83azQ+5A2XNYTwcNMpjp
         Vb+jLE02yBgBlwZB0nk3/4n9qoM36v+QD6x5XYBVPSppkiqmrRJeAAEUyQNIRk1oWe7p
         oL2ssOmhOWiMZfdOJQ1KcV2oMsQKBFArOcVZvEGii98Z2zCJQMO0MKWzoM43soo93fa1
         PBFA==
X-Gm-Message-State: AOJu0Yz8jnbEvLzastpzXAWDoQ2jY5KTvFTmm8m1Dy37r15WYstoCyZH
	Xg0fikH5s1h+mTO2cKN1UgN3pBwYHh//jVDn+y9gdknmwfVbWdGy98K6TRnPOA==
X-Gm-Gg: AeBDiesJPgNLajNHiS9uRyTvpfFgGpznaHXGhtLSWF+unv2xK2UiFrLNN5VypAdr8j3
	1GuKaW59dVcrC9yP7NVy8VOlSDts/fyFjRN0S2m6YbLnz9R3hLz8cHCBh3n3BlfQW2fH9ueK4ZV
	MzlNr7e2qnTQkX+714FPTA6qydDSn5vfSXLqOh1CLgKmynFaDkT+A1CzCvtIkkgvZ/kU+RJIWlO
	8O6lADvgRHndvL5QoaepviF7zxBboTeF8YSvsOSdOc7+vDM4BVpu1zzP9nZzfPBZodxZlhu5qWR
	eKJL2VOzuPtDXD2DzF2A0BD6Gjxxkq2BNUKGEv3jnm+kPCzW7Lyj5gUgQRJ2/UEx2kerNv5nBN2
	rcIsheJJNAvCvBxdqcZZnd8w5a/iiixEy1pzF6Bd/uDMwAjSnlgUd3Kr9ZImzMp3tpoKTjTWfBW
	usBoso0WEdCm5TA5uoefrh5qqRPfknMo5lc5VI1XBTgdes8x3obsgAzyYr32oKpE48BjXfH9BuY
	h5YnwIMjTjy5a0=
X-Received: by 2002:a05:6102:83cb:b0:5ff:bd9d:b1f2 with SMTP id ada2fe7eead31-605a4d819d8mr3529193137.3.1775445615885;
        Sun, 05 Apr 2026 20:20:15 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-605b214b45fsm9162146137.5.2026.04.05.20.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 20:20:15 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 06 Apr 2026 00:20:03 -0300
Subject: [PATCH 1/4] ALSA: gus: add shared GF1 suspend and resume helpers
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-b4-alsa-gus-isa-pm-v1-1-b6829a7457cd@gmail.com>
References: <20260406-b4-alsa-gus-isa-pm-v1-0-b6829a7457cd@gmail.com>
In-Reply-To: <20260406-b4-alsa-gus-isa-pm-v1-0-b6829a7457cd@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=12535;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=ZJsXuAOnzKe7VNcjOOvgpbIj4nvUPV0wpNzyd65c2Xo=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmX1bLflm1ckLBOzeFZpetjheOpv9rWXPnxNFf0nAjb3
 QMbgg3md5SyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBEdngxMmx77isQevD+Zck7
 a1YLLDjulfUm6pPQpEPRE9d7lP601pnCyLBZ3dc1+OWmKVNPy7bu32v+2OB5WEhvV01i/WGVT1m
 T7vACAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

gusclassic and gusextreme still leave their ISA PM callbacks disabled
because the shared GF1 core only provides probe-time startup and full
shutdown paths.

Those helpers are not suitable for suspend and resume. They reset software
handlers and tear down runtime state such as the DRAM allocator, timer
state, DMA queues, PCM state and UART setup. Resume instead needs a
narrower recovery path that rebuilds the GF1 hardware state without
rerunning probe-only detection or discarding the bookkeeping kept by the
card instance.

Add shared GF1 suspend and resume helpers for that recovery path. Suspend
now quiesces GF1 PCM, aborts queued GF1 DMA work, resets the UART and
powers the chip down without tearing down allocator, timer or rawmidi
bookkeeping. Resume rebuilds the GF1 hardware state, restores timer and
UART handlers, and brings the chip back to a usable post-resume state for
the ISA front-ends.

The scope is limited to restoring post-resume usability. It does not
attempt transparent continuation of active GF1 PCM or synth state across
suspend, and userspace may still need to reprepare streams or reload
onboard sample data after resume. Open rawmidi substreams are restored
only to a usable post-resume state.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 include/sound/gus.h       |  8 ++++++
 sound/isa/gus/gus_dma.c   | 33 +++++++++++++++++++++++++
 sound/isa/gus/gus_main.c  | 36 +++++++++++++++++++++++++++
 sound/isa/gus/gus_pcm.c   |  7 +++---
 sound/isa/gus/gus_reset.c | 62 +++++++++++++++++++++++++++++++++++++++--------
 sound/isa/gus/gus_timer.c | 14 +++++++++++
 sound/isa/gus/gus_uart.c  | 47 +++++++++++++++++++++++++++++++++++
 7 files changed, 194 insertions(+), 13 deletions(-)

diff --git a/include/sound/gus.h b/include/sound/gus.h
index 321ae93625eb..3feb42627de1 100644
--- a/include/sound/gus.h
+++ b/include/sound/gus.h
@@ -536,6 +536,7 @@ int snd_gf1_dma_transfer_block(struct snd_gus_card * gus,
 			       struct snd_gf1_dma_block * block,
 			       int atomic,
 			       int synth);
+void snd_gf1_dma_suspend(struct snd_gus_card *gus);
 
 /* gus_volume.c */
 
@@ -552,6 +553,8 @@ struct snd_gus_voice *snd_gf1_alloc_voice(struct snd_gus_card * gus, int type, i
 void snd_gf1_free_voice(struct snd_gus_card * gus, struct snd_gus_voice *voice);
 int snd_gf1_start(struct snd_gus_card * gus);
 int snd_gf1_stop(struct snd_gus_card * gus);
+int snd_gf1_suspend(struct snd_gus_card *gus);
+int snd_gf1_resume(struct snd_gus_card *gus);
 
 /* gus_mixer.c */
 
@@ -572,6 +575,8 @@ int snd_gus_create(struct snd_card *card,
 		   int effect,
 		   struct snd_gus_card ** rgus);
 int snd_gus_initialize(struct snd_gus_card * gus);
+int snd_gus_suspend(struct snd_gus_card *gus);
+int snd_gus_resume(struct snd_gus_card *gus);
 
 /* gus_irq.c */
 
@@ -583,6 +588,8 @@ void snd_gus_irq_profile_init(struct snd_gus_card *gus);
 /* gus_uart.c */
 
 int snd_gf1_rawmidi_new(struct snd_gus_card *gus, int device);
+void snd_gf1_uart_suspend(struct snd_gus_card *gus);
+void snd_gf1_uart_resume(struct snd_gus_card *gus);
 
 /* gus_dram.c */
 int snd_gus_dram_write(struct snd_gus_card *gus, char __user *ptr,
@@ -593,5 +600,6 @@ int snd_gus_dram_read(struct snd_gus_card *gus, char __user *ptr,
 /* gus_timer.c */
 void snd_gf1_timers_init(struct snd_gus_card *gus);
 void snd_gf1_timers_done(struct snd_gus_card *gus);
+void snd_gf1_timers_resume(struct snd_gus_card *gus);
 
 #endif /* __SOUND_GUS_H */
diff --git a/sound/isa/gus/gus_dma.c b/sound/isa/gus/gus_dma.c
index ffc69e26227e..30bd76eee96e 100644
--- a/sound/isa/gus/gus_dma.c
+++ b/sound/isa/gus/gus_dma.c
@@ -173,6 +173,39 @@ int snd_gf1_dma_done(struct snd_gus_card * gus)
 	return 0;
 }
 
+void snd_gf1_dma_suspend(struct snd_gus_card *gus)
+{
+	struct snd_gf1_dma_block *block;
+
+	guard(mutex)(&gus->dma_mutex);
+	if (!gus->gf1.dma_shared)
+		return;
+
+	snd_dma_disable(gus->gf1.dma1);
+	snd_gf1_dma_ack(gus);
+	if (gus->gf1.dma_ack)
+		gus->gf1.dma_ack(gus, gus->gf1.dma_private_data);
+	gus->gf1.dma_ack = NULL;
+	gus->gf1.dma_private_data = NULL;
+
+	while ((block = gus->gf1.dma_data_pcm)) {
+		gus->gf1.dma_data_pcm = block->next;
+		if (block->ack)
+			block->ack(gus, block->private_data);
+		kfree(block);
+	}
+	while ((block = gus->gf1.dma_data_synth)) {
+		gus->gf1.dma_data_synth = block->next;
+		if (block->ack)
+			block->ack(gus, block->private_data);
+		kfree(block);
+	}
+
+	gus->gf1.dma_data_pcm_last = NULL;
+	gus->gf1.dma_data_synth_last = NULL;
+	gus->gf1.dma_flags &= ~SNDRV_GF1_DMA_TRIGGER;
+}
+
 int snd_gf1_dma_transfer_block(struct snd_gus_card * gus,
 			       struct snd_gf1_dma_block * __block,
 			       int atomic,
diff --git a/sound/isa/gus/gus_main.c b/sound/isa/gus/gus_main.c
index b2b189c83569..6adf8b698e2b 100644
--- a/sound/isa/gus/gus_main.c
+++ b/sound/isa/gus/gus_main.c
@@ -404,6 +404,42 @@ int snd_gus_initialize(struct snd_gus_card *gus)
 	return 0;
 }
 
+int snd_gus_suspend(struct snd_gus_card *gus)
+{
+	int err;
+
+	if (gus->pcm) {
+		err = snd_pcm_suspend_all(gus->pcm);
+		if (err < 0)
+			return err;
+	}
+
+	err = snd_gf1_suspend(gus);
+	if (err < 0)
+		return err;
+
+	snd_power_change_state(gus->card, SNDRV_CTL_POWER_D3hot);
+	return 0;
+}
+EXPORT_SYMBOL(snd_gus_suspend);
+
+int snd_gus_resume(struct snd_gus_card *gus)
+{
+	int err;
+
+	err = snd_gus_init_dma_irq(gus, 1);
+	if (err < 0)
+		return err;
+
+	err = snd_gf1_resume(gus);
+	if (err < 0)
+		return err;
+
+	snd_power_change_state(gus->card, SNDRV_CTL_POWER_D0);
+	return 0;
+}
+EXPORT_SYMBOL(snd_gus_resume);
+
   /* gus_io.c */
 EXPORT_SYMBOL(snd_gf1_delay);
 EXPORT_SYMBOL(snd_gf1_write8);
diff --git a/sound/isa/gus/gus_pcm.c b/sound/isa/gus/gus_pcm.c
index caf371897b78..a0757e1ede46 100644
--- a/sound/isa/gus/gus_pcm.c
+++ b/sound/isa/gus/gus_pcm.c
@@ -471,7 +471,8 @@ static int snd_gf1_pcm_playback_trigger(struct snd_pcm_substream *substream,
 
 	if (cmd == SNDRV_PCM_TRIGGER_START) {
 		snd_gf1_pcm_trigger_up(substream);
-	} else if (cmd == SNDRV_PCM_TRIGGER_STOP) {
+	} else if (cmd == SNDRV_PCM_TRIGGER_STOP ||
+		   cmd == SNDRV_PCM_TRIGGER_SUSPEND) {
 		scoped_guard(spinlock, &pcmp->lock) {
 			pcmp->flags &= ~SNDRV_GF1_PCM_PFLG_ACTIVE;
 		}
@@ -558,7 +559,8 @@ static int snd_gf1_pcm_capture_trigger(struct snd_pcm_substream *substream,
 	
 	if (cmd == SNDRV_PCM_TRIGGER_START) {
 		val = gus->gf1.pcm_rcntrl_reg;
-	} else if (cmd == SNDRV_PCM_TRIGGER_STOP) {
+	} else if (cmd == SNDRV_PCM_TRIGGER_STOP ||
+		   cmd == SNDRV_PCM_TRIGGER_SUSPEND) {
 		val = 0;
 	} else {
 		return -EINVAL;
@@ -856,4 +858,3 @@ int snd_gf1_pcm_new(struct snd_gus_card *gus, int pcm_dev, int control_index)
 
 	return 0;
 }
-
diff --git a/sound/isa/gus/gus_reset.c b/sound/isa/gus/gus_reset.c
index a7a3e764bb77..998fa245708c 100644
--- a/sound/isa/gus/gus_reset.c
+++ b/sound/isa/gus/gus_reset.c
@@ -6,6 +6,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/time.h>
+#include <asm/dma.h>
 #include <sound/core.h>
 #include <sound/gus.h>
 
@@ -263,11 +264,18 @@ void snd_gf1_free_voice(struct snd_gus_card * gus, struct snd_gus_voice *voice)
 		private_free(voice);
 }
 
-/*
- *  call this function only by start of driver
- */
+static void snd_gf1_init_software_state(struct snd_gus_card *gus)
+{
+	unsigned int i;
 
-int snd_gf1_start(struct snd_gus_card * gus)
+	snd_gf1_set_default_handlers(gus, SNDRV_GF1_HANDLER_ALL);
+	for (i = 0; i < 32; i++) {
+		gus->gf1.voices[i].number = i;
+		snd_gf1_set_default_handlers(gus, SNDRV_GF1_HANDLER_VOICE | i);
+	}
+}
+
+static void snd_gf1_hw_start(struct snd_gus_card *gus, bool initial)
 {
 	unsigned int i;
 
@@ -277,14 +285,14 @@ int snd_gf1_start(struct snd_gus_card * gus)
 	udelay(160);
 	snd_gf1_i_write8(gus, SNDRV_GF1_GB_JOYSTICK_DAC_LEVEL, gus->joystick_dac);
 
-	snd_gf1_set_default_handlers(gus, SNDRV_GF1_HANDLER_ALL);
-	for (i = 0; i < 32; i++) {
-		gus->gf1.voices[i].number = i;
-		snd_gf1_set_default_handlers(gus, SNDRV_GF1_HANDLER_VOICE | i);
+	if (initial) {
+		snd_gf1_init_software_state(gus);
+		snd_gf1_uart_cmd(gus, 0x03);
+	} else {
+		guard(spinlock_irqsave)(&gus->uart_cmd_lock);
+		outb(0x03, GUSP(gus, MIDICTRL));
 	}
 
-	snd_gf1_uart_cmd(gus, 0x03);	/* huh.. this cleanup took me some time... */
-
 	if (gus->gf1.enh_mode) {	/* enhanced mode !!!! */
 		snd_gf1_i_write8(gus, SNDRV_GF1_GB_GLOBAL_MODE, snd_gf1_i_look8(gus, SNDRV_GF1_GB_GLOBAL_MODE) | 0x01);
 		snd_gf1_i_write8(gus, SNDRV_GF1_GB_MEMORY_CONTROL, 0x01);
@@ -293,6 +301,8 @@ int snd_gf1_start(struct snd_gus_card * gus)
 	snd_gf1_select_active_voices(gus);
 	snd_gf1_delay(gus);
 	gus->gf1.default_voice_address = gus->gf1.memory > 0 ? 0 : 512 - 8;
+	gus->gf1.hw_lfo = 0;
+	gus->gf1.sw_lfo = 0;
 	/* initialize LFOs & clear LFOs memory */
 	if (gus->gf1.enh_mode && gus->gf1.memory) {
 		gus->gf1.hw_lfo = 1;
@@ -321,7 +331,15 @@ int snd_gf1_start(struct snd_gus_card * gus)
 		outb(gus->gf1.active_voice = 0, GUSP(gus, GF1PAGE));
 		outb(gus->mix_cntrl_reg, GUSP(gus, MIXCNTRLREG));
 	}
+}
 
+int snd_gf1_start(struct snd_gus_card *gus)
+{
+	/*
+	 * Probe-time startup initializes both GF1 hardware and the
+	 * software state that suspend/resume keeps across PM cycles.
+	 */
+	snd_gf1_hw_start(gus, true);
 	snd_gf1_timers_init(gus);
 	snd_gf1_look_regs(gus);
 	snd_gf1_mem_init(gus);
@@ -357,3 +375,27 @@ int snd_gf1_stop(struct snd_gus_card * gus)
 
 	return 0;
 }
+
+int snd_gf1_suspend(struct snd_gus_card *gus)
+{
+	snd_gf1_dma_suspend(gus);
+	snd_gf1_uart_suspend(gus);
+
+	snd_gf1_i_write8(gus, SNDRV_GF1_GB_SOUND_BLASTER_CONTROL, 0);
+	snd_gf1_i_write8(gus, SNDRV_GF1_GB_REC_DMA_CONTROL, 0);
+	snd_gf1_i_look8(gus, SNDRV_GF1_GB_REC_DMA_CONTROL);
+	snd_gf1_stop_voices(gus, 0, 31);
+	snd_gf1_i_write8(gus, SNDRV_GF1_GB_RESET, 1);
+	snd_dma_disable(gus->gf1.dma2);
+
+	return 0;
+}
+
+int snd_gf1_resume(struct snd_gus_card *gus)
+{
+	snd_gf1_hw_start(gus, false);
+	snd_gf1_timers_resume(gus);
+	snd_gf1_uart_resume(gus);
+
+	return 0;
+}
diff --git a/sound/isa/gus/gus_timer.c b/sound/isa/gus/gus_timer.c
index e3a8847e02cf..14dcde138bc7 100644
--- a/sound/isa/gus/gus_timer.c
+++ b/sound/isa/gus/gus_timer.c
@@ -178,3 +178,17 @@ void snd_gf1_timers_done(struct snd_gus_card * gus)
 		gus->gf1.timer2 = NULL;
 	}
 }
+
+void snd_gf1_timers_resume(struct snd_gus_card *gus)
+{
+	if (gus->gf1.timer1) {
+		gus->gf1.interrupt_handler_timer1 = snd_gf1_interrupt_timer1;
+		if (gus->gf1.timer_enabled & 4)
+			snd_gf1_timer1_start(gus->gf1.timer1);
+	}
+	if (gus->gf1.timer2) {
+		gus->gf1.interrupt_handler_timer2 = snd_gf1_interrupt_timer2;
+		if (gus->gf1.timer_enabled & 8)
+			snd_gf1_timer2_start(gus->gf1.timer2);
+	}
+}
diff --git a/sound/isa/gus/gus_uart.c b/sound/isa/gus/gus_uart.c
index 770d8f3e4cff..25057a5a81b0 100644
--- a/sound/isa/gus/gus_uart.c
+++ b/sound/isa/gus/gus_uart.c
@@ -232,3 +232,50 @@ int snd_gf1_rawmidi_new(struct snd_gus_card *gus, int device)
 	gus->midi_uart = rmidi;
 	return err;
 }
+
+void snd_gf1_uart_suspend(struct snd_gus_card *gus)
+{
+	guard(spinlock_irqsave)(&gus->uart_cmd_lock);
+	outb(0x03, GUSP(gus, MIDICTRL));
+}
+
+void snd_gf1_uart_resume(struct snd_gus_card *gus)
+{
+	unsigned short uart_cmd;
+	bool active;
+	int i;
+
+	scoped_guard(spinlock_irqsave, &gus->uart_cmd_lock) {
+		active = gus->midi_substream_input || gus->midi_substream_output;
+	}
+	if (!active)
+		return;
+
+	/* snd_gf1_hw_start() already left MIDICTRL in reset. */
+	usleep_range(160, 200);
+
+	guard(spinlock_irqsave)(&gus->uart_cmd_lock);
+	if (!gus->midi_substream_input && !gus->midi_substream_output)
+		return;
+
+	if (gus->midi_substream_output)
+		gus->gf1.interrupt_handler_midi_out = snd_gf1_interrupt_midi_out;
+	if (gus->midi_substream_input)
+		gus->gf1.interrupt_handler_midi_in = snd_gf1_interrupt_midi_in;
+
+	if (!gus->uart_enable)
+		return;
+
+	uart_cmd = gus->gf1.uart_cmd;
+	snd_gf1_uart_cmd(gus, 0x00);
+
+	if (gus->midi_substream_input) {
+		for (i = 0; i < 1000 && (snd_gf1_uart_stat(gus) & 0x01); i++)
+			snd_gf1_uart_get(gus);
+		if (i >= 1000)
+			dev_err(gus->card->dev,
+				"gus midi uart resume - cleanup error\n");
+	}
+
+	snd_gf1_uart_cmd(gus, uart_cmd);
+}

-- 
2.53.0

