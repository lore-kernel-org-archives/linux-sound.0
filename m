Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3D07262E
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 15:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779810411; cv=none; b=fjHibxJfihiFEqiGGoI3ONlhYFiqltjl2LgSpBKrTSCkgBUfY1JXFjg8NIOV//rvHuFmB4g0nThjAThQd+JW5FNRl0Jo8dRfVZ8EKHZS+QUxMGdmJack/GWIODPofQ9W7gCu2BY4ZrNjE+Wi18gz86Pm92k9j82wKmaBOCWwlhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779810411; c=relaxed/simple;
	bh=D8glnkD9J1TkjSLXewWmyd44wCW1pvtiZyeUVB3bLe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=axnY2+YT4Uo3N6LyUbK3nSCEeYxA6YKpwmS0DH/UTGovXFq2EAIO1D8rajbQ+bYZLKL7DqH+Z3uzAjLtKjnpU3Ek0otEEqZOqvH0OPZ+ZHxiHTANM2yLfhY+LyhWj35jQ8rP2V/MYTMd1oHqKNHea0eZSi/LBYr/ZbZYho+s7nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apzpfdFj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apzpfdFj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4904fd4f6aeso31293765e9.2
        for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 08:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779810408; x=1780415208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7NT6YcVKtNaapw4+qptkK4Cx3/s7zGymBKAWm3o+mY=;
        b=apzpfdFjgFrjRAAjvJpbtB848h/1a1hSFCpRi1JKN5GM6ZJk7ADVdTRkyiO1Mhd3oj
         PmNwfDZpZccSUo1PXfXeuH9xIISqptFdZZ8VzyEqPYznK3dKmdkiPzlr7rR5K+OC+K15
         3k4Ti9CcJg+CRrScGp/BsaKFHUzDpbFPTXgRSGcjaPEjJyy9qSGJZJT7+ynEbwrw/Zkm
         4C4cbiP7ao9RZXmwW4QiAYnzZpfL/i0aYg/Pgz/u3D6cH+fCUV44QLNOyq+74WKyDOx9
         xJ6rua2f4+F0SiZg4myxfwIKssTX23j45ugS/x53hK9qFEsWTdZuEvOkTn+sUplfGgpU
         zseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779810408; x=1780415208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U7NT6YcVKtNaapw4+qptkK4Cx3/s7zGymBKAWm3o+mY=;
        b=DdNYknnj6nR7XEL00yoUBk9d9tMpNCDeSpfmzI8sBCDyu9e+kuLplzZiQxVJaCEkK1
         UQXWS3pHNHPekeL0ImtV7mplX0Vr4aRIgjQA/wibexncQxd1lbfaXnMCMvfYDp3h8znP
         KbEqITWfTSAi5plZzxTHhsOZKNfI7NDGxL6XS8e7pwxqfRVPIn35C4Y6LbkteZv3DrRB
         6WGybqux7Xs4s2zVFaV72uBOQ9Oeze/S+Q1HIp8NX8SiVcm0ad/GimI7Owxk45E0EsSB
         QvE2SKcpNK2aEdhXp/a3Lu1XKKWWJ5hs1jxw5JlevzHTjP5X9TgYHaVYUx8++ZomJFRu
         tLUw==
X-Forwarded-Encrypted: i=1; AFNElJ/AEHixEGR679lOYBoRNtGePtspK+TIdGCrEzADnmvmr6YUDeXW2MBxMJn5F24VC66jOZqlYD4zsksIZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YygOV23sYCaNaLYlaMm9NcP/cspmMbGgISqRAK86R2myFAdsgEU
	qDAci2+WjxRJCd9CH0E++wiSrgWL3W7wMkfRHzxK03ttVgZlzQbVF/6e
X-Gm-Gg: Acq92OG6dVaKAr8y97dmCzF/fleKlR+XBQEZSPw/KlVGhjybY3eUnHlQ3Ug3vOdZHFO
	o9zr0jg7Q0pCDLi9vz2oMjr1wgRDzDc7gWyvw1mqfdF9WkR+XA6TjFkBPvhRNHIcZJ/afe9+9aF
	BgDjY9BZT+ii5DBE6Zt9ZibY7Wc2Y8ZG/D/FANHIAaRg/fSV3Xp9znG/hQ3ioZu5Y+ZOUQQbJ+L
	QlcyJS6Lr6N5yw5N2ftRVMVPw0JUqcPT7Zf+IlslrLUXe7m/yb2NmbVHSObnos1XTT7MxmtRhJJ
	Yj7fySQoA4uEPkrTShWlCLkTBFk4r3jE21NKcRKoJcVfz7ZFXfzWNt2JJYJi5ZwmK4oa+JYOp7P
	uAlVPb9ZQ72LeH2mI+ae68mx+hMs+VTAxBm6IE53t+YBq7CEWIH2pGZmRRwdsUlqcNsvOkdKV6J
	OTIeRIziCp3nvK8zd7JnOERV8EHzHV67cIK0Ixm18H
X-Received: by 2002:a05:600c:6094:b0:490:625e:bb68 with SMTP id 5b1f17b1804b1-490625ebc14mr160164165e9.3.1779810407792;
        Tue, 26 May 2026 08:46:47 -0700 (PDT)
Received: from th-heuss ([185.238.219.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042487609sm176397465e9.3.2026.05.26.08.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:46:47 -0700 (PDT)
From: Fabian Lippold <fabianlippold1184@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabian Lippold <fabianlippold1184@gmail.com>
Subject: [PATCH] ALC269/Realtek: add quirk for HP Dragonfly Folio G3 2-in-1
Date: Tue, 26 May 2026 17:41:01 +0200
Message-ID: <20260526154418.1850568-3-fabianlippold1184@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87ldd6zp8w.wl-tiwai@suse.de>
References: <87ldd6zp8w.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PCI quirk for HP Dragonfly Folio G3 (PCI ID 103c:8a06) to select the
CS35L41 SPI4 & GPIO LED fixup variant.

Signed-off-by: Fabian Lippold <fabianlippold1184@gmail.com>
---
Sorry for the inconvenience, this should work now.


 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f180d6a72..8ba9b2a07 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7070,6 +7070,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x89d3, "HP EliteBook 645 G9 (MB 89D2)", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x89da, "HP Spectre x360 14t-ea100", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
 	SND_PCI_QUIRK(0x103c, 0x89e7, "HP Elite x2 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio G3 2-in-1", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a1f, "HP Laptop 14s-dr5xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
-- 
2.54.0

