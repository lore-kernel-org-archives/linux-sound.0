Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DC229ACDD
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 02:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783908540; cv=none; b=Fgt67Xj/54UkVLGmQnCO0DpqjtMXC3lpDxucCt4/A1PaMFRC8XfjgFMq0vGanAY1dlc/eHs/IkwzOU+Yo1ne4pv+6r863mAMqAYjS6mmKL7HrTQzbHyS/lpeqsX3ZmxAqnchpVQiixQz81hWRlu4df7xzKoedtADgLM8gOOsHFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783908540; c=relaxed/simple;
	bh=Do9LmMhnLtZw65zDzHqJ5WhnlKIc2TDahxJpnIp62CY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fMI9Jz7SF5+AV1SmB0+H2tsGPWshFYGauNWWOf3+QKtXqr2ew6g75b1eDHUIlGrY1fErPUqFMApjXilgz1wYlpe9pnRqV973hQKSVZnWrfynoC9WsPHS5FDa69R0oHzXQvaBRaxswvmQSGf7AO0y5m5FeNc+XGM/08UxeLeR+KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=sOPSv9Gk; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="sOPSv9Gk"
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 27E753F0B5
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 02:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1783908529;
	bh=7lePleqyVN1zFZN0zuRgl3DYBgz7Zjmg7e9eYUsK1Bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=sOPSv9Gkyj0wOWWi+dbIe7aaj8sxUD4R2kMxMr8aNb1Nh2ZZti39oJ1rLpZSVLDRz
	 h8mV6fFs02nx/lG6JBjXz91FcoTjCk0T0x9Fn/kZaOvqkf6t3GJniRW7WKZFjY4Cbl
	 C+OydaZ7AilfIerd68r6lAqs8UNO76V1j55XXjHs73H57bERAWO2pXOVRUatexggqS
	 pSkboM7tVRDXX5KKsd/AQrffTZvUqZxTYQg5NeM6ugqHqj+gjKzQ8zec3qWTw2C47B
	 ZBGdDvQNx01Bkz7Tc9FHRl6VT5DLFLB1545W1d+Tg77FIXFzzmUQMoDmweubnZs0yL
	 EfA3KtDWi1OdVFIxdZMqvEtWDiwmIIIm2XLvZ4hb6sWY7nib3tZKPRsJEh9HrtpsXW
	 IbROjnb8tkaZQKZ273qeDPGWIYRRU1cw+lYoqslbnfdeIY48FHh6kjClyKC1hnoBEq
	 XZrtat7kzdCa1fZzTQ5eaGN70Vr208AF+BU75A5ibEtuu4tPneHe4KE3qLKy9IgVLN
	 gusbfchmZWuYpERvCiQxKJd72NF7jMFKI9SCmnmn5j4EOP9POxP67JS43WchIOPFWL
	 UQpDy1A3bD6WXULqL6lMbNm79fJRC4qHEKwveyb65oDQznDD5x1KcS2gkqorfiJKXk
	 gXv6+FHvo9/Ryts9mLiIYhek=
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so52865125ad.3
        for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 19:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783908527; x=1784513327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lePleqyVN1zFZN0zuRgl3DYBgz7Zjmg7e9eYUsK1Bs=;
        b=p31JdP3tGWVlIXsm5QzKyauZXfIMnXECxyEFPNY52+JOr4JD3CVkLDN4f4ieJJR/Zl
         4OF3tumphq+7/5eZPfvWeEoRN+az1H89yrTHFh9IjbnI/7D3OSx7LO5VwaNT+PqkhiV9
         cVaNdpeigp3zCsCOeAlAm02nvCEBPwkV+OtlufIExoWCiZsi6FNk3EVbFJ5YTxbRVaDS
         zOL6H4c1NDHHtT2y4rDd7KCRPrAkTROX6Eq9ArVmG9TC6Ixe+YcQvmQ98HkSGWm1US1+
         0zZr3ZCVO+CI3mUJvN9AOJ6JX0x5bZ/+bjl6vPizoScFrwu6Ika3oCxhEscfVGxgB+Cz
         Y8Wg==
X-Gm-Message-State: AOJu0YxzQOcobiqsUBSRfBIi7rHLEG1yWXWol5e2iid3q3cxLQfrFHro
	AZ4v13/hBoAii/zTZ5jMi/FpFQhpYWcxjydfOq0QZgGOwMbM4Ad3Byj1fUpJfwOucb3t2pmdR8j
	iJORyFe3lrZ96V+BF6Au223732vjXF3K7rVgMcwVSEPSDzNwpsc+nzBOQBBTmOBwe7YTIPqtfTg
	a1tPVs
X-Gm-Gg: AfdE7ckNXivr7d1Tng2st5QCHJOuV//sz1nVJHXrysCkyCTQjjWY9E+1viT9u30y6ar
	GfdKKf/2NeMh+EILMyhLwkoM/e33oitFG9h5NdEyPiHWcwK7CO6fECOG2QrVASDj8WfZBV80o2R
	Z0BsteEfYLlbjScAhGucCSIuux2Yv4SmZnKDSHe4/5cZ7GW5HMxsgfq6nYNN0ZI/63QtaHq0WHF
	iAabDAY6FWY2lScwRO6vj65OxyZL+TRWPsS10hDzgm6WJOKcAFMpjWwSFDkDN7EG5NSV2EjPYHx
	FGAOv3yJGZpFgKgjt0D2RO6XypxF3J67gfmHocXGfoLVxzyYvuJl1vvB5JOP1SEtBekqNaWJp5r
	udGZzW8GcAZs1jat8W/YAJHU/t+ePqCEl1xEY1tjUfgx9oJUBjXDPbQ==
X-Received: by 2002:a17:903:3d0d:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2ce9e1df6c8mr71214245ad.0.1783908527573;
        Sun, 12 Jul 2026 19:08:47 -0700 (PDT)
X-Received: by 2002:a17:903:3d0d:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2ce9e1df6c8mr71214055ad.0.1783908527219;
        Sun, 12 Jul 2026 19:08:47 -0700 (PDT)
Received: from localhost.. (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d602fdsm90330825ad.81.2026.07.12.19.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 19:08:46 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH v2] ALSA: hda/realtek: Add inverted LED quirk for HP ZBook 8 G2a
Date: Mon, 13 Jul 2026 10:08:39 +0800
Message-ID: <20260713020839.3822602-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP ZBook 8 G2a 14 and 16 (SSIDs 0x103c:0x8f94, 0x103c:0x8f95) use
Realtek ALC245 codec with TAS2781 amplifier via I2C. These models
require inverted speaker mute LED handling compared to the existing
ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED quirk.

The existing quirk produces opposite LED behavior: when speaker is
muted, the LED turns off (should be on), and when unmuted, the LED
turns on (should be off). This patch adds a dedicated quirk that
properly handles the inverted LED polarity.

Code flow explanation:
- With HP pin (hp_pin != 0): Uses standard HDA LED framework via
  alc245_fixup_hp_mute_led_coefbit() for full control interface
  support, enabling both manual control and direct hardware updates.
  
- Without HP pin (hp_pin == 0, speaker-only laptops): Registers
  direct vmaster_mute hook (alc245_hp_spk_mute_led_update_inverted)
  to control LED during mute operations, ensuring LED feedback
  without headphone jack detection capability.

Both paths use inverted LED update logic to correct polarity and
maintain backward compatibility with existing systems.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/hda/codecs/realtek/alc269.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index b26ed9c1f09f..e04b5adce075a 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3776,6 +3776,15 @@ static void alc245_hp_spk_mute_led_update(void *private_data, int enabled)
 	alc_update_coef_idx(codec, 0x0b, 0x0c, val);
 }
 
+static void alc245_hp_spk_mute_led_update_inverted(void *private_data, int enabled)
+{
+	struct hda_codec *codec = private_data;
+	unsigned int val;
+
+	val = enabled ? 0x04 : 0x08;	/* inverted: 0x04 off, 0x08 on */
+	alc_update_coef_idx(codec, 0x0b, 0x0c, val);
+}
+
 /* JD2: mute led GPIO3: micmute led */
 static void alc245_tas2781_i2c_hp_fixup_muteled(struct hda_codec *codec,
 					 const struct hda_fixup *fix, int action)
@@ -3804,6 +3813,42 @@ static void alc245_tas2781_i2c_hp_fixup_muteled(struct hda_codec *codec,
 		alc245_fixup_hp_mute_led_coefbit(codec, fix, action);
 	alc285_fixup_hp_coef_micmute_led(codec, fix, action);
 }
+
+/* Inverted LED version for HP ZBook 8 G2a models (SSIDs 0x8f94, 0x8f95)
+ * This fixup handles systems where the speaker mute LED polarity is reversed
+/* Inverted LED quirk for HP ZBook 8 G2a (SSIDs 0x8f94, 0x8f95)
+ * Speaker mute LED polarity is reversed vs standard behavior.
+ * Code flow depends on HP pin detection availability:
+ * - With HP pin: Uses HDA LED framework for full control support
+ * - Without HP pin: Registers vmaster_mute hook for direct control
+ */
+static void alc245_tas2781_i2c_hp_fixup_muteled_inverted(struct hda_codec *codec,
+const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+	hda_nid_t hp_pin = alc_get_hp_pin(spec);
+	static const hda_nid_t conn[] = { 0x02 };
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		if (!hp_pin) {
+			/* Speaker-only config without HP pin detection */
+			spec->gen.vmaster_mute.hook = alc245_hp_spk_mute_led_update_inverted;
+			spec->gen.vmaster_mute_led = 1;
+		}
+		spec->gen.auto_mute_via_amp = 1;
+		snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
+		break;
+	case HDA_FIXUP_ACT_INIT:
+		if (!hp_pin)
+			alc245_hp_spk_mute_led_update_inverted(codec, !spec->gen.master_mute);
+		break;
+	}
+
+	tas2781_fixup_txnw_i2c(codec, fix, action);
+	if (hp_pin)
+		alc245_fixup_hp_mute_led_coefbit(codec, fix, action);
+	alc285_fixup_hp_coef_micmute_led(codec, fix, action);
+}
 /*
  * Clear COEF 0x0d (PCBEEP passthrough) bit 0x40 where BIOS sets it wrongly
  * at PM resume
@@ -4164,6 +4209,7 @@ enum {
 	ALC256_FIXUP_VAIO_RPL_MIC_NO_PRESENCE,
 	ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED,
 	ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED,
+	ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED,
 	ALC288_FIXUP_SURFACE_SWAP_DACS,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO,
 	ALC233_FIXUP_LENOVO_GPIO2_MIC_HOTKEY,
@@ -4481,6 +4527,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_before = true,
 		.chain_to = ALC269_FIXUP_HEADSET_MIC,
+	},
+	[ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_tas2781_i2c_hp_fixup_muteled_inverted,
 	},
 	[ALC288_FIXUP_SURFACE_SWAP_DACS] = {
 		.type = HDA_FIXUP_FUNC,
@@ -4785,6 +4835,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e86, "HP", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ec0, "HP", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f94, "HP", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
+	SND_PCI_QUIRK(0x103c, 0x8f95, "HP", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
 	SND_PCI_QUIRK(0x103c, 0x91c6, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x221c, "HP", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x1043, 0x1080, "ASUS K53UT", ALC269_FIXUP_SSID_IGNORED),
