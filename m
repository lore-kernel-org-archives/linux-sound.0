Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4573390C85
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 05:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993794; cv=none; b=bnwgLxzJH32Bg8SEa5lq8jui/yr27e4AX/lG4ePXy6ETwhCwZzT5Y9jgnERxIYisAh5pFREhoowhxY1Vpw118+QexUsgjjyjAqjns1TigIGXKIMyQxkmijGg24aRfx9CMqG4ATB1loaOmJfJHNRicYoxKS4JxXuB8Ur691QOC8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993794; c=relaxed/simple;
	bh=sSXF3ao+JS2PxAoloNsB354hf3yu0bleah103QwAXjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tqO0bt2rC7dzv7SNXDdXNRQ19ddBewDafGXgU+nlmKVNZrpawSrmVSVAX7o23fq/y6XKYx7X7lPZ5VeR+y51LwbPZZ+E+EyydB/9bUw4vSHgBUR+QNcEIsMqGSMeK8TJgTaNW2eqzodBe3pxUOylIsZPFMNB5g2F8Zz8RpVITB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnp0iEUN; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnp0iEUN"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-848743155bcso902409b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 22:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993792; x=1786598592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rju6HFe/S+MJe8cf6yB0HBsbdDH7a0Yg40XL1i/Z1yY=;
        b=lnp0iEUNcwv5RkyyqZQt9BkmcSBquzQ4oj7ZWd/JUtTnruKiyHV0K1rQXqf/APh1xJ
         5X2jlg04j69SqWVw9OnKsUeWxB5+2xeMHePeemK1uNSse6MpGyJ/pvkFY4jHYZMI8Cso
         hLlQ+CII3bDM/NEfbVQs5ZAYH2iYSIfAsQ1ZeU81/XjdalNaHakBUDXkaFl9Z4/CpN59
         r6S/99vKFXFmZgxj9WURY6LDtVmoOvIt+P/BhLtPuOg7iwb2xlCoOqjEEGbwlQOs9EoU
         +8zNjhD09gVKooy+Et06nlb/cH5yDPQQmn/12dp83ibnjO0MovPbvL8RMbwm3r3l0xYO
         2bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993792; x=1786598592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rju6HFe/S+MJe8cf6yB0HBsbdDH7a0Yg40XL1i/Z1yY=;
        b=VIZW9mMC8P/PyjYsEkgDkCtDsWotIev1eKW8dmQ35FxPscncNgycFmTj9MBVHcUeLg
         BhusrQFtbkE+z5gHR03aUpAbRPb+rJJaUCR4O370C6rcwFbGkK1LNdif5V2p3Cf+sRfJ
         ts+SlMynoKFioiBLawOFoIQ9Fma0Bm6JnuNHfrrFRdWhbOt+Sh2VG4S96nyUBnGR/N4R
         O58bDVWPBy4Jfq9L7jZ8JmzinbkakA3Yv043iUqmTA4Q0CppUXUScEctuzbM6/FZBerS
         +uOx+oR8mdf/RbH9KjyatbPm+NMKDZSmQbCxSzE0TCXvXbPqYL0zII8O7dcUVN3yigrn
         FRzA==
X-Forwarded-Encrypted: i=1; AHgh+RoDVCH5Ym7UejU5+aKXn0E7kSww23mw/IpLpv6W5jX/BC7jfwFRB1rkAB60OKe8/XFPMDHw3yMSiS4vfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxckUe3x3Mjeat5ocV4Fon2anngxcdZt82Ixaf+u4+Pr6AOCpQ0
	4C97isopAg7jRgQGuJBnb4nzmJ+1htBg75+H9OqWjX7SkYaQUT/AZS1Z
X-Gm-Gg: AR+sD10/kAxdSlPjenbf4JdFdM1gkzIImETHa1KqS1fI3d3P5szmhUlnjIk8B8ke6vO
	7XMgcI6tsqe/+zN25yGptHcGP03kCESO98dkxjOYmJ3LFWs9XqZwf2x3uVRjeGl+y1Vm+5nSJb6
	s5pxB32+iXyuY5AYi9obFPHMTT9DQ+2LrRej35zAwMhbjY6vjaEtRfJV7o9THV0T8awpbXjymCg
	HxYzii9hbe2F9ONt5YdBAVWYonskOi/RX8ogtBum+FsAvDWNz5i4CrK9pNIFiZ8aEy3qcUGs3/G
	qF65RwfNhH2QBp/D0DBvifXkGNlHkarkhQanlVSXDv2Nx1/7Z46AIgkX9QZhh4QbX7HinzUM3U/
	tJqSzBl58fxIUVGKJ7G2vmzre/LVg83KRalhsmb/p/DWRsPd10zPmIJag74SQxyylLvopI76gAm
	A8oD9c/aIKIMfJQV4oOAeMg2vlcOMHbgUUIjpl08V4FS5ztuFDPEPyF9yYOldSP+kd1b3OFNRXU
	S3cXb6OZyn4k7VkuvAuoiNfDdgYCas4p2boFVsYrjgy3GnGrOHlexz7bKTj0nj1i0Ux0kK4ac/6
	dLKs
X-Received: by 2002:a05:6a00:2e1a:b0:848:42a7:1854 with SMTP id d2e1a72fcca58-84f2e0c9c90mr12879556b3a.39.1785993792226;
        Wed, 05 Aug 2026 22:23:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:23:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 14/14] ASoC: rockchip: spdif: Return the original error code
Date: Thu,  6 Aug 2026 12:21:36 +0700
Message-ID: <20260806052136.21034-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Return the original error code directly and drop the redundant error
message since the called function already reports the failure.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_spdif.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 7f15bc7f8f35..2d53efd5dd2e 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -396,13 +396,13 @@ static int rk_spdif_probe(struct platform_device *pdev)
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Could not register PCM\n");
+		return ret;
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &rk_spdif_component,
 					      &rk_spdif_dai, 1);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Could not register DAI\n");
+		return ret;
 
 	return 0;
 }
-- 
2.43.0

