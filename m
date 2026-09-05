Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DD830BF6B
	for <linux-sound@vger.kernel.org>; Sat,  5 Sep 2026 08:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598214; cv=none; b=B+OPBe1e9isdUekt/aDITKct3wtm5pGBIFTZlvpgqq6hKCb+n8LNmRNNsGjw+AOWUmz+7syshxdkdwDFMRz8dmlMnwKJZw8cd19BKM26SnX2gI7fmxfAcQP4b2lv7mYllXQubxbXVlfAdv0zxeYv6PLEm0BmT1RoRDuVWN+2Ryk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598214; c=relaxed/simple;
	bh=418GUUCHPriYoCUp96gnknZxNvDG4KIlym1boqpP0rc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FnSTvcdE7xC6NoUrZq8arQ8z7mg5Gicy0fdP3JhvRo1DOM7e4TwzEsaO330NVRAGnoLQPu6F0kc27y0H1I3jcUtjLanPszin94+IOsPK6hknoBdSfztAkIB2TGY83R8EeHLrdSLXz7CTADV0S56AogqtKLD3NFxnr+0EcU6QxSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJXTtBmH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJXTtBmH"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d71ae3455aso23737535ad.1
        for <linux-sound@vger.kernel.org>; Sat, 05 Sep 2026 01:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788598209; x=1789203009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wi1PNVlf9ygKz7D9d545aLc7cRBusDmxm541j+QdCUI=;
        b=FJXTtBmH8oVgCY8S+WugEHHy2hRMiZO2kvYNnQkbYLZNIi07JneE0g+ml3Ak8xez4V
         ILu9stX6ZYrLsRTG844fJxrYIRLa+tJR/LHI0BeSm48kyHmTaEPnwTWFiRMGb173kQXI
         YVOCV5siki3s6qI0AwXCM/KIPLECGOuFqX1jbciA3C7HW+nEibLAsoXHU5iVa64AKwor
         Qxx76kb1KpC2zNfxOKsqsjPJOjWjcI7HRjLGt5GNz3RUxisG5hloi5Sml2mEfDxYtHhx
         xD6/O+mLxuiYXRzdgPK0k2DQSCYEZ9QTwiIIbpwiQTeO2m7qs4aH7pc498UMPyPFMlOr
         MdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788598209; x=1789203009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wi1PNVlf9ygKz7D9d545aLc7cRBusDmxm541j+QdCUI=;
        b=bHBq+27q2+L1sKFArjQR1iQSV6sKdRdSx9HqhJ0tSFuv2IAPkU1VH71oz/W09/z7mn
         VTxkZ/ox7XA8dxNOW9kh14Ne9PKvppGzIDvEA26WpsRBwoDEHFCpyZDnvkxUBRdwgKUs
         DRoSzryY7y7HT4wyuboW+6TGNjZlJJKonS7o71wEjjoIlUc8dhuYCsa+ArXpS7erLFv8
         T6QoMYddLjQ23GslQZDvheHPURJyOOUYe7IR/Yplg8n2UF0X4PHDOTv+F8Rgxi1eUcGn
         YLi0IhMdgBEyyy6rCseJCnk/18ArOO7ZPMfEZ4z4G/x7H6YqSoyiE/umuIm6vm1JG+4G
         WgyA==
X-Forwarded-Encrypted: i=1; AKwUvBx+Nd8hkyz7i6HA97dHY2KHJuU9ELZqKftvoVj3bwMpdp43koBvQhJQ1lb98oJDrwJ51Q7IKhEhmIgb1w==@vger.kernel.org
X-Gm-Message-State: AFuF++mGBVSlBPA+VFdD1nbehJXclWHHvlMWatzYoJk4FMwrkVMNXe+N
	rAxFPnQPh+ZN69J97NugTvpFcAtrZ2GN0Gc4/NrdEFr/eI2JDf+tHFvP
X-Gm-Gg: AYBFou1XBh+HieAQ8U1NSlPAvLjsk2Figczhvld5DHDnWH7VNvc7L/y4olNj1PkmJ/S
	XxFSNbXIzRa/BToojHJV+ci1k3CuW9phXJ4UAGZMoGnJaq/SHClLj7SwwflYHsESyl7ltDg06DV
	5+Sltt8CDG5ZAepcMI1MXK/qwE8PHsDDvo4z8QLtPT1njm8mfAlnYTvrWfvkVpsZLZDbhy2yjyg
	+1VjP4OhU3rJ7YAZjLEeVffVYIKK2fKHW9HhIfA+Qn/wgpIH1fHTEREl91KbVl91oXQHuVathw9
	ybFZT06PVX1X7ZlqCbw3R71ORjYjTbeN6xTaLdTsePhmyaqu4s5HQc1KnU4TvacpdaaAreT6a4r
	wrfeugOKtWa+dO7BHhbcAwJp/+Wf8FEiKW3IdT94MSra/e/WGxaEAAAu4qkeEbZus/OIjcHe+U6
	IeS8WhrTxWp4vnFXORg9oyPI9VXL4cw19P98wJLGwLQmlVVQIjYYG9y04A7PAO1MJzHkJUIZSKY
	ISgHn4dZefwvM6SHk5mP2faJ0iWKVu1rlLFOAxVC4ZAs291r7s6fHa92OJBUE+P15Xz601M0p0e
	tVtjRxXw0YoMFetq4JlV5Q==
X-Received: by 2002:a17:902:8c83:b0:2d8:d4cc:5bb5 with SMTP id d9443c01a7336-2db128a7a5fmr111814335ad.21.1788598209380;
        Sat, 05 Sep 2026 01:50:09 -0700 (PDT)
Received: from arch.taild3b82f.ts.net ([2401:4900:531d:da35:5001:ad51:d51:ab15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm11899378eec.18.2026.09.05.01.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 01:50:08 -0700 (PDT)
From: Krish Gulati <krishgulati7@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Zhang Heng <zhangheng@kylinos.cn>,
	Eric Naim <dnaim@cachyos.org>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Kailang Yang <kailang@realtek.com>,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>,
	Krish Gulati <krishgulati7@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Omen 16-wd0xxx mute LED
Date: Sat,  5 Sep 2026 14:19:05 +0530
Message-ID: <20260905084951.9595-1-krishgulati7@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SND_PCI_QUIRK entry for HP Omen 16-wd0xxx (PCI SSID 103c:8ba9)
using ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT, which controls the mute
LED via a COEF bit write on the ALC245 codec. Without this quirk,
the mute LED does not reflect mute state on this model.

Tested on the affected hardware; mute LED now toggles correctly.

Signed-off-by: Krish Gulati <krishgulati7@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 95b40a177d2b..740476a9a344 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8371,6 +8371,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0xf111, 0x000f, "Framework Laptop 13 Pro PTL", ALC295_FIXUP_FRAMEWORK_LAPTOP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0xf111, 0x010f, "Framework Laptop 13 PTL", ALC295_FIXUP_FRAMEWORK_LAPTOP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0xf111, 0x0010, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0x103c, 0x8ba9, "HP Omen 16-wd0xxx", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
 
 #if 0
 	/* Below is a quirk table taken from the old code.
-- 
2.55.0

