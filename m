Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CE91A2C04
	for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 12:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773318026; cv=none; b=Rk2HPlEC4j02ynCG+GlkIdg7Y/BzzL19RryORDgFcLAJcOyhpq/71Whb2T+cvXx0Aj9dlwtw8bqvNphIODwD5PbNCcVLx+7PvBmNxrbvH2Yd5jq2dDlgnwqCLDleNRMWGsYZNTt37OlqtLggMJAIdpdj6EMArFlz1clvr0IXATQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773318026; c=relaxed/simple;
	bh=SpilT2+A67SBUd3FY31lBzctB4jt2FGEBU5yBRGOaEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UgqliMxrUrgnZUxW2B9ujeTy9ZOyqVIAE/sQ67c7hYnuMhLixFUUIQhviGouhpgEL22iVlWChndh5bBGpkrujDc6DojS+FcOdUN0akXy35PZpftv4uxdTAr3NXBZpwN7wzr2TflPCTiz27FW3szW+kNPRAYm1gXYrjlRKP9DK94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b=x3jpoie8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b="x3jpoie8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-482f454be5bso21787415e9.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 05:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20230601.gappssmtp.com; s=20230601; t=1773318023; x=1773922823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=92/jIz5SL9RuQJC/BU2x7pqetHgoI2vlneGO9lZ+OSo=;
        b=x3jpoie8JE67mN6n0S3XxradSF8CignMqYRbheJvqc3R0Xbn06Q4DsZvL0zUimshTu
         oj1ZvM4+roPOKz5H+WyUKltPR+MmTjBUhVwA5+vQm19k/+jtjGPY7eYC3zoJWbkCZKTg
         /i0F/Z1Gk/vUxcVhdtAn/Xi9mCGNrboIifQ5Tcs4MocTD7KLUPlnBEGYP4yQi25Ir94s
         11l5K9b4uwyNlSvADW7fOl6IesqZUkyJ7gWtk7YDPDxUh4G1dw6ne29COhCNVrggteP3
         4py5RvqvCfAVrSgqGwJ2Jaj6GtMmVWPEQ8msMrsOOEuB2eca57UOAOpyJEUqMrUsXf46
         FMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773318023; x=1773922823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92/jIz5SL9RuQJC/BU2x7pqetHgoI2vlneGO9lZ+OSo=;
        b=wG6LRWcUPSTrkqDpuLQyztZF+MIpRfZ4j83QEMnjWgQNNQ7SvmGaFYVq8wZQwIVDtK
         VwuMgWbRhpZoQWJC0NfJUvGDJXlF5XkhPaqjubvTVKBmzCzL2ezxaTYT1Axn+qQX3cuy
         PyOzmfyHGc/JR7pVqS10p7CaY+NQzyZu3fa2AYoJx+xdgEaf+TPCDBRxg8ngcQtcf3vL
         nZmfug7Jtz9saOWsq0ghkcgUu1EIVnWFhb6a3wEiXut3YRrglXL7wR2UC8RgyspaHIdS
         coTv4gLBGfPa3GCBCXB6dapVPTayCfA3G714dYXmSeHc7lGShfU/+ltxxYQ04+Idf4cW
         yyYA==
X-Forwarded-Encrypted: i=1; AJvYcCWKEkQauDwGhfwBXfF6+KzEF+hsdHeNGJcgWEa75c7BcguNPbdaHRdPd/SyhueCw3wJJe7x9fsfFWJWAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsbcZpwBZh7wMxZLbZ4N+QU7TbKUa9F/B0LEPm2jsSginJPrZM
	EvXyw260Alvobk2nToo7u6xf192bzWCbvo1p7wjM8a8E2O/abwY4iMe9RP//AeXVZw==
X-Gm-Gg: ATEYQzxi0tYBV5ISxVtJnFaUBx1nsVr3A0BqwkqB4bR4mAmfuB/Qu00vrSCyruKAZu+
	+Dr2BbGzku3jmkp9cuK5ErPPb59RIKhCXB8j4EQ6RYbgm/MTmwG7Ucg1+RJeC7DZItt3z4kB06Y
	jSH9zob5AmboqupLFm96Jyx7KuDWlyY81rv+Z1vIkQXWbO5rV4GyN3O48TmI9B+5gdsIZQL1h4H
	3qpHWINE0KfZ0jsBBG4kGwgwlBKH3xj2r+kpYYUCHh0IZUKQEMgx5Pt7WTyNcSjg+9HPAQMMH+r
	m2q9no50XWt3jJ0m0KUKXZ16YElFxKHUHD4HqyDjg3dCccGnsXxw8cJVVuagk1Ifid6JbvrDDDF
	mYF0I4m2eCKhhKzOCN2epgMaGTE6m0fR1sMn9z7ZKRHpGmeyqCVoctOp/LYPvRLiBmBIIi3NErn
	FTTFWWvMU1c3dyPm9/h3ok4KHlZ1yyEonaopTvp+B1gOmL3i+vXG0klGzJR6tUqPGdB/huUwf+L
	AO8oNwv
X-Received: by 2002:a05:600c:848d:b0:485:33b7:573d with SMTP id 5b1f17b1804b1-4854f56a0a2mr46426525e9.1.1773318023155;
        Thu, 12 Mar 2026 05:20:23 -0700 (PDT)
Received: from starbook.localdomain ([212.105.129.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe23afc5sm8780832f8f.39.2026.03.12.05.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:20:22 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Kailang Yang <kailang@realtek.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Edip Hazuri <edip@medip.dev>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 1/2] Revert "ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter"
Date: Thu, 12 Mar 2026 12:20:20 +0000
Message-ID: <1801fec108ea0047af7b034928f0a5537e6901a8.1773318012.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The shutup delay workaround fixes the runtime suspend pop, but further
hardware testing showed that the StarFighter speaker path can be
controlled more directly.

The ALC233 speaker path uses LINE2 EAPD on NID 0x1b together with GPIO2
for the external speaker amplifier, so a better fix is to sequence those
controls at playback start and stop instead of sleeping in the shutup
callback.

Revert the previous workaround before adding the runtime sequencing fix.

This reverts commit 1cb3c20688fc8380c9b365d03aea7e84faf6a9fd.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Kailang Yang <kailang@realtek.com>
Cc: Chris Chiu <chris.chiu@canonical.com>
Cc: Edip Hazuri <edip@medip.dev>
Cc: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 sound/hda/codecs/realtek/alc269.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 4c49f1195e1b..f5719e630d28 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1017,24 +1017,6 @@ static int alc269_resume(struct hda_codec *codec)
 	return 0;
 }
 
-#define STARLABS_STARFIGHTER_SHUTUP_DELAY_MS	30
-
-static void starlabs_starfighter_shutup(struct hda_codec *codec)
-{
-	if (snd_hda_gen_shutup_speakers(codec))
-		msleep(STARLABS_STARFIGHTER_SHUTUP_DELAY_MS);
-}
-
-static void alc233_fixup_starlabs_starfighter(struct hda_codec *codec,
-					      const struct hda_fixup *fix,
-					      int action)
-{
-	struct alc_spec *spec = codec->spec;
-
-	if (action == HDA_FIXUP_ACT_PRE_PROBE)
-		spec->shutup = starlabs_starfighter_shutup;
-}
-
 static void alc269_fixup_pincfg_no_hp_to_lineout(struct hda_codec *codec,
 						 const struct hda_fixup *fix, int action)
 {
@@ -4058,7 +4040,6 @@ enum {
 	ALC245_FIXUP_CLEVO_NOISY_MIC,
 	ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE,
 	ALC233_FIXUP_MEDION_MTL_SPK,
-	ALC233_FIXUP_STARLABS_STARFIGHTER,
 	ALC294_FIXUP_BASS_SPEAKER_15,
 	ALC283_FIXUP_DELL_HP_RESUME,
 	ALC294_FIXUP_ASUS_CS35L41_SPI_2,
@@ -6519,10 +6500,6 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		},
 	},
-	[ALC233_FIXUP_STARLABS_STARFIGHTER] = {
-		.type = HDA_FIXUP_FUNC,
-		.v.func = alc233_fixup_starlabs_starfighter,
-	},
 	[ALC294_FIXUP_BASS_SPEAKER_15] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc294_fixup_bass_speaker_15,
@@ -7685,7 +7662,6 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x2782, 0x1705, "MEDION E15433", ALC269VC_FIXUP_INFINIX_Y4_MAX),
 	SND_PCI_QUIRK(0x2782, 0x1707, "Vaio VJFE-ADL", ALC298_FIXUP_SPK_VOLUME),
 	SND_PCI_QUIRK(0x2782, 0x4900, "MEDION E15443", ALC233_FIXUP_MEDION_MTL_SPK),
-	SND_PCI_QUIRK(0x7017, 0x2014, "Star Labs StarFighter", ALC233_FIXUP_STARLABS_STARFIGHTER),
 	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
 	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged", ALC256_FIXUP_INTEL_NUC8_RUGGED),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
@@ -7782,7 +7758,6 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC298_FIXUP_TPT470_DOCK_FIX, .name = "tpt470-dock-fix"},
 	{.id = ALC298_FIXUP_TPT470_DOCK, .name = "tpt470-dock"},
 	{.id = ALC233_FIXUP_LENOVO_MULTI_CODECS, .name = "dual-codecs"},
-	{.id = ALC233_FIXUP_STARLABS_STARFIGHTER, .name = "starlabs-starfighter"},
 	{.id = ALC700_FIXUP_INTEL_REFERENCE, .name = "alc700-ref"},
 	{.id = ALC269_FIXUP_SONY_VAIO, .name = "vaio"},
 	{.id = ALC269_FIXUP_DELL_M101Z, .name = "dell-m101z"},
