Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF63D1A3AB0
	for <linux-sound@vger.kernel.org>; Sat,  1 Aug 2026 06:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785564420; cv=none; b=DyaUcTOpEuNPGZBWZgSLeXDrOaBzFrckcyHgWAFZgtOQbIQBRcwVoq79QZr5nM7ehQwgkRpHFWMamXZWk6Ut/yzFRwEHtCnmI2JcjrFyuBQw0NOPG5wsKSG4hRREdbRq3JMRcCm4d0rxKScNPx71p9RH9pmH+essZ/VeGoo7chw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785564420; c=relaxed/simple;
	bh=C17v7nsA9Qzj8pHyor5sagLVN+uKS5BLSI9jXiIN4Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kogOaVZX5cpCfquhjq5BLu3vpfvd5kSUV33HLoDtwSX31X9SN0aeuuDo16xo+v1aiB1ZMkcSP6JRtAwlTDmT++rVhffEldQrnOE6vOLLg+xiQLQHhfYYwMKVCcuNvz+bf+U9hqpR1xGUk89qejrHeXvPx2HAvoJVYM7dH7U5Qk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YW6dFR8a; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YW6dFR8a"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-446f87b6de1so1145251fac.3
        for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 23:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785564417; x=1786169217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ssgfiod7fls0kWP4VyuI4UTisD0HHAIkvZaq5QR+lCg=;
        b=YW6dFR8aOYXXYjZOwkq6lP8fj+kl2xkdpwn0pxTTuHtAfZ466b5kXE0dnUuoZsGmTc
         sglr1ViSRZNkA+A6lZ8HsfV2eFxh1UqC+IAsGre0uR79O+p9Uc35hBbLHMxRCEp51aqs
         gbLqn84yl2CSzsvUNwblYl4L2JSmgTtt+jYpD42GI98QNFthwgHuVp6HSgcqKLBwtoo7
         7f00AkmOS5P96DRWT7coItJzRKakvvzvXcLJq4OFp3TqZ2muvd0I4W8um4SMvopaY9KH
         fb/E0NX4aY/j8tMphGQk+N2KR6EFVkeukJc8zZ3KNYl//oYyaFDV52Pcx+v0dRuH4UXi
         rwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785564417; x=1786169217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssgfiod7fls0kWP4VyuI4UTisD0HHAIkvZaq5QR+lCg=;
        b=EzI8tWKKxlettTN+pMKmOp1Y+A3de/w6J1vpTdftJ6zIk4PNW0u6PZkEizSbpsn05p
         2Af1I/wVNK4esyhuEBZRgqu/PsYxR248oBoihxuj92tDho+ZI+3oW5boxnco/kbJ8ROW
         5m1O8mE+R/UVAc0Ue8TPlabXTNcBp2dDuvc91fq2E+KMFATbIXCFYTltkUCLVZx6D3Ts
         YrcSYfV8Wxpnbs7PSi4+BAAxJ9QeMgBd1Eeu+nF2G55+aNAkHL2gTHtqQ534ZNfe+GB+
         prbsHTJ3GbUFGjUrQ97+fHcC7eYWF+XIr9a3ag/PzoxwDokZafyTqv2EHjLEs5DKIVSX
         elig==
X-Forwarded-Encrypted: i=1; AHgh+RquCrBnbcBE3ofJRW0NGl/6BfbTVSn3zvINj1FoR2ok3+RUhz+nEQjIWAxtw4Pyrq3N1raoUdJ6mw9WPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4PpEn8MtFFk//Tce6ECc9z7ErsybsBNETu7G2++P5yZMZQQMQ
	cvO6vfSH7tjIPMo62eJCAWGuIE8TJxrs8o97QWtywdLqM1/4lidlsnzu
X-Gm-Gg: AR+sD10v6Ktj8EGxFkeyvQXwYckdE9eBNh+XCz+a9scFAzf4rF3Fyo/TroPniYFdVSt
	w9Zh3a++CG7TaTU1tz4S4j5lk463WEksJ7/0ltEox5ik7xCDDI5g22QQDzPy0IGMB5Yc//l2liS
	vOgDjjcc8a13uZjkjxQ34NCGJvFfBHw6DE0tgPHw6falzFe3mWof+hhaUcKNjyzqIZy12Wum0Du
	Mnd7q1r285Dg0K/8Jj3Pgai43zWZR6+kaGbhDyzigh0k0fFU7C+ibF7q4OWNJ9Re/GZsXxsl8Yf
	G3yP7gKSfrGOLjcV1tWzR4djstewVJCTS3dOObG/VXkieUrfXectnLcKsQuHXz7x0dOVbRCaA+D
	qiwM5kDHuc1pVv0uUV+Jh2EBypoSi1EFafgaXXIO3Y2TB1TumbpyRvOG8t8nWMwtoWiS0yg0Kxa
	ZOOY9SjwSGFHRJ2K2arxohp0s4+RS9FvbVfvhzt4nJX4ICLqc2NRZqSZMbRXdi5HqwWOl3GaK35
	+gBOQ==
X-Received: by 2002:a05:6871:b28:b0:457:b657:b084 with SMTP id 586e51a60fabf-45905ade6damr5302585fac.18.1785564417550;
        Fri, 31 Jul 2026 23:06:57 -0700 (PDT)
Received: from u-ThinkPad-X1-Extreme-Gen-4i ([192.3.12.183])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f664d812sm3473404fac.9.2026.07.31.23.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 23:06:56 -0700 (PDT)
From: Aaron Ma <mapengyu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Zhang Heng <zhangheng@kylinos.cn>,
	Kailang Yang <kailang@realtek.com>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Aaron Ma <mapengyu@gmail.com>,
	Bob Song <songxiebing@kylinos.cn>,
	marco_giunta@outlook.it
Subject: [PATCH 1/3] ALSA: hda/realtek: Use AW88399 I2C fixup chain on Legion machines
Date: Sat,  1 Aug 2026 14:06:28 +0800
Message-ID: <20260801060630.2768318-1-mapengyu@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Six Lenovo Legion codec SSIDs use an ALC287 with two AW88399 amplifiers
registered through AWDZ8399. Bind them to ALC287_FIXUP_AW88399_I2C_2 and
chain the existing microphone, headset, jack, and DAC-routing fixups.
Disable auto-mic switching to preserve explicit internal-mic selection.

Drop the dedicated Legion fixup and its redundant 0x1d override. Firmware
already marks 0x1d as an unused modem-line pin, which the parser ignores;
overriding it only produces a legacy SKU warning. Retain the existing
Lenovo routing for quad-speaker output.

Signed-off-by: Aaron Ma <mapengyu@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 62 +++++++++++++------------------
 1 file changed, 26 insertions(+), 36 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f7877127e0e49..2e3f7f1b52782 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3270,32 +3270,14 @@ static void find_cirrus_companion_amps(struct hda_codec *cdc)
 
 static void aw88399_fixup_i2c_two(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
 {
+	struct alc_spec *spec = cdc->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
+		spec->gen.suppress_auto_mic = 1;
+
 	comp_generic_fixup(cdc, action, "i2c", "AWDZ8399", "-%s:00-aw88399-hda.%d", 2);
 }
 
-static void alc287_fixup_legion_16iax10h_aw88399(struct hda_codec *codec,
-						 const struct hda_fixup *fix, int action)
-{
-	static const struct hda_pintbl pincfgs[] = {
-		{ 0x1d, 0x411111f0 }, /* unused bogus pin */
-		{ }
-	};
-
-	/*
-	 * Force DAC 0x02 for the bass speaker 0x17, as the default 0x06 lacks volume controls.
-	 */
-	static const hda_nid_t conn[] = { 0x02 };
-
-	alc269_fixup_limit_int_mic_boost(codec, fix, action);
-
-	switch (action) {
-	case HDA_FIXUP_ACT_PRE_PROBE:
-		snd_hda_apply_pincfgs(codec, pincfgs);
-		snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
-		break;
-	}
-}
-
 static void cs35l41_fixup_i2c_two(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
 {
 	comp_generic_fixup(cdc, action, "i2c", "CSC3551", "-%s:00-cs35l41-hda.%d", 2);
@@ -4267,7 +4249,8 @@ enum {
 	ALC274_FIXUP_HP_89E9_GPIO,
 	ALC274_FIXUP_HP_VERBS,
 	ALC287_FIXUP_AW88399_I2C_2,
-	ALC287_FIXUP_LENOVO_LEGION_AW88399,
+	ALC287_FIXUP_AW88399_LIMIT_INT_MIC_BOOST,
+	ALC287_FIXUP_AW88399_HEADSET_MIC,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -6967,12 +6950,20 @@ static const struct hda_fixup alc269_fixups[] = {
 	[ALC287_FIXUP_AW88399_I2C_2] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = aw88399_fixup_i2c_two,
-	},
-	[ALC287_FIXUP_LENOVO_LEGION_AW88399] = {
-		.type = HDA_FIXUP_FUNC,
-		.v.func = alc287_fixup_legion_16iax10h_aw88399,
 		.chained = true,
-		.chain_id = ALC287_FIXUP_AW88399_I2C_2,
+		.chain_id = ALC287_FIXUP_AW88399_LIMIT_INT_MIC_BOOST,
+	},
+	[ALC287_FIXUP_AW88399_LIMIT_INT_MIC_BOOST] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc269_fixup_limit_int_mic_boost,
+		.chained = true,
+		.chain_id = ALC287_FIXUP_AW88399_HEADSET_MIC,
+	},
+	[ALC287_FIXUP_AW88399_HEADSET_MIC] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_headset_mode_no_hp_mic,
+		.chained = true,
+		.chain_id = ALC287_FIXUP_LENOVO_XPAD_HEADSET_JACK,
 	},
 };
 
@@ -8037,8 +8028,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	/* Legion R9000P ADR10 shares PCI SSID 17aa:38bb with Yoga S780-14.5 Air AMD quad AAC;
 	 * use codec SSID to distinguish them
 	 */
-	HDA_CODEC_QUIRK(0x17aa, 0x3927, "Legion R9000P ADR10", ALC287_FIXUP_LENOVO_LEGION_AW88399),
-	HDA_CODEC_QUIRK(0x17aa, 0x3928, "Legion R9000P ADR10", ALC287_FIXUP_LENOVO_LEGION_AW88399),
+	HDA_CODEC_QUIRK(0x17aa, 0x3927, "Legion R9000P ADR10", ALC287_FIXUP_AW88399_I2C_2),
+	HDA_CODEC_QUIRK(0x17aa, 0x3928, "Legion R9000P ADR10", ALC287_FIXUP_AW88399_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38bb, "Yoga S780-14.5 Air AMD quad AAC", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38be, "Yoga S980-14.5 proX YC Dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38bf, "Yoga S980-14.5 proX LX Dual", ALC287_FIXUP_TAS2781_I2C),
@@ -8066,8 +8057,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38fc, "Lenovo Yoga Pro 7 15ASH11", ALC287_FIXUP_LENOVO_YOGA_PRO7),
 	SND_PCI_QUIRK(0x17aa, 0x38fd, "ThinkBook plus Gen5 Hybrid", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
-	HDA_CODEC_QUIRK(0x17aa, 0x3906, "Legion Pro 7i 16IAX10H / Y9000P IAX10", ALC287_FIXUP_LENOVO_LEGION_AW88399),
-	HDA_CODEC_QUIRK(0x17aa, 0x3907, "Legion Pro 7i 16IAX10H / Y9000P IAX10", ALC287_FIXUP_LENOVO_LEGION_AW88399),
+	HDA_CODEC_QUIRK(0x17aa, 0x3906, "Legion Pro 7i 16IAX10H / Y9000P IAX10", ALC287_FIXUP_AW88399_I2C_2),
+	HDA_CODEC_QUIRK(0x17aa, 0x3907, "Legion Pro 7i 16IAX10H / Y9000P IAX10", ALC287_FIXUP_AW88399_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x390d, "Lenovo Yoga Pro 7 14ASP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3911, "Lenovo Yoga Pro 7 14IAH10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3912, "Lenovo Xiaoxin 14 GT", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
@@ -8077,8 +8068,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3920, "Yoga S990-16 pro Quad VECO Quad", ALC287_FIXUP_TXNW2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3929, "Thinkbook 13x Gen 5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x392b, "Thinkbook 13x Gen 5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
-	HDA_CODEC_QUIRK(0x17aa, 0x3938, "Legion Pro 7 16AFR10H", ALC287_FIXUP_LENOVO_LEGION_AW88399),
-	HDA_CODEC_QUIRK(0x17aa, 0x3939, "Legion Pro 7 16AFR10H", ALC287_FIXUP_LENOVO_LEGION_AW88399),
+	HDA_CODEC_QUIRK(0x17aa, 0x3938, "Legion Pro 7 16AFR10H", ALC287_FIXUP_AW88399_I2C_2),
+	HDA_CODEC_QUIRK(0x17aa, 0x3939, "Legion Pro 7 16AFR10H", ALC287_FIXUP_AW88399_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x393e, "Lenovo ThinkBook 14 G8+ IPH", ALC287_FIXUP_LENOVO_XPAD_HEADSET_JACK),
 	HDA_CODEC_QUIRK(0x17aa, 0x394c, "Lenovo Yoga Slim 7 14AGP11", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3977, "IdeaPad S210", ALC283_FIXUP_INT_MIC),
@@ -8383,7 +8374,6 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC2XX_FIXUP_HEADSET_MIC, .name = "alc2xx-fixup-headset-mic"},
 	{.id = ALC245_FIXUP_BASS_HP_DAC, .name = "alc245-fixup-bass-hp-dac"},
 	{.id = ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO, .name = "alc256-honor-mrb-xxx-m1020-audio"},
-	{.id = ALC287_FIXUP_LENOVO_LEGION_AW88399, .name = "alc287-lenovo-legion-aw88399"},
 	{}
 };
 #define ALC225_STANDARD_PINS \
-- 
2.53.0

