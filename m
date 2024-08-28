Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A68B1AC8B5
	for <linux-sound@vger.kernel.org>; Wed, 28 Aug 2024 20:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724876423; cv=none; b=qYYMN2pfJCjCNih+17PUAxbFSd+o6oKLqwlg5m4YuYozShR70siuUKY1qYT5tpSpJDYTDEln4ek/OgBKY88xLICons2W337OBOW72rVaQs5/+rIJJ0XvLGvRBcRkKT+VDOQjZuX0/VE/lk6DgVNNrtRvQtKbxppKSmtOJ3InvBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724876423; c=relaxed/simple;
	bh=yo8Bqe8e5gPrNBrNAgu4U0/R0eeSUmUJDEeqYXDhtGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oG/G4ORHKtl61oIJf8kapPjZnc80ehfQhhlCBAUjzi/1e+GS4WijmfdB6LkZeVCrWnnj0lWAfgrSBMMYxH5pU3XA5liixRdyiPFNfG0hJieLWef5nXhoKcKIaLaJPxinFKTAnlhDwlHbuBm+dYRHkRQ85vuCSF5Rhojww4Uc4vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DmAK0D/6; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DmAK0D/6"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7143ae1b560so4071036b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Aug 2024 13:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724876421; x=1725481221; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GW0sfHv4RXqfz6QFs1KqjTYLK9yTslXZaNQMV9fgT5w=;
        b=DmAK0D/6PmMtE5A87kiqS5qLb9NSTPoOX2JAN3bYZ3DSJE0V3ObWPCaL3oS/Ou8BKT
         BPqoXBunOyLTrADMmnfnD5xbv6N7xtkFk45xTCqNsLzgeV7NjXyP/Etot1XcWeGKUTGf
         LxD2Sa3pPTzuggR881NB3acOsRazTqB3tM0d4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724876421; x=1725481221;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GW0sfHv4RXqfz6QFs1KqjTYLK9yTslXZaNQMV9fgT5w=;
        b=XX7RZh6aFsPCheQiMbHPwc0z1mLu1WLn9MAcqlhHC8vRiy6JwJea/90NxzPzXqgMUZ
         eSuKKVxVlnBhFbOOSmgQgaAlVV62Wy1lvATngYTxFccLZ2flnHazbgA7WP/E2r//zt2L
         KXcabgy05dYM1uZViob5X8+uRvuNZgq16rmZu/l5T9hmvtpz1ik6zRqlLKqp0/hWiW76
         puo8rFz/jzDfvVrOZlMRXvfhQGZIYbM9W7CYxcNVXMIZ+OlKh0BOol4A3v1ymR1LGSCv
         uUTuVOO60LS8yt0dfD+EhHlFoDhtKFcH4FWdBxDmWkU6YT3Phuu0yCzPL62h/JiltP/0
         EXrA==
X-Gm-Message-State: AOJu0YxVDFqKOE/Xg9aRHB0YJlmm9VLkNd7GgrLxb+xVgjfK5aFHgif8
	NhVdgUqsAKovXk3lc3LA1byx29LEJ5dpNHciuRjrosGAwJGF0v2Vda5B0ZI8aw==
X-Google-Smtp-Source: AGHT+IH0qkv/MfG9MIxmLidUqbxhESVRipI97MoHotsE8LjBilxoueyG2Sp8CbwJ4HHOa5Q60suOXg==
X-Received: by 2002:a05:6a21:9209:b0:1c2:a722:92b2 with SMTP id adf61e73a8af0-1cce1103f3amr439369637.45.1724876421544;
        Wed, 28 Aug 2024 13:20:21 -0700 (PDT)
Received: from htcheong-p620.tpe.corp.google.com ([2401:fa00:1:17:12b:e9e8:cb3:7d66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8445e9a51sm2351185a91.21.2024.08.28.13.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 13:20:21 -0700 (PDT)
From: Terry Cheong <htcheong@chromium.org>
Date: Thu, 29 Aug 2024 04:20:18 +0800
Subject: [PATCH v2] ALSA: hda/realtek: add patch for internal mic in Lenovo
 V145
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-lenovo-v145-fixes-v2-1-713ac5cbb32d@chromium.org>
X-B4-Tracking: v=1; b=H4sIAIGGz2YC/32NTQ7CIBSEr9K8tRj+aoor72G6aOFZXmLBgBJNw
 93FHsDM6pvJzGyQMRFmOHcbJCyUKYYG8tCB9VNYkJFrDJJLzQdp2B1DLJEVoXt2ozdmZrgVfNJ
 utqaH1nsk3INWu46NPeVnTJ/9ooif+2+tCNaklBN4GoSa1cX6FFd6rceYFhhrrV+7/u7htQAAA
 A==
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Terry Cheong <htcheong@chromium.org>
X-Mailer: b4 0.13.0

Lenovo V145 is having phase inverted dmic but simply applying inverted
dmic fixups does not work. Chaining up verb fixes for ALC283 enables
inverting dmic fixup to work properly.

Signed-off-by: Terry Cheong <htcheong@chromium.org>
---
Changes in v2:
- Corrected description for the patch
- Link to v1: https://lore.kernel.org/r/20240829-lenovo-v145-fixes-v1-1-133d1e6813b3@chromium.org
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

