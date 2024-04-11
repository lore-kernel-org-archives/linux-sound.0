Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE2B28FD
	for <linux-sound@vger.kernel.org>; Thu, 11 Apr 2024 12:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712840288; cv=none; b=BZJE1FZjthKAIKBuukr6M6/0QA/gskWLqcHEVJ9+XR0mlmxkyAM+IbwQ70EiNtJzzPrOMLU20fEj2NVfw03qlk4Gv6deb0Hv0DCXwbULwVNifA7s5lJ0k9xjnfBGJXlOQAT6aW2wNCEwKricXKo09DstfGAvpzVM6GezYW1ZJME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712840288; c=relaxed/simple;
	bh=PkbTDsvUgpgonP08VF+4sMSC2FS5v1MP/JX1qm9aOMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UBL+yGwKRuOAoc2ubYEXELZfSxjMIATcSpHyeIQ4Q9kjzNyQvEVlL0xevp4EphVjiMnYVkuhfEGvi4kL0ynG+Wht56MlEW07JKBSrM1M/LA8MTWaqRMAmwF1IB8GgAUP9GPc8JpEiH2ZLlKgVhEEZAKPIt5bY0rLTQbIWwA+9s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoUHGUq9; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoUHGUq9"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a519e1b0e2dso842208466b.2
        for <linux-sound@vger.kernel.org>; Thu, 11 Apr 2024 05:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712840284; x=1713445084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+gri4PdKgdz3ZG/qiHXd0qH2Y0/rhqtaqkaRdh8lHmc=;
        b=aoUHGUq999QF3a5t8/+BXemWsg6XnUQ5wiltPqbGitQJkshmt0qbo8WcbhZSHtnMzH
         G1ehZwHCG9xQtubGnv6pZcaqv+UaRVv/9rd/dO+TRHsAxpDr4jhZpqpl0SLJ1DQxP2GJ
         eN4aYexH4YenldACyW16Rpp8Gxn9lZfUoe1Qo4dXn7LGu4WpsvO7d0HGB7wE3ZOXf2fM
         pcs7EJoX8NXUeFjMM/8tvsrb2GTGkEeF06hr7Amt0HhFQc/QYCF788zLxMAIiLqM4D6t
         kOu7qaXcXD0R1A5iTc/52Q/ihBxwFsLPTx7987T63miwXvAbWfzGBLsJtDD7MonihvUl
         Z6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712840284; x=1713445084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gri4PdKgdz3ZG/qiHXd0qH2Y0/rhqtaqkaRdh8lHmc=;
        b=xPndn8nv3QKb3EcO3Y9+B4uPofyihr1O+Un+dDX5OeXMcD9wrioe8PGny84g+DJMPR
         7CXJI3pTsAl3GXWjchA1pdjAJQLwcFajRbHur0lRMpcL5FdSFlxphPJuMSPJ26yEvuA4
         yHprCAOdv1obLA7QVDYExP4/P7xOVQ/ZVnLhvScM0+ZCuqH2UiEES6E0bIreLLOsWCvX
         e1iQsE+byYgRbOWdcYsclk9fDkyAeJrHW8bJ1wBKMv8PSXFqPBdTPuFh+vAxGrpKo80A
         T/RdpBmoeoTlS8n4PCASWouoLR0IOfbTcas38ibssdkcre1h8ZMj77cwvE8AgEymrozF
         O/ag==
X-Forwarded-Encrypted: i=1; AJvYcCXLqABytf9qwah9sOe8KAEL5wK1D7WwE1kww/9uXP1KR1/pLU0VJ/jkuI1fxFtmgs2Cnx1p+Vc/bAfWbsQinYFACn8K+Ssw+xfMr7g=
X-Gm-Message-State: AOJu0YzJugr2h1LEvJwrO6Q15xkVQQzMUZtBxg/eF8CyZkhZtyFRtbV8
	OgRTLI4AoVgw/WFZz0s0/l5gl6hITjxx1IB9EVyd0IGS7x/gMYo=
X-Google-Smtp-Source: AGHT+IGrsTs9TOhifPa6FLTL/fOZowXrP274UAsfbESeDDZxRaOSmuK/do8iwCGmobR/p2QZagzZEQ==
X-Received: by 2002:a17:906:1393:b0:a51:98df:f669 with SMTP id f19-20020a170906139300b00a5198dff669mr3282529ejc.43.1712840284298;
        Thu, 11 Apr 2024 05:58:04 -0700 (PDT)
Received: from host ([45.89.89.120])
        by smtp.gmail.com with ESMTPSA id dt3-20020a170907728300b00a4e23400982sm735191ejc.95.2024.04.11.05.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 05:58:03 -0700 (PDT)
Received: from ltop by host with local (Exim 4.97.1)
	(envelope-from <ltop@host>)
	id 1ruu0E-000000004qV-0rY8;
	Thu, 11 Apr 2024 15:58:06 +0300
From: Vitalii Torshyn <vitaly.torshyn@gmail.com>
To: tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: luke@ljones.dev,
	Vitalii Torshyn <vitaly.torshyn@gmail.com>
Subject: [PATCH] sound, hda/realtek: Fixes for Asus GU605M and GA403U sound
Date: Thu, 11 Apr 2024 15:58:03 +0300
Message-ID: <20240411125803.18539-1-vitaly.torshyn@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Added the correct pin table for Asus GU605M and GA403U, enabling all
speakers to be controlled with the master.
Updated quirks for GU605M and GA403U by including the pin table patch
in the chain.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Vitalii Torshyn <vitaly.torshyn@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 40 +++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index d6940bc4e..4544b5039 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7467,6 +7467,10 @@ enum {
 	ALC285_FIXUP_CS35L56_I2C_2,
 	ALC285_FIXUP_CS35L56_I2C_4,
 	ALC285_FIXUP_ASUS_GA403U,
+	ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC,
+	ALC285_FIXUP_ASUS_GA403U_I2C_SPEAKER2_TO_DAC1,
+	ALC285_FIXUP_ASUS_GU605_SPI_2_HEADSET_MIC,
+	ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -9690,6 +9694,38 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_asus_ga403u,
 	},
+	[ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x03a11050 },
+			{ 0x1b, 0x03a11c30 },
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC285_FIXUP_ASUS_GA403U_I2C_SPEAKER2_TO_DAC1
+	},
+	[ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc285_fixup_speaker2_to_dac1,
+		.chained = true,
+		.chain_id = ALC285_FIXUP_ASUS_GU605_SPI_2_HEADSET_MIC,
+	},
+	[ALC285_FIXUP_ASUS_GU605_SPI_2_HEADSET_MIC] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x03a11050 },
+			{ 0x1b, 0x03a11c30 },
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC285_FIXUP_CS35L56_SPI_2
+	},
+	[ALC285_FIXUP_ASUS_GA403U_I2C_SPEAKER2_TO_DAC1] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc285_fixup_speaker2_to_dac1,
+		.chained = true,
+		.chain_id = ALC285_FIXUP_ASUS_GA403U,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -10145,7 +10181,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1a83, "ASUS UM5302LA", ALC294_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1a8f, "ASUS UX582ZS", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1b11, "ASUS UX431DA", ALC294_FIXUP_ASUS_COEF_1B),
-	SND_PCI_QUIRK(0x1043, 0x1b13, "ASUS U41SV/GA403U", ALC285_FIXUP_ASUS_GA403U),
+	SND_PCI_QUIRK(0x1043, 0x1b13, "ASUS U41SV/GA403U", ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1b93, "ASUS G614JVR/JIR", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1bbd, "ASUS Z550MA", ALC255_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1c03, "ASUS UM3406HA", ALC287_FIXUP_CS35L41_I2C_2),
@@ -10153,7 +10189,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1c33, "ASUS UX5304MA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1c43, "ASUS UX8406MA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1c62, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
-	SND_PCI_QUIRK(0x1043, 0x1c63, "ASUS GU605M", ALC285_FIXUP_CS35L56_SPI_2),
+	SND_PCI_QUIRK(0x1043, 0x1c63, "ASUS GU605M", ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x1043, 0x1c92, "ASUS ROG Strix G15", ALC285_FIXUP_ASUS_G533Z_PINS),
 	SND_PCI_QUIRK(0x1043, 0x1c9f, "ASUS G614JU/JV/JI", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1caf, "ASUS G634JY/JZ/JI/JG", ALC285_FIXUP_ASUS_SPI_REAR_SPEAKERS),
-- 
2.44.0

