Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C3927F75C
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 02:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784169527; cv=none; b=VzLofrp+tJLmaEFvHg9eqBwgOIy1B6FgkaoYwLK9Cjgwz2rlaa8G9ffBk5gYUgpPnwfLbcM8tRjsLaM+MTpFm5B1ee+xacfmjHl6OxiqcHgJc1da69hhOVF24uqA4STKu+yVAhc9YFz0AUh2+BemdDsIcq1TzMFABfQ3HR3oEsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784169527; c=relaxed/simple;
	bh=GDywgNAAv1SeClmWk8TV/5ffCC5ejh0weyQI9rabPVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VzcLbPxyOv7QXJ/4pUirqgDNxiXA14fcSsZ4Ki8KWA3y+clQ9TMkua60MpJMnHP0DujXeaQXazpNn9vJ1OUC63rXQR2WSEjH3ryQISuL5Ffdx813kTKg+SoR7HdfKfCQamt/3Z1YRIwsGT358w5OhYlEwy6WJBRKdBNoZfD9+zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=gDJndlNr; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="gDJndlNr"
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B19093F620
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 02:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1784169514;
	bh=SXgfO97DxS3/azhu0TLaCnZvyMLMyG3H3No7UV0iFzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=gDJndlNrsOXNJyevpPZ755a7lIexPQJtqrwG9yocs8jszB9XYo+8Zk4hO832l2h39
	 LWLOVRxweuJblQHfKAi+11yp58/qWk9YJWvR6QES0cpX40RCw4Rxj2/fQ7JsUEabE3
	 DcQGkkbjCUhsEjEWPAnmt3Vf/EbuXjMKg6k5DcY/VUi1YJwxvOXuLp7e6itToMN3pC
	 fQyELWpPeEhe/MaXJsMvrN9AnMiBJD4YRCW4vZ07Xm7Aot2yznNh4xjnOK+UcBK7LY
	 K2r5QF8mYWIm3VStNC+zF4YB0a0x8rkRKKeFYZmSjXk1funf3Qs/Wzj64aEcdDUaVj
	 3rEVVRAOMFLmJqoFgk9RCYdOkxUMk0UBoGCBMuLsaUZRt+a2Uqm17hJPnqzRltwqJ4
	 AX3DZZBH8fEHXzQdI9qAEwK9EQb4S2/d2fYmoNYOqrg89BtEpqcOKdMjpnvq7Vr6hF
	 WY9ZZWYSn6X8A2k1EBemOAJgKQlN4w9uElG9o2+ww5xAkR1oWoJCgoyiZxP+CHPCka
	 x/xFaiifrKl8AgLjPnh51sUG/MBlZIvbSJLDPyuvxjJsinGjtai6Zubi49E39m0vSD
	 MKU+jqnjEQ85WmWSdV31HloOrBiGKJsUWky++N2AVmewb4SayzqNVh/JwZnzejtdKK
	 JE3t3EAH/8pkPP5PsOZHZBNk=
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so8243841a12.3
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 19:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784169513; x=1784774313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXgfO97DxS3/azhu0TLaCnZvyMLMyG3H3No7UV0iFzI=;
        b=Qdc0SPOeBBbw8CI2WmJm3OtssRpCMqIfeJMBB0lju3ehg75t9B7EM/OeYYJ5biXvG1
         QBe4w2TzvisQlCEirOGW9AS++0AyYlaUCn7EmNgjS9YqQgW9cIfu4cOtWWk/lok1TiZY
         zvQRwNOhz777ubQj1FsgiMXOFvtYs6knMI2tCtONvSYKEWjm6+CB8Qw/3ijfFe96937l
         7rEX2LaD/KahHApGZHBPYr2VYrJjJUMB0ABRtKnphQTYnK3pB9mni9EcO+H1wf3sss0g
         mNJ07ZbkOhbsVDpexk0fvaQ+JveYgmNTFlsM0bajsKe2Z2WrIYHDjiw7+bQ4r42XEGJ2
         pmaw==
X-Gm-Message-State: AOJu0YylWiCYvqHuDTZQsyHt7VZ44VIHgDfe7ZcMMabsMwQDmVfOM1Rg
	7AMv0VZ8QbXQNNeFE8tOz6HvnOPPiPM8RPIiSkh1LdKZFFA1kU8VkyPlxTzCjj75SVqqkuKEQFc
	WCmh8UVnvXp1ReNQvwdEeC0gKAHBEuDJGerVOREky7NTbEiibedkAPXh/T8xCoSCUz2nt6ylird
	PpMglq
X-Gm-Gg: AfdE7cn9FNZoqdlX93kGSZ1dmQEYbhhFZY2YM1zKo5xyoc+vyIqVC+lXOSYqZqe4RM+
	QEZk+GTQFNmnJzoslaheKK2R/3UL9BMavONbQ8AOJB+YpE7J7y97kBVvHWHT8+NgM+bkOU8PuTi
	o4ewQxDv9ye7PagX50p8Hk7/oi3sztUuDhLApzDDpZXPF/SAIysRWHM7WDOZAd26oNN95JqrZcz
	G4lDTNwCCIpFOucnm6hGzqDOEH1ZfIgCaNpkEStIcko+g0g+Z9K3n1VzY2qe23mJbOQiqBzcjo0
	zD/76y2CSVS5iRb/oG6vA/znBpPHsyS9IDfOVuaZj7v3HAwTU+8fRqf8TS1QJ/fMR0rYGN67Elv
	dn8gDetkkkdLbJWUQFKOdJy9G+chvKzjLzg///7qszmQ=
X-Received: by 2002:a05:6a21:489:b0:3bf:9c93:ac44 with SMTP id adf61e73a8af0-3c36c1923d0mr5662666637.19.1784169512918;
        Wed, 15 Jul 2026 19:38:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:489:b0:3bf:9c93:ac44 with SMTP id adf61e73a8af0-3c36c1923d0mr5662642637.19.1784169512519;
        Wed, 15 Jul 2026 19:38:32 -0700 (PDT)
Received: from localhost.. (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258ff3c9esm1041715a12.24.2026.07.15.19.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 19:38:31 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH v5] ALSA: hda/realtek: Add inverted LED quirk for HP ZBook 8 G2a
Date: Thu, 16 Jul 2026 10:38:25 +0800
Message-ID: <20260716023825.387532-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP ZBook 8 G2a 14 and 16 (SSIDs 0x103c:0x8f94, 0x103c:0x8f95) use the
Realtek ALC245 codec with a TAS2781 amplifier via I2C. They share the same
hardware configuration as the existing 0x8f40/0x8f41/0x8f42/0x8f62 models
but have inverted speaker mute LED polarity, so the existing
ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED quirk drives the LED backwards: off
when muted and on when unmuted.

Add a dedicated quirk with inverted COEF values. These are speaker-only
models without an HP pin, so the LED is driven directly through the
vmaster_mute hook; there is no need to probe the HP pin at runtime since
the configuration is static and known per SSID.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
Changes from v4:
 - Rebase on latest linux-next/master

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
index fac781fca9d4..b3562c821954 100644
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
@@ -3804,6 +3813,33 @@ static void alc245_tas2781_i2c_hp_fixup_muteled(struct hda_codec *codec,
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
+					const struct hda_fixup *fix, int action)
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
@@ -4168,6 +4204,7 @@ enum {
 	ALC256_FIXUP_VAIO_RPL_MIC_NO_PRESENCE,
 	ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED,
 	ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED,
+	ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED,
 	ALC288_FIXUP_SURFACE_SWAP_DACS,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO,
 	ALC233_FIXUP_LENOVO_GPIO2_MIC_HOTKEY,
@@ -6753,6 +6790,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc245_tas2781_i2c_hp_fixup_muteled,
 	},
+	[ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_tas2781_i2c_hp_fixup_muteled_inverted,
+	},
 	[ALC288_FIXUP_SURFACE_SWAP_DACS] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc288_fixup_surface_swap_dacs,
@@ -7403,6 +7444,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
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

