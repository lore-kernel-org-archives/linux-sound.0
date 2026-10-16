Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E9E509EE2
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 17:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172804; cv=none; b=udpEPCvtR9BNnUw1YxcUJl3rTLOnTnGv2URqwS8P2QRgs8KGI2s6b9WFIhcp+cp+Q7XSz0HBIokY2+JbuUXyMiqom6tFNxo5rxpRDmqTg3ATjX+sjsHr11MLVvdgAHrlKbH10/KOE7Zv0QDEW9Eq3kOavSqr17LwZl86cxjwo1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172804; c=relaxed/simple;
	bh=iG7yw/XW9kt+scsciYbPOm2zkpcdecfUamR5JJerxbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hG7hY3RcCc5Tls8Ii2re8eB3+TdU1Bh0OfQfebwSXY581dxvWnIeYYKCeJACqnZhBZuarvsjs5GqMbfsJWQOKWNNFddM8jtsXbsS/WldVc3x5zo20xYWMfm8zGrL5KXbyKabR24C2B1iviSGLD92kPswWmIEnqo7bKVCIPrYrrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwsZn0kl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwsZn0kl"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso2574445e9.0
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 10:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792172801; x=1792777601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xXTYs7ePdo05GsxVQxd5NyG1vGmSHNhIKeIMrVirDTE=;
        b=CwsZn0kl32Cv83jX2PRf4e4w6xFPV2HghCHwRVb6b2e5FZkFoSldpErM088Vj9Uf97
         bk6fVVpCT0R7z8ms4QLUdvv2iTfEE76+Z473lB+uCL8nCoexV/FOYz/qDj2LYPH5uvV+
         /5Ezr5jN76u3R4oXfiyCm2mIgAHznE4e6OPRj7lbc5GwVHipa+bgwX+O02Ka2zRJFTtM
         xRwvEQrOpw19dP8wygIjVBedXXTGk/oTgAuu/PZX5SM0AU5NOHKCBJT+dyT7Pg3n+e/I
         bRe2rsVNZz8vL27Ji1OGu3w59YO0P0F+n/zTuETC/5F7QztyuddBNaIQOmEyU/HBqgxY
         nBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792172801; x=1792777601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xXTYs7ePdo05GsxVQxd5NyG1vGmSHNhIKeIMrVirDTE=;
        b=aJPd4x5XA6DO7XSX0Nh9gYQJVl5bLXwaDOIHuOEO6QWvfne4WPAemsIBV/bbv6vEPo
         ZFGnUzRn5b3lTGPKjbd2So+RBE1Lxz4wHx1Vk8KeXplJveMvo80hP+AYV4UJna2lwY80
         LDkco1T8XvjKHbZylow1NBfMuoID6gbJe2hqoMYW32K73XZizbmZnr0CHK6oCImMPxZF
         ni6UvFScN26VNu03cYuCJc4i2fjE+6yfHH4bvrvgp+4PWfUCAgkSYIlUHpNVkt1esPQU
         6GIWbL0ChSHrNMT6YJm9Zee+kW/OcW+gyVJGhLi5ZRDjZ7c6cCxfD+J58l4DDXu8JUA2
         EmAQ==
X-Gm-Message-State: AFq9FYJ+8CHj0S2Si2Iafb/5W9QrCKMx+ZrgpbYUXbfTMrG9uKtkd8AG
	d5e7l1mH7PjhKbXZrhbnur/CZfnOr2Oc7zngiHHM1++yIbbqgLZWOItjafewCL2D5pM=
X-Gm-Gg: AYBFou3oRwjHCwoWzNRJlLP56c5DOeh2qaQfWN2vKPfkpprqnxZdu0I2HdrmQ80AIPt
	W6ZPxO34DizarYWTO28YaY2lqIb3Ql7gxS1njsvvpRnKpAycaU5evr0dnRRK6KkPi5SmgHKWtVg
	N2nfRNFLclVtxtzV7FgQNewmh0dQNGYA/QF0Jn2Jw/zaXWMQ3R62jurQ2iXDwRLV2XOfi42vTqZ
	rqaL5b26e9SHGvkkghmwyW6hL8xKS7LM28sVmvopB7QHSi2FtmOSMnVk7BvDEwLDVFjJIyaplSt
	GrQyZbAusEMaoukMFv5/rjmy9CV/gJnPUtdY28yBY3FBffO+41BpvGwp0gdsNhgDdXDzNhFwDL3
	7Sm+CR9/qPp/SDHWiJPPYNslDphMLmCecXir6FCZau4sQXoj65hNp5Z1zyPxIh5tk7/oo/EsUHO
	j6M/1XMnCpuQTL6KCguJK1sBFdIIl8QoHM+aotY35EmL+FxeyhFdQJRbbl3yZpPNVn1CG7ul7G5
	nDuOm8oGnI2lrgJTIh1QCg4wAUE0U9+z2WUIGU3lyFZ8gOBcxm98hTvDeI26ueGeaUgeRted367
	7jA=
X-Received: by 2002:a05:600c:3508:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4a1d762251bmr12053835e9.32.1792172800327;
        Fri, 16 Oct 2026 10:46:40 -0700 (PDT)
Received: from rattlynaught.tailfd605.ts.net (93-45-212-86.ip104.fastwebnet.it. [93.45.212.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d2e93a01sm43201305e9.0.2026.10.16.10.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:46:39 -0700 (PDT)
From: Giovanni Maria Mazzone <giovannimariamazzone@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP 15s-eq3xxx mute LED
Date: Fri, 16 Oct 2026 19:46:27 +0200
Message-ID: <20261016174627.362872-1-giovannimariamazzone@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Laptop 15s-eq3xxx (SSID 103c:89fc) uses the Realtek ALC236
codec. Its speaker mute LED is driven by COEF index 0x07 bit 0, which
is exactly what the existing ALC236_FIXUP_HP_MUTE_LED_COEFBIT2 quirk
implements. The sibling models 15s-eq1xxx (103c:8706) and 15s-eq2xxx
(103c:887a) already carry this quirk, but the eq3xxx SSID was never
added, so the LED never follows the mute state.

Add the missing SSID to the quirk table.

Signed-off-by: Giovanni Maria Mazzone <giovannimariamazzone@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 1623cf9..a71b443 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7502,6 +7502,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8870, "HP ZBook Fury 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x8873, "HP ZBook Studio 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x887a, "HP Laptop 15s-eq2xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
+	SND_PCI_QUIRK(0x103c, 0x89fc, "HP Laptop 15s-eq3xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x887c, "HP Laptop 14s-fq1xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x888a, "HP ENVY x360 Convertible 15-eu0xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x888d, "HP ZBook Power 15.6 inch G8 Mobile Workstation PC", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.55.0

