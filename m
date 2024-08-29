Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66041494A7
	for <linux-sound@vger.kernel.org>; Thu, 29 Aug 2024 20:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724962322; cv=none; b=iN0IInG+Bzr4Nj0YKVvgBeLG6eXdAQi11866qsQiblV37U+ImoNeomXrvPbjP3asuxzj4c5VsObZ29N48DQPyTgbYsCY9ftHdOv9oyUKFvH1X1vrKO0EC9xuUmhGQu3ir5uY8piwHelePtFiY/wP1R7yDtInzrtvdtq/UKAMTh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724962322; c=relaxed/simple;
	bh=bg3niV7bz5Zl9USpbgTTH3hyFvXVp5gg0sizqQaLu6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OjjaNOfyn0OpYPaigHNyylWxKzZCZM0YUQeKCVV8CBo1osyLnzy6/4Wj1b4SYRRl/JlG6+uq/d0jHRa5MQG4dtNmP8g8cQPUHj1Pt/oLEQWbS1ngUW8Zq4dVdI27d11GnR0ZD3v9UAHYBDlPLceXBVLG+XkVAu33GJ/qXFrL6Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ixiFMVt8; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ixiFMVt8"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-71430e7eaf8so907823b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Aug 2024 13:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724962320; x=1725567120; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x24EhIgNe8xtya4+W0q16hyJ5+Ru2f7HMLYEbdNojMQ=;
        b=ixiFMVt8/rRkS01jplzBcjd6M/mMo4v3mLZjCFhVRt4vq46v3xQJl4Ouv0jnUvqixS
         kJLizVcOCqe/RWga93lyMgb4ip3D5mv+s6qmAuryBVV3V9JamzBaYwXJjhMd4QhNIw3c
         U/Mwc1F5xwAAQD+IJeUz6422HjhF0wsECflA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724962320; x=1725567120;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x24EhIgNe8xtya4+W0q16hyJ5+Ru2f7HMLYEbdNojMQ=;
        b=JQ/GM1/vN221+8m9yNovMRnCUkE8UHlwiVYvG3vK4l3NWD0gj0xdLPWS5rTVHoR1jl
         YUV6DbppT+S3g9osIt3QnX1D086RrfMmb0P/7Au6QhPLA3BKvyYarjHoGt6ZeWW3biRm
         /buprWynw5I7X6WbayyL7VppOdASR4z2XQg4Zti7MgCZqpGGQFmhdgQWO7HDt4lzzNHZ
         cU+aT2xwxxqynvru17wRZp4e2ialw3qeVaBdQFG6PNu7pRvQK5cLAFE/p0+XS3Ra0Cm4
         y+m79RtEJwhRjaSBjdIWDdpt1uAF2mhpXWeq9oF2RWALkmM6ssbxJKwW2m7OUlCsNj0b
         CXyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK+vow9LFiNU/rXdsEC6wwnJn9YWFLMW+rAOHy4q6wBmkrKcmtPxN1QJFqD+wN2yeIMlvH56MGKwIz0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU7sq6/mGHkk0OwvVJ2xait3Xio+HH72+9ODKXpvGUPIPq05qG
	uZlG6VPWrrgIF1m7FXCFoJZmDmGNTDFxGNWXvkU5dMB9ek5mafweY8hbLPwMZw==
X-Google-Smtp-Source: AGHT+IFTL/qrxW22ZvcQ3tu3WutlO2t4RvbRVlSo2L9vJfLPpFPQttIOYpZLFTyT8+teTTJnwS97Jg==
X-Received: by 2002:a05:6a21:9218:b0:1c4:8da5:c665 with SMTP id adf61e73a8af0-1cce0feabb6mr4004249637.11.1724962319911;
        Thu, 29 Aug 2024 13:11:59 -0700 (PDT)
Received: from htcheong-p620.tpe.corp.google.com ([2401:fa00:1:17:8388:bd61:f13b:7b88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e5577263sm1525694b3a.21.2024.08.29.13.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 13:11:59 -0700 (PDT)
From: Terry Cheong <htcheong@chromium.org>
Date: Fri, 30 Aug 2024 04:11:53 +0800
Subject: [PATCH v3] ALSA: hda/realtek: add patch for internal mic in Lenovo
 V145
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-lenovo-v145-fixes-v3-1-f7b7265068fa@chromium.org>
X-B4-Tracking: v=1; b=H4sIAAjW0GYC/4WNQQ6CMBBFr0JmbU3bAQVX3sO4oO0ITYSSVhsN4
 e4OLF1oZvX+z38zQ6LoKcGpmCFS9smHkQF3Bdi+HTsS3jGDlrqUtW7EncaQg8iqrMTNvyiJRlo
 l29IZ21TAuynSVvDscmXufXqE+N5eZLWmv2xZCT5Ep+hQKzR4tn0Mg38O+xA7WIVZ/5VolhwVt
 rayxqB2X5JlWT69BDnG+gAAAA==
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Steve Kendall <skend@chromium.org>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Terry Cheong <htcheong@chromium.org>
X-Mailer: b4 0.13.0

Lenovo V145 is having phase inverted dmic but simply applying inverted
dmic fixups does not work. Chaining up verb fixes for ALC283 enables
inverting dmic fixup to work properly.

Signed-off-by: Terry Cheong <htcheong@chromium.org>
---
Changes in v3:
- Place PCI quirk in order in the quirk table.
- Fixed a typo in the model name for the patch.
- Link to v2: https://lore.kernel.org/r/20240829-lenovo-v145-fixes-v2-1-713ac5cbb32d@chromium.org

Changes in v2:
- Corrected description for the patch.
- Link to v1: https://lore.kernel.org/r/20240829-lenovo-v145-fixes-v1-1-133d1e6813b3@chromium.org
---
 sound/pci/hda/patch_realtek.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 588738ce7380..ff62702a8226 100644
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
@@ -10742,6 +10749,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38f9, "Thinkbook 16P Gen5", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38fa, "Thinkbook 16P Gen5", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
+	SND_PCI_QUIRK(0x17aa, 0x3913, "Lenovo 145", ALC236_FIXUP_LENOVO_INV_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x3977, "IdeaPad S210", ALC283_FIXUP_INT_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo B50-70", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x3bf8, "Quanta FL1", ALC269_FIXUP_PCM_44K),
@@ -10994,6 +11002,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC623_FIXUP_LENOVO_THINKSTATION_P340, .name = "alc623-lenovo-thinkstation-p340"},
 	{.id = ALC255_FIXUP_ACER_HEADPHONE_AND_MIC, .name = "alc255-acer-headphone-and-mic"},
 	{.id = ALC285_FIXUP_HP_GPIO_AMP_INIT, .name = "alc285-hp-amp-init"},
+	{.id = ALC236_FIXUP_LENOVO_INV_DMIC, .name = "alc236-fixup-lenovo-inv-mic"},
 	{}
 };
 #define ALC225_STANDARD_PINS \

---
base-commit: 86987d84b968b69a610fd00ab9006c13db193b4e
change-id: 20240829-lenovo-v145-fixes-90c10a4dbc95

Best regards,
-- 
Terry Cheong <htcheong@chromium.org>

