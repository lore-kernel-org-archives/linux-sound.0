Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EA848F002
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 13:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603033; cv=none; b=r27viNt5QhMte5IkW2Njfod2MSFJG2ss4MrW/DNvTGA6vYav8TDiuzQ92Qt5tnjFARU/scan8dC4kYiV5uDbc3Mjy0SETTTYV3Oac1XumJNMBf6KleGMHX3/OFtgwsI8hTJltlLEfn7LKdQmN0YWSr+7iFG47XF26S142wYzwO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603033; c=relaxed/simple;
	bh=mqNxGtc2qZj/pB7g0jn0pOCaDg7IRzMAZBIJBCo08OU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fjeFcpWnjqeO1t6dXf7BzWUGCQ4MC3ysV/ij8/pVi4PLK2QJJBU5JXUfM8XFiwR0RGDZ+rsFk/e7p2mSR/iiqXE9L9jQrBSTCGUBWX+Hi2iVWuabCDWNy4ri6GOm0vba83Hd5Zy/WZXLhXdT8AmvVaoXq1dx5QqYQ45/Hm0h/k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCXhdDb/; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCXhdDb/"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8d6489419so2468134e87.3
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 06:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790603030; x=1791207830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rOxLA1JMar839B+IImDVjERCRoDtVDtOiXPwWspWPbs=;
        b=MCXhdDb/C7gP4lQMUDt2nKxdxuObflbIWptqR2U7x2Zp5pvjFMeVFyReBGiDgIsGhv
         Tvql8afgX8JmywfJ9z1k7P6LM8s6wZCVHZy5/vt9PZ6lmohjCx4Tc2PgIxYWu0jbffPq
         OfDsIgr7av8b3+VvEzvlgEqWYw08EAONapmpJ6clqQBZpp8YXojMa/FZivRIcNC/BvYQ
         wAjGLs7b+66ZzFIngNXuLP1RnOJIJs7DKoejfG6RvaFX5w4Gjq9N927fHJNOZsAaj9BH
         o4hmHh7xZL9KPhxmtSGqGfUMW/zmANVnUIwtJ1ut7kxvVdXbTUmyh26IFXWiEHtWDMPI
         yZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603030; x=1791207830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOxLA1JMar839B+IImDVjERCRoDtVDtOiXPwWspWPbs=;
        b=JCpKGJ2jJXEh3XuZZVu3z7Zo6D79b84SFWW+xtNtAqSwGjBonMLJeRUnmaY2YhuUcB
         QOf7ZCjhz5KIEeRnxqaMfVcLXMR/NSSGWRQ6ymbIe6PrDqO/ieeY3+8qlQoZpNjNX6JQ
         s1pxuWpmXPyKtOtGgeWrQv4R53wWADzvsmIkudt+sSeoTop+vEmdOmBbB5A5s9oYyn+X
         VEswU+bZEM0fLdhZ8RGlwKFbN63aoW9M2zz6ZRAuta/YjB6u18od/by15bRWJq4hb4D9
         8s5ZbmjfIdjMDO02K8WmRD45rJdImqPWJSpG9i5uvhqO3eSEqRfZrFH/7PAG/prJey/R
         o61w==
X-Forwarded-Encrypted: i=1; AKwUvBy+ncY1RQ+i2XoiAwb7jxhiSGiSQtnwzhjoUvNehI2R4eY1KdEpfghnnMRXSuUTe0r03xaCMNroQgah0w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLQKcMN57dc9+XMnW0hEsnGqCLifKNnuj1tAe7qP8GbDs/oPih6
	zq96nTErX3XhyRM+z4P5S4luqnN/jkb+ZT6cac4Fnt+HF+1uLFSPcTjn
X-Gm-Gg: AYBFou1y045BTrRFtRSiuhNyx+xSW/+dt/uqcoXldUvmnRZtpuS+M9UqXseWoE7AqyR
	yE4Q2Ei1/iKuD9YaDNPAc2iLlwXTnfNAwbPxsrZ8cA0Ox+Dn1ohmgIwOR+PBGB2NytSo/PyUTOx
	RDY4j0H9z92Z92tBg9lIuXhD1jJ+WwI3g32GIV4+ih7yVSHv9MztE4QThxu0yfSAY10+MHOs0d/
	dsESfjCKUiJ2RUt4iKZQvyu/OUsbVHE94VQS24mazm6htCI2PIBQKTo1Uw2fZT/qdISYsBmVcdK
	2tTrJokEjZkI8EzCGHVVhl+l/8GpEA8WmR00XRObO6I5zijt/Mh3bCDvhoZfctSQhnE2ZUF3GJH
	IKyPGOQU3446RQPWlg0T82DuFc0n09eCqBIJxp8PjSFZ1L/7cXbm+TRSCwtW1FpGhc5gZlLOoia
	+eM6AU5ze16SDs6GEL1S8/C1rFHFZQSEQe1GRJs+dl0y67tlmaaYmErbjlsgocydy1WBhJBWqrO
	RMiRl9o8kGxErqy7Mm5iks0UXNvpGvkGitR87OSGY263lg0BjqXcsi9s6ux5eIUUEZqeJviYXKH
	pGzjY0tUX5NRB+HD5S088pvRc1bJkMMpG+o=
X-Received: by 2002:a05:6512:b28:b0:5b8:f7fc:959f with SMTP id 2adb3069b0e04-5b8f7fc976fmr1468909e87.60.1790603029893;
        Mon, 28 Sep 2026 06:43:49 -0700 (PDT)
Received: from DESKTOP-P8LEVVU ([2a02:2a40:1afa:d200:255c:8e92:476c:7c40])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb25a9sm570634e87.44.2026.09.28.06.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:43:49 -0700 (PDT)
From: Bartosz Brom <bartosz.brom06@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Brom <bartosz.brom06@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirks for HP Pavilion 15-eh3174nw and HP Laptop 15-dw1xxx
Date: Mon, 28 Sep 2026 15:43:35 +0200
Message-ID: <20260928134335.1875-1-bartosz.brom06@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Pavilion 15-eh3174nw with an ALC287 codec requires the
ALC287_FIXUP_HP_GPIO_LED fixup for its mute LED to work correctly.

Add subsystem ID 0x103c:0x8bc7 to the quirk table to apply the
existing fixup.

Tested on an HP Pavilion 15-eh3174nw; the mute LED now follows the
speaker mute state.

The HP Laptop 15-dw1xxx with an ALC236 codec requires the
ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO fixup for its mute LED to work correctly.

Add subsystem ID 0x103c:0x85f1 to the quirk table to apply the existing fixup.

Tested on an HP Laptop 15-dw1xxx; the mute LED now follows the speaker
mute state.

Signed-off-by: Bartosz Brom <bartosz.brom06@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5127a111c59c..daca68ece94a 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7388,6 +7388,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x85c6, "HP Pavilion x360 Convertible 14-dy1xxx", ALC295_FIXUP_HP_MUTE_LED_COEFBIT11),
 	SND_PCI_QUIRK(0x103c, 0x85de, "HP Envy x360 13-ar0xxx", ALC285_FIXUP_HP_ENVY_X360),
 	SND_PCI_QUIRK(0x103c, 0x85f0, "HP Laptop 15-dw0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
+	SND_PCI_QUIRK(0x103c, 0x85f1, "HP Laptop 15-dw1xxx", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x85f3, "HP 250 G8 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8603, "HP Omen 17-cb0xxx", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x860c, "HP ZBook 17 G6", ALC285_FIXUP_HP_GPIO_AMP_INIT),
@@ -7581,6 +7582,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8bb4, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bb6, "HP Laptop 15-fd0039nt", ALC236_FIXUP_HP_15_FD0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8bbe, "HP Victus 16-r0xxx (MB 8BBE)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x8bc7, "HP Pavilion 15-eh3174nw", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8bc8, "HP Victus 15-fa1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bcd, "HP Omen 16-xd0xxx", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bd4, "HP Victus 16-s0xxx (MB 8BD4)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
-- 
2.55.0.windows.5

