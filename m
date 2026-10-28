Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793212426;
	b=JSyzQDjG2rUR2aQKauyokSEF+OKWz/PzQi8T9BDLPycw7S0eyxrw2h5VKrfYIAQwGClC
	 KUiA6D0GOMsIYsVa7GHRzWhZSk60dY9pX+rL3PxUXZJyzA9m66TWbHOMARQ5+KhTAkeKO
	 EF7NEoN9WYqnDCYlruytav82sH7BTnuXPnUSMcoYDTb4GG1STzOPqc79IKEHw5Jt5FR23
	 Wp4VYp1mBCt44Ly3gXYaecsUF2CN4EpdpikeioMspYzEgLKdVEho34CNIACoc4V9sUs7V
	 GYV7dR1NLylvfxw1NE2lLFHB0JSfAhMnsW9UJ33Y7FsEOPo/eEpZxLj4rNF3c8wSXpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793212426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ngyWFIp9b2RI1L29HXSmCYoH/auDdUsZs2KU+zvgTBU=;
	b=F6if4Ci4ApTnQtMO2YI18+y0rxftVUGmHaH2AveQ39v6g4nKxJk1FjEmdl24c91fA3rL
	 ziVho4maxn96lxjttEbfqZDIen/KrhY8BsJ9VYxHHSPIQSakcNFI2ZZB3Wst/DRDuWZCk
	 73kEBImccbMIsZQcR5quyxCDC6OSgN+B1hWNdRRinOFsyHNwlVPkXa0ikOeciA8wPdYXL
	 E0xxbJI32k0C1v752SNf25roT7rp9R3Ikq6KIVWclFGH0mvDbJUdE9t8LrbBdFvJ56rYs
	 l+D9y4Q5kUWZ5w8W+MMTzMm+S/fCmr0jRqTCTzpgwoBk+1IItnJQPj32t7syaeA+WXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E6KTi3Hb;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E48606A31E
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 18:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E48606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E6KTi3Hb
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a210470b49so10684075e9.2
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 11:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793212425; x=1793817225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngyWFIp9b2RI1L29HXSmCYoH/auDdUsZs2KU+zvgTBU=;
        b=E6KTi3HbAS98a5UwjkBuOqLX7zCM/TgIGqtqSquFml1qyig12JfceHJCdtlNQtwwUS
         OP/VpDAtSnFj8o8Z6xkbI8JIoujqalxj1geeeEGtzN+bndprnr0evBkoJh1jFaDtxAGa
         cnlWVeW3KPn2gPL+jkBiNWaU2B6DN7znpm3F0i42L48DtCW3B/LDggf8iHziPsThPaXE
         T/T1p7IfrYDMJGNy7yeen0Mufd3xfQ6GcNbBDbdkYO5KJYq3s2lKOQuSoou9SsfsIwsJ
         i6lBxFktXuXd4OScLkbp+7b85u+1Hy6kfEk0q7GdRl7Ue4QLuzX35kaTrZ/XBjxF3YSL
         ZUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793212425; x=1793817225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ngyWFIp9b2RI1L29HXSmCYoH/auDdUsZs2KU+zvgTBU=;
        b=dWE4WGCm1xRXI+GyectwN9wzuaHzTziKoraZwT7edhhmfHB0d+PKzGCg7HlO/NKfli
         U+2ssLsY8/trsFUHosRyzwuQQZ0RteldDTLH7tQZF44GcldY8KfHB17/AZcHWMfwi0bs
         KmC3oRx9/NGwHOAz+UKtyrj/XCi/hvFTLvc4tLV7V7Tioui7cmbk6tkJmkKCQIjdizZd
         PKbDCQKcuFvlqX4jSk1rjeSXI1EdyLK8r+dUSmOUIz8w0eJNbf8KTAScJFR3xeFGvZiK
         8Lk+tPkUtutmQXPjhphqzufdj/FBts1b0y3km0aqSnG6zyv3R4PD01VOqFNn1MR8A3hp
         sPvw==
X-Gm-Message-State: AFq9FYJiux2/cvWuK7dF+Ov0M7UwScFZSfDSroDSSyLjkxykP6gmjwaV
	0/bk2c3q1wytZagmZf3pJNsdCVGSRYRx6o+H1aZt0lK8bs6aPtYObmFg+czabHIeC3M=
X-Gm-Gg: AYBFou2Hj5XrvEOPe10d5Bg1CqxpH0oZNRByIHzsPamv5xa1tyRpjUWS4aE8s6fgnNB
	yTFza8AzRRPZs9kGsRy7MkzxUzJW0ydLbA9FmKSGx7AtXU1AKzAPon2iGTLqDxqO0al4Uj67H1u
	DBOr65B1RiZRmgCocXO5d5Am4VRekezfIGtbm6bmpSRtJEweX40jtxgIzuVnCAh4xx2rgxKiH/s
	jOngTOSGhJD9WDI2laNNNDbabpVMDRGO33/9Lyab66prPqQQjHGehcVuifIk4VKZ6JY1sxxzjfh
	OMk/FXOLVIJAxk1gWYNfs8e391o7ZPkbioJOT2FyNp7due+xtLk66Z+5RA7Tx4n2CmRi3P6W6Fa
	jVZmRvBRMvp9YlGfU7UAynZUk0q5qEUEZg+vgz6bU2Y4DckpOYgKKPDWdo8Zd0BQ/F//qCFSm2Y
	7q8HopkZ6J8pPYFN3U6lFRlWr4y749cZFd9pDaQzX1QwbLW1N5vgjXp42vEdFxLXywCvMB95BEb
	IJWpe3MabSRdjx5i6+JzNaLzP5qZinoDaybEROZmLdmvBMctMO/MbowuBcSBVdvH767xm/4otJL
	Gb6GC3C2HyI21Yzx8eveyrINx4CJnOP+8Ee4mSDCL1D7rMiEXPpK64iN++kN6zZ2pC/4XtR/n5k
	pb0eqkT4=
X-Received: by 2002:a05:600c:154a:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4a9660b5e35mr74056685e9.9.1793212424592;
        Wed, 28 Oct 2026 11:33:44 -0700 (PDT)
Received: from gmail.com (dynamic-adsl-84-221-247-128.clienti.tiscali.it. [84.221.247.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f52e2sm11723035e9.9.2026.10.28.11.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:33:44 -0700 (PDT)
From: Davide Gironi <davide.gironi@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	Davide Gironi <davide.gironi@gmail.com>
Subject: [PATCH v2 2/2] ALSA: ice1712: add TerraTec PHASE 88 support
Date: Wed, 28 Oct 2026 19:24:10 +0100
Message-ID: <20261028183155.787599-3-davide.gironi@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028183155.787599-1-davide.gironi@gmail.com>
References: <87y0bk6gfn.wl-tiwai@suse.de>
 <20261028183155.787599-1-davide.gironi@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handle PHASE 88-specific expander, EEPROM, control, and MIDI behavior
in the EWS driver. Use a distinct TS88 model name and preserve the
expander state when a write fails.

Assisted-by: Pi:gpt-6-luna
Signed-off-by: Davide Gironi <davide.gironi@gmail.com>
---
 sound/pci/ice1712/ews.c | 141 +++++++++++++++++++++++++++++++++++++---
 sound/pci/ice1712/ews.h |   7 ++
 2 files changed, 138 insertions(+), 10 deletions(-)

diff --git a/sound/pci/ice1712/ews.c b/sound/pci/ice1712/ews.c
index 62574c3..5a44bfa 100644
--- a/sound/pci/ice1712/ews.c
+++ b/sound/pci/ice1712/ews.c
@@ -32,6 +32,8 @@ enum {
 /* additional i2c devices for EWS boards */
 struct ews_spec {
 	struct snd_i2c_device *i2cdevs[3];
+	unsigned char pcf8575_data;	/* PHASE 88: shadow of the chip select byte */
+	unsigned char pcf8575_input;	/* PHASE 88: shadow of the input select byte */
 };
 
 /*
@@ -128,12 +130,94 @@ static struct snd_i2c_bit_ops snd_ice1712_ewx_cs8427_bit_ops = {
  * AK4524 access
  */
 
+/* The PHASE 88 chip-select expander is write-only; keep a shadow value. */
+/* The bit-banged bus takes gpio_mutex internally; don't hold it here. */
+static int snd_ice1712_phase88_write(struct snd_ice1712 *ice,
+				     unsigned char page, unsigned char value)
+{
+	struct ews_spec *spec = ice->spec;
+	unsigned char bytes[2];
+	int err;
+
+	bytes[0] = page;
+	bytes[1] = value;
+	snd_i2c_lock(ice->i2c);
+	err = snd_i2c_sendbytes(spec->i2cdevs[EWS_I2C_PCF2], bytes, 2);
+	snd_i2c_unlock(ice->i2c);
+	if (err != 2) {
+		dev_err(ice->card->dev,
+			"PHASE 88 expander write failed (page 0x%02x, addr 0x%02x, err %d)\n",
+			page, spec->i2cdevs[EWS_I2C_PCF2]->addr, err);
+		return -EIO;
+	}
+	return 0;
+}
+
+static int snd_ice1712_phase88_chip_select(struct snd_ice1712 *ice, int chip_mask)
+{
+	struct ews_spec *spec = ice->spec;
+	unsigned char data;
+	int err;
+
+	if (snd_BUG_ON(chip_mask < 0 || chip_mask > 0x0f))
+		return -EINVAL;
+	data = (spec->pcf8575_data & 0xf0) | chip_mask;
+	err = snd_ice1712_phase88_write(ice, ICE1712_PHASE88_OUTPUT_PAGE,
+					data);
+	if (err >= 0)
+		spec->pcf8575_data = data;
+	return err;
+}
+
+/* PHASE 88 Line/Mic bits are ordered 7/8 to 1/2 (0x10 to 0x80). */
+static int snd_ice1712_phase88_linemic_get(struct snd_kcontrol *kcontrol,
+					   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_ice1712 *ice = snd_kcontrol_chip(kcontrol);
+	struct ews_spec *spec = ice->spec;
+
+	ucontrol->value.integer.value[0] =
+		!!(spec->pcf8575_input & (0x80 >> kcontrol->private_value));
+	return 0;
+}
+
+static int snd_ice1712_phase88_linemic_put(struct snd_kcontrol *kcontrol,
+					   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_ice1712 *ice = snd_kcontrol_chip(kcontrol);
+	struct ews_spec *spec = ice->spec;
+	unsigned char bit = 0x80 >> kcontrol->private_value;
+	unsigned char val = ucontrol->value.integer.value[0] ?
+		spec->pcf8575_input | bit : spec->pcf8575_input & ~bit;
+	int err;
+
+	if (val == spec->pcf8575_input)
+		return 0;
+	err = snd_ice1712_phase88_write(ice, ICE1712_PHASE88_INPUT_PAGE, val);
+	if (err < 0)
+		return err;
+	spec->pcf8575_input = val;
+	return 1;
+}
+
+static const struct snd_kcontrol_new snd_ice1712_phase88_linemic_ctl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "Line/Mic 7/8 Switch",
+	.info = snd_ctl_boolean_mono_info,
+	.get = snd_ice1712_phase88_linemic_get,
+	.put = snd_ice1712_phase88_linemic_put,
+	.private_value = 3,		/* bit 0x10: the pair nothing else drives */
+};
+
 /* AK4524 chip select; address 0x48 bit 0-3 */
 static int snd_ice1712_ews88mt_chip_select(struct snd_ice1712 *ice, int chip_mask)
 {
 	struct ews_spec *spec = ice->spec;
 	unsigned char data, ndata;
 
+	if (ice->eeprom.subvendor == ICE1712_SUBDEVICE_PHASE88)
+		return snd_ice1712_phase88_chip_select(ice, chip_mask);
+
 	if (snd_BUG_ON(chip_mask < 0 || chip_mask > 0x0f))
 		return -EINVAL;
 	snd_i2c_lock(ice->i2c);
@@ -458,9 +542,31 @@ static int snd_ice1712_ews_init(struct snd_ice1712 *ice)
 		}
 		snd_ice1712_6fire_write_pca(ice, PCF9554_REG_CONFIG, 0x80);
 		break;
+	case ICE1712_SUBDEVICE_PHASE88:
+		err = snd_i2c_device_create(ice->i2c, "CS8404",
+					    ICE1712_EWS88MT_CS8404_ADDR,
+					    &spec->i2cdevs[EWS_I2C_CS8404]);
+		if (err < 0)
+			return err;
+		err = snd_i2c_device_create(ice->i2c, "Output expander",
+					    ICE1712_PHASE88_OUTPUT_ADDR,
+					    &spec->i2cdevs[EWS_I2C_PCF2]);
+		if (err < 0)
+			return err;
+		spec->pcf8575_data = ICE1712_PHASE88_OUTPUT_INIT;
+		/* Check if the chip select expander is present */
+		err = snd_ice1712_ews88mt_chip_select(ice, 0x0f);
+		if (err < 0)
+			return err;
+		/* Clear the input register before codec setup. */
+		spec->pcf8575_input = ICE1712_PHASE88_INPUT_INIT;
+		err = snd_ice1712_phase88_write(ice, ICE1712_PHASE88_INPUT_PAGE,
+						spec->pcf8575_input);
+		if (err < 0)
+			return err;
+		break;
 	case ICE1712_SUBDEVICE_EWS88MT:
 	case ICE1712_SUBDEVICE_EWS88MT_NEW:
-	case ICE1712_SUBDEVICE_PHASE88:
 	case ICE1712_SUBDEVICE_TS88:
 
 		err = snd_i2c_device_create(ice->i2c, "CS8404",
@@ -982,9 +1088,15 @@ static int snd_ice1712_ews_add_controls(struct snd_ice1712 *ice)
 				return err;
 		}
 		break;
+	case ICE1712_SUBDEVICE_PHASE88:
+		/* The PHASE 88 has no EWS88MT sensitivity controls. */
+		err = snd_ctl_add(ice->card,
+				  snd_ctl_new1(&snd_ice1712_phase88_linemic_ctl, ice));
+		if (err < 0)
+			return err;
+		break;
 	case ICE1712_SUBDEVICE_EWS88MT:
 	case ICE1712_SUBDEVICE_EWS88MT_NEW:
-	case ICE1712_SUBDEVICE_PHASE88:
 	case ICE1712_SUBDEVICE_TS88:
 		err = snd_ctl_add(ice->card, snd_ctl_new1(&snd_ice1712_ews88mt_input_sense, ice));
 		if (err < 0)
@@ -1014,13 +1126,21 @@ static int snd_ice1712_ews_add_controls(struct snd_ice1712 *ice)
 
 static int snd_ice1712_ews_eeprom_init(struct snd_ice1712 *ice)
 {
-	if (ice->eeprom.subvendor == ICE1712_SUBDEVICE_DMX6FIRE &&
-	    !ice->dxr_enable) {
-		/* Set EEPROM value to limit active ADCs and DACs to 6;
-		 * also disable AC'97 as no hardware in standard 6fire card/box.
-		 * DXR extensions are not currently supported.
-		 */
-		ice->eeprom.data[ICE_EEP1_CODEC] = 0x3a;
+	switch (ice->eeprom.subvendor) {
+	case ICE1712_SUBDEVICE_DMX6FIRE:
+		if (!ice->dxr_enable) {
+			/* Limit active ADCs and DACs to 6, and disable AC'97
+			 * as the standard 6fire card/box has no hardware for it.
+			 */
+			ice->eeprom.data[ICE_EEP1_CODEC] = 0x3a;
+		}
+		break;
+	case ICE1712_SUBDEVICE_PHASE88:
+		/* No consumer AC'97 codec on PHASE 88. */
+		ice->eeprom.data[ICE_EEP1_CODEC] |= ICE1712_CFG_NO_CON_AC97;
+		/* Enable the rear MIDI UART. */
+		ice->eeprom.data[ICE_EEP1_CODEC] |= ICE1712_CFG_2xMPU401;
+		break;
 	}
 	return 0;
 }
@@ -1052,13 +1172,14 @@ struct snd_ice1712_card_info snd_ice1712_ews_cards[] = {
 		.subvendor = ICE1712_SUBDEVICE_PHASE88,
 		.name = "TerraTec Phase88",
 		.model = "phase88",
+		.eeprom_init = snd_ice1712_ews_eeprom_init,
 		.chip_init = snd_ice1712_ews_init,
 		.build_controls = snd_ice1712_ews_add_controls,
 	},
 	{
 		.subvendor = ICE1712_SUBDEVICE_TS88,
 		.name = "terrasoniq TS88",
-		.model = "phase88",
+		.model = "ts88",
 		.chip_init = snd_ice1712_ews_init,
 		.build_controls = snd_ice1712_ews_add_controls,
 	},
diff --git a/sound/pci/ice1712/ews.h b/sound/pci/ice1712/ews.h
index aec8dc6..064675a 100644
--- a/sound/pci/ice1712/ews.h
+++ b/sound/pci/ice1712/ews.h
@@ -58,6 +58,13 @@ extern struct snd_ice1712_card_info snd_ice1712_ews_cards[];
 #define ICE1712_EWS88MT_OUTPUT_SENSE	0x40	/* mask */
 #define ICE1712_EWS88D_PCF_ADDR		(0x40>>1)
 
+/* TerraTec PHASE 88 configuration definitions */
+#define ICE1712_PHASE88_OUTPUT_ADDR	(0x42>>1)
+#define ICE1712_PHASE88_OUTPUT_PAGE	0x01	/* output register */
+#define ICE1712_PHASE88_OUTPUT_INIT	0x20	/* initial output state */
+#define ICE1712_PHASE88_INPUT_PAGE	0x03	/* input register */
+#define ICE1712_PHASE88_INPUT_INIT	0x00	/* line inputs */
+
 /* TerraTec DMX 6Fire configuration definitions */
 #define ICE1712_6FIRE_AK4524_CS_MASK	0x07	/* AK4524 chip select #1-#3 */
 #define ICE1712_6FIRE_RW		0x08	/* read/write switch for i2c; high = write  */
