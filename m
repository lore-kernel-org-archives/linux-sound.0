Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6D6353EEB
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 09:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781515531; cv=none; b=CSrugC9LENi1cJ4hAK5Wz1+Dc0Y5yBs5HrGt32z2bD5tU7JsLEQt3Ny7AKMiYiMLstHxuZ7zeU6TZqYvlAMtLaI75rp4zfNf3Vl+YybNvDKfAAd4e8op8wL1BOJNKRos6h2wk5gwlBzUHMic8eAB1q4mxsfE7eOdYoaf5u93WZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781515531; c=relaxed/simple;
	bh=K93QMHshX9IfqFQdsNbZ0g/moGKf4uzXyHnL5WDTFTc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PZ+A4hi14fmkM3sKt36kNVw+alk3y22w06TG7IqiPRUnJpKJQ3LMZp8wheamTlAnJ7BQNZBv3kU9M1rT3tRaaKa+qkI/KpjIS5Ic56K1Qv3wgWgEzaf1rmbsB0EXwwPSU3KULMuUBWKO7HGewkJyCk0XAozBPqs/DYKV+U35tT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hu2vh8B+; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hu2vh8B+"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa5f11deb2so3458490e87.3
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 02:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781515528; x=1782120328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gf4P6gCVkUmXbK0aO75+HZ2RCOvfzJopFv1IOpYqGMI=;
        b=Hu2vh8B+/8YBKO+LPese9kPikdfZmNDAzxrAoPtl1M1udLr5bHbwrS4Oit9SAGLRxC
         roC2nPMPbck50ImsEzctXf/Yv18PSFPeKlDd5o4XRGwUSH7mGR90QwOBnTrPKhcx2SCb
         TnRCRxVVhOn2/VcvIeVP75kCn5yV4QlKkUlL4ILnC8z0odgLMFF1cwNbh2/56+JNG1cQ
         6baI7Pt4SxqgkDF5XjGrG8h4nmfTlIwXp42yO6VbKTksujh2M6yLCKsVTXtSzymrx6g/
         pZvbJvmoR4EivH9VgWWPfX5Re0Cm6+8HeNBzFU9+SDsehkjjd8qA9AyyqdpWHH1NYc6j
         4R6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781515528; x=1782120328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf4P6gCVkUmXbK0aO75+HZ2RCOvfzJopFv1IOpYqGMI=;
        b=UL32dSr4/GHCAx3V3VDxzaTYwHi3dhXN4LgpspDFt7leHvjY5IUketIE/gGOTtcqR1
         c29j2zVckBY7XqKw20c+uQrBWpgF7FpKkEef1ZIJmdUnJXkv91mqLuXHPxfOl6WnR1VK
         S/ET8PKh6p7c8WuMaEgV/aYbn3xXe85OkZehWS1KJ5xWTizCbBn8Wn2s2NNuihTRQopn
         JdvCR9ksimj9LCWTr6Xn5EGI/mniY1WaX71OwRN7gY9XzNHZUx/ZQ7fmI0oqWCVPhejd
         MvRAcRG4NxK3jJOE9YgGWOmHj4k9xmrltxK9T843BsdrbaBmPUM5pAL6mmQxcDEnulZy
         6eqQ==
X-Gm-Message-State: AOJu0Ywq5HZfjp4WrqNofPxbMZmudbfll9vkuAOP+eTbjEvWd5i9Mu5Q
	noyxyDJHBtuQePoc7N7vvmMxqBab69gawssbh/fDUM/cnoLsLTpQxqNd/R6xNKXcqYU=
X-Gm-Gg: Acq92OHNv0zN4L4axgS/1xTK8EyUJohfM5vxep0CNUOg4Ys6IVjpsx95ndIj6quz81I
	srnO1J4Rb6Fez36tq+d4PWgLmpAzcKAGbdSKvdaQXLXqRv8BCjavXs0LO6hkdksYc9SrmgAJKEp
	z4WC+HE5qzKLsliLKfWniomnD4zM0BgrYX4Pfs3RTbLjK5rV+He9OFl0Fy8z/vN0nu/FzGlC+4Q
	klFEXLXgCbEzNFB1/sgyD2+Wxtp9M+lBzxgZ+z+/hqLgONzDzzip4Pl0kmCllfD5wf4pr2dJ5my
	cVmNghSIM1KUeuoOvk2Tjbcy4yZASiamFgYhzcvWyRaVGk80HM6ltuyLAoYh+wGfBw+KkpfDxRr
	NBxXuk9cjrO4NT793LZHci71fMeZSB09G3nxpNfyu3VZirSZUJebs7aK3uH8MOLH/MVKdtXuL/n
	VPpy6bhIVUPMu9QwZYAs13eZdnberhKHhj
X-Received: by 2002:ac2:5159:0:b0:5ab:bea4:4aae with SMTP id 2adb3069b0e04-5ad2db66904mr2961410e87.34.1781515528034;
        Mon, 15 Jun 2026 02:25:28 -0700 (PDT)
Received: from DESKTOP-GA746HN.lan ([188.75.205.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1aec88sm2610054e87.65.2026.06.15.02.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:25:27 -0700 (PDT)
From: Viktor Menshin <ripeeerr@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	Viktor Menshin <ripeeerr@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Xiaoxin 14 GT
Date: Mon, 15 Jun 2026 18:25:15 +0900
Message-ID: <20260615092515.1082-1-ripeeerr@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Xiaoxin 14 GT (Chinese market model, AMD Ryzen AI 9 365)
produces constant electrical hissing and crackling noise from both
internal speakers and 3.5mm headphone jack during audio playback.
Audio works correctly on Windows.

The PCI SSID 17aa:3912 is not present in the quirk list. The device
shares the same AMD platform and ALC287 codec as neighboring Lenovo
14" AMD models (17aa:3911, 17aa:390d), so apply the same fixup.

Note: the fixup selection is based on similarity with neighboring
models and has not been verified by testing a compiled kernel.
Guidance from maintainers on the correct fixup is welcome.

Signed-off-by: Viktor Menshin <ripeeerr@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index dcbc66984..0d8f157c9 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7774,6 +7774,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x390d, "Lenovo Yoga Pro 7 14ASP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3911, "Lenovo Yoga Pro 7 14IAH10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
+	SND_PCI_QUIRK(0x17aa, 0x3912, "Lenovo Xiaoxin 14 GT", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3913, "Lenovo 145", ALC236_FIXUP_LENOVO_INV_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x391a, "Lenovo Yoga Slim 7 14AKP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x391f, "Yoga S990-16 pro Quad YC Quad", ALC287_FIXUP_TXNW2781_I2C),
-- 
2.47.3

