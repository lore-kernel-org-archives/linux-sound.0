Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E891A0B05
	for <linux-sound@vger.kernel.org>; Wed, 28 Aug 2024 20:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724876122; cv=none; b=XNvOvnvw73HhUetknL3N2uef8DMVHZRoStiicHVfSsBFVQ2LafPDi+ELsO69kfcuEaO1rXWOzhnFGefxJ7zZQ7IW16fDIQeGiMLJsmz8AxfUiRq1Awb2VH+t0R0uiyb6/sq2FcL05qOWlJgEqJM+D46ufX9XFpvPGzCo7bkH6YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724876122; c=relaxed/simple;
	bh=qMv8kS2wPT6Fcpvyz9ylAaj6cJnDHn1M2evcby3D154=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X/YI32ca7ilNDvhHxOlW0BCIQc1MPe96s7AdgRMa5JvVmg5dmGXW1W9F4FSAdbLmrqNdGxF8pSENU/z4U0gLZpYUq0z8/iujxxGEPQY9/BeNFzImlGw6c5AYrgIAddK2CD2v7XisR7n3NfQbzGUekoPYsNVedViKcCPmSBTdOf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iYp3NnJU; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iYp3NnJU"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71433096e89so6090256b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 28 Aug 2024 13:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724876120; x=1725480920; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YVCTrbMf1sTGotshIDLMzBV9qNa2qrimN7njbsJ8Bu4=;
        b=iYp3NnJUdEbggGzcs5CktNlAumANjgyoFfdJkrD6Pf7jA97MhN5Y2Z8w0vN4rgDQpf
         yyJ/q7wmaE6uJ43mcmUOzQ2MnRHVATTlxka90Z2Kh8aXMgrknz3wkhJf+Q2LBVVVb37c
         0LL08rFAMWG16jt1wd4OnANxMfKJx1WIi1/tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724876120; x=1725480920;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YVCTrbMf1sTGotshIDLMzBV9qNa2qrimN7njbsJ8Bu4=;
        b=UEqNW704DmmQFecRdQ2u0Rs21BJj1OZ6T57nUrqrWbYJRJ0eucgtNx9SyAlooBltp3
         pNd/R+DclnZ9jdYw6pHXBkUFLUqwH2bYK1wZ6blzaLg1fUuel+v+QEoilWbHfEfp6RBE
         Q+JC43slDZvOxD2Ee3QbJKfJWtZZtWoTTRcY/KMmlS14Z17J5KzHYNwe2G642xsUg+gp
         QsYLwROsPEzITKFhUBmqSIiHQ4He++nDAkNsxEx6XkOpFoZBK142pR6kfZ4R1jQ2AIE1
         l5cFxbFLWKrqJeWTTdUeZekBqxqAPlpKjTGIqIdlB3AoFjitRRDYoa2D/IhqMqURq81S
         O9sA==
X-Gm-Message-State: AOJu0Yx8K8TMAm91QZux1GdiwVzYLjUZNukInQss7GGPTpx7iUJQdHFH
	39TXsMq+bxNa4HzZyM8pHG/VU0p1wW2tXpuamXPcpN59vaLgP7H/IyKmbHdi5A==
X-Google-Smtp-Source: AGHT+IEqNESDw8taCPOE3BDUJfZvlbdfYPNLgxGnEs7m34KKf/NxICGBeft9wHZ473VFtIA4WWseUQ==
X-Received: by 2002:a05:6a21:6e4b:b0:1cc:c202:b289 with SMTP id adf61e73a8af0-1cce0eeb267mr632164637.0.1724876120146;
        Wed, 28 Aug 2024 13:15:20 -0700 (PDT)
Received: from htcheong-p620.tpe.corp.google.com ([2401:fa00:1:17:12b:e9e8:cb3:7d66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434255548sm10496322b3a.79.2024.08.28.13.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 13:15:19 -0700 (PDT)
From: Terry Cheong <htcheong@chromium.org>
Date: Thu, 29 Aug 2024 04:15:16 +0800
Subject: [PATCH] ASoC: patch_realtek: add chain for fixups in Lenovo V145
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-lenovo-v145-fixes-v1-1-133d1e6813b3@chromium.org>
X-B4-Tracking: v=1; b=H4sIAFOFz2YC/x3LQQqAIBBA0avErBtQUciuEi1KpxoIDQUJors3t
 Hx8/gOVClOFsXugUOPKOQl030E4lrQTchSDUcaqwXg8KeWWsWnrcOObKnoVtFpsXIN3IN9V6A+
 yTfP7fhAk3gJjAAAA
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Terry Cheong <htcheong@chromium.org>
X-Mailer: b4 0.13.0

Lenovo V145 is having phase inverted dmic but simply applying inverted
dmic fixups does not work. Chaining up verb fixes for ALC283 enables
inverting dmic fixup to work properly.

Signed-off-by: Terry Cheong <htcheong@chromium.org>
---
 sound/pci/hda/patch_realtek.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 588738ce7380..bbda235ea96c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7538,6 +7538,7 @@ enum {
 	ALC236_FIXUP_HP_GPIO_LED,
 	ALC236_FIXUP_HP_MUTE_LED,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF,
+	ALC236_FIXUP_LENOVO_INV_DMIC,
 	ALC298_FIXUP_SAMSUNG_AMP,
 	ALC298_FIXUP_SAMSUNG_AMP2,
 	ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET,
@@ -9161,6 +9162,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc236_fixup_hp_mute_led_micmute_vref,
 	},
+	[ALC236_FIXUP_LENOVO_INV_DMIC] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_inv_dmic,
+		.chained = true,
+		.chain_id = ALC283_FIXUP_INT_MIC,
+	},
 	[ALC298_FIXUP_SAMSUNG_AMP] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc298_fixup_samsung_amp,
@@ -10707,6 +10714,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3855, "Legion 7 16ITHG6", ALC287_FIXUP_LEGION_16ITHG6),
 	SND_PCI_QUIRK(0x17aa, 0x3865, "Lenovo 13X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3866, "Lenovo 13X", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x17aa, 0x3913, "Lenovo 145", ALC236_FIXUP_LENOVO_INV_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x3869, "Lenovo Yoga7 14IAL7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7 / Yoga Pro 7 14ARP8",  ALC287_FIXUP_LENOVO_14ARP8_LEGION_IAH7),
 	SND_PCI_QUIRK(0x17aa, 0x386f, "Legion Pro 7/7i", ALC287_FIXUP_LENOVO_LEGION_7),
@@ -10994,6 +11002,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC623_FIXUP_LENOVO_THINKSTATION_P340, .name = "alc623-lenovo-thinkstation-p340"},
 	{.id = ALC255_FIXUP_ACER_HEADPHONE_AND_MIC, .name = "alc255-acer-headphone-and-mic"},
 	{.id = ALC285_FIXUP_HP_GPIO_AMP_INIT, .name = "alc285-hp-amp-init"},
+	{.id = ALC236_FIXUP_LENOVO_INV_DMIC, .name = "alc236-fixup-lenovo-int-mic"},
 	{}
 };
 #define ALC225_STANDARD_PINS \

---
base-commit: 86987d84b968b69a610fd00ab9006c13db193b4e
change-id: 20240829-lenovo-v145-fixes-90c10a4dbc95

Best regards,
-- 
Terry Cheong <htcheong@chromium.org>

