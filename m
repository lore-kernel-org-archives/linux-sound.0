Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DE436F40E
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 15:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575393; cv=none; b=bHV1E5pXFWR0j2HnK/rdWRhn7HT2gwLW9vkLcOPEyJbdTdTn6ExQ7cP+qgIKEH/8ox4Bitkr8OXWMh0FfWdwcElLAcNk3fAQjBxyk5gjRQ+Pi9FovfUyM3ByzFG38c0EA/Y5zJ2Mtn2Tc9AIxpUVgupx4pxMBczFlSKxBmU502I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575393; c=relaxed/simple;
	bh=4Y9CqXMn8U69M84oxZ10Kqm4IkJzKs8xnoSjmQa3AR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FO1U1EZmDCVgrTHNZ2/eG6CaFzGDvG5/6XSr3wlfIfynlewn7Ym9Hy4CHMXg0exjCbYAXeoPGdw99GAMDNObmKDfCtqf39AEQhASgSW0d/0YfzIdbFc6vhIrdJUwoOtWkNTz4cV21twPCGWJizbAJx08bFMWiecGuTug7JH9TXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJWdggIj; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJWdggIj"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1274204434bso4753249c88.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 08:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775575387; x=1776180187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XQbGkefogy11J2Mc9HHAVdzevhbE9LurfcwHxWmPT0=;
        b=jJWdggIjaludTOEPtMfsJMa9mh8o6nPz3mtRXoNPso7UGd4Wpo5czXAh3BDdM0kM9s
         kRWZuzzJcwjWZRmr/c3HJ6PtbRJp17yDwjaY6cgUq6TYDN1x/kN1AnAglnJ4874myYd1
         KfulnqnYmlJ9Flm183cWx5V6EmDoJM2/Vf3woxuNX8PaxC7aAw3jKYfCEOjepSQaHCLk
         lQ/vLSzRYDFHExpnSYUaFJFwLYTVHgXYRlDvk0lb8baAm4bC02QxDgysKwRNrgo2BiV9
         IkmRWZMAY9kUP30NeYqrbXFxfSD2zAUY+1R9nln3GgNzyMK2jdOc5427BQOO4DYEJQtT
         +/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575387; x=1776180187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8XQbGkefogy11J2Mc9HHAVdzevhbE9LurfcwHxWmPT0=;
        b=lYfsKeYnmONh6QBu5YAWu4Ek6Uw+e0WFfV56eafCnG88e4TiVTQWjLTE6FFraiot87
         wY8YLSC4SwIGKb87WSgr5ovDeFD3FvSqu1JGy9jt1wlDbPq1S0mL9ZMV7hK53he7OHGt
         L9fAOQbiazXjII84uJr79E3/9+/ZEFB65L0nb08q674rKbLHsyoF5v0LABrwbDx/evBm
         I7Hs3ok3el5sEubPLWWP5r8vNsX+8uHBXzx6c2VUqczX02WeGINBNfTUmwHGCijxcDGd
         jy7r+NLcYLDWTWv3C5xcWcb7IlSED4xLbUbFF8Kzez519mMW3pqoQvIfZyw3KbClZS1b
         6WTw==
X-Gm-Message-State: AOJu0YzeXk2WbaKJT8vRO62YzerALbCcVGGJuxgmVjq8DVSwKrSlq8aU
	y1sda6JTwUR5aLHGyyBlq1e4rk+ZP7BlIVCtqD2JASh6+jw+vM63LmiW
X-Gm-Gg: AeBDiev1LmR54gpWtBnMACLopftJadrJ/MOCx02IfJ3hUCSucILA3RfEg/8STMdjdfz
	323jrZOKmaWHzNkwM7UqliGGZCs0LTGiXpDVmqF6di241YRIR98/9BgTpqcIjgnJemvuM/o5It3
	cG1QUBwQmb8umVongnV6X5mubd29advyiY4riwhC5EonzJjEInDnhUtTzN7Xv5WT4XHJ+C1+U21
	0njdBNF+M39jJPjUoRGfSPGiA9xjmuvl7BtCK6GyM/wuCCX5bFZtNYflnt9wqrt8062SbvGx7R0
	XCU0GTD2ewn4sD337+l7auAt7VkdW9GG3H/PigWYUDdLkmLnLL4AI7ZgoSvooFpznq3fmZE8O2n
	YmteTciCj4vWIOSzds9JapFh8D8XMSwZzYntVW0o5bnfz/jEFCkbvUSaA47RXNGGflBJ1fZVVP9
	vi0mR+t1o617RmMAD1KX7dkpYbHm6J05GKXHlRNefgcLkyeDD8s8PgKoVdUYMkW/+8y7k7z4g1I
	35Ndu3xiAIZwpE=
X-Received: by 2002:a05:7022:4591:b0:12a:6abf:ab1c with SMTP id a92af1059eb24-12bfaf4e6b7mr6948722c88.11.1775575386599;
        Tue, 07 Apr 2026 08:23:06 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm20628473c88.0.2026.04.07.08.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:23:06 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 07 Apr 2026 12:22:51 -0300
Subject: [PATCH 3/3] ALSA: interwave: add ISA and PnP suspend and resume
 callbacks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260407-alsa-interwave-pm-v1-3-80da1151f59c@gmail.com>
References: <20260407-alsa-interwave-pm-v1-0-80da1151f59c@gmail.com>
In-Reply-To: <20260407-alsa-interwave-pm-v1-0-80da1151f59c@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9075;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=4Y9CqXMn8U69M84oxZ10Kqm4IkJzKs8xnoSjmQa3AR0=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlXFf2OJCurl09UKtSaov2Ec4bgjail/1Im8h6YNNkzf
 fc1IeGAjlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZjI3XkMf6UPyr/q3P9iSuor
 01vPnQOKOvKNVOxuLjRfvUFufb1GVzrD/zSDd4aK3rtOpz+5WNrkLtkvsbnseqzL0WB21fZFz67
 EMwEA
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

