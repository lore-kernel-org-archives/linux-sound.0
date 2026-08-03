Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C7E3B058B;
	Mon,  3 Aug 2026 09:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748288; cv=none; b=KvTnbhmUaSdcpyB9n1pbys0QA2AWfvHNDKV1mjUVC7ZJFVGETZvzdrY+ecRbWvC0k7edIMM5taRDDDqLOaXx4OOEbYa9X5BX3oqxkLpe35uBRFw1fzAl48/2eTVxaU/ch+W9qfxEN99XEmAHqeEFF8Fgputu0rcXRMozdGUjtaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748288; c=relaxed/simple;
	bh=1RNI+wcDYvIOMI37hOH2m8FSKSzYAKfrKVw511iqkRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ayf53zJnoXoM+gcAurGDgO5UgMj1EboG7FBl6NV4Mev79FLqDxQV1qBpa5E31tou1Ko5R6GFHaAQi/LZjRpj1/ylhjPvH04U2q3iUjmTdoXWQSLi4j7SS/yQpgfUoCRKE1DGba1QxR3kQoikEgjOpWRvgvWI9vF2YZViOPDnOVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=H7wQD4wQ; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="H7wQD4wQ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD03F28055C;
	Mon,  3 Aug 2026 11:11:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1785748284; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=AWv5ePhR0k5yGLXcc7npvot6xniBkWURd44Nuy7WecA=;
	b=H7wQD4wQXv1z3kqLm9h1g0mg0NCedfWNPXHiXw6YitE6y90xaK+wy8HgrE6sqly8qRqjfw
	8YG8y4bxRY6sm4Xx7BWuHOaEjhpMZlNqE8zZJWbghJurj8pAMLyEpO+e2pnnx47ED540qK
	mvTK0ieiMOTjiRUP9nBGHAI4A5RDubVsR32qLnl9vBTFvk50CFcPKz0ojUKxcVvTKn5+Cm
	xWK4mwjPracsJU8jBE0d22ZOdtdHE6ijB2HXF/37PsQvcKlx3v3MWvRDQGHBTF7uOBhoP8
	advusOEaLdF+pbeJJod+o7K2WydWUCUHSHGt1ibYEIa246079vCfgqCf+/dYZQ==
From: Eric Naim <dnaim@cachyos.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Eric Naim <dnaim@cachyos.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] ALSA: hda/realtek: Remove ALC294_FIXUP_CS35L41_I2C_2
Date: Mon,  3 Aug 2026 16:10:50 +0700
Message-ID: <20260803091102.107570-2-dnaim@cachyos.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803091102.107570-1-dnaim@cachyos.org>
References: <20260803091102.107570-1-dnaim@cachyos.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

ALC294_FIXUP_CS35L41_I2C_2 is exactly the same as
ALC287_FIXUP_CS35L41_I2C_2, so remove the former and move existing
devices that previously used ALC294_FIXUP_CS35L41_I2C_2 to
ALC287_FIXUP_CS35L41_I2C_2.

Signed-off-by: Eric Naim <dnaim@cachyos.org>
---
 sound/hda/codecs/realtek/alc269.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index e9b0f3aa9776..f44996869059 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4232,7 +4232,6 @@ enum {
 	ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD,
 	ALC2XX_FIXUP_HEADSET_MIC,
 	ALC289_FIXUP_DELL_CS35L41_SPI_2,
-	ALC294_FIXUP_CS35L41_I2C_2,
 	ALC256_FIXUP_ACER_SFG16_MICMUTE_LED,
 	ALC256_FIXUP_HEADPHONE_AMP_VOL,
 	ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX,
@@ -6730,10 +6729,6 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC289_FIXUP_DUAL_SPK
 	},
-	[ALC294_FIXUP_CS35L41_I2C_2] = {
-		.type = HDA_FIXUP_FUNC,
-		.v.func = cs35l41_fixup_i2c_two,
-	},
 	[ALC256_FIXUP_ACER_SFG16_MICMUTE_LED] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc256_fixup_acer_sfg16_micmute_led,
@@ -7671,7 +7666,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1863, "ASUS UX6404VI/VV", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1881, "ASUS Zephyrus S/M", ALC294_FIXUP_ASUS_GX502_PINS),
 	SND_PCI_QUIRK(0x1043, 0x18b1, "Asus MJ401TA", ALC256_FIXUP_ASUS_HEADSET_MIC),
-	SND_PCI_QUIRK(0x1043, 0x18d3, "ASUS UM3504DA", ALC294_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1043, 0x18d3, "ASUS UM3504DA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x18f1, "Asus FX505DT", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x194e, "ASUS UX563FD", ALC294_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x1970, "ASUS UX550VE", ALC289_FIXUP_ASUS_GA401),
@@ -7682,7 +7677,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x19f4, "ASUS UM3405GA", ALC294_FIXUP_ASUS_I2C_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1a13, "Asus G73Jw", ALC269_FIXUP_ASUS_G73JW),
 	SND_PCI_QUIRK(0x1043, 0x1a63, "ASUS UX3405MA", ALC294_FIXUP_ASUS_SPI_HEADSET_MIC),
-	SND_PCI_QUIRK(0x1043, 0x1a83, "ASUS UM5302LA", ALC294_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x1043, 0x1a83, "ASUS UM5302LA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1a8e, "ASUS G712LWS", ALC294_FIXUP_LENOVO_MIC_LOCATION),
 	SND_PCI_QUIRK(0x1043, 0x1a8f, "ASUS UX582ZS", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1b11, "ASUS UX431DA", ALC294_FIXUP_ASUS_COEF_1B),
-- 
2.55.0
