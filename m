Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BFF405C31
	for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 19:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778958480; cv=none; b=kdE1VVtPdweiXZbBGK67BqB59BIAjCg5FTLaMVm7sg3zzyKnN1nROJks0OK40KK/iN33MMo3Zy7X3+fYeOpL/QzKPOQvsSfvuxBMSzi7cgpg14WLbrfaqL/IMSCqy8enfNj9Ou1VOUJZaJp8EZRLNDHEaErkbRq6I/84mTaek2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778958480; c=relaxed/simple;
	bh=XrzaJo4HWQdFxlW5p7D3E7trnt7CsF9FzaadFtFx7H0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NssHqF33aSSvN2FfBndl/enxR/ZHGFWOBbYUyvv2f53kgviS73Ltu5QMVTdSHpff7BlnbYrHZeCNyF0uZlwZDH9MuW5gnM9H+srnKKSJAEoazr3D6eUUFfqRPR9aGoafQhed0Du51GJ2BjNIQhRd6vvCUyuiKU0VB5Y6Rd0yKJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZ9xjZiE; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZ9xjZiE"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36643b96b99so893336a91.0
        for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 12:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778958478; x=1779563278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rJEppFNhUS0Xaa2w3V2HP8neaFUhqRuk85p9iAO9Rts=;
        b=dZ9xjZiEKNiKZGxAC4HXT/38mAcJtNyyD708y/02yD/5XNWtV5QQwzezz+kLSkP37A
         eQ8NyGYb2d6dUdGOA0JHCIEutTnoV7XN1XRadiwKvBgYu4S9Tt3Lj1lumpqTTLaqVDu9
         Vfp8xpLc8vCtBenNO6KgZG5Y00FpNRyQhpcjqr1huH2ddiqC5WYetRpKLLQ39ZJA32rI
         CTnwUKpVimUr8Y+wtmS0gQ98ZkFZ3IYX4FoHciZtbl8SYLGnSC3v7QxMTcpwT+ouNN00
         ydWKKJLcs5TThWy/KAdTkGjZCR+mm/g4+VL8eMyWigoNVwzFc8eCBHTVbtLWJOwRmDFL
         IWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778958478; x=1779563278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJEppFNhUS0Xaa2w3V2HP8neaFUhqRuk85p9iAO9Rts=;
        b=pYmDylBe4cK6bdYS9g5nAeqy4Um+PjRJzZXaHuY7924RuqI8J4SBn1v0LqTN3GV0xM
         ZIAYDybZkeC0Bt1I8WRd2tUZTb5lc5t+ptg0MOKgOL3U88cmcFvI050bxRPzHN40/oM8
         zDIFZm97xmvdXd1O1424pZrygrcLVe9OM3c7M7ESBXMGrmyfww6/S3dnZbxAM+pheOAj
         TVeGitlPbmER/v2qquZv/HTSV8PFNNFO10bQBfwpJSOZWoiNYcyaI647gAE4GTL+mtVl
         UYxX2rfbwgQyaozkKmRvFaxwVf02v/RjfrwyngHRmVbhyBa2SVvocNFtcmobBE/rxJzl
         xzXA==
X-Gm-Message-State: AOJu0YyLlX1xLcAOAYDPIigBuC1+KwHNh4YsKM4hjLPxfC0PYOzHbbKZ
	bC/f2JT82ZcTqOd/KYBSzNTEgEFI6euunfISLORTDKkV6Y03Ax6aomev
X-Gm-Gg: Acq92OGeQBEfxIV5qeZsK6kIIgMCaW7elemEOT5+nG05B5Pb2fKuwvlB8x/nNLmeiCm
	8oxAa/KIrmKxuW9xo4QMm9qeAx5hUDfj+n6WgrIiP1zRZF+GRvLWuYOdoQQktLJlqG58/kupreq
	2knMA7M5U01aeZbOceBdKAvVmNgcl3bYTiQpXVr6xM0lKAPHY+RWQ1/k7ZVDvBrTboecnibrQoA
	kC83iUmpEOPHOZUz1EfEdSuRm6cbBibs3ES3O0Q7MhSXS9z3ANUZACRwPvE4yQjW3x70xa8V2cX
	kieBBjakDdcWlTk0ZmXBVpAnXe/iMkmQeD82h5lVo/42XZ7StUWL0N5wWrev/4s1v4ldAGBdhm/
	S23jzjs6woL+SBYOeMNt2EPDf4b1gVm8E2KXoGW6M057vWvew0myk9YKiq6y6xTXexGS9yz2Voq
	gl98RDotjzkj5CJvMtP+I9Jf6PwQH+Vw==
X-Received: by 2002:a17:90b:544c:b0:369:7ef6:2874 with SMTP id 98e67ed59e1d1-3697ef62f88mr2681528a91.4.1778958478279;
        Sat, 16 May 2026 12:07:58 -0700 (PDT)
Received: from localhost ([188.253.121.112])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-369515895d2sm6145557a91.8.2026.05.16.12.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 12:07:57 -0700 (PDT)
From: grxp <grxp323@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	grxp <grxp323@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add HP OMEN 16-n0000 mute LED quirk
Date: Sun, 17 May 2026 03:07:34 +0800
Message-ID: <20260516190734.34721-1-grxp323@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OMEN 16-n0000 laptop uses an 
ALC245 codec with a mute LED controlled by a coef register.
Add the corresponding quirk to enable the mute LED.
After testing, the LED brightness is consistent with Windows.

Signed-off-by: grxp <grxp323@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 11d0ea8ed..2ac400353 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7079,6 +7079,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8a34, "HP Pavilion x360 2-in-1 Laptop 14-ek0xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a3d, "HP Victus 15-fb0xxx (MB 8A3D)", ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x8a43, "HP OMEN 16-n0000", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a4f, "HP Victus 15-fa0xxx (MB 8A4F)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a6e, "HP EDNA 360", ALC287_FIXUP_CS35L41_I2C_4),
 	SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a75, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.53.0

