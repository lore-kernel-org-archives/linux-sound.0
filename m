Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4733CB571
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 07:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370996; cv=none; b=dt7pDQDHqujXBTiEnh4C3gh6wQJw1WqAV3e6sExoWEbI9Tw9C5jpKVyJS2Ht9zmQY2a7awDpH57KpQMbEqGDyXpezZVqNwsA/AF6KdCt71vrfH8+Gki+06YXeG8bUOamiE3XgrC3BpbBeteBU9piVjMkEpSneq/FJEhN3WeMDi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370996; c=relaxed/simple;
	bh=HNQ3yAaTj8Lox9L4v2OsrFX6RIoSfJ6hArRWObXN3VU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ha/lojyw9amqnbjwsok/YfjZ14WcwHnwkIdF3YfosNeGNltYL/Tq+B5XRxYMphPZoTrVYavdKSx0GQw/xdtGGN7fIDYqHXrEZV/0YXtcrZfQXug7SbtIcTGJIC/jSfiOZ1ffXPKIDeIbzu+zsA689/n36D3cHfpMK/StNE0bAmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYfsZik/; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYfsZik/"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso3235727a91.3
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 00:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370995; x=1789975795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DlX7uEp+xJt+DRWD58MvDXb25/Cat7Ywclf9fNm7ioc=;
        b=lYfsZik/twvSM+UqaiMIjAwr1/XNFn0i3kN/SlgWyse7tgP7VHMBXaogaFrEDWLPFD
         R8Dy8jj0BbC3s5++wkvab2bE4DfdkMu/wn97ivBH/Ovxg8a0kWIYWebmG9mp2U/jm44N
         1wussQPKOClO9yPEJlBUkv5/Rnk3WwSeKMotQ6FVNm0VBuna73i9ggJOx7C2JuMUF5V0
         YGN2Zs1NBebCsz0jZ0JNBJsWdAWSvsIu6k7X4gkcqCmUpIypjrz5xW5rLN+IDZXQKFD0
         eQJXuL5FwxizT7s93O0M7yZr5ZcXvGpLXQJpWRCIHRB/di/ZSqfsZXh+4Y48kX8Uy/ge
         1S7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370995; x=1789975795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DlX7uEp+xJt+DRWD58MvDXb25/Cat7Ywclf9fNm7ioc=;
        b=d3gk4T3jJd1ZfXW3ihJ0wmM4cElMG8MwaFGDQHO4qg+33ngHDsgn67ZvY0soVgC2d7
         kLgzSJg+xTgI9HLPR2B+o1HjNcPsu+3IHHCUbB1wm0cP0XFaAkO2A420zIsC+W0tTa/Y
         TFNsN/2kNyurxzZYIy/ScP9fBDb/13XcU641go7UPO8SIis0U0T7yYG+RUE9jOQHku8I
         Or7UoCxEDjWpUnpY9h/YXKF88thVY+IW/Yc8sa/9Av/96kh3REAiPJVqwdI5nBpo16kR
         3Elz99uVwE78csZn2s5/cvLImCZSa9kRd7hY2916bkT0KVqigxfX9APDvP9JI3e+PTf3
         rSPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuJW/rkfzVxWi//QVLqIqVxhELaj9FjulnbWH3F30p0JG8S+B8n9r+z8nNwZwF3FgbGh2btoZC3XguvA==@vger.kernel.org
X-Gm-Message-State: AFuF++l57gnUpu2vGBuifwgM/n/goyz4Kw9Bp9BnxqaOuEH4osZ0FJC4
	sp1SA/U+qZyfKHgYtaR984L9FJZ7yPl0/s6Q+9r2OGmKgDLsfF/OS/aU
X-Gm-Gg: AYBFou3sJ6+yQhoPfxNYHrrF8z0uo/W3IZYcmdbfXDjLSws3FELaA2nDBR3OUw0m+fD
	f6v+JW3jXYLCTQzr1rAUdml/YTTr5QsGTKbgNU2P8cTx1M+IGtgPLqyyXwByI3Vg3SHzStOHrHC
	E16JqW9WrgcPEAbo3blwGMfAmOO/Bf6W6owubx2dv6kUtw1LszZ9pfAJp/7+tAcDX5wzHD2cmuE
	+pgtb9D6w+9V1e3O7AeOABw5o/5PCnoQ+M4Xwj12/ynRmuCVQ0rMMTRxWMWiP2f+RsPFo5YGa/i
	27Vw0X+Ckw+JUIjo+zDPd58q2VfHwj3v+TuQ7iYZdxcgfn4+Ud3bqQRq617pXt46IRMDsswQTmy
	XMPBnPgO0WVeP9Syoq+COfBIKamUXFD2lB6Tb9LR+Z7o1rYLvdI7jfuzOjii3/fXZ+aHh50E5y9
	GfdAg7PFPGhExSaH99kweC6HLWub230vKTOhdBC9qzslJ5ryT3U6sx2vXeM9wFY4apOARDqyVaE
	vkbD+xhDxNQmlpiJqTXZnMO9vWSjuL37gPrVaIR6OGDHfOmAAF2lDRT9MnYCVEAmFRGuCwP/mo9
	LsDFupBg00sDIdbBR7v/r6EjcA==
X-Received: by 2002:a17:90b:3884:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39debf6ce65mr3151063a91.2.1789370994682;
        Mon, 14 Sep 2026 00:29:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 13/13] ASoC: mediatek: mt8189: Validate TDM MCLK frequency
Date: Mon, 14 Sep 2026 14:28:42 +0700
Message-ID: <20260914072842.24420-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_dai_tdm_cal_mclk() accepts zero or negative frequencies.
Reject invalid frequencies before configuring the TDM clock.

Fixes: 9f202872ba04 ("ASoC: mediatek: mt8189: support TDM in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
index 1b51027c6cf4..7748b4ff2c72 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
@@ -381,6 +381,9 @@ static int mtk_dai_tdm_cal_mclk(struct mtk_base_afe *afe,
 	int apll;
 	int apll_rate;
 
+	if (freq <= 0)
+		return -EINVAL;
+
 	apll = mt8189_get_apll_by_rate(afe, freq);
 	apll_rate = mt8189_get_apll_rate(afe, apll);
 
-- 
2.43.0

