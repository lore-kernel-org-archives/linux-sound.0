Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E1B2DB7B4
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 02:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783996195; cv=none; b=HyHl8nLBGV6qAwX1k+dw4qfTDH9mqo9JHTFjnf0qnFirf3x3RE5aC4eEqI8MU933EQitvoq9ZT8327k9uzeK1PvYn+y8YzJHo/pYNZKzLrZDGQSxIb2jsSV1H9GZ9A1p36aeFRMKWA3ULdzioFRweVBobSrZbX1aFy9x5L8r2+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783996195; c=relaxed/simple;
	bh=WLUoXyoCGlf4hrKMh+AAgtQJ9KQSz4ar4AA1jN82X0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aH/J2EG5/o6ZZz3FRTNTFqxrteSeAcRUYM7vBj6NFw1yNW4z4HAu8FUbgW8xOf0DFJa7MRIdfS9Fj1w7VMhRlEEcG5OtvQA3H74NRc+XCM7UP4nrKAjVSg1Gz5/uE8TjRSvAM3k9VZ4/kX9oUgRvbWhekqIt/sP/5Xh5qeVaqac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=fNiA6Chg; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="fNiA6Chg"
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6EC6A3F427
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 02:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1783996185;
	bh=UANpJ8cS2s6hZdq+1u/gjFdD5nBg/lgUDqG+zu87xCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=fNiA6ChgY0DjK6YwmwF/lcHVwD6HdoRhpZ1IGLmxJ7DS+jm1yZnoh/PKCR+vM3Mp8
	 nCwlyQL6o6Z5loa7CVSvcEuw01PaKZin7/js1UTMzrUPufo5odL9+HcyFz0dt5/508
	 V01U5grg60qyAFcq7oO09Z1QLH82iP1sUPRaZuw0LH0Zfs8V4r1FxIEF8zTVbUbbar
	 Y3UzhBE9ooDNcYwZ0wMZrR8d1luXYwu+fW8XywoxqzbCCqITeSwmUCb6Tj7ZIevgcS
	 BbYGOD+4wzA/WTTCj6IqWM53YGBoVBd3259i+NGQ2bSgn+mevLTBgrELn+wCCV77I9
	 pM51jBf1q3ARAhyNnxAvhCau3VOi+pX6sixGhjYQD2xglPTq9sWiABbgZAlFJA3QgU
	 /g8KIlq6DxG9K2jjrAnK71y2y2B8A7AgOG4xe0vMyEeAvER247zDW3ZhuJDkZHUxsX
	 NIRloIZPyHFNuJpaKR6MKSqziUEVKRtPYl9GyZCGp20hDgOHUelJ+YdWA+2nhatDS8
	 p+NL2riZHaphBO4sBMvnSo2TkcluBHzg9R3LjA90JJE9HdlsJvNRVdi1fIJhczqSBK
	 qF02d1KwE/8DFmzuNS37zoVoJhq6eOBBfltkIjMTRIpfkev0AZg9Ah6qgphWNHSNU0
	 g3ltcfCCQjGIhSbPf+HbMEUE=
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c354050c34so67178325ad.3
        for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 19:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783996183; x=1784600983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UANpJ8cS2s6hZdq+1u/gjFdD5nBg/lgUDqG+zu87xCY=;
        b=PQrptyUihtiPt20pt0GWEKIN0FwXKfyAePZIb7bL5T9BfNcEbQPv2PGV6NmgmNeavR
         MA8ieDdHuIaRvZ1NHvXHjKrF5PhMo+9/xx4PH2hsjoM536fb1tLXCgi0fCt9Kyk/lCZ6
         LdXFrP5UVIy6tUSbJuxwiol6DT2Uh8hRYrtvQ0sTFbbTEGYQRhPqYrXcTZrk4jCA0syA
         PRVRbSJ1Ua29fZSJtN4HyGR3Ck/CmviPDShP3J6G6MXXf5m8w/QOaa6e04PfB5X7xayN
         zl6ggvUDVnuvoLdfIF+98yoYT5K/TAbA8SN/Y4DQnOLKcxPzT+W5VXbIL7UXV2gSfhKH
         KLCg==
X-Gm-Message-State: AOJu0YwifTLaLWJkDOh9N1GFHhk9ixCkB0J3wSR6I79lyhxiAS+o4jXh
	BLRegcpLGNi+3Wfti9URUWcePNfQiQ7+oZxBfwFhLkW9WHLBOiAOLh6YtKj4B9Qg00cHG5lTG0L
	e+WapWDkPgdLYgsaJvZYLcVjfOf6amLCI9kOn9mE7mdhR8zJoabOcogfKHCAX/nS+qvnqZtPloh
	J98DlJ
X-Gm-Gg: AfdE7cl5jOg8oWJy2KYqijkycbon3AGp0ghCXaIFqc7arlO5R93CT6RjNomin2EmfQA
	vQ1y/NEYAZLMz4dLBeKAOntNkfanMlHIQjx3ib5uifNAuzWdc+UhRgLnymksTWuoj6C3cIzJaIN
	YzRryV+YrsIDKMTMv9EUlzeQFzp2SLtW7EbRxitvzAGEGfWNQ8ks/AQHeQm5WmnLY5Tu1oFXinc
	Fh++OYSRzPMLhMaTBtX+YPv6EnPJobWHYDaIUtXlhggyOhODr2YR4k+y79A4uhMed7aehBVn4Z/
	gZEGKqyqUeTsocKpHvJ0QUXVVLgajg8MtcpJdVpR76waTnV8hgRgCkYShb6AcbCBiNdAT6q17vN
	QNQcviOYtiWZALdT4svtn45iQCA151wBudg3fRlezQJCVTOSz9b9eIg==
X-Received: by 2002:a17:902:ef11:b0:2c9:b48c:fdec with SMTP id d9443c01a7336-2ce9eab31e3mr115279785ad.12.1783996183356;
        Mon, 13 Jul 2026 19:29:43 -0700 (PDT)
X-Received: by 2002:a17:902:ef11:b0:2c9:b48c:fdec with SMTP id d9443c01a7336-2ce9eab31e3mr115279505ad.12.1783996182971;
        Mon, 13 Jul 2026 19:29:42 -0700 (PDT)
Received: from localhost.. (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e5d0sm109587695ad.42.2026.07.13.19.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 19:29:42 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH v3] ALSA: hda/realtek: Add inverted LED quirk for HP ZBook 8 G2a
Date: Tue, 14 Jul 2026 10:29:37 +0800
Message-ID: <20260714022937.4062646-1-chris.chiu@canonical.com>
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
require inverted speaker mute LED handling.

The existing ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED quirk produces
reversed LED behavior: LED is off when speaker is muted and on when
unmuted. The new quirk corrects this polarity issue.

The code flow depends on HP pin detection:
- With HP pin: Uses HDA LED framework for full control interface support
- Without HP pin: Registers vmaster_mute hook for direct LED control

Both SSIDs share this quirk since they have the same hardware LED
configuration despite being different form factors.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
Changes from v2:
- Simplified commit message to be more concise and brief
- Removed detailed explanation of "multiple models with same SSID" as
  it's not necessary for commit history
- Fixed comment block formatting (removed unbalanced comment marker)

 sound/hda/codecs/realtek/alc269.c | 50 +++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index b26ed9c1f09f..c1b10647110c 100644
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
@@ -3804,6 +3813,40 @@ static void alc245_tas2781_i2c_hp_fixup_muteled(struct hda_codec *codec,
 		alc245_fixup_hp_mute_led_coefbit(codec, fix, action);
 	alc285_fixup_hp_coef_micmute_led(codec, fix, action);
 }
+
+/* Inverted LED quirk for HP laptops with TAS2781 amplifier via I2C.
+ * Speaker mute LED polarity is reversed vs standard behavior.
+ * Code flow depends on HP pin detection availability:
+ * - With HP pin: Uses HDA LED framework for full control support
+ * - Without HP pin: Registers vmaster_mute hook for direct control
+ */
+static void alc245_tas2781_i2c_hp_fixup_muteled_inverted(struct hda_codec *codec,
+						const struct hda_fixup *fix, int action)
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
@@ -4164,6 +4207,7 @@ enum {
 	ALC256_FIXUP_VAIO_RPL_MIC_NO_PRESENCE,
 	ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED,
 	ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED,
+	ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED,
 	ALC288_FIXUP_SURFACE_SWAP_DACS,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO,
 	ALC233_FIXUP_LENOVO_GPIO2_MIC_HOTKEY,
@@ -6134,6 +6178,10 @@ static const struct hda_fixup alc269_fixups[] = {
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
@@ -7361,6 +7409,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
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

