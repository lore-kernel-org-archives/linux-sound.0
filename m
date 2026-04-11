Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ABC2E266C
	for <linux-sound@vger.kernel.org>; Sat, 11 Apr 2026 04:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775883283; cv=none; b=p3Ia3jiWW2y0Oj50WaSQxut6LyZ+PQbz+2C/z56+UWX2zZYSnFAkJuKN0ST87lb16s90NTbYIlHhSqfYr+y+Ql5O6e9sa/5/8qjc7wtJdPOMYKq3NPSIEocHi/d6QF48OPyiIFpJ6F3kv3YCveKCG6YJ5WjT2AS+zgx6o1mOgpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775883283; c=relaxed/simple;
	bh=yC5W6bSUIYMX3dHsvMHSJERX+BChWerrSP13apEg1Cc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OWkS+x3cwqhXi0OxLe+jfX7ns05yTbIx5Cr5scVz91xhmsDKmWC7FpinYQy+Fyf3NRK7zyLiHY23sPfVi2VDw2MQ+5Jz9jUo8yarz2IgPz/PdzEhVh1Zyo72oLNGGyl00F/fO/GIhQ/PqeZ1nAXlnx7RDgjQ/yU/teGhl2xiNU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kA7wTYZA; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kA7wTYZA"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c56aa62931so4465784eec.0
        for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 21:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775883281; x=1776488081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLscJC43HBKbTT8zpntHphEX5063DkOG1/JtZ6+kZuQ=;
        b=kA7wTYZAEtErwm7y6qi92Inwmu39FDgOb6cG8MapsVxFkrVhtKI7K6lymXBR7BMjA4
         UUVjrnT64f8pEXycpJZ88yI62dp9Hp0My9bezvKzPOL3JToWEvcHQIfWellPfDFmYV7h
         Sl2hHMwwOXYPDhimIYsZBAQE3XOVldVoEM7731VZWZg1x+5zP7GDGhMe7uYywT7Tb1JP
         dBulXNifTAeRgYE7gX15tJlclQgnnSfvF8KvTfhK/zGYgaePHLJoelEAGhQ0YbY7Gcch
         s9CdqGk9ytRDAnL3xhH/O4A822qnVuXCfGzkkCsl3PgBbjkfn6fy3kFR6kMvelGUKXpu
         J5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775883281; x=1776488081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tLscJC43HBKbTT8zpntHphEX5063DkOG1/JtZ6+kZuQ=;
        b=iPGqdhaRT1/JwSLyqe5yRZhVdfqHNiiEbwi+qiB6fHP+uxaOpGqvbv7cIXx6if8xIX
         YbFEvf/JX3D4yk7HvBjMtckt94sygVP745ImrPeRCtKhSMApciqtyySxuj++wSzFvTIi
         7V0xZH8Twv1H5Ow+xcLF9CZe7yx/1KTAZGzGxLo50fRMNjcemI3Wb3FeaRusMU2FSGZG
         u0253V4N1Hn+g7rDEbzAdgPD0JWEZpxE3VOXfcKPcfHb2ezBZnDJD84MVwCt3qsR9UKg
         RRRC7Zid9j6uLx8YgHzjR6w9XAydQBhV+PeD56fpl8ywIy/KinjHw0woqVd3rAipZQHl
         WKIA==
X-Gm-Message-State: AOJu0Yz7cKiIEml2H3Wggao7xVsR9ZCBP41CHJw3sVDAjMXH4SGwA3Mr
	BTdK6tIjHHPoZNdZiy+BC3sZ7qXLg6DHGTJa18gIn18pPY+suQWucMpA
X-Gm-Gg: AeBDietYU5Cms8Xnr67Ha52S+C52S1rnfFdjKPqsKCwXaAOugXhxRzKTnofpkoEojJz
	vE0EJTxzHc8zmUjfTXp1Ee1yC/whyO8UlvFTA0RrOMSyAFPExYBrz4OwdfVTzGxRWtmeFVDOIpu
	SGVYLpL2HIvjR/mOmsVcNyslq6DUG7r3+7tQEdFegJrq7TLRMOeDbk5TwJREwC8m0ZJyHdQQYSZ
	by73rket70mIi/RhkSLlmEZYaTgrgkMm7YtJJpk32zL+ACmZiW2BCi30fBgyGxmkdpmt3+f1qq9
	QppJb5Fexmwr+ofdFwQsyx0Y0lZhvuBp/kLkcJQAkvm0pcNIWZsDwV9hKOCNKgPe3//TX/dxS5+
	rTJNxb9Y4cKmb2scOQQ0beRouarYjy1EGWK43/tZQlIe5w2QXLSGE0nQ7BGdmldueacKYkPy0gM
	2stxntGyYXsenzLAjHv1oVNilF8zz07MaLPoOUiWHH82FRbitWnt50MGma4P63TVfA5QnutugMr
	IsB
X-Received: by 2002:a05:7300:430a:b0:2d4:2cc8:67e with SMTP id 5a478bee46e88-2d589dafcadmr3774829eec.23.1775883280479;
        Fri, 10 Apr 2026 21:54:40 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561bde68bsm7378754eec.17.2026.04.10.21.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 21:54:40 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Sat, 11 Apr 2026 01:54:29 -0300
Subject: [PATCH 1/2] ALSA: sscape: Cache per-card resources for board
 reinitialization
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260411-alsa-sscape-pm-v1-1-3058d988783a@gmail.com>
References: <20260411-alsa-sscape-pm-v1-0-3058d988783a@gmail.com>
In-Reply-To: <20260411-alsa-sscape-pm-v1-0-3058d988783a@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11999;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=yC5W6bSUIYMX3dHsvMHSJERX+BChWerrSP13apEg1Cc=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJk3r3BlJEwSYf6k/qRFOzSWx6Bw9Ty1pWsmldSqhV1tN
 bss4be/o5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACZicoeR4fuLecolkx62OQae
 Dp7Ylbfv23fPZ7/NrTdPWcHFsF/ipwUjwyX/X8KlNgYtf7c+7zn1PD9tZ1YGv5rfroboGt7Kh/l
 L+QE=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The SoundScape driver programs the gate-array directly from the global
resource arrays during probe. That is sufficient for initial bring-up,
but a PM resume path also needs the resolved per-card IRQ, DMA, MPU IRQ
and joystick settings after probe has finished.

Store the resolved resources in struct soundscape and move the board
setup into a reusable helper. Also factor the MIDI state programming so
the same sequence can be reused by a later PM resume path.

This is preparatory work for suspend/resume support and is not intended
to change runtime behaviour.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/isa/sscape.c | 210 +++++++++++++++++++++++++++++++----------------------
 1 file changed, 125 insertions(+), 85 deletions(-)

diff --git a/sound/isa/sscape.c b/sound/isa/sscape.c
index a31ca75774a6..3e9465bc64ed 100644
--- a/sound/isa/sscape.c
+++ b/sound/isa/sscape.c
@@ -131,6 +131,11 @@ enum card_type {
 struct soundscape {
 	spinlock_t lock;
 	unsigned io_base;
+	unsigned long wss_base;
+	int irq;
+	int mpu_irq;
+	int dma1;
+	int dma2;
 	int ic_type;
 	enum card_type type;
 	struct resource *io_res;
@@ -138,6 +143,7 @@ struct soundscape {
 	struct snd_wss *chip;
 
 	unsigned char midi_vol;
+	bool joystick;
 	struct device *dev;
 };
 
@@ -149,6 +155,21 @@ static inline struct soundscape *get_card_soundscape(struct snd_card *c)
 	return (struct soundscape *) (c->private_data);
 }
 
+/*
+ * Store the resolved board settings in the per-card state so that
+ * the same configuration can be replayed later if necessary.
+ */
+static void sscape_store_settings(struct soundscape *sscape, int dev)
+{
+	sscape->io_base = port[dev];
+	sscape->wss_base = wss_port[dev];
+	sscape->irq = irq[dev];
+	sscape->mpu_irq = mpu_irq[dev];
+	sscape->dma1 = dma[dev];
+	sscape->dma2 = dma2[dev];
+	sscape->joystick = joystick[dev];
+}
+
 /*
  * Allocates some kernel memory that we can use for DMA.
  * I think this means that the memory has to map to
@@ -560,6 +581,28 @@ static int sscape_upload_microcode(struct snd_card *card, int version)
 	return err;
 }
 
+/*
+ * Restore the SoundScape's MIDI control state after the firmware
+ * upload has made the host interface available again.
+ */
+static int sscape_restore_midi_state(struct soundscape *sscape)
+{
+	int err = 1;
+
+	guard(spinlock_irqsave)(&sscape->lock);
+	set_host_mode_unsafe(sscape->io_base);
+	err &= host_write_ctrl_unsafe(sscape->io_base, CMD_SET_MIDI_VOL, 100);
+	err &= host_write_ctrl_unsafe(sscape->io_base, sscape->midi_vol, 100);
+	err &= host_write_ctrl_unsafe(sscape->io_base, CMD_XXX_MIDI_VOL, 100);
+	err &= host_write_ctrl_unsafe(sscape->io_base, sscape->midi_vol, 100);
+	err &= host_write_ctrl_unsafe(sscape->io_base, CMD_SET_EXTMIDI, 100);
+	err &= host_write_ctrl_unsafe(sscape->io_base, 0, 100);
+	err &= host_write_ctrl_unsafe(sscape->io_base, CMD_ACK, 100);
+	set_midi_mode_unsafe(sscape->io_base);
+
+	return err ? 0 : -EIO;
+}
+
 /*
  * Mixer control for the SoundScape's MIDI device.
  */
@@ -660,6 +703,59 @@ static unsigned get_irq_config(int sscape_type, int irq)
 	return INVALID_IRQ;
 }
 
+/*
+ * Program the SoundScape's board-specific routing and enable the
+ * codec path using the resolved IRQ, DMA and joystick settings.
+ */
+static int sscape_configure_board(struct soundscape *sscape)
+{
+	unsigned int dma_cfg;
+	unsigned int irq_cfg;
+	unsigned int mpu_irq_cfg;
+	int val;
+
+	irq_cfg = get_irq_config(sscape->type, sscape->irq);
+	if (irq_cfg == INVALID_IRQ)
+		return -ENXIO;
+
+	mpu_irq_cfg = get_irq_config(sscape->type, sscape->mpu_irq);
+	if (mpu_irq_cfg == INVALID_IRQ)
+		return -ENXIO;
+
+	scoped_guard(spinlock_irqsave, &sscape->lock) {
+		if (sscape->ic_type == IC_OPUS)
+			activate_ad1845_unsafe(sscape->io_base);
+
+		sscape_write_unsafe(sscape->io_base, GA_SMCFGA_REG, 0x2e);
+		sscape_write_unsafe(sscape->io_base, GA_SMCFGB_REG, 0x00);
+
+		/*
+		 * Enable and configure the DMA channels ...
+		 */
+		sscape_write_unsafe(sscape->io_base, GA_DMACFG_REG, 0x50);
+		dma_cfg = (sscape->ic_type == IC_OPUS ? 0x40 : 0x70);
+		sscape_write_unsafe(sscape->io_base, GA_DMAA_REG, dma_cfg);
+		sscape_write_unsafe(sscape->io_base, GA_DMAB_REG, 0x20);
+
+		mpu_irq_cfg |= mpu_irq_cfg << 2;
+		val = sscape_read_unsafe(sscape->io_base, GA_HMCTL_REG) & 0xf7;
+		if (sscape->joystick)
+			val |= 0x08;
+		sscape_write_unsafe(sscape->io_base, GA_HMCTL_REG, val | 0xd0);
+		sscape_write_unsafe(sscape->io_base, GA_INTCFG_REG,
+				    0xf0 | mpu_irq_cfg);
+		sscape_write_unsafe(sscape->io_base, GA_CDCFG_REG,
+				    0x09 | DMA_8BIT |
+				    (sscape->dma1 << 4) | (irq_cfg << 1));
+		/*
+		 * Enable the master IRQ ...
+		 */
+		sscape_write_unsafe(sscape->io_base, GA_INTENA_REG, 0x80);
+	}
+
+	return 0;
+}
+
 /*
  * Perform certain arcane port-checks to see whether there
  * is a SoundScape board lurking behind the given ports.
@@ -890,37 +986,33 @@ static int create_ad1845(struct snd_card *card, unsigned port,
 
 /*
  * Create an ALSA soundcard entry for the SoundScape, using
- * the given list of port, IRQ and DMA resources.
+ * the resolved port, IRQ and DMA resources.
  */
-static int create_sscape(int dev, struct snd_card *card)
+static int create_sscape(struct snd_card *card)
 {
 	struct soundscape *sscape = get_card_soundscape(card);
-	unsigned dma_cfg;
-	unsigned irq_cfg;
-	unsigned mpu_irq_cfg;
 	struct resource *io_res;
 	struct resource *wss_res;
 	int err;
-	int val;
 	const char *name;
 
 	/*
 	 * Grab IO ports that we will need to probe so that we
 	 * can detect and control this hardware ...
 	 */
-	io_res = devm_request_region(card->dev, port[dev], 8, "SoundScape");
+	io_res = devm_request_region(card->dev, sscape->io_base, 8, "SoundScape");
 	if (!io_res) {
 		dev_err(card->dev,
-			"sscape: can't grab port 0x%lx\n", port[dev]);
+			"sscape: can't grab port 0x%x\n", sscape->io_base);
 		return -EBUSY;
 	}
 	wss_res = NULL;
 	if (sscape->type == SSCAPE_VIVO) {
-		wss_res = devm_request_region(card->dev, wss_port[dev], 4,
+		wss_res = devm_request_region(card->dev, sscape->wss_base, 4,
 					      "SoundScape");
 		if (!wss_res) {
 			dev_err(card->dev, "sscape: can't grab port 0x%lx\n",
-				wss_port[dev]);
+				sscape->wss_base);
 			return -EBUSY;
 		}
 	}
@@ -928,18 +1020,17 @@ static int create_sscape(int dev, struct snd_card *card)
 	/*
 	 * Grab one DMA channel ...
 	 */
-	err = snd_devm_request_dma(card->dev, dma[dev], "SoundScape");
+	err = snd_devm_request_dma(card->dev, sscape->dma1, "SoundScape");
 	if (err < 0) {
-		dev_err(card->dev, "sscape: can't grab DMA %d\n", dma[dev]);
+		dev_err(card->dev, "sscape: can't grab DMA %d\n", sscape->dma1);
 		return err;
 	}
 
 	spin_lock_init(&sscape->lock);
 	sscape->io_res = io_res;
 	sscape->wss_res = wss_res;
-	sscape->io_base = port[dev];
 
-	if (!detect_sscape(sscape, wss_port[dev])) {
+	if (!detect_sscape(sscape, sscape->wss_base)) {
 		dev_err(card->dev, "sscape: hardware not detected at 0x%x\n",
 			sscape->io_base);
 		return -ENODEV;
@@ -964,66 +1055,28 @@ static int create_sscape(int dev, struct snd_card *card)
 	}
 
 	dev_info(card->dev, "sscape: %s card detected at 0x%x, using IRQ %d, DMA %d\n",
-		 name, sscape->io_base, irq[dev], dma[dev]);
-
-	/*
-	 * Check that the user didn't pass us garbage data ...
-	 */
-	irq_cfg = get_irq_config(sscape->type, irq[dev]);
-	if (irq_cfg == INVALID_IRQ) {
-		dev_err(card->dev, "sscape: Invalid IRQ %d\n", irq[dev]);
-		return -ENXIO;
-	}
-
-	mpu_irq_cfg = get_irq_config(sscape->type, mpu_irq[dev]);
-	if (mpu_irq_cfg == INVALID_IRQ) {
-		dev_err(card->dev, "sscape: Invalid IRQ %d\n", mpu_irq[dev]);
-		return -ENXIO;
-	}
+		 name, sscape->io_base, sscape->irq, sscape->dma1);
 
 	/*
 	 * Tell the on-board devices where their resources are (I think -
 	 * I can't be sure without a datasheet ... So many magic values!)
 	 */
-	scoped_guard(spinlock_irqsave, &sscape->lock) {
-
-		sscape_write_unsafe(sscape->io_base, GA_SMCFGA_REG, 0x2e);
-		sscape_write_unsafe(sscape->io_base, GA_SMCFGB_REG, 0x00);
-
-		/*
-		 * Enable and configure the DMA channels ...
-		 */
-		sscape_write_unsafe(sscape->io_base, GA_DMACFG_REG, 0x50);
-		dma_cfg = (sscape->ic_type == IC_OPUS ? 0x40 : 0x70);
-		sscape_write_unsafe(sscape->io_base, GA_DMAA_REG, dma_cfg);
-		sscape_write_unsafe(sscape->io_base, GA_DMAB_REG, 0x20);
-
-		mpu_irq_cfg |= mpu_irq_cfg << 2;
-		val = sscape_read_unsafe(sscape->io_base, GA_HMCTL_REG) & 0xF7;
-		if (joystick[dev])
-			val |= 8;
-		sscape_write_unsafe(sscape->io_base, GA_HMCTL_REG, val | 0x10);
-		sscape_write_unsafe(sscape->io_base, GA_INTCFG_REG, 0xf0 | mpu_irq_cfg);
-		sscape_write_unsafe(sscape->io_base,
-				    GA_CDCFG_REG, 0x09 | DMA_8BIT
-				    | (dma[dev] << 4) | (irq_cfg << 1));
-		/*
-		 * Enable the master IRQ ...
-		 */
-		sscape_write_unsafe(sscape->io_base, GA_INTENA_REG, 0x80);
-
+	err = sscape_configure_board(sscape);
+	if (err < 0) {
+		dev_err(card->dev, "sscape: Invalid IRQ configuration\n");
+		return err;
 	}
 
 	/*
 	 * We have now enabled the codec chip, and so we should
 	 * detect the AD1845 device ...
 	 */
-	err = create_ad1845(card, wss_port[dev], irq[dev],
-			    dma[dev], dma2[dev]);
+	err = create_ad1845(card, sscape->wss_base, sscape->irq,
+			    sscape->dma1, sscape->dma2);
 	if (err < 0) {
 		dev_err(card->dev,
 			"sscape: No AD1845 device at 0x%lx, IRQ %d\n",
-			wss_port[dev], irq[dev]);
+			sscape->wss_base, sscape->irq);
 		return err;
 	}
 	strscpy(card->driver, "SoundScape");
@@ -1040,35 +1093,21 @@ static int create_sscape(int dev, struct snd_card *card)
 			err = sscape_upload_microcode(card, err);
 
 		if (err == 0) {
-			err = create_mpu401(card, MIDI_DEVNUM, port[dev],
-					    mpu_irq[dev]);
+			err = create_mpu401(card, MIDI_DEVNUM, sscape->io_base,
+					    sscape->mpu_irq);
 			if (err < 0) {
 				dev_err(card->dev,
 					"sscape: Failed to create MPU-401 device at 0x%lx\n",
-					port[dev]);
+					(unsigned long)sscape->io_base);
 				return err;
 			}
 
-			/*
-			 * Initialize mixer
-			 */
-			guard(spinlock_irqsave)(&sscape->lock);
 			sscape->midi_vol = 0;
-			host_write_ctrl_unsafe(sscape->io_base,
-						CMD_SET_MIDI_VOL, 100);
-			host_write_ctrl_unsafe(sscape->io_base,
-						sscape->midi_vol, 100);
-			host_write_ctrl_unsafe(sscape->io_base,
-						CMD_XXX_MIDI_VOL, 100);
-			host_write_ctrl_unsafe(sscape->io_base,
-						sscape->midi_vol, 100);
-			host_write_ctrl_unsafe(sscape->io_base,
-						CMD_SET_EXTMIDI, 100);
-			host_write_ctrl_unsafe(sscape->io_base,
-						0, 100);
-			host_write_ctrl_unsafe(sscape->io_base, CMD_ACK, 100);
-
-			set_midi_mode_unsafe(sscape->io_base);
+			err = sscape_restore_midi_state(sscape);
+			if (err < 0)
+				dev_warn(card->dev,
+					 "sscape: MIDI init incomplete: %d\n",
+					 err);
 		}
 	}
 
@@ -1111,8 +1150,9 @@ static int snd_sscape_probe(struct device *pdev, unsigned int dev)
 	sscape->type = SSCAPE;
 
 	dma[dev] &= 0x03;
+	sscape_store_settings(sscape, dev);
 
-	ret = create_sscape(dev, card);
+	ret = create_sscape(card);
 	if (ret < 0)
 		return ret;
 
@@ -1130,7 +1170,6 @@ static int snd_sscape_probe(struct device *pdev, unsigned int dev)
 static struct isa_driver snd_sscape_driver = {
 	.match		= snd_sscape_match,
 	.probe		= snd_sscape_probe,
-	/* FIXME: suspend/resume */
 	.driver		= {
 		.name	= DEV_NAME
 	},
@@ -1211,8 +1250,9 @@ static int sscape_pnp_detect(struct pnp_card_link *pcard,
 		wss_port[idx] = pnp_port_start(dev, 1);
 		dma2[idx] = pnp_dma(dev, 1);
 	}
+	sscape_store_settings(sscape, idx);
 
-	ret = create_sscape(idx, card);
+	ret = create_sscape(card);
 	if (ret < 0)
 		return ret;
 

-- 
2.53.0

