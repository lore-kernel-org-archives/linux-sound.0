Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD2D1FDE31
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 01:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775524948; cv=none; b=YFVJYAuKD/CGVXYN0pDasBbzmcNi2XPS/gE7cZxAgjR9tTKxOZPEJVBPVEWjYFcHlrjY2FgZ3rYJYrIow6+CeHUIzhLRI7m1IeoGREw4EN6zHkLSsIFJB0FbW9ujI8psm7izXiUmBnmaBpLrxpC2h+hyWaoqTjGl4Vw9KLuCO2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775524948; c=relaxed/simple;
	bh=4Y9CqXMn8U69M84oxZ10Kqm4IkJzKs8xnoSjmQa3AR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eaQUXXwOTtyPMxPB3X+akQ2VSuGPoZQZFe4mzCDugAFM5hjOe+feH89KhpYxhHJl+9SF/SsuthR//vi1g3OSuj+EBmL5Cicktdm88JCxKDeDwu2OXHcrMlBtDYjxHsttWAtcKKkASBdpiaQeQD/Mhhp5X404iyA3/+eDTwPzJ/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxbrazC9; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxbrazC9"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c0b72dac7so1834678c88.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Apr 2026 18:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775524945; x=1776129745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XQbGkefogy11J2Mc9HHAVdzevhbE9LurfcwHxWmPT0=;
        b=hxbrazC9mU6WeT+o2RquzOdK/m+tcBNlN+8WR3HFZpVG1ZH9yaIIqxBdh9e26Fjr0+
         n4Vlj2GEmQuR1RqqHvAr3vtlEUZ5jEYpkERIGbXTG5Im7iB98xT4K+Bqz4vHqtDEakm8
         xNCrmc3eh08WG2HAfQ6IC0iwDghRmbqfcrrrOlPl1OOoFOxzWUPWcZJKVip/qmVdUqR2
         j10yofzkTmdnM0ktZWoPYVCapoSYwmSnaQuYIPsU4gMDzE66mVf4be4GIcAw0CWZhmWf
         eksP+lQ5+k59tWALoZ2TWaYunpvvjc61NorrRuWzwiY16PcAVvPEWPVfPwv6oZfuiCVQ
         ab9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775524945; x=1776129745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8XQbGkefogy11J2Mc9HHAVdzevhbE9LurfcwHxWmPT0=;
        b=pbVYhhwf8xP+dvKaUV76tycbInLl2oTyU6JkDABnKf13+MbXtPxX0FJTgZkuhlqyit
         cEsYFagjdm/n3qqRTYAj1sH1/EmJ3+GilkkHxrX2Csfd64rN6IYZOuCHiDu56B1tVsMa
         hsExZLtSR8io7WPMdg35S94qipz6MD/SVSvPXnsRuFkjPw0AsBtIBmQq1ax9fD8Wukql
         +xUfZp5UPTW6/bGgWt3L/JEG9GJ592MdfcK7AVETU4uNXSTDm7CFZuzHuVcOAf62yH33
         kmeOyxTGv/Aia2fPGL1/XSMUziPFsxOKSsJlyIUKnQZe5x7WfzhNmIruqwSLjCGGWjMI
         0Chg==
X-Gm-Message-State: AOJu0Yw6DN7PyLNXuFJXdg75r+zObrYPm+7VsxLr1ggP2oRBColLOh9g
	3QjGtVtIqEZhEeJ9dtdoI0VCoJjv6jhkf/Du7GMwSGJoOYsVClquY42GMd04+w==
X-Gm-Gg: AeBDieunFJ5/qwKpfizBJuZctaPAWf6PE/mlnKNgKj+5VIZkyBYeaSO2a3kjN9E3m+c
	54OS2VvAewiDRymnVqfK9U27c5KnC4CGEygf3Wa1yroFqLaZuVfTai1sWtd4EjHW7x12wYE1OHp
	xmqdHWJU+HIgOFHaHlkyEk3WfB7nXW6x0Zd2/KaT3rbUOv3P2r2br7WuTXtysRUpArhVCNy77YF
	xgI4ULg+l78zbs+0Sc6eqsfun7IYkrb2u+xgGD3cdrZzfwnGpnn8Jzt6eOJ3/1rcwAwNe/50Rpw
	7h2MrmxYQcsHuvjT4KzDI5V7CcK2amW6kiy8Lhv+Prhc34qaQCAS5jG4/wrUg7HDrGczhRRuPFc
	ZID3u+mmrcYrXUKDnyPlk/cMI25stSeKn64TZkNCe7MJ+Dd4iyrp3svMrcoWcQFNwiL5h5rWLxC
	6o4be6xcidf8b0Y1xF8CieVt56netnD84dPkzZCtsq60eyLuvBJQ5nU2F1yLTD9/3koDNqOg7cZ
	R5/
X-Received: by 2002:a05:7022:260b:b0:119:e56c:18b3 with SMTP id a92af1059eb24-12bfb775a39mr6718210c88.27.1775524944460;
        Mon, 06 Apr 2026 18:22:24 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede7f542sm13098567c88.14.2026.04.06.18.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 18:22:24 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 06 Apr 2026 22:22:08 -0300
Subject: [PATCH 2/2] ALSA: interwave: add ISA and PnP suspend and resume
 callbacks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-alsa-interwave-pm-v1-2-6ffa6f317c8f@gmail.com>
References: <20260406-alsa-interwave-pm-v1-0-6ffa6f317c8f@gmail.com>
In-Reply-To: <20260406-alsa-interwave-pm-v1-0-6ffa6f317c8f@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9075;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=4Y9CqXMn8U69M84oxZ10Kqm4IkJzKs8xnoSjmQa3AR0=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlXYjx0LgmdVnhh6mx/zWKu3ByZ9Stb0tc6az57uctGy
 rnR4zRzRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEzEsJnhr/jChuBUmyffVR7c
 eZ5ss9n88yLmhzUPbq7pncPMlPAoJ4nhf8TSnFwhA6+7d1e+/HFY4tDJ1mmCn7ylPRwO57wLtzu
 qxAEA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

interwave still leaves both its ISA and PnP PM callbacks disabled even
though the shared GUS suspend and resume path now exists.

This board needs InterWave-specific glue around the shared GUS PM path.
The attached WSS codec has its own register image that must be saved and
restored across suspend, the InterWave-specific GF1 compatibility,
decode, MPU401, and emulation settings must be rewritten after the
shared GF1 resume path reinitializes the chip, and the probe-detected
InterWave memory layout must be restored without rerunning the
destructive DRAM/ROM detection path.

Track the optional STB TEA6330T bus at probe time, restore its cached
mixer state after resume, add resume-safe helpers for the InterWave
register and memory-configuration state, and wire both the ISA and PnP
front-ends up to the shared GUS PM helpers.

The resume path intentionally restores only the cached hardware setup.
It does not attempt to preserve sample RAM contents across suspend.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/isa/gus/interwave.c | 178 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 151 insertions(+), 27 deletions(-)

diff --git a/sound/isa/gus/interwave.c b/sound/isa/gus/interwave.c
index 18adcd35e117..616c11e51a2f 100644
--- a/sound/isa/gus/interwave.c
+++ b/sound/isa/gus/interwave.c
@@ -96,6 +96,7 @@ struct snd_interwave {
 	struct snd_gus_card *gus;
 	struct snd_wss *wss;
 #ifdef SNDRV_STB
+	struct snd_i2c_bus *i2c_bus;
 	struct resource *i2c_res;
 #endif
 	unsigned short gus_status_reg;
@@ -363,18 +364,30 @@ struct rom_hdr {
 	/* 511 */ unsigned char csum;
 };
 
-static void snd_interwave_detect_memory(struct snd_gus_card *gus)
+static const unsigned int snd_interwave_memory_configs[] = {
+	0x00000001, 0x00000101, 0x01010101, 0x00000401,
+	0x04040401, 0x00040101, 0x04040101, 0x00000004,
+	0x00000404, 0x04040404, 0x00000010, 0x00001010,
+	0x10101010
+};
+
+static int snd_interwave_find_memory_config(unsigned int lmct)
 {
-	static const unsigned int lmc[13] =
-	{
-		0x00000001, 0x00000101, 0x01010101, 0x00000401,
-		0x04040401, 0x00040101, 0x04040101, 0x00000004,
-		0x00000404, 0x04040404, 0x00000010, 0x00001010,
-		0x10101010
-	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(snd_interwave_memory_configs); i++) {
+		if (lmct == snd_interwave_memory_configs[i])
+			return i;
+	}
+
+	return -EINVAL;
+}
 
+static void snd_interwave_detect_memory(struct snd_gus_card *gus)
+{
 	int bank_pos, pages;
 	unsigned int i, lmct;
+	int lmc_cfg;
 	int psizes[4];
 	unsigned char iwave[8];
 	unsigned char csum;
@@ -399,17 +412,20 @@ static void snd_interwave_detect_memory(struct snd_gus_card *gus)
 #if 0
 		dev_dbg(gus->card->dev, "lmct = 0x%08x\n", lmct);
 #endif
-		for (i = 0; i < ARRAY_SIZE(lmc); i++)
-			if (lmct == lmc[i]) {
+		lmc_cfg = snd_interwave_find_memory_config(lmct);
+		if (lmc_cfg >= 0) {
 #if 0
-				dev_dbg(gus->card->dev, "found !!! %i\n", i);
+			dev_dbg(gus->card->dev, "found !!! %i\n", lmc_cfg);
 #endif
-				snd_gf1_write16(gus, SNDRV_GF1_GW_MEMORY_CONFIG, (snd_gf1_look16(gus, SNDRV_GF1_GW_MEMORY_CONFIG) & 0xfff0) | i);
-				snd_interwave_bank_sizes(gus, psizes);
-				break;
-			}
-		if (i >= ARRAY_SIZE(lmc) && !gus->gf1.enh_mode)
-			 snd_gf1_write16(gus, SNDRV_GF1_GW_MEMORY_CONFIG, (snd_gf1_look16(gus, SNDRV_GF1_GW_MEMORY_CONFIG) & 0xfff0) | 2);
+			snd_gf1_write16(gus, SNDRV_GF1_GW_MEMORY_CONFIG,
+					(snd_gf1_look16(gus, SNDRV_GF1_GW_MEMORY_CONFIG) & 0xfff0) |
+					lmc_cfg);
+			snd_interwave_bank_sizes(gus, psizes);
+		} else if (!gus->gf1.enh_mode) {
+			snd_gf1_write16(gus, SNDRV_GF1_GW_MEMORY_CONFIG,
+					(snd_gf1_look16(gus, SNDRV_GF1_GW_MEMORY_CONFIG) & 0xfff0) |
+					2);
+		}
 		for (i = 0; i < 4; i++) {
 			gus->gf1.mem_alloc.banks_8[i].address =
 			    gus->gf1.mem_alloc.banks_16[i].address = i << 22;
@@ -454,24 +470,66 @@ static void snd_interwave_detect_memory(struct snd_gus_card *gus)
 		snd_interwave_reset(gus);
 }
 
+static void __snd_interwave_restore_regs(struct snd_gus_card *gus)
+{
+	snd_gf1_write8(gus, SNDRV_GF1_GB_COMPATIBILITY, 0x1f);
+	snd_gf1_write8(gus, SNDRV_GF1_GB_DECODE_CONTROL, 0x49);
+	snd_gf1_write8(gus, SNDRV_GF1_GB_VERSION_NUMBER, 0x11);
+	snd_gf1_write8(gus, SNDRV_GF1_GB_MPU401_CONTROL_A, 0x00);
+	snd_gf1_write8(gus, SNDRV_GF1_GB_MPU401_CONTROL_B, 0x30);
+	snd_gf1_write8(gus, SNDRV_GF1_GB_EMULATION_IRQ, 0x00);
+}
+
+static void snd_interwave_restore_regs(struct snd_gus_card *gus)
+{
+	scoped_guard(spinlock_irqsave, &gus->reg_lock)
+		__snd_interwave_restore_regs(gus);
+}
+
+static void snd_interwave_restore_memory(struct snd_gus_card *gus)
+{
+	unsigned short mem_cfg;
+	unsigned int lmct = 0;
+	int i, lmc_cfg;
+
+	if (!gus->gf1.memory)
+		return;
+
+	for (i = 0; i < 4; i++)
+		lmct |= (gus->gf1.mem_alloc.banks_16[i].size >> 18) << (i * 8);
+
+	lmc_cfg = snd_interwave_find_memory_config(lmct);
+	if (lmc_cfg < 0) {
+		if (!gus->gf1.enh_mode) {
+			lmc_cfg = 2;
+		} else {
+			dev_warn(gus->card->dev,
+				 "cannot restore InterWave memory layout 0x%08x\n",
+				 lmct);
+			return;
+		}
+	}
+
+	scoped_guard(spinlock_irqsave, &gus->reg_lock) {
+		mem_cfg = snd_gf1_look16(gus, SNDRV_GF1_GW_MEMORY_CONFIG);
+		mem_cfg = (mem_cfg & 0xfff0) | lmc_cfg;
+		mem_cfg = (mem_cfg & 0xff1f) | (4 << 5);
+		snd_gf1_write16(gus, SNDRV_GF1_GW_MEMORY_CONFIG, mem_cfg);
+	}
+}
+
 static void snd_interwave_init(int dev, struct snd_gus_card *gus)
 {
-	/* ok.. some InterWave specific initialization */
+	/* Probe-time setup also clears the timer control register. */
 	scoped_guard(spinlock_irqsave, &gus->reg_lock) {
 		snd_gf1_write8(gus, SNDRV_GF1_GB_SOUND_BLASTER_CONTROL, 0x00);
-		snd_gf1_write8(gus, SNDRV_GF1_GB_COMPATIBILITY, 0x1f);
-		snd_gf1_write8(gus, SNDRV_GF1_GB_DECODE_CONTROL, 0x49);
-		snd_gf1_write8(gus, SNDRV_GF1_GB_VERSION_NUMBER, 0x11);
-		snd_gf1_write8(gus, SNDRV_GF1_GB_MPU401_CONTROL_A, 0x00);
-		snd_gf1_write8(gus, SNDRV_GF1_GB_MPU401_CONTROL_B, 0x30);
-		snd_gf1_write8(gus, SNDRV_GF1_GB_EMULATION_IRQ, 0x00);
+		__snd_interwave_restore_regs(gus);
 	}
 	gus->equal_irq = 1;
 	gus->codec_flag = 1;
 	gus->interwave = 1;
 	gus->max_flag = 1;
 	gus->joystick_dac = joystick_dac[dev];
-
 }
 
 static const struct snd_kcontrol_new snd_interwave_controls[] = {
@@ -724,6 +782,7 @@ static int snd_interwave_probe(struct snd_card *card, int dev,
 		err = snd_tea6330t_update_mixer(card, i2c_bus, 0, 1);
 		if (err < 0)
 			return err;
+		iwcard->i2c_bus = i2c_bus;
 	}
 #endif
 
@@ -828,10 +887,59 @@ static int snd_interwave_isa_probe(struct device *pdev,
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int snd_interwave_card_suspend(struct snd_card *card)
+{
+	struct snd_interwave *iwcard = card->private_data;
+
+	iwcard->wss->suspend(iwcard->wss);
+	return snd_gus_suspend(iwcard->gus);
+}
+
+static int snd_interwave_card_resume(struct snd_card *card)
+{
+	struct snd_interwave *iwcard = card->private_data;
+	int err;
+
+	err = snd_gus_resume(iwcard->gus);
+	if (err < 0)
+		return err;
+
+	snd_interwave_restore_regs(iwcard->gus);
+	snd_interwave_restore_memory(iwcard->gus);
+	iwcard->wss->resume(iwcard->wss);
+#ifdef SNDRV_STB
+	if (iwcard->i2c_bus) {
+		err = snd_tea6330t_restore_mixer(iwcard->i2c_bus);
+		if (err < 0)
+			dev_warn(card->dev,
+				 "failed to restore TEA6330T mixer state: %d\n",
+				 err);
+	}
+#endif
+
+	return 0;
+}
+
+static int snd_interwave_isa_suspend(struct device *pdev, unsigned int dev,
+				     pm_message_t state)
+{
+	return snd_interwave_card_suspend(dev_get_drvdata(pdev));
+}
+
+static int snd_interwave_isa_resume(struct device *pdev, unsigned int dev)
+{
+	return snd_interwave_card_resume(dev_get_drvdata(pdev));
+}
+#endif
+
 static struct isa_driver snd_interwave_driver = {
 	.match		= snd_interwave_isa_match,
 	.probe		= snd_interwave_isa_probe,
-	/* FIXME: suspend,resume */
+#ifdef CONFIG_PM
+	.suspend	= snd_interwave_isa_suspend,
+	.resume		= snd_interwave_isa_resume,
+#endif
 	.driver		= {
 		.name	= INTERWAVE_DRIVER
 	},
@@ -871,12 +979,28 @@ static int snd_interwave_pnp_detect(struct pnp_card_link *pcard,
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int snd_interwave_pnpc_suspend(struct pnp_card_link *pcard,
+				      pm_message_t state)
+{
+	return snd_interwave_card_suspend(pnp_get_card_drvdata(pcard));
+}
+
+static int snd_interwave_pnpc_resume(struct pnp_card_link *pcard)
+{
+	return snd_interwave_card_resume(pnp_get_card_drvdata(pcard));
+}
+#endif
+
 static struct pnp_card_driver interwave_pnpc_driver = {
 	.flags = PNP_DRIVER_RES_DISABLE,
 	.name = INTERWAVE_PNP_DRIVER,
 	.id_table = snd_interwave_pnpids,
 	.probe = snd_interwave_pnp_detect,
-	/* FIXME: suspend,resume */
+#ifdef CONFIG_PM
+	.suspend	= snd_interwave_pnpc_suspend,
+	.resume		= snd_interwave_pnpc_resume,
+#endif
 };
 
 #endif /* CONFIG_PNP */

-- 
2.53.0

