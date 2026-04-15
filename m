Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC023AE6EE
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 07:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239331; cv=none; b=MKSf1PcjxfBHiOH/7pvJodrOCXeZyg28uDiyotqa7J1d/PxB1urWg9Tft3xAW0OTLdRxhOGG4n7pM8jlscThQ2DqBb3P2faxp+tInB17rKzNTsx93hAamfSDdOaOnno1VLCenhuSLKV2YD/ozlI7GRE7UndvGywPKbD4HwukdIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239331; c=relaxed/simple;
	bh=V+/DHUy57e+guISjr8HDQ0jW3CGXKPKRE5C5yNGsMTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J8gy8On86JA2oWftA2BhVbKkP2l9IQ0ljDLvvXJJAYxqMYjV0n8ekLPbEDPBSvPtASzrpDUeLGGTb6Fc9iDhoIUKKe8I8/30P/nECvWnOcCVW5IxTsaiyXcNDp9Vj1xpOb38U/C7zCyq5hv/ypn+Wt5whWj8jHeT63BM9fY20OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AR6niP2T; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AR6niP2T"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso99670225e9.3
        for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 00:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776239328; x=1776844128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jxy1JsaV0S2nhdqwGK/RJ7VYQI9SQ8NHnpCZqEqBIUY=;
        b=AR6niP2TbUQKMy1fPggUH6IN5liK4Zex2UcdFwuDswVZfTF9ZFz3mBi/Ig/L4XMfiU
         SoYnyvQ9OMB0vGpfsAQuelX86jKM/uDXJ5rNCg1sin4gHSaAr+yCjFPNydDlPk9TuuwS
         JBKqiWSxUIBSba1eX7++TzNkReXOrNeaGjnbwmkf7zMNFtLVlF7rFFoRk+yiG+cCl4Vw
         RsWLPVEoExsp/pZhlWP3ehDbFKR7fzO86W2DQGLumDsYX8T+m4RemhadKVoQhKYiWTiJ
         kdi2YRE3R8knJXTjYAMYAx8qP1e3IwzwFDGXPTYBQSt2UtFMW8SHmc7vTKFbj2VTen6i
         OgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776239328; x=1776844128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxy1JsaV0S2nhdqwGK/RJ7VYQI9SQ8NHnpCZqEqBIUY=;
        b=NPntmeplP1Xt77dEGVNU/M+ibCX4mKZQE0IjEeXCBpKZa3dkMF4qkE2OXEBRCatm3h
         t6qkTRxDB9BeO+1WWPMipRxPToKlFMELru6nEcHjFuh6Z73mqef7oLUDLFZiDhoVmkhs
         DtNo9i3jcavBV89aCcQJNz/4BBdsG5TBYC3y2VOi36y9gd54MucCYRY7SYO2n2GHouhy
         UytuDfV1SWi58i4H4fya6ZVmvwcyV5Gl4RO5DJthaVbKmh2K1nYxkJixr+3myZMKLZ2K
         jGjs3PjlOY+QdZWD8qpGNn0Q5Uf+NZmmaOCQmjFBZNoUfQb5PA1Q36i1jSmaNZcXW7F3
         Hpdg==
X-Gm-Message-State: AOJu0YycooFP1EZbR1pP1vXBtPXLTnVbxx8Kk9va1N7vTSaRgymAxitO
	A5Zsq+o2oxBbBgYHua0XPICHrPsRswhljTzX0eWs6IUxnbbRljoS3/E=
X-Gm-Gg: AeBDiesw9M+JwJDMEvGkHbR99kOIqpVAhmYJlVgVXYs9SxC/wwKxCFMdxVB5RG7Zihy
	40+TSjqgWzxx+Zk429dBu7/quXJX5N8ciZTR9vBzYh4eaSF4uotjXk0wnFzFN4+E+j+zbSLPu0X
	UjMFDS29ChzMs3V0Qc+4bzFI9a9tcsmrVYSmLQe2UVtD6SsilPWLo0CNibXsea/54rqA9piAO6n
	E/nqio1F6Cpm1gFauJ6poEciAMqkrWeVhfa+y/IG92TwdwLkPWpXEjFLUuQ60z7tMOoxfzKQETY
	qycRi3o3nBf0zjjs2mU2lmJ+0seOb6U60sF8/xp4uwlymDhA/3dhfRC6feBgvzo5el5C8oqjvxe
	oeL1BHy3dEzfrfTEv0BNbTgjrxYBm2Loka/Pp1i617hB2tbW4YV+PSo0h8DulXSlV8SZjxgFLNA
	/T0LP5RvKR1GOJwkCZ3zY+eR6UjvMVJQu5HQ==
X-Received: by 2002:a05:600c:8b2f:b0:487:1520:d107 with SMTP id 5b1f17b1804b1-488d688da37mr285230745e9.31.1776239327764;
        Wed, 15 Apr 2026 00:48:47 -0700 (PDT)
Received: from endg4me-lt ([178.17.53.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f1e95130sm29454375e9.13.2026.04.15.00.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 00:48:47 -0700 (PDT)
From: Timofey Tarasenko <timka.tarasen@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Timofey Tarasenko <timka.tarasen@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: add quirk for HONOR MRB-XXX M1020
Date: Wed, 15 Apr 2026 17:46:57 +1000
Message-ID: <20260415074657.1217862-1-timka.tarasen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds pin fixups to enable subwoofer and JACK functionality
on Honor Magicbook Art 14 2025 (HONOR MRB-XXX M1020)

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221147
Signed-off-by: Timofey Tarasenko <timka.tarasen@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 45f9d6487388..d35932b46267 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4124,6 +4124,7 @@ enum {
 	ALC245_FIXUP_ACER_MICMUTE_LED,
 	ALC245_FIXUP_CS35L41_I2C_2_MUTE_LED,
 	ALC236_FIXUP_HP_DMIC,
+	ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -6666,6 +6667,16 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x12, 0x90a60160 }, /* use as internal mic */
 			{ }
 		},
+	},
+	[ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x14, 0x90170111 },
+			{ 0x19, 0x03a1113c },
+			{ 0x1a, 0x22a190a0 },
+			{ 0x1b, 0x90170110 },
+			{ }
+		}
 	}
 };
 
@@ -7753,6 +7764,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1d72, 0x1947, "RedmiBook Air", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1e39, 0xca14, "MEDION NM14LNL", ALC233_FIXUP_MEDION_MTL_SPK),
 	SND_PCI_QUIRK(0x1ee7, 0x2078, "HONOR BRB-X M1010", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1ee7, 0x2081, "HONOR MRB-XXX M1020", ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO),
 	SND_PCI_QUIRK(0x1f4c, 0xe001, "Minisforum V3 (SE)", ALC245_FIXUP_BASS_HP_DAC),
 	SND_PCI_QUIRK(0x1f66, 0x0105, "Ayaneo Portable Game Player", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x2014, 0x800a, "Positivo ARN50", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
@@ -7973,6 +7985,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC236_FIXUP_LENOVO_INV_DMIC, .name = "alc236-fixup-lenovo-inv-mic"},
 	{.id = ALC2XX_FIXUP_HEADSET_MIC, .name = "alc2xx-fixup-headset-mic"},
 	{.id = ALC245_FIXUP_BASS_HP_DAC, .name = "alc245-fixup-bass-hp-dac"},
+	{.id = ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO, .name = "alc256-honor-mrb-xxx-m1020-audio"},
 	{}
 };
 #define ALC225_STANDARD_PINS \
-- 
2.53.0

