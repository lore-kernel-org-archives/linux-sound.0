Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02060187346
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 02:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783478896; cv=none; b=K2tfTbMqq2qITjU3XNemQyZEMRY3UxhErKWRohylwsbiOU+wo+IHqzt+7O+PvvrpeT0tJPdOw4xTbc88pOUDPeDxiezszAW4dNRmDBIeXLXyOPQqmJsB4BzYekIeeDlzGAHIIt+9XRSMAeuse+FlP9blTAxDyiZWQSOAZo/okak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783478896; c=relaxed/simple;
	bh=kVWYMz8N8L500S4zpO7IKdP7R/XDAomw0TJw0GBIs2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fWoYeqEeybDWoh+WyZV1t0MlCckfGKKxQDO4o6Xjr8V0WfTu0bnjDf49AeVE51MfzZ1a3oAsUQpm7mZOd6oh+1ag1P1nIhPBhrqexgKtcSKW5vw3Vx+8qhWCxVk5xN8NcQoHqRht8+ZR1XoAXiaBpfvgSgeX5xCRJarp9jzHysU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=UnEqWR/l; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="UnEqWR/l"
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 09E9B3F491
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 02:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1783478891;
	bh=q8C5A+OYF1Lfa8cDTHtioHEMlnWuGT751LMAJpYxr4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=UnEqWR/l4lgPW4ddGOVlieDFSLo4FJgwwBkrpMRFpg7hL8konT/SSiYc5Gn44/aF2
	 Y/I+Fyfw7KHrJlhATfY4NQ49SzAEWzle/X1CsOdP3huC1fEyOsLRNXZdw4UikwxDmN
	 rcDZEb7G0n7uTc+F+/yoGfIR8HRwYPfxCtuFtdAIOuJXzDvBSXqmyqSfefZ8yMT34C
	 RSjiQRMw9V9AsyTWbBLjL++YKSpQeCb6wa0+63wTAocSsF5lYr6EEB0Foe3pTchmT4
	 8H7/ffjPTscw7envK9Grs5oCfzubIrdNbYWUSFXmLn7z5oE16WTwBWU0UkUNIbvsOx
	 pDVBzKIMGgXQ/4661lY1/2C14JpCjI4SBSC6eqnx3mmNK+74nQHKRvmqiXp5pD/+mU
	 sSSniNvpYK8tdTr3+5ab9qZ5F2pYFBu2Q3bcmzdwlxTcT3/1DzgEr0oiDbL1rc7lGR
	 kid3kXRF6A1Fmb1SNO1KyCGDj3mpAqSjWPivzrXsCMVdF+YF2VL42he5UK6VZE4yVY
	 qTmMbRPxrX0KeoklD94ux8FgcCNQ0P7VxCRs7H3WFSYJa6+iCJu0efGo6CwvU0Nsjo
	 sJo5Ot5BBqwsqDQHrOFNcDl9wLQXth0D4giy48hfGzyFnU+oCEnL7IOzuiaOhHCgSY
	 ausWwD9K71og/VWKYWkZNYJ0=
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc640dfde3so3515075ad.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 19:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783478889; x=1784083689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q8C5A+OYF1Lfa8cDTHtioHEMlnWuGT751LMAJpYxr4A=;
        b=VJ6WFy2NznixmwTXB2693iKOLIjGYR8f4XRIzvLwEfBSJi057fHF36zOruc1B9FoEN
         +7eKRvLEARP7yBPUfUXAF0Ec6O+gHsA4lAkzOqc5oRXqwXMXZj3vJcRcLv9bUANthsAy
         4UKpUOn4hpXpaz4jqgjH6XG+YEmsDHDgz4AGbnOSVh/6X980uFO6VU3A659L4usZyzva
         r5L7lrY7de0M1GZhjE1j5OF2Y6KsJCFEpPp5WZ9LpO1BTe5LqUODx3ABJIo5L+n6iDae
         rWDmZtd2kN0Z9JsuKWrs9GcchWsoTAqPYBfzdBzyG9x+PYe2Vz4nnkfKYHrkOAR7unox
         R49g==
X-Gm-Message-State: AOJu0Yw7yAEeaOsmMdM9F79cscjh0tRf6Hp96oZNvcVlQlwayIPkkGLA
	DmzlYhJnWqwIoNTn7xnW1e63khZaxm4i3RwtSYHkJ8eHW7yuQPxQRKJpivZhFnIXRAtl0m4OHCD
	lJIXuFEWC2s7OoUyNjPelCbgKXF1KYgcSjYL43WcQkcNdTAfddlDFGe4MCwjCgjfPicuYlZbtvu
	2G1cuC
X-Gm-Gg: AfdE7cmp7lyQMuyTiUY2qQ0Oz4ZjyZ7oaSn4Ei4KwhGmF6ygY7J/hrO6xt6/tC0HEEV
	EC1U2yhP02gbr3DwAYqSrJZIXyJP3mj56DNty9pqwNRORMcVOUbDessYszjAHW3uZ27HWxS5uXD
	K+qxMwsb4UfQkd37/fv55x4wyc3Ofb0EkszcmpGHfSa8Lk0A0GsBeAr1yjfa+FMdP8RiuIbkn73
	7dQB7qvXeodnIqZMYx2Hb5ZpF2aAajb2ur0qt2E5BQvNBHxXV1hbX6Q9GHd/4cAJhvajqw4ypoE
	zvNhjtd9n/u94CHqpu2GABipqkqhINZe6rbHffOGvQG3aSFgND+21sQepwH8HbwT6FJhopxnp8I
	AhCE6DkMwb7zB1LT9HftdauEqSuVTGLhTUzmnrGiqUNOInNbhlC/A5Q==
X-Received: by 2002:a17:902:ce0d:b0:2c9:b8b7:5d1c with SMTP id d9443c01a7336-2ccea3b5089mr6317635ad.16.1783478889361;
        Tue, 07 Jul 2026 19:48:09 -0700 (PDT)
X-Received: by 2002:a17:902:ce0d:b0:2c9:b8b7:5d1c with SMTP id d9443c01a7336-2ccea3b5089mr6317325ad.16.1783478888849;
        Tue, 07 Jul 2026 19:48:08 -0700 (PDT)
Received: from localhost.. (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9a3sm20282265ad.13.2026.07.07.19.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 19:48:08 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] ALSA: hda/realtek: Add inverted LED quirk for HP ZBook 8 G2a
Date: Wed,  8 Jul 2026 02:47:57 +0000
Message-ID: <20260708024757.2400766-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP ZBook 8 G2a 14 and 16 (SSIDs 0x103c:0x8f94 and 0x103c:0x8f95)
require special handling for the speaker mute LED with inverted
behavior compared to the existing ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED.

Add a new dedicated quirk ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED
to address the inverted speaker mute led issue. This ensures the LED
behaves correctly on the new HP ZBook models.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/hda/codecs/realtek/alc269.c | 44 +++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index b26ed9c1f09f..07f5adce075a 100644
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
+	val = enabled ? 0x04 : 0x08; /* inverted: 0x04 led off, 0x08 led on */
+	alc_update_coef_idx(codec, 0x0b, 0x0c, val);
+}
+
 /* JD2: mute led GPIO3: micmute led */
 static void alc245_tas2781_i2c_hp_fixup_muteled(struct hda_codec *codec,
 					  const struct hda_fixup *fix, int action)
@@ -3804,6 +3813,34 @@ static void alc245_tas2781_i2c_hp_fixup_muteled(struct hda_codec *codec,
 		alc245_fixup_hp_mute_led_coefbit(codec, fix, action);
 	alc285_fixup_hp_coef_micmute_led(codec, fix, action);
 }
+
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
@@ -4164,6 +4201,7 @@ enum {
 	ALC256_FIXUP_VAIO_RPL_MIC_NO_PRESENCE,
 	ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED,
 	ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED,
+	ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED,
 	ALC288_FIXUP_SURFACE_SWAP_DACS,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO,
 	ALC233_FIXUP_LENOVO_GPIO2_MIC_HOTKEY,
@@ -6134,6 +6172,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
 	},
+	[ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_tas2781_i2c_hp_fixup_muteled_inverted,
+	},
 	[ALC287_FIXUP_LENOVO_YOGA_PRO7] = {
 		.type = HDA_FIXUP_FUNC,
 		/* Reuse the DAC routing selected for ThinkPad X1 Gen7 */
@@ -7361,6 +7403,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8f42, "HP ZBook 8 G2a 14W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f57, "HP Trekker G7JC", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8f62, "HP ZBook 8 G2a 16W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x8f94, "HP ZBook 8 G2a 14", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
+	SND_PCI_QUIRK(0x103c, 0x8f95, "HP ZBook 8 G2a 16", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
 	SND_PCI_QUIRK(0x1043, 0x1024, "ASUS Zephyrus G14 2025", ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1032, "ASUS VivoBook X513EA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1034, "ASUS GU605C", ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1),
-- 
2.43.0

