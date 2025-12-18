Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F2B31ED97
	for <linux-sound@vger.kernel.org>; Thu, 18 Dec 2025 06:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766038982; cv=none; b=WXToamfWf+NEFAzznYz8OXwkBb0uj7VcXzVo2v+91VfZgLEsO3FTZw6oDKpNLvxw/yAQ3uDILxb27qctXmwRh47UJatP662vJZyd0R72xLfzzFnDFAOMT5GL3Gady5P+DXS/V8odEd+z1cWVxEiYcdINC8y884ZvaZPiG3SyiJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766038982; c=relaxed/simple;
	bh=lKjCNSFQs2sbMgTOtxVUXasBSxLnHhu7yYq0QBkaFvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bACee5PEK2LC38+X8ibE928n6ejXxfVx1mwAQiQE689M3WqgA2dUhWtGl8jAmoE45xC9hmzf/ijCJ6m838xzFZNocvQfA4BLjNODakYR1C0YrtZ9TdT5fu1zS5D5RK5z6w6Aifs/cEci9Ze6rW5YlBdd3uUj+r3+D8SsR3BU3Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=Dnyfdj9p; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="Dnyfdj9p"
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 79E943F7C6
	for <linux-sound@vger.kernel.org>; Thu, 18 Dec 2025 06:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1766038978;
	bh=BAOhdB8RIC3HXI9Spk46jJ6P5R7gq9edWL/vCB1uR0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=Dnyfdj9pUcG6USdwY2cxwzu7C/8Bhl4aHUP15CG5Cn5Pk/uaqFA5d6gt/Ecuf/GD8
	 nSRZoTKOhht/X1dDrCN1O9Vwp7W9LGyFdMHxQrICh0p87/U8rNFy9m2oyR7a57keXb
	 Nym1JFIa7PN1kKogHKdPzm5PZc9qc9HlRTGgWdjssI/1/rwsPdqvN4CnuPobsXjtk5
	 E+YUsboxoE32hACTWnHXOE+gPIM0agW41ESw85GQ1Ka+VNpld9VvV/f4XgWfOSzLyz
	 ZwDhhcYY3a7Co5iDUXT4L30sfdMSuOTlKs4obfV3FbZdinvcC1MRDLEw51U1d+obxF
	 Vi5NWH/6Hll1PgbhiqQyBqAGZ0P2sA+GNJ5mDjSt4icD07DRvh34DbyTPW6CFhvAM5
	 /u2PWEq4L8/uSD6z6XC2zURt7V2K2V2FZJi/XL5WMRJTwABlDCmeERSNkI/77wGBLP
	 F1bp8bAiOZVnDmYVku9t7FkbIUk1rBvVyHo7khoyqiKnhnm9905nZyU9uBjDmM+UTV
	 I3Cdktcmvu+Se+Ar4l60NeCfdIe9xjbUllJryZeOCUDg6QRXCvfkt+2qUXdrEwzNOM
	 4GORJrGQT/s6oNAEkyUqsNXiawDuuCZRa2SLQn3JyQdSm2MEMhzwPC8Ssfi4gUnhSY
	 FP8bEeTBKd0efd8/43vtYi3Y=
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7ba92341f38so451096b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 22:22:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766038977; x=1766643777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAOhdB8RIC3HXI9Spk46jJ6P5R7gq9edWL/vCB1uR0o=;
        b=KgSPPOJoaWk0Pla+YizKw3p9MoK0QqqDVgpoOWV1zAjAbV4LCkArL93zucDsM47Ui7
         Q4sTDirUeI1uQZeNfcr0B3BsCYVH4zXxAjlg9K99NzEGURk43lWNwoK04i9UXC9dgTuM
         5s+5PLIoC0GK30vBS55KyqAYqKfoCWornt7NBFPr6IrxmpBnpUFV6NaMiRSoXBscNv6j
         dnOFs5rc4UlgokuSOrhwDqgs6gjmhfGLMW+eEkBaYB2Gj1I1wdXWgu3zeEc7pcaVJdP2
         ydPcX0EvE4KN67DyqQ1Bol7TfTzTqUdwKIG3CZA5vZJHV9mTOr78+N0zVlAtHrYVUnNZ
         tagA==
X-Gm-Message-State: AOJu0YyeDZgba5RRSgp9mYlQAHA8VP7mgg5oQhCrDRDrdBb2I9epg0n9
	x2FRVb8M+Oh9l3Fbm4kd4jNQjsXU36Ym0tAHaaRJaQ15+o96K8k1Nn6MscRQHWPC78fbVOAn7y5
	enGjkhGC6QWit6YuUusCQXUq0GmLEUfZf/klkKPSnyw2IWIzCOElg3w7ABXNZO3nP61gGPbUqSp
	DDgIOTqo1mLUKLcNs=
X-Gm-Gg: AY/fxX4fx2WmgdyUMMbaSABNlsFsEdacp1mgifcyFiRcF8Iv7hgQ/Sy46oBVh4GGwSg
	RT2KS2tzzDko8aYXeswR75ZrXIUn5IPLdJ8A5rmzloPvG2pJnalE1qEf8/DZGw3YW5RT7p3EuWK
	rZ3pGoYXi7ucF6U6C2ww7MYIPz+yajHT/rF4fo6DCMa12QkLXr5YlZpV99xGhc8IxPBtTLrqCE6
	yM7fZrDlRu8OQnMelhMuGbVIpQTvEVtt2QbaqR/3u3TN2E+5T3T7GCPbrsmKmMF7bTbWmPeg9ye
	In+3ULCav1xzmsMXzEz66du3SO52h09Wl4DYg80HOJWFTfS9YLnuArTzN0hDxig8WxP/xStsP9u
	6Ryuz+apk11LJq4Tyz1/lVc3W6EozN0gaKoMrASEdkKhi3eeQMpk=
X-Received: by 2002:a05:6a21:6da9:b0:359:62f0:574 with SMTP id adf61e73a8af0-369af527da3mr20283544637.41.1766038976943;
        Wed, 17 Dec 2025 22:22:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVUbtGyspSNEFTANXdUAGfovEsU/qEdSIwi7xhNJ2Qnu7ROTVhzGUsPlzBx4IehPfuW5Vq6A==
X-Received: by 2002:a05:6a21:6da9:b0:359:62f0:574 with SMTP id adf61e73a8af0-369af527da3mr20283525637.41.1766038976546;
        Wed, 17 Dec 2025 22:22:56 -0800 (PST)
Received: from localhost.. (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1d2dd9772asm1211166a12.11.2025.12.17.22.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 22:22:56 -0800 (PST)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] ALSA: hda/realtek: fix PCI SSID for one of the HP 200 G2i laptop
Date: Thu, 18 Dec 2025 06:22:51 +0000
Message-ID: <20251218062251.2039592-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCI subsystem ID of the HP machine Abe A6U should be 0x8ee7
instead of 0x8eb7.

Fixes: a30fa8122222 ("ALSA: hda/realtek: fix mute/micmute LEDs don't work for more HP laptops")
Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index c8a9b9b15cb4..2ec36990f804 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6774,7 +6774,6 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e9d, "HP 17 Turbine OmniBook X UMA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e9e, "HP 17 Turbine OmniBook X UMA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8eb6, "HP Abe A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
-	SND_PCI_QUIRK(0x103c, 0x8eb7, "HP Abe A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8eb8, "HP Abe A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8ec1, "HP 200 G2i", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8ec4, "HP Bantie I6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
@@ -6790,6 +6789,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8eda, "HP ZBook Firefly 16W", ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ee4, "HP Bantie A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8ee5, "HP Bantie A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
+	SND_PCI_QUIRK(0x103c, 0x8ee7, "HP Abe A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8f0c, "HP ZBook X G2i 16W", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f0e, "HP ZBook X G2i 16W", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f40, "HP ZBook 8 G2a 14", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
-- 
2.43.0

