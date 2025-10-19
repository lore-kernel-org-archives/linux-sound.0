Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4389F42050
	for <linux-sound@vger.kernel.org>; Sun, 19 Oct 2025 08:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760863180; cv=none; b=Am1w96wmEYPgNbjy4Q72IGL8u7YWuecntsVGvlxF+fLhhhO9tzn+KKPnImA3q3s9PoKKJfJ3vBqETnmfjNadLUIqegP+B0WSnxfur7R5VdXHRGe+gVf8lj8Ib4EAHSgV71w8kBIFnzNVRDLwFArBREox4fKxpRxmkwKQW0gKTf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760863180; c=relaxed/simple;
	bh=XizJcdmtzfIGBXTnNvmIFU6Tr1/b3m+2Bg5b4Dtk1sA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Aem2EtBKiVkcTm3h32aVv7WFjHNyNfPoHy17nOxEnuz08BLbM9pqAL7cLiM+W9IdbEuBJdM9unOdIcnlhUidKrzmnmbCtaDbG9pyqIHvLMFjt6cbgqrK151OlK/XDU2VMNjhpHX64nMSxhvzmWvvDJU2fTsElP0QDJ6d4w0lBHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekqKgt9x; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekqKgt9x"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e542196c7so27968485e9.0
        for <linux-sound@vger.kernel.org>; Sun, 19 Oct 2025 01:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760863176; x=1761467976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w8OOW7C3cD8cI+vyLezuXJ7VQyKa+kmMKvcRNadAvwQ=;
        b=ekqKgt9xkhSEWK8sQHjOFMTi7M394ka93re/6lkDbh48FVjTTp7cYJDpk1MU/SaoFv
         VZTTWsmfoVVFX4UKUzIek89gXKyVbwGNavSKaedFZSCn7M4TPbITwSraPUAVtUjrDPBx
         H+Cnc1GpKmPwfpb6UZwhsGF8xBsKr6hLi2KCMP5nbbsZ3IVbEKrvJUvxGaJ4zvx3dxdt
         +FGw1sRbnnh6/KpjErBUoF5DJQxRDbok0rcChrlJUjbrqxYcbzcf8Ow0/JWz8cPwabBN
         KWTpg/LUF38Z9MsJxGbGu3WWhEFtztHsQTLC258datbRTyXDscC+kcQCDI3yOkuGe7++
         5wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760863176; x=1761467976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8OOW7C3cD8cI+vyLezuXJ7VQyKa+kmMKvcRNadAvwQ=;
        b=Q2GLfESaG9h4prJ+MI+dyqQoQN/v4IRxfGClamJCgW680B4jMm9FN5GgJyDzcYDFS8
         xULsLNJHC+OnwxX1gbaX4QJEtauOcjyB9g4ysN+qQd9ytaJ9sDhcnmRfW33TkQzQASFm
         qRwmmKEgP5rkLmCsC1VsFoE9t3Vw67WGG9C1txqvx9Ul/iQv3zg5eMqPDPWZp9PTFBiQ
         PUnexiqFtJtdxbUhRi5xU4j80OTZxD2g2tmz6xh41cFglaT4jBJOi5ZG22B6oMJaJ6Bj
         LJvJ/Azfa7nTnBtu0enq1iL4/oTrdS6YA+csDGNnN7WsPccqkV+gpxaxYcY0OiYTN6FP
         wZyA==
X-Gm-Message-State: AOJu0Yz2VYbCR7NPkSSwG8Q7fuKHCrBt5/Cv4fdLIbSmZ/32HQT2uwFq
	/QCw2C2V8ZxKC/+WW/WeyWLkQygGLEQPdcQuAKsU8sSM4XX1+59/q60oJ2736sFk
X-Gm-Gg: ASbGncsxcPbcW01E4vlTTSOtDWz+zanXhuLgX9Np1tPP8UvE3ohMNjIZzTd8Iyx0NPs
	qi36IuHjP6FzXzMLrsI9YwgPd85CTrPiqF7QqqLFNISLaEag06hgGvynyw2H5S7KHhbDZY5uObJ
	RExXrwHfEsiex36LFYic6/HqV2GbiBdy5jd74GEpObfcUGJILKM2myYOjQRyyPIp6CzuEEHN+xX
	whMjQVTBuCR7Z0fs7RZ/+ccSFTn26czajCkV8/jSLUDZ/6WmKH9U9eMsp/WWmLnW5/Z3ZaNiS1f
	rtsPFcQzxQcGSP3JRppPWkJIWzkPoTtbljF0ETPRKKw+tEFiNz/upcfxBc3PDEErw/tGe5pdmIH
	wwZyuWgQmfwLnPa4Mxv/3CaG4vPBWCU+xc6emu8KphGFpCnnzpSmSRFY7X6oHv64PrVqW6LX48R
	U7PdTAmls0WsH3dASBJHYpZU3WEw==
X-Google-Smtp-Source: AGHT+IGioA/6IDr0eTqobfJgB/Trrf7ndRB0m2AqoERutdpI4CAwuN83F77QMNmQJOfm2G/vSdf/fw==
X-Received: by 2002:a05:600c:a69d:b0:46e:1b9d:ac6c with SMTP id 5b1f17b1804b1-47109b58b51mr56618515e9.17.1760863176090;
        Sun, 19 Oct 2025 01:39:36 -0700 (PDT)
Received: from nixos.kykwifi.com ([95.7.251.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710cd833ebsm86612745e9.3.2025.10.19.01.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 01:39:35 -0700 (PDT)
From: ern775 <eren.demir2479090@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	ern775 <eren.demir2479090@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix mute led for HP Victus 15-fa1xxx (MB 8C2D)
Date: Sun, 19 Oct 2025 11:31:44 +0300
Message-ID: <20251019083708.35097-3-eren.demir2479090@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing quirk for Victus 15-fa1xxx wasn't working on Victus 15-fa1031nt
due to a different board id.
This patch enables the existing quirk for the device with the board id 8BC8.

Tested on HP Victus 15-fa1031nt (MB 8C2D). The LED behaviour works
as intended.

Signed-off-by: ern775 <eren.demir2479090@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 6b9e5c091bf3..522d4792ec59 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6577,6 +6577,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8c16, "HP Spectre x360 2-in-1 Laptop 16-aa0xxx", ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8c21, "HP Pavilion Plus Laptop 14-ey0XXX", ALC245_FIXUP_HP_X360_MUTE_LEDS),
+	SND_PCI_QUIRK(0x103c, 0x8c2d, "HP Victus 15-fa1xxx (MB 8C2D)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c30, "HP Victus 15-fb1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c46, "HP EliteBook 830 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c47, "HP EliteBook 840 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
-- 
2.51.0

