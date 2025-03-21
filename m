Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338D61DE3CE
	for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 10:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742554166; cv=none; b=BqFPFE7zXVJqx3FUZo+xtqhKAEv8cjIihoYG2yU4CnUsrvieIwScsD8NrN/3OqyQHnKXPm/hMC9/VdZDZoAqrdGwfWjJwm8IDiPxPwHe63QpvCJ0Y4EQWkLgo0z2bD/PytSDBHjWHKOXJO/DXxu2sf9HLYC8X++Z8v7nS0pwnaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742554166; c=relaxed/simple;
	bh=aStHTjdtJrpDKacYsLyzO+frL12AwKU5p8uNGZysYew=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DyBjoaF1wuI88C7j/s2b5BsoadwoToGKEGScgWs7ZrXRTV5MWLWrwX+cOd9xDIBuHDx5jHtMZR47ds9dOtnoQ0NR3PPcbBk+0O1bdFUY4dZfv2F/sYNzSdeS5B83xlhJKBa5fZWCs27ew4uCZxdiU+0JSRMh27kpYnX4LvlNGVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=NUd1oBFS; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="NUd1oBFS"
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 340FA3FCCA
	for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 10:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742554161;
	bh=z9wosfMTvKly19CGRaWf+kiQFrol15FV6ibGh+/i9lo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=NUd1oBFSLTg9XdOQ8rRXvV+npO3sGgewvZRRMcqbc/m2PdmVNN/zXgAIe31EPrio5
	 aiuXJVjdiENqpF/vVax5x67tQXwTOgPls0zDAwAT89rHm7H57a1vV7Jg+y7VERWxN7
	 fTuNLLA627RjuvqKnp+iIqKJtRcZniT3QwYwHvMAWI7PDAsXPhbqzJYoDMOx0P1oVI
	 t2wa5GqhZpqCx+svJ8IZ/iGAk73H6XZswXgWv8vk3AHyI7ln+xg4NzLCnLOTdDuhcn
	 pl4tkGtaoWmL/y/B0A/qQrUME3G591bzcDjPwknZGqSCcZk4aguKk00SywOezlwkaT
	 TpeqmUaRrjIng==
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so2832233a91.1
        for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 03:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742554159; x=1743158959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9wosfMTvKly19CGRaWf+kiQFrol15FV6ibGh+/i9lo=;
        b=sw1nhjZCQ9x9feJGMwV9HErwsdf9EJnPKyXwk9XT+Vmk3temsQs1D+0zC8aiAEA8gB
         wp9YGbdP/YOS1TCMomupWRYfJBJC8oq9U16hKnOYof+5dQMbB0AM6wWg2n649ePCbIji
         O1eyvfRFXe2owQ2trR6jAf6o9g/5VDwaW+a6TYbLcZv9nZSWEoRXN0ArSat1cbukG6NG
         MfQZVsZ286iUqsPNIz4gdYXpSU//PjfZcAdsWEDtNgBQYR50fLpv9QYEdvtTuMwwVx1m
         xOZcMylJ+Kdn9n6a5nvMS828EDcIA4xeE94Cbp1qULW+/kSaV316IPCPQCpWCPTCSf1h
         5r6A==
X-Forwarded-Encrypted: i=1; AJvYcCU+kMiPhLEmieUcfpbeYu0js+19yMHuQX1AhtbNaQxmvu6Xi/Tv7zNjYx2Nl1ZHeRVU6yHdC9HoxHFoAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/5XB4Nhx4sjesnmwDGIhm310g+C1FXjqTrObmJXvRvsL+RobM
	ATTOXrhCKtn2PeELmZg7/EOOREF1qotkc0PwZojZHhmAK3e/22fxI9n0Nj1lv37qmH2rvI3QzGr
	RfmhoP2NGFAQ0kL9v86c73KTeekJ3qrpH92DqhCL+2xruXMlcglJJPwlbhpmkyRBcfdJbkeBx/G
	0U
X-Gm-Gg: ASbGnctFu9i0KcXRNWeHKCPpJrODRRIb+Nti0/jlpd1POkA76i/VVNvMPfkY1pa/yhA
	NsfrnXehxkj9TUax3fLWwjU9DLEb2WdBQRVVzQRlMfYvVqSuxx9eUBQs7BAXJyy3nAHvtOf0+dR
	BE9XvbSoFIn95nkeCbX9n+60Bwb+gR6rdoKw/73ofjTV2iM8dFqZAVPve5sEQWmG1BmqDFZCp8K
	1VAqw5oDXMsePkob3kfkYBC5zG+7aP6BgWyXJSgZV7xXrcjMby0ViIEGGmMxLrhzAXWZ7k/QlRb
	ZUNbVx6lAAOGPtlaLm9G6pTNuuwdj2ahUPJl1UTAOMkWaSkj6C4NaXnL68E/aQ==
X-Received: by 2002:a05:6a20:430c:b0:1f5:9961:c44 with SMTP id adf61e73a8af0-1fe42f09264mr5515686637.3.1742554159477;
        Fri, 21 Mar 2025 03:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCJ33UaDL4j8gJNAwbjlWs3Ea2yNfzjlg9zUYpfJQPH141PwlC3oJsanq+y+Pr9AOvWq9u7A==
X-Received: by 2002:a05:6a20:430c:b0:1f5:9961:c44 with SMTP id adf61e73a8af0-1fe42f09264mr5515649637.3.1742554159016;
        Fri, 21 Mar 2025 03:49:19 -0700 (PDT)
Received: from u-XPS-9320.. (114-36-251-180.dynamic-ip.hinet.net. [114.36.251.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fa92bbsm1589353b3a.16.2025.03.21.03.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 03:49:18 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: simont@opensource.cirrus.com,
	sbinding@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH v2 1/2] ALSA: hda/realtek: fix micmute LEDs on HP Laptops with ALC3315
Date: Fri, 21 Mar 2025 18:49:13 +0800
Message-Id: <20250321104914.544233-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

More HP laptops with Realtek HDA codec ALC3315 with combined CS35L56
Amplifiers need quirk ALC285_FIXUP_HP_GPIO_LED to fix the micmute LED.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1d8caf791dbc..30d4cd93dae1 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10723,13 +10723,27 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8cf5, "HP ZBook Studio 16", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8d01, "HP ZBook Power 14 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8d84, "HP EliteBook X G1i", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d85, "HP EliteBook 14 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d86, "HP Elite X360 14 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d8c, "HP EliteBook 13 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d8d, "HP Elite X360 13 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d8e, "HP EliteBook 14 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d8f, "HP EliteBook 14 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8d90, "HP EliteBook 16 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8d91, "HP ZBook Firefly 14 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8d92, "HP ZBook Firefly 16 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8de8, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x8de9, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
+	SND_PCI_QUIRK(0x103c, 0x8e14, "HP ZBook Firefly 14 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8e15, "HP ZBook Firefly 14 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8e16, "HP ZBook Firefly 14 G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8e17, "HP ZBook Firefly 14 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e18, "HP ZBook Firefly 14 G12A", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e19, "HP ZBook Firefly 14 G12A", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e1a, "HP ZBook Firefly 14 G12A", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8e1b, "HP EliteBook G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8e1c, "HP EliteBook G12", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8e2c, "HP EliteBook 16 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
 	SND_PCI_QUIRK(0x1043, 0x1054, "ASUS G614FH/FM/FP", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.34.1

