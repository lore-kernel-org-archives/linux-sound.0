Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4B034F49F
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 15:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777304221; cv=none; b=uw9RrBi8lRPCpvycqxs1kian89a1k9O4HPvGHE8bAb8FY3/pXEuh5iDqfEXP9Bc+8whRU6ZFhmqMUzsA92+R22CV26qxevqCAkp4LPVod4uWfgSB5vAWuXc7KQUrgG19V9yQOdnyl2+Xkw1hh62UChDqQ5pRFj8m8oeeC/ZanGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777304221; c=relaxed/simple;
	bh=qNXpCX2jg2pYvXRr2+vUnDDqMFjx39ibazilrlJE0Mo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eZKj10ZQJs8jB+/XHaidsDOOypyxwCig3vh2sO0Z70pcBCO/m2Jv59sAKg8UN8DOLcGrlEmh2g7xKJuMsIqPU3pNy3Prg5t14rSPck1bKf3KgfavPHd99o/hBj8h0twHZca1Yo2tNrjGMGbwkaF7mY476VAvu4k9kc+EKY44loo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbwwAMZX; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbwwAMZX"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2de831d2b20so995453eec.1
        for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 08:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777304218; x=1777909018; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HjXOaXm7WF8dQH6cbp/MTJAvdcoaQ+yyBZWI4s0VdIc=;
        b=YbwwAMZXMwD8YsDs1aTwT5Hwi3JF+g2Ke1qM83OqLJbNhyvnq3Ays1XuHokGzu4Nzh
         0FfyZcezjk+cv3ntVmnu8Bo2uR9t1k7tG4i7CBBGFVl2LYtwJSMI9uocAP+Vg6qpBIqd
         ImAxNj1LJ+D6ISRn4twBSXe0W/o2hHacZ6phEHwRej/kWrNZjYiF29+DqDRLWJdcteZn
         tPXe5f/mekQijssNDfxb/hT0J5uL1o1XnDoDO2oYzPmFOaTDkCWxDnewAk9/1tWUvr7x
         wdzikEUCkagGAk1VlCjFKCZz4BxZBdZu8BPN17TbnwgzMUInMXt4Mj+5wFD3tKRMc4CH
         Kycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304218; x=1777909018;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjXOaXm7WF8dQH6cbp/MTJAvdcoaQ+yyBZWI4s0VdIc=;
        b=l7bDCVoo0lqtP4bN8SQri5Vd0ZcxCVK7fvldpsgXE+PAsQB1d75DhTZfHWrTOhggz+
         g9zUAAPC0WH0TSGg9cX3j0BrppBmHA+mG5K+VKcmtAO8+zFij54x3+q1I9ykI67jV0Lp
         OKnJJb0tHJLOAjjRXPsuABZQnOePxOA8/gibXKgLZbEgJhUhdyzAbQ5DfbdwV2FlQxfn
         gOmbNpdS5YcSg26tboxCUoGLEnO8a4QxR3DWGxSoBhNiAHS5hErnAM05jlB6pQ00X4SA
         ByAbet7tvETql/qiWHc2b92GWU8toZUC8XXZesTrwepV/HnQ+2BAumt+6wG/PU/NLmi3
         qzGw==
X-Gm-Message-State: AOJu0YxGgrQtok/d1m6YI8gm2wklcMrR2ZLN8UVj3vyRvvIubW9XpBZ4
	LsBFvkV8BfA6vJjLtnnN+Zh4Lp8v6lxpuddgzR5F+5VrbkmfwtjyIUKM
X-Gm-Gg: AeBDieuUeyHcW1FPd3aih/z6cYk9L54LRhdH6kSTYgq2Hwhbd8MNjZyG1bQXJoApqLm
	tj0jMVvk8bDLp7sIFreTSkyprFcna1mJ6RVL/SUpzObcd1mNWhHwnF0GkAXFkpbEt41GH5UOoR7
	571U9OyHzzhBZc1JkA1uZyVWDnuEaGQUT0xXp5II3v61sPE49zMrxEU37Bn7mq/VxC4BeF0Fh0W
	Gk57A4BiEkYrZ/5a2Y7pjFw9OPdRsVOwUS02CYlhH2QMLOjQzSYjBZKCPhsZaj69ktE0MoTuE5D
	yVeIkKVSuZQVFZUmeht6lLSJcr68O6BT8x3/VGD78X5QGdogQU/RbGmxnkEZhjQ0BD6KqBork4k
	JEWumesvb/vAQozhdK3TOYpRrnIFb9RZ5oFSveloq0L4ShJURnxyc127Y83CWKM0GFxppHD7qim
	KGnvU8eWDN/MsGj0pi4oiGh6yB+uX90gAtg8zizzi+qeBJIfDFalTqPNhTT8HBuQYlM/Sqtp1v0
	kSLbZAsHlGS
X-Received: by 2002:a05:7301:1693:b0:2d2:129a:1682 with SMTP id 5a478bee46e88-2e4786460f9mr22886235eec.16.1777304217572;
        Mon, 27 Apr 2026 08:36:57 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa5c86sm52262546eec.1.2026.04.27.08.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:36:57 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 27 Apr 2026 12:36:49 -0300
Subject: [PATCH] ALSA: wavefront: add suspend and resume support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-wavefront-pm-v1-1-9c1b6a898673@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyNz3fLEstS0ovy8Et2CXF1T40QLA5NkE0vz1FQloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAe16lmXAAAAA=
X-Change-ID: 20260427-wavefront-pm-53a804c497ee
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12077;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=qNXpCX2jg2pYvXRr2+vUnDDqMFjx39ibazilrlJE0Mo=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJnvm6Z9mq90ZtEnG615z8PYf+UvXcItc3jZhl0RnSp/r
 /Q8XOqv0lHKwiDGxSArpsiyOmmR5Z6uB1fr41Z4wMxhZQIZwsDFKQATScxj+F91o+/UcUOvwonC
 YZsKubZOq/2oVDRH9MQJDa2nU8Tr1y9i+O+jcGunVk6u4vyPTRGfY85pHLCKe3BZPuftf8ulpwy
 mOvACAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The WaveFront driver still lacks support for suspend and resume
in both the ISA and PnP driver tables.

Wire the driver into ALSA PM by storing the WSS codec pointer in the card
private data and adding shared suspend/resume callbacks. Resume cannot
simply rerun snd_wavefront_start(), because with the default fx_raw=1
setting that would reset the synth on every resume and discard uploaded
WaveFront RAM contents.

Cache wavefront.os for PM, probe the ICS2115 after resume and only run
the full reset/bootstrap path when the board comes back raw. When the
firmware is still running, refresh the software slot bookkeeping and
restore the MIDI routing state without forcing a synth reset.

Also quiesce and restart the WaveFront MIDI output timer across suspend
and resume so active rawmidi output does not race the PM transition.

This restores the card to a usable baseline after resume while preserving
uploaded samples and programs when the hardware state survives suspend.
If the board resumes raw, userspace still needs to reload custom synth
contents.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 include/sound/snd_wavefront.h         |  7 +++
 sound/isa/wavefront/wavefront.c       | 61 +++++++++++++++++++++-
 sound/isa/wavefront/wavefront_midi.c  | 47 ++++++++++++++++-
 sound/isa/wavefront/wavefront_synth.c | 96 +++++++++++++++++++++++++++++++++++
 4 files changed, 208 insertions(+), 3 deletions(-)

diff --git a/include/sound/snd_wavefront.h b/include/sound/snd_wavefront.h
index 30f508a56766..ac749bb2b836 100644
--- a/include/sound/snd_wavefront.h
+++ b/include/sound/snd_wavefront.h
@@ -12,6 +12,7 @@
 struct _snd_wavefront_midi;
 struct _snd_wavefront_card;
 struct _snd_wavefront;
+struct snd_wss;
 
 typedef struct _snd_wavefront_midi snd_wavefront_midi_t;
 typedef struct _snd_wavefront_card snd_wavefront_card_t;
@@ -46,6 +47,8 @@ extern void   snd_wavefront_midi_enable_virtual (snd_wavefront_card_t *);
 extern void   snd_wavefront_midi_disable_virtual (snd_wavefront_card_t *);
 extern void   snd_wavefront_midi_interrupt (snd_wavefront_card_t *);
 extern int    snd_wavefront_midi_start (snd_wavefront_card_t *);
+void snd_wavefront_midi_suspend(snd_wavefront_card_t *card);
+void snd_wavefront_midi_resume(snd_wavefront_card_t *card);
 
 struct _snd_wavefront {
 	unsigned long    irq;   /* "you were one, one of the few ..." */
@@ -93,6 +96,7 @@ struct _snd_wavefront {
 	int samples_used;                  /* how many */
 	char interrupts_are_midi;          /* h/w MPU interrupts enabled ? */
 	char rom_samples_rdonly;           /* can we write on ROM samples */
+	char midi_in_to_synth;             /* route external MIDI to synth */
 	spinlock_t irq_lock;
 	wait_queue_head_t interrupt_sleeper; 
 	snd_wavefront_midi_t midi;         /* ICS2115 MIDI interface */
@@ -101,6 +105,7 @@ struct _snd_wavefront {
 
 struct _snd_wavefront_card {
 	snd_wavefront_t wavefront;
+	struct snd_wss *chip;
 #ifdef CONFIG_PNP
 	struct pnp_dev *wss;
 	struct pnp_dev *ctrl;
@@ -110,8 +115,10 @@ struct _snd_wavefront_card {
 };
 
 extern void snd_wavefront_internal_interrupt (snd_wavefront_card_t *card);
+void snd_wavefront_cache_firmware(snd_wavefront_t *dev);
 extern int  snd_wavefront_start (snd_wavefront_t *dev);
 extern int  snd_wavefront_detect (snd_wavefront_card_t *card);
+int snd_wavefront_resume_synth(snd_wavefront_card_t *card);
 extern int  snd_wavefront_cmd (snd_wavefront_t *, int, unsigned char *,
 			       unsigned char *);
 
diff --git a/sound/isa/wavefront/wavefront.c b/sound/isa/wavefront/wavefront.c
index 07c68568091d..f4a0c21c905e 100644
--- a/sound/isa/wavefront/wavefront.c
+++ b/sound/isa/wavefront/wavefront.c
@@ -353,6 +353,7 @@ snd_wavefront_probe (struct snd_card *card, int dev)
 		dev_err(card->dev, "can't allocate WSS device\n");
 		return err;
 	}
+	acard->chip = chip;
 
 	err = snd_wss_pcm(chip, 0);
 	if (err < 0)
@@ -400,6 +401,7 @@ snd_wavefront_probe (struct snd_card *card, int dev)
 	acard->wavefront.irq = ics2115_irq[dev];
 	card->sync_irq = acard->wavefront.irq;
 	acard->wavefront.base = ics2115_port[dev];
+	snd_wavefront_cache_firmware(&acard->wavefront);
 
 	wavefront_synth = snd_wavefront_new_synth(card, hw_dev, acard);
 	if (wavefront_synth == NULL) {
@@ -553,12 +555,51 @@ static int snd_wavefront_isa_probe(struct device *pdev,
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int snd_wavefront_suspend(struct snd_card *card)
+{
+	snd_wavefront_card_t *acard = card->private_data;
+
+	snd_wavefront_midi_suspend(acard);
+	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
+	acard->chip->suspend(acard->chip);
+	return 0;
+}
+
+static int snd_wavefront_resume(struct snd_card *card)
+{
+	snd_wavefront_card_t *acard = card->private_data;
+	int err;
+
+	acard->chip->resume(acard->chip);
+	err = snd_wavefront_resume_synth(acard);
+	if (err < 0)
+		return err;
+	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
+	return 0;
+}
+
+static int snd_wavefront_isa_suspend(struct device *dev, unsigned int id,
+				     pm_message_t state)
+{
+	return snd_wavefront_suspend(dev_get_drvdata(dev));
+}
+
+static int snd_wavefront_isa_resume(struct device *dev, unsigned int id)
+{
+	return snd_wavefront_resume(dev_get_drvdata(dev));
+}
+#endif
+
 #define DEV_NAME "wavefront"
 
 static struct isa_driver snd_wavefront_driver = {
 	.match		= snd_wavefront_isa_match,
 	.probe		= snd_wavefront_isa_probe,
-	/* FIXME: suspend, resume */
+#ifdef CONFIG_PM
+	.suspend	= snd_wavefront_isa_suspend,
+	.resume		= snd_wavefront_isa_resume,
+#endif
 	.driver		= {
 		.name	= DEV_NAME
 	},
@@ -600,12 +641,28 @@ static int snd_wavefront_pnp_detect(struct pnp_card_link *pcard,
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int snd_wavefront_pnpc_suspend(struct pnp_card_link *pcard,
+				      pm_message_t state)
+{
+	return snd_wavefront_suspend(pnp_get_card_drvdata(pcard));
+}
+
+static int snd_wavefront_pnpc_resume(struct pnp_card_link *pcard)
+{
+	return snd_wavefront_resume(pnp_get_card_drvdata(pcard));
+}
+#endif
+
 static struct pnp_card_driver wavefront_pnpc_driver = {
 	.flags		= PNP_DRIVER_RES_DISABLE,
 	.name		= "wavefront",
 	.id_table	= snd_wavefront_pnpids,
 	.probe		= snd_wavefront_pnp_detect,
-	/* FIXME: suspend,resume */
+#ifdef CONFIG_PM
+	.suspend	= snd_wavefront_pnpc_suspend,
+	.resume		= snd_wavefront_pnpc_resume,
+#endif
 };
 
 #endif /* CONFIG_PNP */
diff --git a/sound/isa/wavefront/wavefront_midi.c b/sound/isa/wavefront/wavefront_midi.c
index 69d87c4cafae..fb184d9ef284 100644
--- a/sound/isa/wavefront/wavefront_midi.c
+++ b/sound/isa/wavefront/wavefront_midi.c
@@ -455,6 +455,49 @@ snd_wavefront_midi_disable_virtual (snd_wavefront_card_t *card)
 	card->wavefront.midi.isvirtual = 0;
 }
 
+void
+snd_wavefront_midi_suspend(snd_wavefront_card_t *card)
+
+{
+	snd_wavefront_midi_t *midi = &card->wavefront.midi;
+
+	if (!midi->istimer)
+		return;
+
+	timer_delete_sync(&midi->timer);
+
+	guard(spinlock_irqsave)(&midi->virtual);
+	midi->istimer = 0;
+}
+
+void
+snd_wavefront_midi_resume(snd_wavefront_card_t *card)
+
+{
+	snd_wavefront_midi_t *midi = &card->wavefront.midi;
+	int istimer = 0;
+	bool pending_output = false;
+
+	midi->timer_card = card;
+
+	scoped_guard(spinlock_irqsave, &midi->virtual) {
+		if (midi->mode[internal_mpu] & MPU401_MODE_OUTPUT_TRIGGER)
+			istimer++;
+		if (midi->mode[external_mpu] & MPU401_MODE_OUTPUT_TRIGGER)
+			istimer++;
+		if (!istimer)
+			return;
+
+		midi->istimer = istimer;
+		timer_setup(&midi->timer, snd_wavefront_midi_output_timer, 0);
+		mod_timer(&midi->timer, 1 + jiffies);
+		pending_output = true;
+	}
+
+	if (pending_output)
+		snd_wavefront_midi_output_write(card);
+}
+
 int
 snd_wavefront_midi_start (snd_wavefront_card_t *card)
 
@@ -466,6 +509,7 @@ snd_wavefront_midi_start (snd_wavefront_card_t *card)
 
 	dev = &card->wavefront;
 	midi = &dev->midi;
+	midi->timer_card = card;
 
 	/* The ICS2115 MPU-401 interface doesn't do anything
 	   until its set into UART mode.
@@ -511,6 +555,8 @@ snd_wavefront_midi_start (snd_wavefront_card_t *card)
 		dev_warn(card->wavefront.card->dev,
 			 "can't enable MIDI-IN-2-synth routing.\n");
 		/* XXX error ? */
+	} else {
+		dev->midi_in_to_synth = 1;
 	}
 
 	/* Turn on Virtual MIDI, but first *always* turn it off,
@@ -553,4 +599,3 @@ const struct snd_rawmidi_ops snd_wavefront_midi_input =
 	.close =	snd_wavefront_midi_input_close,
 	.trigger =	snd_wavefront_midi_input_trigger,
 };
-
diff --git a/sound/isa/wavefront/wavefront_synth.c b/sound/isa/wavefront/wavefront_synth.c
index 33b563707a58..2f57a6795d22 100644
--- a/sound/isa/wavefront/wavefront_synth.c
+++ b/sound/isa/wavefront/wavefront_synth.c
@@ -1626,6 +1626,14 @@ wavefront_synth_control (snd_wavefront_card_t *acard,
 				"support for sample aliases still being considered.\n");
 			break;
 
+		case WFC_MISYNTH_OFF:
+			dev->midi_in_to_synth = 0;
+			break;
+
+		case WFC_MISYNTH_ON:
+			dev->midi_in_to_synth = 1;
+			break;
+
 		case WFC_VMIDI_OFF:
 			snd_wavefront_midi_disable_virtual (acard);
 			break;
@@ -1639,6 +1647,83 @@ wavefront_synth_control (snd_wavefront_card_t *acard,
 	return 0;
 }
 
+static int
+wavefront_restore_midi_state(snd_wavefront_card_t *acard, char isvirtual,
+			     char midi_in_to_synth)
+{
+	snd_wavefront_t *dev = &acard->wavefront;
+	unsigned char rbuf[4], wbuf[4];
+
+	if (dev->midi_in_to_synth != midi_in_to_synth) {
+		if (snd_wavefront_cmd(dev, midi_in_to_synth ?
+				      WFC_MISYNTH_ON : WFC_MISYNTH_OFF,
+				      rbuf, wbuf)) {
+			dev_err(dev->card->dev,
+				"cannot restore MIDI-IN routing after resume\n");
+			return -EIO;
+		}
+		dev->midi_in_to_synth = midi_in_to_synth;
+	}
+
+	if (dev->midi.isvirtual != isvirtual) {
+		if (snd_wavefront_cmd(dev, isvirtual ?
+				      WFC_VMIDI_ON : WFC_VMIDI_OFF,
+				      rbuf, wbuf)) {
+			dev_err(dev->card->dev,
+				"cannot restore virtual MIDI mode after resume\n");
+			return -EIO;
+		}
+		if (isvirtual)
+			snd_wavefront_midi_enable_virtual(acard);
+		else
+			snd_wavefront_midi_disable_virtual(acard);
+	}
+
+	return 0;
+}
+
+int snd_wavefront_resume_synth(snd_wavefront_card_t *acard)
+{
+	snd_wavefront_t *dev = &acard->wavefront;
+	char was_virtual = dev->midi.isvirtual;
+	char midi_in_to_synth = dev->midi_in_to_synth;
+	char rom_samples_rdonly = dev->rom_samples_rdonly;
+	int err;
+
+	err = snd_wavefront_detect(acard);
+	if (err < 0)
+		dev->israw = 1;
+
+	if (dev->israw) {
+		dev->fx_initialized = 0;
+		err = snd_wavefront_start(dev);
+		if (err < 0)
+			return err;
+	} else {
+		dev->has_fx = (snd_wavefront_fx_detect(dev) == 0);
+		wavefront_get_sample_status(dev, 0);
+		wavefront_get_program_status(dev);
+		wavefront_get_patch_status(dev);
+		outb(0x80 | 0x40 | 0x20, dev->control_port);
+	}
+
+	dev->rom_samples_rdonly = rom_samples_rdonly;
+	dev->midi.base = dev->base;
+
+	err = snd_wavefront_midi_start(acard);
+	if (err < 0)
+		return err;
+
+	err = wavefront_restore_midi_state(acard, was_virtual,
+					   midi_in_to_synth);
+	if (err < 0)
+		return err;
+
+	snd_wavefront_midi_resume(acard);
+
+	return 0;
+}
+
 int 
 snd_wavefront_synth_open (struct snd_hwdep *hw, struct file *file)
 
@@ -2032,6 +2117,17 @@ wavefront_download_firmware (snd_wavefront_t *dev, char *path)
 	return 1;
 }
 
+void snd_wavefront_cache_firmware(snd_wavefront_t *dev)
+{
+	int err;
+
+	err = firmware_request_cache(dev->card->dev, ospath);
+	if (err < 0)
+		dev_warn(dev->card->dev,
+			 "unable to cache firmware %s for resume: %d\n",
+			 ospath, err);
+}
+
 
 static int
 wavefront_do_reset (snd_wavefront_t *dev)

---
base-commit: 876c495d412ef67bd4d0bdc4b74b0bd3d9f4e890
change-id: 20260427-wavefront-pm-53a804c497ee

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

