Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B7A23507B
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 04:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784089149; cv=none; b=qQEhTboUs/KmJYhWukEYMkPreMIMWgzu+lUgbwS8AvhhtYfYd5pctkSQqUKRsszWLP45TtZHPI0eNG6FcpTHvNzL/+riv4wWND3E+K8//uQUd0HKeSbnCXv6vihJRKd27WO2dBLh+kTTa86uR5jNiHK99O+YgrKJWcfplDSxDCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784089149; c=relaxed/simple;
	bh=ChXFU86zZXJSh07Rc24E3XkS6sKKwswF6XgMOwXS95c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LNHZ+d7P9jUwWMdBc1a+kl+hPHuTA6avgq63F08kTHYSGDPDf8rOepA5QTqM11+BuspIdp7x9pFpj/wbcnjZakB9o5CXwlIkwxTQTywLT6vgbac4HsaKE13g2M9xRM6aMNbw/I0/MqB5gOHRSCqY1sAS5jzO2QkI0DYSpchQk3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=ox/xjLFi; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="ox/xjLFi"
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AE9D43F2C9
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 04:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1784089143;
	bh=EaZaratfNTF8DtKMxw1rXcF1pvNeOWsjlYC13qTOwzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=ox/xjLFinawCPY3QOXAVBZgjvamWUlsp6XwuM6vjcA+AfD/klCoTmVuIQfebP1wj4
	 uRPU0ezfStjkCDRtCN3Ka5eDtyY0RRYewpkAT+DDERAUFiLARXYnXqSQWkz2IOQVqh
	 qZDtNCHnX1CNJGtHQSKmZr/WwFOoj7UuMhhcFSNmSXiFPY9ILUUQKCp9Gmtb8cKr+d
	 NDokCPzg1jv+fQquurK9ePVxDbxQwHtckvH3KYAw8Stg7d5ZlN7XxjWZ0hlrAebGZU
	 MNPjM3HIUptrx3pyWt57S1CpLxuU4nynmsXLzoFoCtKfphhdbDGxDTaa/Ixeefzbt5
	 eoXP1RrVWdRAGciWgAWHeXbYAeGISF1n787ruVQP/a/GUW+fyWtM7CuhHj9Ii/HywI
	 R2RMY8TYo76ETo5motmwNUYKBxPDwHuWGB4daAIQymf3pGRmsOGh0BZrOwbaza+0KE
	 YXkEly6snb6+JTaoB7nzOCuiZC7ezf1wsRFG3n2Kir93QugVMK+oNNydqlXaH5Gfd2
	 mMaFnhnSs5pLn6oFYfFQsOl1BuKOoEi5EcpRFyHC7bTHo6xsYmHvrYU9Jb1HFSzwcA
	 GCdHsKkMqa5ImPH7EshoMXJ52sZ8KiPS/VDDReUDpwLatQVywXAiVOgksPyOweCZMq
	 +2iUG5D/xSSNM5w5SBT33R+Y=
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84870e7f498so5868109b3a.3
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 21:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784089142; x=1784693942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaZaratfNTF8DtKMxw1rXcF1pvNeOWsjlYC13qTOwzk=;
        b=HwGPGm5IDGNzTW2tUvs9t9+0A5WFaIXgvG4dZ0WlDVTSZbhs24W78i83ZB1q/Y+AHt
         la5uVj8GobYk43ADHrch0DGG1tw9Sl9WhwNX9Mtgq9Spi49xOiKtODcR2VguycDspJMa
         n69rgInZchDSDwA7nn+S/x5w7hWc7V5pP2ybMlD72ki+G66BPsBZ95HccB1uDvGTvbcD
         CEkhnMs1iCCqzZKBOCN0zbLaZ3Ae4hKg+TJMtIreBC8GriXDnaNRYUpWdSPfMcLQdauY
         HtX3fnsvJZhTrr/BV75BXezkTpNys3YCAeYRMuCGNKrdO0OXCzqA/+cRVCO3AqqTCzBU
         Mo9w==
X-Gm-Message-State: AOJu0YyMr27lq19Wp7NPXGpxnbjTe9oXdPVkcz+aRUBJSxyq5wZUHOfO
	UE/SFpBozc/vjAy/k05DewKmGHc6mUeRDufFhWtzCPmjl8x7nMhDrp055sIr5ozFZyqercnYI7T
	00nCNkAHo1cNkVWHBfBGjZL2YGdZhZ7ZmR4QlDsUYGnYd8iXPTH4iW/Zge2yWKHqZIqqn4ry6TV
	LEqwqa
X-Gm-Gg: AfdE7clgdc64JXkSyQhEXQG84dl0YEo+kJlHduS8mZA1igdsdHMFVQ5HXv/i/wS+PVi
	gnfT62CNuRAXTzTKWgsNqexvtB8TnAD9SdAA+AsKUd+CpJCIPOsyFoEieCu5Klg+MFalCx8r6L1
	MgOnBeA6qs6amzL5RFaVRMDmm0bUXdbuZ5FOz8pbvgnRm8inYjzb6asKD71VkjgN/1RbXC9s2Eq
	JMtgA7aay/T7KnATh3PFORNX9WCHeAG5WuD3rgxcuWOxMbJxL/m4MmFZOrg0ZZAKx+/ixJoGich
	Xu2lrLDc8jO6ueFdXIZ7z3hbqr9W0xJcyaJkE4o6vPlcRt8QNL3oPx+0gwC0kL7UtSn0e8koI+4
	ziV3xNR/jMMuOnrE2GeqYPko+fNZyTa42NR2TMWpnsnoJ8RyKizSW
X-Received: by 2002:a05:6a00:92a7:b0:848:31fb:43d9 with SMTP id d2e1a72fcca58-84a673587f0mr1030129b3a.45.1784089141957;
        Tue, 14 Jul 2026 21:19:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:92a7:b0:848:31fb:43d9 with SMTP id d2e1a72fcca58-84a673587f0mr1030101b3a.45.1784089141332;
        Tue, 14 Jul 2026 21:19:01 -0700 (PDT)
Received: from localhost.. (1-161-28-137.dynamic-ip.hinet.net. [1.161.28.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23895bsm2405218b3a.2.2026.07.14.21.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 21:19:00 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
X-Google-Original-From: Chris Chiu <mingshuo.chiu@rakuten.com>
To: tiwai@suse.com,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH v4] ALSA: hda/realtek: Add inverted LED quirk for HP ZBook 8 G2a
Date: Wed, 15 Jul 2026 12:18:55 +0800
Message-ID: <20260715041855.63264-1-mingshuo.chiu@rakuten.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Chiu <chris.chiu@canonical.com>

HP ZBook 8 G2a 14 and 16 (SSIDs 0x103c:0x8f94, 0x103c:0x8f95) use the
Realtek ALC245 codec with a TAS2781 amplifier via I2C. They share the
same hardware configuration as the existing 0x8f40/0x8f41/0x8f42/0x8f62
models but have inverted speaker mute LED polarity, so the existing
ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED quirk drives the LED backwards:
off when muted and on when unmuted.

Add a dedicated quirk with inverted COEF values. These are speaker-only
models without an HP pin, so the LED is driven directly through the
vmaster_mute hook; there is no need to probe the HP pin at runtime since
the configuration is static and known per SSID.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
Changes from v3:
- Drop the runtime HP pin detection; the ZBook 8 G2a 14/16 are speaker-only
  models with a static, known configuration, so the LED is driven directly
  via the vmaster_mute hook. This also fixes a latent issue where the hp_pin
  branch fell back to alc245_fixup_hp_mute_led_coefbit() with non-inverted
  polarity, which would have made the quirk a no-op.

Changes from v2:
- Corrected the fixup entry so both 0x8f94 and 0x8f95 use the new inverted
  quirk
- Simplified the commit message

 sound/hda/codecs/realtek/alc269.c | 43 +++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index e809d838ff58..ee8cfacffb31 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3495,6 +3495,15 @@ static void alc245_hp_spk_mute_led_update(void *private_data, int enabled)
 	alc_update_coef_idx(codec, 0x0b, 0x0c, val);
 }
 
+static void alc245_hp_spk_mute_led_update_inverted(void *private_data, int enabled)
+{
+	struct hda_codec *codec = private_data;
+	unsigned int val;
+
+	val = enabled ? 0x04 : 0x08; /* inverted: 0x04 led off, 0x08 led on */
+	alc_update_coef_idx(codec, 0x0b, 0x0c, val);
+}
+
 /* JD2: mute led GPIO3: micmute led */
 static void alc245_tas2781_i2c_hp_fixup_muteled(struct hda_codec *codec,
 					  const struct hda_fixup *fix, int action)
@@ -3523,6 +3532,33 @@ static void alc245_tas2781_i2c_hp_fixup_muteled(struct hda_codec *codec,
 		alc245_fixup_hp_mute_led_coefbit(codec, fix, action);
 	alc285_fixup_hp_coef_micmute_led(codec, fix, action);
 }
+
+/* Same as alc245_tas2781_i2c_hp_fixup_muteled(), but with inverted speaker
+ * mute LED polarity. The HP ZBook 8 G2a 14/16 (0x103c:0x8f94, 0x103c:0x8f95)
+ * are speaker-only models without an HP pin, so the LED is driven directly
+ * through the vmaster_mute hook.
+ */
+static void alc245_tas2781_i2c_hp_fixup_muteled_inverted(struct hda_codec *codec,
+						const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+	static const hda_nid_t conn[] = { 0x02 };
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		spec->gen.vmaster_mute.hook = alc245_hp_spk_mute_led_update_inverted;
+		spec->gen.vmaster_mute_led = 1;
+		spec->gen.auto_mute_via_amp = 1;
+		snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
+		break;
+	case HDA_FIXUP_ACT_INIT:
+		alc245_hp_spk_mute_led_update_inverted(codec, !spec->gen.master_mute);
+		break;
+	}
+
+	tas2781_fixup_txnw_i2c(codec, fix, action);
+	alc285_fixup_hp_coef_micmute_led(codec, fix, action);
+}
 /*
  * Clear COEF 0x0d (PCBEEP passthrough) bit 0x40 where BIOS sets it wrongly
  * at PM resume
@@ -3857,6 +3893,7 @@ enum {
 	ALC289_FIXUP_ASUS_ZEPHYRUS_DUAL_SPK,
 	ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED,
 	ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED,
+	ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO,
 	ALC233_FIXUP_LENOVO_GPIO2_MIC_HOTKEY,
 };
@@ -6327,6 +6364,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc245_tas2781_i2c_hp_fixup_muteled,
 	},
+	[ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_tas2781_i2c_hp_fixup_muteled_inverted,
+	},
         [ALC233_FIXUP_LENOVO_GPIO2_MIC_HOTKEY] = {
                 .type = HDA_FIXUP_FUNC,
                 .v.func = alc233_fixup_lenovo_gpio2_mic_hotkey,
@@ -6873,6 +6914,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8f41, "HP ZBook 8 G2a 16", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f42, "HP ZBook 8 G2a 14W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f62, "HP ZBook 8 G2a 16W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x8f94, "HP ZBook 8 G2a 14", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
+	SND_PCI_QUIRK(0x103c, 0x8f95, "HP ZBook 8 G2a 16", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
 	SND_PCI_QUIRK(0x1043, 0x1032, "ASUS VivoBook X513EA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1034, "ASUS GU605C", ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
-- 
2.43.0

