Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5099D492519
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 21:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780522433; cv=none; b=jhZT1pdCD+St/B3p3TGv/cknWPHrFkMc66S2eSP7LkNRMbz5e2ig5W0fgPquj7G2MtgRngEcJKOiQq3FdZgLeAJnx9VjBYIO/nqm0BWmRnlA+9YIcJfAr4Uotvzio3HSq9hB360x10z1/hhYKhu7SOqbBkx9+xHbHuXcTCS96oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780522433; c=relaxed/simple;
	bh=FzjlBSZTQ4xIgKzesNz8Nd4bBERzPTu3p3kNn1RpBcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZhBw+03hcEyp5xwpG2DsR7KetPsyiWZLGpv5DS86piGu24me582fjIhfuQbBBksjyQ8kYO/L9/h8pYiIBSJpdpWUH7tKEzrmHYtOdUit/MG9YrZmfkEWjpktG0/KgjFLCDB6qd41beC0YLlQNALEGhp2uhIGa4dzy6xIM+Ea4X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noogadev.com; spf=none smtp.mailfrom=noogadev.com; dkim=pass (2048-bit key) header.d=noogadev-com.20251104.gappssmtp.com header.i=@noogadev-com.20251104.gappssmtp.com header.b=qiaVta69; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noogadev.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=noogadev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noogadev-com.20251104.gappssmtp.com header.i=@noogadev-com.20251104.gappssmtp.com header.b="qiaVta69"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45eeba68948so5310753f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 14:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=noogadev-com.20251104.gappssmtp.com; s=20251104; t=1780522430; x=1781127230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlH1yY2Qw2PumWmBtn3keZ08FiCHVsmk5GMo+CQoULY=;
        b=qiaVta69X+OfPUYeeMuEpuvGqvkljkYyUyUtQeO2lbS3MzZ1LKNNxa2VsPl90WrdyC
         /Y/7ojOJooMjHvr9qv4UOdO1zU9C5RFlBWnA+pb9hJNuB6lv88S6SnzFwQ2pX9OkwPJF
         kqWO7JKFFVz9c4spjzt72ieZuCx71P9moU5J2JsP0NjnL9uPobBAB48w63qdWBo1KM1T
         63REzfbO/V+/keb9gG8nfw0vo1Opzn1GQGd+QT9NTHYvU8yv//JQoC75Eg5xk7LbWOfh
         ZdvZqvAXN7ocN0Ev4ycnQ9lUBQiKmWbaLUbQ6QPyoHPHdofBKejsv40rWjj5DEOAe3gG
         SeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780522430; x=1781127230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mlH1yY2Qw2PumWmBtn3keZ08FiCHVsmk5GMo+CQoULY=;
        b=jsu5I4maIwnDKKieC3T61U03IShKrdEsTH1otEZQrCGlLeg/ZMl20laE3vYR4nKt78
         RLN4QmjILuKqUlnLRSJkZZQAgh7jJrbMz+veMNzW0oCZ1tLSV0WbS6Kq5VtxFzff13F0
         eyuFVw3b6Sx1lnTvbLsFjTiMmXRPSG6TTu93cncefXPQBgLAgAiMyExQEKov3JQWuEIx
         S4YhkogK2tb7WRiqT7Sj18KLuXvWZwsu18hBTL+67OFQd8Ux1uz+noIxQACuxUoLO2Iv
         YD6DzJ4C3K5PZhptn13FUtYrcq3qxTtDtAmpRb30MlwuEChAapeyCnnGRBlOgft3CbCZ
         6/Fw==
X-Forwarded-Encrypted: i=1; AFNElJ9Fj7F/Y+LZsNgnMZ4eVui3gXh1vwTHobx8o3QczStB+JXHE+/kla/IM74BKJDUkX5lErE3VbBeurXbAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgVPMsfrk6sKdanvlxh6C6u/wn7Qu8xR1pJ7nNw86gjWdZPnII
	4Dg16BJg9dVElxNk06rvApElKX8vBk68ejUAnqcuJvjfTf5hnVzHUQgR3hbzo5BKab4=
X-Gm-Gg: Acq92OHtkSZ8uPAC5MChXunRxi80dd16/UQ/S6uS1CmlfSmhjYA6IzRVU668YSjd7/k
	5BVsxm1xEERx8ITyAmAdvEH76e9PJQ+Q/E1ovqJ1gRtICdr1xCuXxdY1beUSphKSWNecWg7VfZi
	z5cCd/DE+AHVovdMuFEljUduhQc0t3WhLOGFk29T37TVxvt4OXSi3DSEzRrXX7eXy8ZZwW+3rJa
	rlXZtaGX32gtL+QcKmDgQkZmtCM6QCao+bLrXjQhMGvaA1prPhNgexWvZc82+eKY/6eJVTNn9Ke
	ANnln+ommGpXWwFr02rUoSRkiVfWLc3ERrnOw2KqI0/UjwgBG6SwscufBYXnGz+F4SaJ4z7itbN
	Jye6qJKv5MgruI6AZXsTl0j9tGHWO2Dhic3Rebz4sC7f+w8ZU8LSueEIbnCmRJiqGkFjjzEJWeT
	BD1rgZWLH+MNV3FWTYGU7Hlb4Oz/fTNL50GoZR
X-Received: by 2002:a05:6000:18ab:b0:45e:a0ab:8bcb with SMTP id ffacd0b85a97d-460217de189mr8487206f8f.15.1780522429770;
        Wed, 03 Jun 2026 14:33:49 -0700 (PDT)
Received: from srv ([91.184.117.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f5612sm10415562f8f.15.2026.06.03.14.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 14:33:48 -0700 (PDT)
From: Andrei Faleichyk <andrei.faleichyk@noogadev.com>
To: geraldogabriel@gmail.com
Cc: andrei.faleichyk@noogadev.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: hda/realtek: Add quirk for ASUS VivoBook X509DAP
Date: Thu,  4 Jun 2026 01:33:13 +0400
Message-ID: <20260603213313.6298-1-andrei.faleichyk@noogadev.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <aiCaJlTA8j9oahdt@geday>
References: <aiCaJlTA8j9oahdt@geday>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The internal microphone on ASUS VivoBook X509DAP (subsystem ID
0x1043:0x197e) is not detected without a quirk entry. Add
ALC256_FIXUP_ASUS_MIC_NO_PRESENCE to fix the issue.

Signed-off-by: Andrei Faleichyk <andrei.faleichyk@noogadev.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index dcbc66984..18dec3427 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7379,6 +7379,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x18f1, "Asus FX505DT", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x194e, "ASUS UX563FD", ALC294_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x1970, "ASUS UX550VE", ALC289_FIXUP_ASUS_GA401),
+	SND_PCI_QUIRK(0x1043, 0x197e, "ASUS VivoBook X509DAP", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1982, "ASUS B1400CEPE", ALC256_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x19ce, "ASUS B9450FA", ALC294_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x19e1, "ASUS UX581LV", ALC295_FIXUP_ASUS_MIC_NO_PRESENCE),
-- 
2.54.0

