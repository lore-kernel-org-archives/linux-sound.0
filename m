Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C83361DA1
	for <linux-sound@vger.kernel.org>; Fri, 13 Feb 2026 14:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770993590; cv=none; b=P8V2AFHl0H4h9j/swG1Zc2Ykd8eFpFpQuhxocCdrOZgUIkHJvm3DNsAA8WXXuwRsaC1T/znN+WjvBylJzCYr60pNC6sMtcyXcwqgc4ag/9TL+sTdNhjbKC5orgYXi/5evyVDcbkH9xvgTxiscBuK+ZPZf8MNb7DizTJMheecWxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770993590; c=relaxed/simple;
	bh=Ufx2LQuVsPemONElURIztMjbQMMbf+4gtqztqAWWexA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o+FtVLzvKMQx4AyJg3hWIEbnBrdLdy9fsneUvia74XEjawa0olnpOHDN5f/vVPys2RvKcqUTB3a/vdK5YToCXDd4tFAfZc6suYYl4MSvRC0MBfQENha0TwwvqrtmEnGyA4YuolloABzIDLmySmHz2i13gwcCQUpjhiVZWQxNv0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJYIAIqt; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJYIAIqt"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8230c33f477so545057b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 13 Feb 2026 06:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770993584; x=1771598384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BUN5m9KdWt5VPnYVJOX/YZHFeP0Re4SEll9bpIlXeb0=;
        b=RJYIAIqtDW8E1MXKb312gXAyOr3UmiTnFvIOweP1Prtz6n9gyAxGdszPK8B4U3uEe/
         5i12DtZnntBO5h7Zn+g84usYawMMLPT193aFWIPQ00X7sJWrKrMHrod0Fd3PY5L2EfQd
         /MSGYKfMv+RsmTE47XiS4TxAO9gSMorQKkig6ORx05dNVzfJYZjlX1vSDkWVIn17+N5L
         bglzSr97zJQvEA/5Cs3Ej4n3isEJcnYAzKJQR+p26xgxhme6IDrTcbsiagibfFIFDbXX
         kSjH3khVEbIvpUT/avAen7xkUDNr6QynzDPPU+YxOClxyukbn3sM7VeOBVePAKbbj++N
         9kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770993584; x=1771598384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUN5m9KdWt5VPnYVJOX/YZHFeP0Re4SEll9bpIlXeb0=;
        b=rhzy1aQBJMHXl/TsUkB8/0C/kJPEy0gkUu0Wuzu8B0X+vFE9sq3JmGdI4Y43jAo53y
         /VC9JB+WY7IBPltUV5wNKEKRoI+uhROhrRhOr+m+3ELi2bO2Uj4xyDer0GWf6r3uA0L3
         V5VcNpujojB6tfjy1Nfh89ajhc2Km282mhp4mjMwBMPZTEDWNUO9/hivsiCPEM7lwA+v
         Gusb/Wxhm4RaS8PsEwo/No22xnNHZJU1xkr+HeU77bU59Ev5VRuyarb88zWkUhUJPC7E
         QhG1+/8GzCfN9RJ+nxUEn9EiL0ShIZncmmc1L5YmB9Z24Gc6y7N8XPNI+WDj7wzbKIwc
         6epw==
X-Gm-Message-State: AOJu0Ywcx8EqqylTA3pwN2/q+fSxLIDnnUABOMw8g1d6RkRwtVD2vU0v
	wLHu4t9Vh2v3qustPS42ws6X4gP+/DOc8L/DYZahPJruYdvf/Zr8vwZ9VCE88Z7t
X-Gm-Gg: AZuq6aJnfM9siNbA1wa/0NRU3jzyqpDSRxA+ujngXpHlhwbZ41LJaiRq+Wghx+XjJea
	jJ/drkpL11EzWsVxbqUIcke66it2civf1r7R9MsyHC1ghQpzvIOZ4zjQRV/rzxHcY91+H24Y3gE
	zoNaqK/Vx51RFlHMdxWagClyVs1ANaoZZyLLMjKN/6eUnhc67TviNq3IYq6StFBYsKCWwIEJw44
	UNVPVTXqag3i8fjrb1qB3sOOIm/AYUenDTaObueffjpW3HfiSrA1wOtJ+3ZaApFqVswThGT3sKr
	RQwWMTrteCQ2RrYgCpPefAx/UjH9ESL0FErWlluBjTgE2io0SyR01Amrjr9AAn1JQtRK9CoBzci
	89UtTY54zsk7BZrTD4rFo0j0XBneXubYslO0gmkIXeYSsc9AHrKqrRwJCtotRj1q4U4D/LY4hsX
	n/nq3Gn3KOlyHjXRyzsFJ1aJXsmFGKmf7VciGpsWkCjcj/oj0+3kVVIn4JGycXPK/mFCZ94pKYV
	WDOQfGoaRL9JZDFM5oUad01+TRJQBARYzPnyw5g6BDgrO3Cbg==
X-Received: by 2002:a05:6a21:6f0d:b0:38e:99a0:105b with SMTP id adf61e73a8af0-3946c8bf40fmr2021017637.51.1770993583680;
        Fri, 13 Feb 2026 06:39:43 -0800 (PST)
Received: from localhost.localdomain (wnpgmb016qw-ds01-160-103-199.dynamic.bellmts.net. [142.160.103.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e196accf9sm7676094a12.13.2026.02.13.06.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 06:39:43 -0800 (PST)
From: Rob Hermann <supgeek@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	kailang@realtek.com,
	supgeek@gmail.com
Subject: [PATCH] ALSA: hda/realtek: Fix speaker output on ASUS ROG Strix G512
Date: Fri, 13 Feb 2026 08:39:41 -0600
Message-ID: <20260213143941.29696-1-supgeek@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS ROG Strix G512LW (subsystem ID 0x10431f21) with ALC294 codec
has no speaker output on Linux. The internal speaker amplifier requires
specific codec coefficient writes that differ from the existing
ALC294_FIXUP_ASUS_SPK quirk values.

The required coefficients were identified by comparing codec register
dumps with and without working speaker output:
  - Coefficient index 0x0f needs value 0x7778 (vs 0x7774 in existing quirk)
  - Coefficient index 0x40 needs value 0x0800 (vs 0x8800 in existing quirk)

Without this patch, speakers are completely silent. Headphones and HDMI
audio work correctly.

This affects at least the following models:
  - ASUS ROG Strix G512LW (i7-10750H, RTX 2070)
  - ASUS ROG Strix G512LV (reported on Fedora forums)

Link: https://discussion.fedoraproject.org/t/asus-rog-strix-g512lv-speakers-do-not-work-headset-works-fine/74918
Link: https://forum.endeavouros.com/t/asus-rog-strix-g15-g512lw-no-audio-through-the-speakers-alc294/72857
Signed-off-by: Rob Hermann <supgeek@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index XXXXXXX..XXXXXXX 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7859,6 +7859,7 @@ enum {
 	ALC294_FIXUP_ASUS_MIC,
 	ALC294_FIXUP_ASUS_HEADSET_MIC,
 	ALC294_FIXUP_ASUS_SPK,
+	ALC294_FIXUP_ASUS_G512_SPK,
 	ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
 	ALC285_FIXUP_LENOVO_PC_BEEP_IN_NOISE,
 	ALC255_FIXUP_ACER_HEADSET_MIC,
@@ -9166,6 +9167,19 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC294_FIXUP_ASUS_HEADSET_MIC
 	},
+	[ALC294_FIXUP_ASUS_G512_SPK] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			/* Enable speaker amp on ASUS ROG Strix G512 */
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x0f },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x7778 },
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x40 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0800 },
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC294_FIXUP_ASUS_HEADSET_MIC
+	},
 	[ALC295_FIXUP_CHROME_BOOK] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc295_fixup_chromebook,
@@ -10977,6 +10991,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1f11, "ASUS Zephyrus G14", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1f12, "ASUS UM5302", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1f1f, "ASUS H7604JI/JV/J3D", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x1043, 0x1f21, "ASUS ROG Strix G512", ALC294_FIXUP_ASUS_G512_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1f62, "ASUS UX7602ZM", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1f92, "ASUS ROG Flow X16", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x3030, "ASUS ZN270IE", ALC256_FIXUP_ASUS_AIO_GPIO2),
--
2.47.0
