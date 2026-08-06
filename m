Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A57F3876BA
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 05:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993762; cv=none; b=a0x/cly3TVzPdrBO8Qg/9IWP3r97eqh8XKGCNNQToB5lWs1z7mOtZDYvMIS3hXkfZTiZNMT+9UM0jV5h8yO8iNXjeiPLMSwntIYyBln5nagzwIXU0pTzBf4cWFmUaLNL38nY94KI0IKeRpN2GDivqGwO3p0aR+P6n+d/QrNwpLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993762; c=relaxed/simple;
	bh=QbrsH3Ye3OVwGF+o/qAklVVTMlaBOcFIHP8AU4D7yvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mBUz/jYn4EgkPky69VISz7zdyPnR0tljfulwJwuBPv4+WjK2ATSlIxqN0JPDVuo/AfGxSvU317yEBNEnywyShrKkAzzpJd7sDU9yO8FJ0TPAORLPai4nTgBaBMFlE0OHmNEeR9ELzgGHlMhRtpxCC3OXrE456AKAsiXKXRAWnyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+gGC4bA; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+gGC4bA"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84830c774a0so1875193b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 22:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993760; x=1786598560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJadDqh/AXReHASvk+eJve0FUluChS8L4Z4vpvFJSCs=;
        b=d+gGC4bAIuHPYOknwFjn8+s6/HkZKYB2QmiihclkNbvNJ5W+6ofzdYhvTWPbhmWOK9
         xgNCiYEFBz6xvRxv5uUH7E+IH21bpVOpxdNZ4fL7oIv68rXEeDTnZgswvtzrjVRhJWef
         RM5ZQWJVQ0MAvKO5BeqaA0FUy6I8wEyU9xbzmMB5ATk4h/PuGVeRb8U6ufncq4db3gpt
         /OHvuJlf2qHh3gNVy7Smn7jOXorp85X2HdF26CF7dBF0zibpdZ0/sn8Itu+SURiEz85E
         y1DIr+u1fAzSdM75HDIIxlJphP8BfOsmg9kPS/9o7cRZREcdqK5jEpT8JQHwR+HbQW9f
         V25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993760; x=1786598560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJadDqh/AXReHASvk+eJve0FUluChS8L4Z4vpvFJSCs=;
        b=YB8C1gTxoR1xA0oIn4+0v3ZFkGSc3WD0Rp4TRfBWjZ7S6y1K1Vk8J2V9Tch5CaY4SD
         owrlSSJgeLt+zxHepC99M+eOqijZkouXDwXGyM/jzONad/uCtdhtPpRrSCHsO+M5fNY1
         XKq8LNw7yD603hoHs+1on4jO+bBv3NUkv5cNmayVueCKgeKQek+LFE0j4sHL8G68M10I
         k7d9vRrIfrveFdzM6qqXQbtcvEvwUQob6YhQN4ciV/KcJarwZ+gWlcHG9Cxyqz3ffK5c
         U46yr3hUQtqtnxsFnALySgGlEsWkTYSNLzO0Jpf3WgbF7PHPEPJSMaOyv4nRDde84lh3
         ewRQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAU//TDXQtbI3NkKSAO22AJgu1ZGmx4Z1KsD+FhkXs5N+iQ0vCwc3RvU9QUkwY6nOYE+nifKiePmmlAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTKBoagJKa7c8uYdEk/g2eUVIdeDoVKDSRxWacL5UhWD449qg4
	InQ8Wf8ATqUW/OM5NNMAovi6yZ2jIMpAzbyqu0OPcp3sEmUr1dMk/PCl
X-Gm-Gg: AR+sD11vpN4Qwks4qG2QwVmEqJ5/8GRn9OUNAOV/XaF4W4xQ8CTGBchj6UIO88PgaJf
	BW18tM2hGZu5Z1TdJDtTVWjaPZ4KEDZBjon1+GEvrq6QeJOq3YxYd/atBK+7OX/JU6Zl3ZiQ6wc
	ET8EAXhkWNC9rras59aIncAx+EiXf6NPZSlcqrTG2P25thrSghThfG/45AYuVVNE8QHoADhPTf8
	xcQYdDLKMF4uOR98N36H4bum0OMfMfDilgdpwPyWgFVkp0o8RWaUPj2mvQnc+BFcX/62/YYoljU
	4xx4dtFnbwE41bT0LUWotKENiSCDW2aN79xq7GTIztmDCooXUfZKWmg5xcQ9VwjDZhU3zeUHAli
	co3tHLhewLBrV/eYNM1Gec5AnI04eUVAz2ybJGQko4nHxFnjAqXKGhRiLdNYAGDJeQc9aWl4bkB
	d9hlawSrUg34iTkRLd9c+fRXY7I84luG9NHGZiXqLuoQ1qnn36IZsxQUptzIulsVQ45emPFFk6x
	DiDG5jxJPX1Kck9eIh9V+c5j8UXagjlrdTW/QG7drFyZ51t531T6uPdj3llVqHUFv0B6ZpJzj6l
	+pMI
X-Received: by 2002:a05:6a00:1250:b0:847:97a4:d6b3 with SMTP id d2e1a72fcca58-84f2e05124dmr12546494b3a.16.1785993760355;
        Wed, 05 Aug 2026 22:22:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:40 -0700 (PDT)
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
Subject: [PATCH 07/14] ASoC: rockchip: i2s-tdm: Drop redundant probe error messages
Date: Thu,  6 Aug 2026 12:21:29 +0700
Message-ID: <20260806052136.21034-8-phucduc.bui@gmail.com>
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

Remove the probe error messages to avoid duplicate error reporting,
since the error is already reported by the called functions.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index c9ad769a4072..5ef7f109706d 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1361,17 +1361,12 @@ static int rockchip_i2s_tdm_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &rockchip_i2s_tdm_component,
 					      i2s_tdm->dai, 1);
-
-	if (ret) {
-		dev_err(&pdev->dev, "Could not register DAI\n");
+	if (ret)
 		goto err_suspend;
-	}
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
-	if (ret) {
-		dev_err(&pdev->dev, "Could not register PCM\n");
+	if (ret)
 		goto err_suspend;
-	}
 
 	return 0;
 
-- 
2.43.0

