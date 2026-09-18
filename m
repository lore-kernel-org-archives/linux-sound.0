Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D31513575
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738823; cv=none; b=nRM1zHNj0U/dXqNthqMiGJgkM//rk2sxM6u0v7UXXWHnYWgv1bQtUcpljwKw1ZWS/NsuT6+ozxbifkCHyq7LG91o/NnBBeNqwKIfL1DSRtBCM3av9SUfQBBlR0qgzwYsR/Q9eXhDCRIU+JUQbQwOdn71qLtUWYaNcebnx1D8RcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738823; c=relaxed/simple;
	bh=Qitf22YVUG4a6YGRxlpw/22OK6F5q8rrk5pZg2Nyz2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sR+ENI/W5KM2tVz0ZZ8GahL9zM1gMW/b8TpdkxgS1tEfSwx67zpZ452Y0P/xaYRDl0C2xdWxRIFSjIvS6NX+X4pujiZJI2/gt5EEVA0GfEyPTj3iYeZzZaSW2mVEqzEZmaOLUzfyFhhwBUdZ0kDYWIf6qQy+Hv30a9D/SErp9pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIbSqY3l; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIbSqY3l"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso553933a91.2
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 06:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738821; x=1790343621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDhRsljiXwH4R/2v4DqxrYu1sHb7R4NiCX/UTlOHxi0=;
        b=GIbSqY3lrmXgRoYuGGGFoAgTL8KdZvizcEN69GBeV7iMMxezR7hzui1OKdqOQZ1KkM
         ALrzjPDbRfjqcqcBtuu1QcDdmVwiXyh++WTaxjFiSy362BEs5cCdO7Kx8FKjYW+8lxws
         rKeNHjFVrOgoAtpSQ0plwkdmR9uOu5pSPFGjCUtMfUm6AGr5pbjwppticNF1zMaLpF/8
         EqGo32lzpyTkI9QLI2h75zECSkxMRxcB7oWU50lFaSwR4BEZI+D1AIBXgTZKe4i268R5
         PIep+x/5PmwN2E1SP3/zuVRO8IiiGmiXtfiKr8TcYRCPYD6W1TcZy2h6aGNDn9YXJHJj
         /R1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738821; x=1790343621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GDhRsljiXwH4R/2v4DqxrYu1sHb7R4NiCX/UTlOHxi0=;
        b=YO2/qzfG9HubiNTn+8jZLKzZrQxM57jlLXTkBKDrv8DT1iYKx1KtgB9+n5h74JOdcW
         4G216abDO+eiOpA9+raOxpSiwWODGs1vpWRRtmNwCQaf/VgpOFq1AAKxOMxK8lj7tplc
         tTckyjI7F3Ja6a8x/jPdr4/psNQubClz0mxqFGpN+hfs6YZPXr45UtOuNyI4MVEb7k2U
         MHt3J2K62M9+U7giVkqrCXE0IMsRy+0lZPimC9Ya+lTUgyIsc0KJWqHP1LS8ETKOgTEE
         D9yIIehck8BPuGfdI45lq+J8Qyfx6LX7MvmyywyZCgscN5KdP6BJSzVKI3JRrpLfFuJm
         Lcug==
X-Forwarded-Encrypted: i=1; AKwUvBxccM5xC6a2ags3tlR/WiA5925eNFXih//Jz9PqscFqcyYra+KcjlC+/I6hg1Dv9h+0tv3ThzzUNwYV3g==@vger.kernel.org
X-Gm-Message-State: AFuF++k4Y9g2NsOIn2mi+qMmVNi9CZYdmas93ONTvAO9XjKCcT81TRSX
	bZyBWRCrM9W7tACuU5epjB/DIjeO/esNHQvOKuUpaAyQE15vv8Y3Hpdg
X-Gm-Gg: AYBFou3qNe3Z5TLuBi0lxA9Q0/HmBOnCLlGeRe/Vz2TtT/cQ7XnqIAVjLYbw5haI2wv
	NsArbzBq78b9QEBBUoIxCVJ7Ok63xv13wtR0xcNZ5xXD0TE1M4jt84PhSti+WHhhFVjbSwpVu0P
	vLrfQ1lQ0/t1uFbiMd32//7XbxGqukt+XBb+287BFpn/a4y42BCoV19sZC2bjx/A6aKMo68zNtx
	+qPRzKeB5foQPtrB8CpP2yvW7oCYJYgNcaRGFMaGkVOnqHeCkHKuYPcsCgqAqJHdfCKzJw+KbmJ
	WagJNlXyrtJ1IMAU+33rHLWWDqGwbh1rURJoDa3VgCKE8zVBmmmXLWJNidFx9oHVDPbuXtNhsf5
	PvFAB++tdzJyveKRf1idAONoHPZF+6z7Njeuy60tqim1PZ4+B7yT9IyRMesFoAtcnffFXYGMlEY
	CJrAGVvVChdKL4Gf7E2EYt34cHalWFcxRyTqmkxqHeZy7+GJIRtqRt8/g7RXZnFk+K4x2L6ydmk
	aZwhSaH9MRxN2TB4Ka1vqm8ddB5z8NV8bv0xJpoI+bNl5Lqi2NvEAZM20Nd45wYQ6nwGj+b34zt
	Wwkzg1XNXZoRzg==
X-Received: by 2002:a17:90b:3b85:b0:39e:4c7f:7305 with SMTP id 98e67ed59e1d1-39e5504d3d9mr5689902a91.28.1789738820802;
        Fri, 18 Sep 2026 06:40:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 08/15] ASoC: mediatek: mt8192: Use dev_err_probe() for devm_pinctrl_get()
Date: Fri, 18 Sep 2026 20:39:04 +0700
Message-ID: <20260918133912.133799-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index ed6dfdf2589b..d4218f9708f7 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -132,12 +132,8 @@ int mt8192_afe_gpio_init(struct device *dev)
 	int i, ret;
 
 	aud_pinctrl = devm_pinctrl_get(dev);
-	if (IS_ERR(aud_pinctrl)) {
-		ret = PTR_ERR(aud_pinctrl);
-		dev_err(dev, "%s(), ret %d, cannot get aud_pinctrl!\n",
-			__func__, ret);
-		return ret;
-	}
+	if (IS_ERR(aud_pinctrl))
+		return dev_err_probe(dev, PTR_ERR(aud_pinctrl), "cannot get aud_pinctrl!\n");
 
 	for (i = 0; i < ARRAY_SIZE(aud_gpios); i++) {
 		aud_gpios[i].gpioctrl = pinctrl_lookup_state(aud_pinctrl,
-- 
2.43.0

