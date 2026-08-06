Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D403F38A711
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 05:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993753; cv=none; b=iyf//SJt5CFuPYsstSTeKAE2RMaLdBqb26rN85ENBYGeRCeWC3J1DGzGgf9XkmAHouoMqbKhYJtKv3Ut4RSoi5z4T5uaTq10DD0cZ3URtl+qsgFo1koTAkkQ0ivbD7Ja2T6oz/tnZzmiPNsQAS5rITYrG/BNHCYuabFFCb9S7Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993753; c=relaxed/simple;
	bh=fGO9oOIoR8JXXEZxk5RW9dNEvSflPgscDS+z7rGXpnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GNmzbJg0yvMOakiCir+HENdSqNFK58Khf2Q7iFBF/UU8oKTunC4rCjUU+NmpTQed15mi0NMu7Z4gS9tE0nlYbvt9NRyj/Ry/2lWA7cCpfrATBJgkAG+sXEqf2T/PQrc/m2SFjyPPm2oN/zHyCZ0GblssUvJwYXDiQpVxw3OrzJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DacBQmGB; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DacBQmGB"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84874b52eabso2563280b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 22:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993751; x=1786598551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYDtAASES468elSTBLIDdmGvVbZC7pKU/2qFW6TvMTI=;
        b=DacBQmGBPHbuZ7Mlyuilw6k5H1qfcJ46qxS4VrlgEWBtY+vjQ3O1ueLzfgvBaltmem
         K9hisggx2hhfjIlLa0FMoKo6VjNu0LlRYxgUgkXSHvqcs0SrKrd9naNRTWR2eLP7mtRC
         GDDP/8+caetM/nQxKHYS5QRu+37wYXZr2T2Q1K2yx3Dz2KjfoN9I4/p6aM9n6FPQteh2
         gB9GFjRdssbFenIaUiHWBhhERIa2Z4F3xr6TFSOvdMFgfkU75hyWx06D7OWANN5m5jNT
         gn6ocp9hcFzYRaCfG21Tdw+Lsb4BZPRrEVjcae0guudk4oBjJpchhA3WsQ6SAXBCEj8z
         aSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993751; x=1786598551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SYDtAASES468elSTBLIDdmGvVbZC7pKU/2qFW6TvMTI=;
        b=MwJFaixZUaLqV3D/x0SUmBKw5AtkRSnsx9clDqzefIRVqdolUkaFJKKXnmU9gIlY5m
         LHXd+JqBlOP8HPUODYCu8fPAYVOTWD2tU+BHI+n26mQZAfoEYhzRwbdZuhJn+koCvImb
         97ifEanq1d0oPxMD2oCUOYq34M2aZsLeGyxp1JDWDv2E9ads/+B2oo40Z3U5ilM04jtm
         TWYDMhiUqPaQTHMSta8/FfbzZQLt6gTxvsRrauB+0XUfGhDz+9Utjgwe0n2WiKcHy15O
         6hakqfnSwyQM3vnmUmTin0K/XrrLVni6aTcCQeZFztuL0McLA8k5WbP1VQ9STTDMn2+u
         OvCg==
X-Forwarded-Encrypted: i=1; AHgh+RpF+N/C3eDgrzyCH8iFEQqmJlMxoTEbNNaKMK/pOGoUaeTlJJ85sl6EAtx316OwzQmXIjTFpLxv7h7mpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd8dfcLvbgnnm7LYzVx9DMusuX8J/BNJ1WxfRE9pQnXzDnD85h
	fRrHEZ/GKG4a380If/ThldsUdfeTIPjAUOvMYqGSloY03DSTPdHfSSBJ
X-Gm-Gg: AR+sD13lakpMk89SR+omPX5Z7u6DEBSEYziFhqOAze2Ck3gqnabm1X4ND9/OKhb5TIu
	PSEMc7TiZenFH4SHfDx1SQqKQ9RUFVuWxS+NV4zqyffylR026L2JZ950a1fwur23bak32uEcmwk
	L9GoFkxrVLWhG4Dyd85lju2DHxHAffXJPFsttgxDgopMvGhXAEvtgYGwyYwqEfGsWFgo9pjMVzk
	bnY7Mdd5RKF6Cy8SaECJtgSdYa9oqc4crBSKFDCzoVSK/QBUmU2Q3LiURpvNKi98Ufc9VEZU4sX
	kXq/DIx2malJakUu3680zpqUh0pdndYHM8ys5TLAbKI/x2c5O8BDDwlAyrE0UWAbxHawHkaw4YV
	fDEOxveKWbui4KXWrGo3d/7nQ3qQAf+RbxK+zx+Zr4QqNS/vFpHkx/got/BKCET9DdJyc76y3bD
	p8aOR+eThBICeTJjrqZxNJaTBOZz1j6MDOXnyPBI0SVsgcJQE8ZqfwVUNyphLE2a067/OKlcBnX
	lYWQxAgl50MgpeKVB7n3nyx0Oo3stRaKdH6x0M1TzXgeYtmeHOEFQKsjcMmeVPeHa3Uz31Jm4RQ
	830c
X-Received: by 2002:a05:6a00:4650:b0:848:2c2e:c7a3 with SMTP id d2e1a72fcca58-84f2dfd6b8emr12646865b3a.16.1785993751213;
        Wed, 05 Aug 2026 22:22:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:30 -0700 (PDT)
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
Subject: [PATCH 05/14] ASoC: rockchip: rockchip_i2s: Propagate -EPROBE_DEFER from devm_pinctrl_get()
Date: Thu,  6 Aug 2026 12:21:27 +0700
Message-ID: <20260806052136.21034-6-phucduc.bui@gmail.com>
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

Return -EPROBE_DEFER from devm_pinctrl_get() instead of ignoring it and
continuing probe. This allows the driver to be reprobed once the
pinctrl provider becomes available.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 354430f916f9..261f36d4c2fd 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -790,7 +790,11 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 
 	i2s->bclk_ratio = 64;
 	i2s->pinctrl = devm_pinctrl_get(&pdev->dev);
-	if (!IS_ERR(i2s->pinctrl)) {
+	if (IS_ERR(i2s->pinctrl)) {
+		if (PTR_ERR(i2s->pinctrl) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		dev_dbg(&pdev->dev, "failed to find i2s pinctrl\n");
+	} else {
 		i2s->bclk_on = pinctrl_lookup_state(i2s->pinctrl, "bclk_on");
 		if (!IS_ERR_OR_NULL(i2s->bclk_on)) {
 			i2s->bclk_off = pinctrl_lookup_state(i2s->pinctrl, "bclk_off");
@@ -799,8 +803,6 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 				return -EINVAL;
 			}
 		}
-	} else {
-		dev_dbg(&pdev->dev, "failed to find i2s pinctrl\n");
 	}
 
 	i2s_pinctrl_select_bclk_off(i2s);
-- 
2.43.0

