Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1D138A711
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 05:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993757; cv=none; b=KPcN0T1+zMBx6+lbJPLl815YOx2Vburl5OgnQn5CjB8s+LTvZTRAD2tn871vlwjeNk0MGKDkIyzIXLnlWK0UTTOMQ81D8QSBzDr0pYSPa0c0AyswxPN5d44V0ygOM0LBKriZLk0giDyQamc/JprghaUFvOdxXE3NEczbcy8kuR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993757; c=relaxed/simple;
	bh=p6eRh+Xygm9NS0x2TQpIk58cVyp9tlFLU6gbH3d0RrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m45rStreA3BMEbrEaNXmbNSk70CgJ5/zopulCgr0x2D+zQXies4X0JZV3lRZgCqGHiO/88fNaR9S7U6UOmBO7UAzPL8OcPjH4LYr3c+0T8mXRGVelqy7hPx8D4+o94pMuNciqQ3AEaVNSF9HKklBKKIZOyxeiLz91SoTz8X75vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/BY3v2B; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/BY3v2B"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso2256157b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 22:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993756; x=1786598556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vOL7cmzT8i6DixZXZmGfCOr4Bi06fOU2/O4s9agm2c=;
        b=A/BY3v2BNkT7CjNNSigde0m9Qo0iL478NLX4rjxr/ARZXRdE07u1lUMI0AP2XFGB7R
         lZaHjQYegPubdgXmssUN6aINxwQNb0qP4nDq+iy78pS2VK5KLEnPdw3H3U8LwyKenpQ5
         jWVaAE4Ew8H+WPaMW3hyWF/l/4Bj8zElIiNGTTXraxbp3/doG8uIdxjywwTy+7z+mDGc
         WKq14dY/VOWrQXDr8rdsbF3RmuHwYfpoiNZ/KhUl5rFzC1+4jhPDJXoVRlKlvKG4W/NK
         vvY0dbziYrNYC6+BL2TLG1+b6Z5ZhcjaMcpk8CNY7bPuwBUWGEBY1a52atXpI7ytv3fZ
         aDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993756; x=1786598556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vOL7cmzT8i6DixZXZmGfCOr4Bi06fOU2/O4s9agm2c=;
        b=aDGWGaideuCxu17+MqZaujm3FUppdGTsBuqQUnppMLMK3J/8gZuy0ZjaixWLz5Atg5
         D2dUr0HIiqNV8NeLmrrqtoxX53hgQWQTLlAtl7dZwz+VTj9nzk/NfllUEPPDYZ2uUQ6a
         Gpjsgynb3ZrlGD89zh/vOIGP9epbjPwby9jSgr6WSDitvzCnU8TLT+XICkMY3HFoVw9e
         zlDErvIEJDB0F3pOkvuH9dlk5TU+TpypDYD02ZzpDTZKuh8zW1Kp3ryR6hpasqFs6Hz8
         As7CLMbxnJrs8+xXVbvaG18hOFnnrY3T0rzet572YA2vYLlPr9EF2MirwKu1kF/7lzfn
         5Gow==
X-Forwarded-Encrypted: i=1; AHgh+RpsyY8UD4J8iIG736mvF/IlZ1t8KnXj+XbWSjAB+rFRDauRysY7sIR8Om/lUEnGsgdPMr+v+F5SwFRKQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmB5Qfp28hCFoI84NNoSJKiZxODHlRRTAZFxuz6If3Gvrdalwe
	KGPiglDjN1waa4o0B+LmVFKdm/pDjnv4GwtDhpeCrwslbXZdeuPWWxIA
X-Gm-Gg: AR+sD12GO+GofZaH089IpZAqdcNeKcfSFhfnknDL3XBAzbyciWDuTrWYdiNOMIpzFCJ
	5bFS7WFy8yXcw3BSihkuyCD0PHp8ybaW57j1SJRUm1hLhcPXzBsBKlyzcHaKxgBNdGTWCeL/gY9
	ls1lzC29oEyJG5/zw5MrHwWQOIOCT3vqWIUocAHmqE3jJP877j7jEpxsnkL9pfCPbDntxrp4dtB
	8BW6b5odZ1Kdn26xSqrwk/99UVjDms1CH2tGx0gRJuCO4wBUuIb3cE+SDYncMvF9dX0Q4qvJKTx
	lOuNr0hB0IdTRFDUNKivz5n7zj/JsGmdSkk0amIHaiN2u7ssV+6hCRdcQKY+3grPktcuwft5RXQ
	jGpkqdBj4xzY9HA4c6a88tay7DU+ezYL1uxIfYpsGJvVHdKkSBeJGPGOwu9FIMP97p+ScC1P9Vr
	aWo2y9qsoJovGVHAVTR1/ChQDVVhq/pGuk1PKCQz/yl5xe7Q/cSsqRV9qipWxIOzFOCRgiNwf4q
	iiXp4yO/wyIyp75nOurv9QBp1EeNy4HYeFToKWxsCHS6YNqjzfI/9xk5fBJ5pMBa6IuQR/rRanK
	78OU
X-Received: by 2002:a05:6a00:2d8b:b0:848:3e74:85eb with SMTP id d2e1a72fcca58-84f2e014749mr13013714b3a.1.1785993755907;
        Wed, 05 Aug 2026 22:22:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:35 -0700 (PDT)
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
Subject: [PATCH 06/14] ASoC: rockchip: i2s-tdm: Inline PTR_ERR() in dev_err_probe()
Date: Thu,  6 Aug 2026 12:21:28 +0700
Message-ID: <20260806052136.21034-7-phucduc.bui@gmail.com>
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

Pass PTR_ERR() directly to dev_err_probe() and avoid assigning it to
the local variable first.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index e6229a325ffe..c9ad769a4072 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1263,16 +1263,14 @@ static int rockchip_i2s_tdm_probe(struct platform_device *pdev)
 	i2s_tdm->tx_reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
 								      "tx-m");
 	if (IS_ERR(i2s_tdm->tx_reset)) {
-		ret = PTR_ERR(i2s_tdm->tx_reset);
-		return dev_err_probe(i2s_tdm->dev, ret,
+		return dev_err_probe(i2s_tdm->dev, PTR_ERR(i2s_tdm->tx_reset),
 				     "Error in tx-m reset control\n");
 	}
 
 	i2s_tdm->rx_reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
 								      "rx-m");
 	if (IS_ERR(i2s_tdm->rx_reset)) {
-		ret = PTR_ERR(i2s_tdm->rx_reset);
-		return dev_err_probe(i2s_tdm->dev, ret,
+		return dev_err_probe(i2s_tdm->dev, PTR_ERR(i2s_tdm->rx_reset),
 				     "Error in rx-m reset control\n");
 	}
 
-- 
2.43.0

