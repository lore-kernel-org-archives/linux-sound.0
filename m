Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284C629BD8C;
	Thu, 27 Nov 2025 03:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764212710; cv=none; b=VSQXUlnmiGuW4/zkHwLNHhXL8UD2BN6GiIHUMnwlHGQHhXupD8rs3tlH75Rcw22ZduNivrPIFZ1rwtqJZNZWQph8ItfSlwsw1H3lCILD7of9IKM9lK0J7iqTiTMDYLVE1c3S9yDc47ZlqWf5quXe+6w6AdBo0Vd4JkLvgp8RFuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764212710; c=relaxed/simple;
	bh=Ljrjwq55IneT0MLCETCOBRPN6RW+vgS46z8Fi3UZ6hE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SSXqYByK90gn9G1liPwwPt/baHPVSphcDUsh8Wd4JVjnDrNRIcCIivnG5xt6A0luBvYpuSRiz6DSoAG0Eek3g9OBv4MR2F3Yj0VKluG+hZO4TedRQBoHWvy66y3dsrDkopF5LKIaqKPba4T8xQaSdsIbx4KP5cBnGGPVKwNBerg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=R/c6pvNa; arc=none smtp.client-ip=185.125.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="R/c6pvNa"
Received: from localhost.localdomain (unknown [10.101.197.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id A025A42490;
	Thu, 27 Nov 2025 02:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1764212249;
	bh=E/Vy7JsfAf6QQYStFXMIzuqCnSTEINGAkbxjPbtYV1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=R/c6pvNaOI/ggoPBu8977F3MPI9Up/XixYLvFnWzHiEn0zup1HhnzArJjoRx/LJ/z
	 r4a6hhdy6vBiCsPdTZeHfuOabrem/CDsZfbsrVLahtH965ldW3NQ+9aEDjAijBE2Wd
	 RPq0+7b3VfNrio0LPIFLhx7fcve4gc+3kdjoAGKwnDWt4kBjba2EBZfuMxImW5N/lW
	 aal3RKO8emI/sxmbouhVdp9lyc0GpBkU1x6TdIdGqKja3VaF1h2z/BVvpAgDFGHYJp
	 rfFCmk1glxuUgkydyBRy/BsECxbwikNxDCWtC1OhcUZkOx1kQWD94f4gSpIGHao/+N
	 tHUd4yTx93RfuiOr6bXqY6/Dihvh8/BzAMPkcQ/TYOjOUmwNfk/5bw8vMTi3P+7son
	 +TWdBNiN2aGZpXiCWkh43Fo0955yp+Eg4+Gi/Usjr/z6GqBqpBSo64NsFEKoixV06c
	 EQiDCdLDkjhpCc6jqfX9xkTa/v+yhv71ML6Kuq+sg2cveoSWuZvDyEn9+aObuZsXXc
	 p28HEt0M9MJqTf2Hymhf8xsqNeHlpLHzMuc9NpGYk6cmYQFp3R8Y67wr0NdngNWCaa
	 abucwyEkLWOzRKDHinnu1BNnMsN5658Xtz5cxa9XOOtQUC/KlZTyk/9yf7PCN+PlIp
	 2EJnZqkxVdZTkWS/z2VxEYJs=
From: Dirk Su <dirk.su@canonical.com>
To: 
Cc: Dirk Su <dirk.su@canonical.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Kailang Yang <kailang@realtek.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Edip Hazuri <edip@medip.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: fix mute/micmute LEDs don't work for HP 200 G2i
Date: Thu, 27 Nov 2025 10:56:39 +0800
Message-ID: <20251127025651.13627-1-dirk.su@canonical.com>
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
 sound/hda/codecs/realtek/alc269.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 70299e359ba0..b21dc24cad20 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3790,6 +3790,7 @@ enum {
 	ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED,
 	ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED,
 	ALC288_FIXUP_SURFACE_SWAP_DACS,
+	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -5323,6 +5324,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc236_fixup_hp_mute_led_micmute_vref,
 	},
+	[ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc236_fixup_hp_mute_led_coefbit2,
+		.chained = true,
+		.chain_id = ALC236_FIXUP_HP_GPIO_LED,
+	},
 	[ALC236_FIXUP_LENOVO_INV_DMIC] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_inv_dmic,
@@ -6760,6 +6767,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e60, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e61, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e62, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8ec1, "HP 200 G2i", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8ed5, "HP EliteBook 8 Flip G2i 13", ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ed6, "HP EliteBook 8 G2i 13", ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ed7, "HP EliteBook 8 G2i 14", ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED),
-- 
2.43.0

