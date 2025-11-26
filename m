Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CEA2F3635;
	Wed, 26 Nov 2025 03:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764126010; cv=none; b=p15K4GOCu/LDjVxt+0OQ7OJl5oIRy8u7PKz4/+j1DfyIQ+zBRAhIfVzZtzIze7n+pE23raA/fsdsxp8yYB/uJPnh2LJGByfg9PZoq2RiNO+UBruOH8RBYUEJeiBhv7AicHHN0T36vHoSve9Eof/JrdvXP5+m6zm+4SFvaEyo/Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764126010; c=relaxed/simple;
	bh=22k9NtrTDYGWJoFwNo7dc17XTol/VR+ezineJ4NI7IE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RENjZkOXzlLwO5BxB+WiTiDs1qHlHUXxAZZj05o1oJ5IODK13NahE5taWKvLcW7XZbpr8pymOXJgyU7PBUU5nUqJ/FKVrMZtbtkKS1xLjM10bJVSTssnCC2kuVtQBchbDrxk8+2sIMzgTWDQDq5Yi1JVIssUGjNAekqHfflpsro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=M9xQz/YY; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="M9xQz/YY"
Received: from localhost.localdomain (unknown [10.101.197.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 29C293F7C5;
	Wed, 26 Nov 2025 02:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1764125580;
	bh=T2cHVlHrm68HaRtexa57Mg22xq26fIOgu9ozaL25RQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=M9xQz/YYwQQtFLFaJkmbJoy/ocwgY+Pt25FZD38i53O1lDy4FIyONEgItEm81O3l4
	 KcV0zDrwdIcsCF4phudwaKqUuN04Iug22YadNEjKUFcyefRyp7cwQLN9tpGpDwYfiE
	 FtaqUKVMcNSpVpB3myds6sRy85PuJv5Nu2B4iBUYpEcS7tRUJ/qMTo0bscuoynywC8
	 vdpnmoqbUco8wL4HdsMrvNZz+NIRm6ZXA1PpCCDrNvmESAdT2CFjAesM9f8qVH+yK1
	 /HwMxFTPPxczvOeuuks/1Kmw8RGjXw55ngJlAZ3We+y0FrnS9tDedwty2j0r1LBRF/
	 +1Bfc8oBnj+Uzn5tYnY8sJbcS3cvGvyaPAlaE1IK50C+UVdML/voAUP8igyjIfz20C
	 zwNacNmFDsG3IlHCzEMJBBND8KbdjPmIqMiriFnftG2JVxZc7gG50p940B9lqomj4w
	 zIhTm9z6yaQUVXIxuzoHgeqKIo+dRFI4RTlrQJUqUFS7d0jtwn+W+8kxTthlVWB1NU
	 HCgoMWZQFf+bSMqPTq98sm8ZLDI3CniU4GGI6Qpay5RZgL/Q8GOBzT8B9T97Tcq2/+
	 tnLQk8/HnSaERqFzMCnhd2g5FP8rQvvERXa1KXEbPs1kkQLkzfMZ4JyodMCfHuXo3e
	 CF6k7VNDwxjNJ7l6ai5zg+NA=
From: Dirk Su <dirk.su@canonical.com>
To: 
Cc: dirk.su@canonical.com,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kailang Yang <kailang@realtek.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: fix mute/micmute LEDs don't work for HP 200 G2i
Date: Wed, 26 Nov 2025 10:51:30 +0800
Message-ID: <20251126025151.12332-1-dirk.su@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP 200 G2i needs quirk to make mic-mute/audio-mute working.

Signed-off-by: Dirk Su <dirk.su@canonical.com>
---
 sound/hda/codecs/realtek/alc269.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 70299e359ba0..a8e1ec92349f 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1656,6 +1656,13 @@ static void alc236_fixup_hp_mute_led_micmute_vref(struct hda_codec *codec,
 	alc236_fixup_hp_micmute_led_vref(codec, fix, action);
 }
 
+static void alc236_fixup_hp_mute_led_micmute_gpio(struct hda_codec *codec,
+				const struct hda_fixup *fix, int action)
+{
+	alc236_fixup_hp_mute_led_coefbit2(codec, fix, action);
+	alc236_fixup_hp_gpio_led(codec, fix, action);
+}
+
 static inline void alc298_samsung_write_coef_pack(struct hda_codec *codec,
 						  const unsigned short coefs[2])
 {
@@ -3790,6 +3797,7 @@ enum {
 	ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED,
 	ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED,
 	ALC288_FIXUP_SURFACE_SWAP_DACS,
+	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -5323,6 +5331,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc236_fixup_hp_mute_led_micmute_vref,
 	},
+	[ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc236_fixup_hp_mute_led_micmute_gpio,
+	},
 	[ALC236_FIXUP_LENOVO_INV_DMIC] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_inv_dmic,
@@ -6760,6 +6772,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e60, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e61, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e62, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8ec1, "HP 200 G2i", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8ed5, "HP EliteBook 8 Flip G2i 13", ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ed6, "HP EliteBook 8 G2i 13", ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ed7, "HP EliteBook 8 G2i 14", ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED),
-- 
2.43.0

