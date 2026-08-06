Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3209238D688
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 05:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993772; cv=none; b=mhg7zr17NsDQwHmvWw2riHgP6QQpxvtV4C5xn0aY/UltLlNrd9jo3L0uH6dRJjXiCBSgdOLJUqR5M6r0gEBx6sbb+JptmR30zN3JDNxR1DN7TpTHlwY+VOlJsc44EtmyPbk3l+bwGQedY03kKakJMJf80/J1EG2yw+zvgB+qMs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993772; c=relaxed/simple;
	bh=uht1wtGkO3dc/GBpw/WuVtCYhBwXB0XSudDAS5+3MPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r5Et/o+g0hlZJA7tKXOc5VeRw9rqZ13KQgO1D4htL4f3CFHiZQwUSIsrJCev/G+r0rqRGCo7ea+HZhpLNW+1KKUahTZV6TRHHkgrmCT9irijnH8AEE2+D8/3W8gXjYFG/S2mWjtXTtKXMnrxxzdnnMoZrzigY1X9ld8KKhyPqrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDGb2g8y; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDGb2g8y"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so1660370b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 22:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993769; x=1786598569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0hWHLReiVEFXDAdvhyF4GcFfDKUrHwAoJwgfx7kXGn4=;
        b=lDGb2g8yIPHj9B5rI5WIs+/JX7vvFbZ8a16fiehgnAIfuu2DF9MiAeW/gmGURYd+Kb
         uwXETm8YTssTlWrzhM1Oyuh+2pbILqxL6KwBkZLh82twisOHxK19eT5VPLCDjlDQzER4
         4X5uF4yqW/d+duIt/ymu3mt2OnOPvy+qf2DopF/VBo8edsE+Iweybgdsat+QtYm5Aw9a
         sah64txlhEyNSY80lscDIff0sWKdUPZVpLSSc9LABwFZk08JC+qfqXL0Vid78NhdNnQx
         Y/aUMrYmce/AFZ2xG+sxQqa/9IsDXp7pTZ1ghxtSD8k2IO5RrDmqHfowSkTKpbKZw6IL
         u0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993769; x=1786598569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0hWHLReiVEFXDAdvhyF4GcFfDKUrHwAoJwgfx7kXGn4=;
        b=pHbc5g+bQTsnC7wyJOpukuBpgFeq8XtyvlxfaTto3nolpM8rnzl6vyvaSjNo+FHghX
         hs6MsInKwJzV1+d59zPTOqrAABE6Oo8abNodesDn1Dc1Xd6D887V482tRqnvu6bWawVI
         +LLMEhx2pjmrt2N1F0n0nKocfwi3EzrCPc2X8kTMYA/QSnAgZ4p5yPnAhsvsnU0mP7da
         /xwx2zNhy1Pv5Iamc9O6EZBgPhx+M4G9UuIsBUmWp2GuKhZQJq6235HTcrxUYEJ06btv
         iHyo7VTG0hW5yBsRIGvGV3JxphRAXX0CZe70hJz7iAfBGMEg2zCuvTuKXqxKSfWFH6qV
         1QWg==
X-Forwarded-Encrypted: i=1; AHgh+RrYbWY+bHWQdav1UbAkyKmxB33nPBv5zCHOJ0ir66L6FH2PGzs7+cvsz6sVpFDCUPA3jzgOYuXzItlxeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRBqwrEj/vI2kzNXDlYgdwAoWZobJXdFEXZlnAvj88mTKHDmvF
	REQv2LM6fZWqin8Vxp1CXyAYU3+GLbdGMPjkT2D0Na41IlfX1ZIPjQ7M
X-Gm-Gg: AR+sD13JdI392+swbs1QBkgfIp1QZPyOFqlF9NBrdfHBp5gzmLyHY2Hl3JUn+YP/kKY
	iGck65dkYe24szOMGhsI9jYAV+gkG3IZGS2xXdAApqGhK9ETcVTWVGDU2tW2cRceQB0kqyiT/EP
	kMPThGShx2Gxl81XLb4sSgytwFn2i7qBOe3ut1bKU+oFALnxT+ld2vv/83x26noM9UnVYjlnt2x
	6H06wPYbHf7M3svsO2frBNLLZrTc2DMZd0GtkMh8XOG7FnkGOlOfoGjw6zuiMcDQ56QssBXquSC
	t6WYo27QY2WNmQO8p8MqYqiNDCxjpaay8OgSsOQqD0yFmkkVtIW+Y/0NgS6pj70MuVo5QTZhvzY
	Zas0y52AZ1wD6EodRojfZ3DAZ4q7LBKUNPodxwWilXdpJywFJs+MF6voW24ozChRlRaPo4LGNW0
	QpQpBKCOhgWHgkC03848hH1bYtSu6zeq6gRo5sxLD8XsHVVZnXeTD4mpJ03MfNEVS3wbrY+TcaP
	yFP53iOk2RAcdubeCeRox+kdpKEucuYFMzxaYqcD3Gblwo+TIgSi+19+bx4OVcp6XwPdVKl1339
	Bb6U
X-Received: by 2002:a05:6a00:2295:b0:848:62ab:7b7 with SMTP id d2e1a72fcca58-84f2e0402b9mr12960128b3a.16.1785993769555;
        Wed, 05 Aug 2026 22:22:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:49 -0700 (PDT)
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
Subject: [PATCH 09/14] ASoC: rockchip: rockchip_pdm: Drop redundant probe error messages
Date: Thu,  6 Aug 2026 12:21:31 +0700
Message-ID: <20260806052136.21034-10-phucduc.bui@gmail.com>
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
 sound/soc/rockchip/rockchip_pdm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 115e90d3bbfe..343fda478901 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -630,10 +630,8 @@ static int rockchip_pdm_probe(struct platform_device *pdev)
 					      &rockchip_pdm_component,
 					      &rockchip_pdm_dai, 1);
 
-	if (ret) {
-		dev_err(&pdev->dev, "could not register dai: %d\n", ret);
+	if (ret)
 		goto err_suspend;
-	}
 
 	rockchip_pdm_rxctrl(pdm, 0);
 
@@ -642,10 +640,8 @@ static int rockchip_pdm_probe(struct platform_device *pdev)
 		goto err_suspend;
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
-	if (ret) {
-		dev_err(&pdev->dev, "could not register pcm: %d\n", ret);
+	if (ret)
 		goto err_suspend;
-	}
 
 	return 0;
 
-- 
2.43.0

