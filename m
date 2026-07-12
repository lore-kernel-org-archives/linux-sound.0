Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44125233923
	for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 21:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783892234; cv=none; b=DBfyaWvRlkJUdMIlNfEANCaS348c3pgnYLP4ZRWmCfKt6EmuW7sLjee+Emvr2+tdntY/LJMEyfiH68pzjxh+z8SdMjj4TUvSYaPXHpz/T4n4Q1YgtyKNJmqu1yZ3Ty3tHehPxJJk2z1tI5NlafVGhWuIHjvVk0rwhsb8dm8180g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783892234; c=relaxed/simple;
	bh=K+QoN4lPFWbA6m/zHJmz1G3exSg3zUH5T40jJvEn8cw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uN1CojVyVN89QgsQblZ4RMXHjHttA0Qfs/8B5vB6XmI5n36YdZoZVa+OXBZE3EX6zC+HTSxBKxcIRghbeg7aTsTHRI+ZY/qHemwlHHSOaMfgaXYLqfmLey/QdaSoxFWPTE2POhYeoezf5LUwwogFUyBjaFZexMovUGDv176QXe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ha/Oc1BX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ha/Oc1BX"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so18567045e9.1
        for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 14:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783892230; x=1784497030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ntYN848xuUV55EhSBTHU3dFEq74SwL7jLVtxgemmUs8=;
        b=Ha/Oc1BXg00THPwBQu9cMVOKCEAin6r3/4/XhD1UWEpXNCAnMZDeXE3S3XPcSXgL/z
         YcUdnCYISNivl0KhEM76l0bfO5WO6hACsEKh7aY8Ep1csXWBgg7Fls3xH/wnGRfrbQWl
         xXgrkP3RcbYB+gAUDMfyxnGVI9WSs7LoKKpBrQ5dDVW271t9NRLiA078yFL3l84aocQl
         C7kSlUFo+BTgbQrztcYuo1KiAx1H6Smgtw4RlXkjrZrqikH9nQAxk/5+isg7+vT1iDE5
         +3S90xxsE6Ni6Kdu1KwApqRb9ll1D42O4Ghumij5ruzN5iV/Yb9L8tN3cbBdhho2JE4B
         SRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783892230; x=1784497030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntYN848xuUV55EhSBTHU3dFEq74SwL7jLVtxgemmUs8=;
        b=FItQnmubg/JyKabAbH1s7VLevaWcECHPwZ5iLn0EHW4IOR6woddmKKhBfYgKlQSE10
         YOJ/25gMLPu+6UlNUFWtB1tEVy1rHY03QU2wbASc07NlFbifh7pv69UPwsykIesLOC5y
         Vfy+fdp8WGz6JblAfK7LNmHYSJgNaK0FSr55ofT9KmsYZ179X4/M2+TNKp/16ktezsFn
         Y5sCfAc+/8nX5ERoZ/PoKe9PUz1lT0OWtHdXxNeMjT7GLumlsYO+3dbPhbgp0g6dY076
         G8mZSD5xUaZs1cDjmtOxLbdQ1eB4zdFW5mtZ/hhl9yF23ZMF9Op6Bk1aUbCTGfaM/CIf
         vllw==
X-Gm-Message-State: AOJu0YwiJs6Jgzv6r5qmbe6gEaRHcY9Pm7zn/nj/yLqAWdMsjEPoDHnW
	H+C+ETvhAmoKQiADqheyE1YkTK/JWWX8aWG7+wdNAkaztlY2+9bC2/Y4WZv0DxNq
X-Gm-Gg: AfdE7cnV0pJlA4s2716RfXOq+IrGdssDbhqOTXfq0Un9jwvL+zp+33etWyzpXC4FPLz
	Jz40yyTvTlQVJNgvf7+cczO0Q1YQzc3W9gR/O0CiJut0h4F+dp53yZcf2IgeuvDufdxMYGcHEi+
	0H9yrCdT/fiNeOvpMlkCu3NEbcnpAbbSNAUcxWowoqDf0rzvHBeGOIMzhB/MsbgAJLliaplY+Ct
	vrYXwsKKNGQ+ylirZJeNaoxWxcqktRPe+qR7TxPEuGXAXOmHrrDV6v0C+c6MnIjlobnRdsTAHLk
	SV6MEyfXlg0nUy7CVEntB8nYXkzc5aSv/bOnh1P0ZlKfB9wwroK49/k0LlOBFdmq/r4eo4h6abj
	DdfyWe9BQmHeFm6hpVW4DxL4VVp1McEpkRPmRURp9QYKMtpTpNe/oH7FvLf7kF9qa3GzFv2yxs3
	r+OQvqeD4jpNNXRyrDxrdCAxgmoBmN38un/l/HjHhUXPk75DMblYp6DhYwsyT8uINmBqICbWI=
X-Received: by 2002:a05:600c:1d0a:b0:493:c991:8e56 with SMTP id 5b1f17b1804b1-493f887bc07mr67653225e9.4.1783892230392;
        Sun, 12 Jul 2026 14:37:10 -0700 (PDT)
Received: from dam-Legion-Pro-7-16ARX8H.lan (85.130.83.79.rev.sfr.net. [79.83.130.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb74b3edsm364813975e9.15.2026.07.12.14.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 14:37:09 -0700 (PDT)
From: Damien Laine <damien.laine@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	Damien Laine <damien.laine@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix speakers on Legion Pro 7 16ARX8H with codec SSID 17aa:38a7
Date: Sun, 12 Jul 2026 23:37:08 +0200
Message-ID: <20260712213708.1835469-1-damien.laine@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some units of the Lenovo Legion Pro 7 16ARX8H (82WS) report codec
subsystem ID 17aa:38a7 instead of 17aa:38a8. Since only 38a8 has a
codec SSID quirk, these machines fall through to the PCI SSID match
17aa:386f (Legion Pro 7i 16IAX7) and get ALC287_FIXUP_CS35L41_I2C_2,
which probes the Cirrus amplifiers of the Intel variant. The TI
TAS2781 amplifier (ACPI TIAS2781:00) present on this AMD variant is
never bound and the internal speakers remain silent.

Add a codec SSID quirk for 17aa:38a7 pointing to
ALC287_FIXUP_TAS2781_I2C, mirroring the existing 38a8 entry.

Tested on a Legion Pro 7 16ARX8H (82WS, BIOS LPCN62WW): with the codec
SSID overridden to 17aa:38a8 via the HDA patch loader, the TAS2781
amplifier binds and the internal speakers work.

Cc: <stable@vger.kernel.org>
Signed-off-by: Damien Laine <damien.laine@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index b47177d73..6e4e1b585 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7799,6 +7799,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	HDA_CODEC_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x386e, "Yoga Pro 7 14ARP8", ALC285_FIXUP_SPEAKER2_TO_DAC1),
 	HDA_CODEC_QUIRK(0x17aa, 0x38a8, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C), /* this must match before PCI SSID 17aa:386f below */
+	HDA_CODEC_QUIRK(0x17aa, 0x38a7, "Legion Pro 7 16ARX8H", ALC287_FIXUP_TAS2781_I2C), /* this must match before PCI SSID 17aa:386f below */
 	SND_PCI_QUIRK(0x17aa, 0x386f, "Legion Pro 7i 16IAX7", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x3870, "Lenovo Yoga 7 14ARB7", ALC287_FIXUP_YOGA7_14ARB7_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3874, "Legion 7i 16IAX7", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.53.0

