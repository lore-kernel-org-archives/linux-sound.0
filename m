Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C838C1F
	for <linux-sound@vger.kernel.org>; Tue, 30 Sep 2025 01:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759194918; cv=none; b=QOTG1kNVEUgb/FdkmtaIGX1Tk+Dklz4jlYgqseguI4W0P5kHKrN8cHJtV7R6ttVwucY2bXkpRTHJe+mkbe30HpWdVEh9HhRUIlKD28ZZvy2ZIpqZH+YjH0ioaX2gLG5kx9+Ai8sVsLNii/vGzdZDDR+qZYWiCa9cDR2qcynUpRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759194918; c=relaxed/simple;
	bh=LWiKZJZFkiAtXPs1OIRLKSYUms2rrDOO4x7f5IqnE8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mt184kTjwIhoU7VLWElZj5Jw1UIo2am3/h1BhDDL089ErLF2Blx4FBaBVQp8Hj+mbbOOlhiuveQtfmfhrHiPO7/rsvKH4RuecevykXvoPF9b4nmy5f18zKMayVAvpKB/C2nSAiGneqI0rF7fGWZjbUErFasxNL1mqSRVEHL9MPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jm4G1laI; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jm4G1laI"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8572d7b2457so513938385a.1
        for <linux-sound@vger.kernel.org>; Mon, 29 Sep 2025 18:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759194916; x=1759799716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1epOtTqBWEeLGUYo8O8pN+gdBd4swSF/z8sq0tZZhJY=;
        b=Jm4G1laIBXpEcvqgWr6AoctqP2z5LlWVW9X2gSjJ4KvJBTpHajzpjirgU7aNM6Nvdy
         pfwdQbPvQgHkqlp632kRAeQ5O/rciIF+6+tyDUFx171gY0fXRg11EFnjfN/bE3b5g2xH
         dxYCm3uhbiZRltYWud5vD/tLJWzJZAkgAD9t+j8Jetqxk5FhMM/8mH7naisLKHApsm2O
         1WYdKAgJfxaKuHOGIkBwFUr/pooWLwfVRnsw5LrThdEU9wd5mY/YRDtE3C+yJavM+37v
         5ZvUIXDEAGHV18sLfUiLocyswrEuPY2MxTgRDN08oX/UkUWw9hQ5lse5XnzHzQx123F/
         L5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759194916; x=1759799716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1epOtTqBWEeLGUYo8O8pN+gdBd4swSF/z8sq0tZZhJY=;
        b=cErNqCWGQ5uCKs7Wv97UW5i8B/ypTuRoVojn7Zhoip75yR0s9h3mr8Hw9RTTpvo//S
         KV9yMfxNU+jU7mZxdgeTltleT9/ZoJ0b+h85hEZ3wXsPOAzIHs/nj2sQHjZoP20sI59v
         a+eWtulN8Kaes0xRLDn/FBi1GjjigVuW8gtxCBMMw+D38zuMlR3sdwQ1QsfbWc5ohlrz
         zPSUgGReauOJ0ykuFgLLEjRL308NpAFf2Ggi/q2cM2pGNAuqSRWvgkSAQOfNfEXng1rA
         rIGx3B4UFf+ywBl8SX0tR5mRZ6dhnqbE5QNK4pu4lQM8B5w3lwVsCN5CzCPILg3EtpDE
         joWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvk6ExQ9EAPi6EqSoMDw9XMthuLA/lXgCItvy2kVYsNf8nzytiLu1OozSveaZudrTIniPWV/S6d2pvtg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk3IXLao71gANnNTzqOWtQy9bkzz5IiSGKOCYfHSywFKGkUd7A
	VCsQhlQNMT9z1I/4CqKJNE1Q6B2C6zh/2P3tFtzsUywQ5MUQspkXx1gR
X-Gm-Gg: ASbGncsy2CGJgj7ItfKp2kVZKYXnINKmnthRKtwlmijok0+Bflf7E0dtvRFEDblKI83
	5OfXzJpZhe4DCYB8+5eutJz5dmTciWIZI16zBnPJaN6biGdDSb5Dk/BilCqnSGFvKCH5FWAF9b7
	DtJAq+j3Ga3YepquwkpAFqWQC4kDahrM7Gm2s3Ji68rgoyjtGVjorXEZDphLPjXmKG/mrVsF14M
	RqzSiZRfXTdldMz4mz67ugV7r67qgjESgzGovkG/33oAiMNdTvK/3iAE0ok0Aw07IeuQLQ2sEPZ
	iu0EVbGXF3ysRUTTViO4NtO4zSrSUhidWXubJcDnL4uLIMZzB4HenGVIp/P5U47Uppx7qVX+qq/
	k+zufSsyiJTTI9wrdexNFPX7DZ39Gsi1j1QL5zix5/YdeFsml6umDy8RNQ2VTRjgzyx/CKBUGhf
	d2FV/1sLMl7WduYRo=
X-Google-Smtp-Source: AGHT+IGsLXU18DJunGIYOUywIhWTT8xaz4mFYutYJyn+VgHl1JpJZgSNPBaY6yQ3wronBxJXPhNYLQ==
X-Received: by 2002:a05:620a:2951:b0:80b:3a4a:da8f with SMTP id af79cd13be357-86edcb4c332mr385299485a.15.1759194915589;
        Mon, 29 Sep 2025 18:15:15 -0700 (PDT)
Received: from FUTILE3080-ARCH (pool-138-88-61-186.washdc.fios.verizon.net. [138.88.61.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c2718e92fsm952514085a.9.2025.09.29.18.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 18:15:15 -0700 (PDT)
From: Adam Holliday <dochollidayxx@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Kailang Yang <kailang@realtek.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adam Holliday <dochollidayxx@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for ASUS ROG Zephyrus Duo GX551QS
Date: Mon, 29 Sep 2025 21:15:07 -0400
Message-ID: <20250930011507.12037-1-dochollidayxx@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS ROG Zephyrus Duo 15 SE (GX551QS) with ALC289 codec requires specific
pin configuration for proper volume control. Without this quirk, volume
adjustments produce a muffled sound effect as only certain channels attenuate,
leaving bass frequency at full volume.

Testing via hdajackretask confirms these pin tweaks fix the issue:
- Pin 0x17: Internal Speaker (LFE)
- Pin 0x1e: Internal Speaker

Signed-off-by: Adam Holliday <dochollidayxx@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 3c42f66fe000..eecf4b48ab0a 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3735,6 +3735,7 @@ enum {
 	ALC285_FIXUP_ASUS_GA605K_HEADSET_MIC,
 	ALC285_FIXUP_ASUS_GA605K_I2C_SPEAKER2_TO_DAC1,
 	ALC269_FIXUP_POSITIVO_P15X_HEADSET_MIC,
+	ALC289_FIXUP_ASUS_ZEPHYRUS_DUAL_SPK,
 };

 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -6164,6 +6165,16 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE,
 	},
+	[ALC289_FIXUP_ASUS_ZEPHYRUS_DUAL_SPK] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x17, 0x90170151 }, /* Internal Speaker LFE */
+			{ 0x1e, 0x90170150 }, /* Internal Speaker */
+			{ }
+		},
+	},
 };

 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -6718,6 +6729,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
 	SND_PCI_QUIRK(0x1043, 0x1533, "ASUS GV302XA/XJ/XQ/XU/XV/XI", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1573, "ASUS GZ301VV/VQ/VU/VJ/VA/VC/VE/VVC/VQC/VUC/VJC/VEC/VCC", ALC285_FIXUP_ASUS_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x1652, "ASUS ROG Zephyrus Duo 15 SE", ALC289_FIXUP_ASUS_ZEPHYRUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1663, "ASUS GU603ZI/ZJ/ZQ/ZU/ZV", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1683, "ASUS UM3402YAR", ALC287_FIXUP_CS35L41_I2C_2),
--
2.51.0

