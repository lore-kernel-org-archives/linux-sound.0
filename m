Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177A247D463
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 11:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198207; cv=none; b=ky9JKvbobjBTSLMl73/snJcCmb3pTPdnnkQaKcdGPVg3V1fL4Azj7e4sy5Mq+isqsbyB4CjW8OSE4D92/MYnWQBcFJgtyKT+LI6hzBsac/y8+wyAnv7WtFco4AC0i39L40g11XPi9IOOGfiSg789TU5J6uK1bkMOCakZAV0755I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198207; c=relaxed/simple;
	bh=3XxECfTsUmdCi+zRvqz0zN2fUbeWSo65SVUzmGYUP40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rWY4PBGu/OBoGnPQ9lQV9yP96zQ4HcHWIpU0tRwZc7jOfTMunmBRgpKGSG0Q8ONLkdVzgYpMw5FtQlO4T7WIp1YyZz0FsznTwF5+WV2I9aUIiv9uk7uaMgQJLmd4jVuDBKAVXzuNk6ugJkKwzAXe2V7KCYSCCEQbXPBHS8BmjXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSmQiYkM; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSmQiYkM"
Received: by mail-pz2-f36.google.com with SMTP id d2e1a72fcca58-88a9f57bd42so636341b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 04:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198204; x=1791803004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=;
        b=eSmQiYkMo+knCC8IlNEdFYYV9VqQq7n3NOQJ8yD3dKBg2liTEmzwb+UrrxmED45Gih
         mYrYdcINbpGSsgAuWWVrAZO0n8P6mDLFNrTYPe+XeGuvCXNdFQXJ/VTKahrPb+iVNREI
         S+4G7V8L9r3Mw2g2xJpsKQlEyhWMVdJ0OV+pWtlIyh9QHkeH2fHbIOQ2OXLvxagpbidX
         ZRqUuly4wHh3jZ+J1ojSChuWo2a02o6SdNMQKqHSnLwfslkl8vD29pPXvy3Xxi+/nZ3G
         eoPyiAMAOdaQgW1uSMsmEsble2a0DVzoDBpcjbElFt11efR98adajh1M6XTEcNfHISY6
         HqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198204; x=1791803004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=;
        b=nIHMVhL1lDBvh10WhT13kGzvKGtK18Yx+qYSvTfPQFpxtnGQHd40XguzMfc75+8j84
         +NVN/YPnWqDVOiwYYJ9diNJXGHX4p41LK3ZQhwnAxHOw+Ef6Es4iZpA85hI8KKhc1EaM
         QQ0WwMHMmuwonqoqST06M3DfqJM4HyG+WesMF+E00ZV4dO//4p4jJcngkHkLJ/ApcxA3
         FFZJbsOre84TE4IWlBEYGvozG9+VxZ1z2bMSYyaTqv8pbdZ02shP2lRF2e2iNGON5oEM
         CoEeKANCSunaTx8Iuc53C18ebkjgGOeYh/aw3KIVEX8v83eIe4IyBdlfzVfbuBzIDx8j
         fvGw==
X-Forwarded-Encrypted: i=1; AKwUvBxLo3lPTvLRQxg4TZrwYwvNsEKfjnNUlDP6stYK1hVFtsTwnzgNrlLeody7c8iimhxIFDi8bwFzIKGkCw==@vger.kernel.org
X-Gm-Message-State: AFuF++mTjfFQ3RQGWuuaS5YZYiQ/WJZTXanvuqDfuITUAnTdkGUxmDmm
	C+7AeSCdJXqd3vCs46j0J7SfStDH0M4pB2Wz0LH/9JwXRwWGB1itrS2N
X-Gm-Gg: AYBFou1LPuGIgrTnkl1pWttumxaDSaaPUEXh6Vn9OScmjpmggaXe5AftlLiBtTDvj68
	5nfRF0z5m+0Dt3c1uocEvRqh27/xmHN2gV13XB6LC6l/7UbdDx3lDv8Pu4ceupBPBDJFMEjuGa7
	aIXRfSnkeIBAZU8fOvSXlWfh3Y2ivUJi4SpLCSa6AxbSz7eSACRyW8nWG25JK8dh0l2HMbjjJD6
	+OXpPTneMeJOnxQOgUAcEYimVffB7wKbJbCewMr8FYq7uLenosBxNoyU+oMkDMytHj47lFCZceN
	5EGNTqG1eXCXL09AogK0X7edBfIcoO0yjQAFYLyfQYHQVfV/iITzynfvZXSNaS6UMkxPcjCy/ca
	QPtuNq+/KC4QJI+xtC5/CeRf0i7Xmu2vl8sNDVDLgVZTA6ClDf5nyeF8LIBKF9LI2SyRX60yWjg
	4D2WmSXzMgHkpmHXP/oIBtiipxfpP0T2NRJFDQUY63qhZux/JCOx2oyBzcNqkNcjWJLc/b4goi0
	UaHykD0NMAyytw2M2wbqFWwX90RGG6zE49SDvL9vNDpGPTNWvPnqwIp9yy9fDAQrRx0BbW/ejdH
	2f7QUEG+taydtA==
X-Received: by 2002:a05:6a20:9c95:b0:3e0:da23:8746 with SMTP id adf61e73a8af0-3e0da2392f7mr6761110637.18.1791198204336;
        Mon, 05 Oct 2026 04:03:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 02/14] ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
Date: Mon,  5 Oct 2026 18:02:45 +0700
Message-ID: <20261005110257.50145-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
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
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index ec1ea5b988ff..12d8159338be 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -397,12 +397,9 @@ int mt8195_afe_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8195_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_dbg(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	/* initial tuner */
-- 
2.43.0

