Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C0F2F532F
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 04:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764649546; cv=none; b=Wdadv4O5eZgl3qLKVebPRNBjQAeOUwH77AIMXri2mYBiyJkxTF33Z3Qs5qKrCq7P8OUsuGB80W48atgGdMdQ8i2ruam9HUW/ORiPei1TmLurjB+g4RUBwq8vrzvBBGFeLAuJKdRlcTO9DjE3L73acdemZZmcF53+u75fLoGmm8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764649546; c=relaxed/simple;
	bh=zLscRgO+9Stq7ElSZQrX2o0g6RxpCK32BjhdhEwjjFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WXuUhsEM03GfhCADlOWjBQc3QUbOrDUnO8fsm0PDoi0BshsINFpu4qoI244VCQCFZYjgHztgbW68vzoYhmxBQFrdbTDQUPgB8SiXFvoZApaP4IPRNY6xSQ/Gv3013lA663gS0nFjJsPYNY0k6r3h0lC1Zvsa8LU5Opte7YQAXYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=nUt4/f7l; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="nUt4/f7l"
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C8E3A3F223
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 04:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1764649540;
	bh=u/0Vf8suUdeCKbxWIhF/01oXg+PEY3zbp8ww2/pLwmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=nUt4/f7ljDCwI2g3xwnvd6HAhBUhyCBUC3/GECcQXacC2sp1mOlNhUb9Ay/Ttc4Xq
	 V+cMt8DGApHGj6SN2oXvcrlDjeehl+tvlUpu8QpzV9mASEfsZQkPX3lheaS24/LPRZ
	 AFWp85MfQ8HYroJ32yD7IM6A7Sr4jUtxNfnC7MZjQur0EW79vGAjolherZpstlEo1P
	 y7zt4nbaBLFxESNBJ8Bl3pAPoIJFw94A9B6DX0IzI7vJ89HlqqlfMSwujtkSTlebh8
	 uFlBH1qYt09B8qc89V7Uckkw+ZBfnBDRe3QNF/Z5y68cTMzfyMfMWIht2A4suRJNOb
	 yqzGlhTpbTeWC/vJ2gED5iQZXn52UuN6LPLqNlAQndBFW2C6bKzjGoABl+BaEgAhqp
	 QHNlyQFbflZAB3ahsp6DFSnxQjaVGt1RqWh+wvFLL9IC0ZTbDY3QqRZU0pnsrkNCMg
	 pWK7KyEG375AJA7I/x8WR+wkpNyiY99PVeu/rwD+XadT9fBswE7dddnJLM4c9gXXEN
	 aunR3Vn+yUZV2TxPmY5LwjaU9iBWk5+ciU8WQXjtTBWR7RX0TF3Jk5peVi7NnIj4V0
	 RlnZHSOxBQpSgdMn7wmWfr+CJTlcKCfz3OC80JKSyElFaniWucOTuWwInbw5gxs6Yk
	 7VDrXXMC7u9I05AyhQftDx4E=
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3438b1220bcso4987555a91.2
        for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 20:25:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764649539; x=1765254339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/0Vf8suUdeCKbxWIhF/01oXg+PEY3zbp8ww2/pLwmU=;
        b=ZyVnRn3RSvtnbzKxOQFjp6teWAN30IWFPDL9W1Pa4tsdijyM6YIL75BC7nwOWBXm+n
         ++gS8OBPo7k4onuAYDoagJr+bfHxSoVcrqsJX+N788r2dr2sct3T0qIOrypvP971d4jQ
         cLKhtGhCNAgt4jZguyPBMWOoqpt898Mit58OTtCamW+KJPMZHPbEsqK3tFGf+nChlLAL
         5XdhH8f4QiJkZha6/UGe8hX/9g6mxnwTvuMn6tlb6F/0mqg1JG/VzEA/e31xU0tJPxwM
         zqt9gui4kiP4kjR9aLTWoI7WqAWd7yEw/LtLHz4sNUMXEkNfqotsgE1rvnyeFkCTegL1
         KOYQ==
X-Gm-Message-State: AOJu0YzwO+f3CL2utJqlIQRVzqleD8KjuFdeqRYkMelYgOiwvJ7Ez0Tt
	OJ/MgSmmojQeXe9IR22B4/+p7wLIJwuDa6JU1/UuKKZruIvB09YZUP0KeJfyhyksCCx6UjBXhF7
	eFPuAbQuMwDPPKm7CgUnCV/0o4G8+HFCq0lhV0UEbl1DjjpG+8lClxwipJXF+DFRoPWqluxs/l7
	Ws1Bw+
X-Gm-Gg: ASbGncvEtsRQRFl6iuhXfUH98NI4jChvskKT6tc3zObh8We9j71oH4wa3ytf3mzxMTt
	WcD/+Pqjv1GsqqnjDm1LUkZVG5yUDJYJEASO/gc1BEs3nqCuk/1XmcR2+oTaagnMeueDvtgtOaW
	rg4XKJjL61NRk2UKJDrMZnBB8sZ/5cUIZxMvkOEAdyNJJgABtOyMz3pRQkkvVmiWk81k56L3n4O
	U1vW1tYWeGYy5Vp3RofC/91Ex6qr1aGL7pmsCUkKmguz2HhRAMxCdPkpYdS3ih6n87JawMp2q1y
	P//0tFgvxKqib78VUDET8gnX2JMczaHIktYmCLRJT2DzV3w8q7vMaDv+GFq/WYsZ6N+f2MSQUdR
	pDD8ieB/cirLe2bLm2tyHgHrzEi5H2RZPjwIlxx7y2BIDcMkY+58=
X-Received: by 2002:a17:90b:164c:b0:340:ad5e:cd with SMTP id 98e67ed59e1d1-3475ebe68f2mr30657310a91.5.1764649539312;
        Mon, 01 Dec 2025 20:25:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxu+bkM+XtX94c/O1CVvc3Y4h72RzCLmIsSsuCP3Qj4t9jkNbAOiFqqSiG/gReUSwNLITFnw==
X-Received: by 2002:a17:90b:164c:b0:340:ad5e:cd with SMTP id 98e67ed59e1d1-3475ebe68f2mr30657288a91.5.1764649538865;
        Mon, 01 Dec 2025 20:25:38 -0800 (PST)
Received: from localhost.. (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3490960ddc2sm172936a91.9.2025.12.01.20.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 20:25:38 -0800 (PST)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] ALSA: hda/realtek: fix mute/micmute LEDs don't work for more HP laptops
Date: Tue,  2 Dec 2025 04:25:34 +0000
Message-ID: <20251202042534.174755-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

More HP laptops with codec ALC3247 need the extra coefbit2 to make
mic-mute/audio-mute working.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/hda/codecs/realtek/alc269.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 1a8fb43887b3..4efc16ae6b5d 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6768,13 +6768,23 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e60, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e61, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e62, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8eb6, "HP Abe A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
+	SND_PCI_QUIRK(0x103c, 0x8eb7, "HP Abe A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
+	SND_PCI_QUIRK(0x103c, 0x8eb8, "HP Abe A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8ec1, "HP 200 G2i", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
+	SND_PCI_QUIRK(0x103c, 0x8ec4, "HP Bantie I6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
+	SND_PCI_QUIRK(0x103c, 0x8ec5, "HP Bantie I6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
+	SND_PCI_QUIRK(0x103c, 0x8ece, "HP Abe I6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
+	SND_PCI_QUIRK(0x103c, 0x8ecf, "HP Abe I6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
+	SND_PCI_QUIRK(0x103c, 0x8ed2, "HP Abe I6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8ed5, "HP EliteBook 8 Flip G2i 13", ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ed6, "HP EliteBook 8 G2i 13", ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ed7, "HP EliteBook 8 G2i 14", ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ed8, "HP EliteBook 8 G2i 16", ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ed9, "HP ZBook Firefly 14W", ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8eda, "HP ZBook Firefly 16W", ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x8ee4, "HP Bantie A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
+	SND_PCI_QUIRK(0x103c, 0x8ee5, "HP Bantie A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8f0c, "HP ZBook X G2i 16W", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f0e, "HP ZBook X G2i 16W", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f40, "HP ZBook 8 G2a 14", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
-- 
2.43.0

