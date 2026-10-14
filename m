Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB064F96CA
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 11:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977324; cv=none; b=fvzmwOIdIQe5RGSrbPln/DsY2nShJ4fUIbJKJTgBRmjwdIBeVE9ehrbinWX7KDvJeXA/f7QgxcULoIGWaNH7jNf6YFpnNn8VKllU7Kf2DeenfViKj0VXqHVPGQXu2yTMsBhXCypU6PI2t3xJM4LHYW6atNJevwIPBpAuXTPDiGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977324; c=relaxed/simple;
	bh=Gg1SmDyIDdXFHoruXACEe1ng9Sx+qLnb9TTfn6qi3u4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DH93CN0E2o8NZa+lV6cMBtSN2bbNZDwSqolB6xHRvU/V93OCf5+xyU7YNs7FTbi90aVYfd6yRh3PYZwmOrFsuNspOcsoevc7nMbRVfDJGY4kL17BF3K9UWVgBwua36XEIPY54JQ9Ppn8EAqBq1BmyYtGc2ZCZVUJZ1W7GzmXHqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FEZd75jh; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEZd75jh"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so2049893a91.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 04:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977322; x=1792582122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMj5RS0n6pbkUqFdhGQRRbzMFnFW3w2l71as0HdhRY8=;
        b=FEZd75jhuqPlEbgECIzM+LViOGkdQsohRgi/5C/u3uJvl9Ltlsc+OvDoJEgKTiknhJ
         eOGaW76aA1splrUViPkATc63jVviR+9vQENWjQO7YvV1KuaaObvaRdzj6zeECSusez3a
         etO3wRBxveMdjwDhGuNdF7E6jBFS5D0uJPw8yZhjAD7UcbXHjtf0+8o1aLjMsT0/FIkt
         w91+9useDoCGV6iW8T6Q02PVYKkjlfOrcPHskS1jWcbsMXeJvaxveIhZassPq0yrvXHc
         ljWdoWlX4FjIK9srDNzAAFRmI9MEkJ5b7FeVPQDGbZpVd06GokZONE0fNioHnYcAp4GG
         v5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977322; x=1792582122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SMj5RS0n6pbkUqFdhGQRRbzMFnFW3w2l71as0HdhRY8=;
        b=eyOmeQHM7YN0kY1/T1r+1zJWUOa/TlD36qQ432mWur2Gk4g7+eE13ECNlVpcjvJpGJ
         oGp/yLERl4y/GVA4AyS1JAUraJfVUq5vSp5G4haKpCqQ0Bme8MtmijRK4BRW60fSrj3p
         XCxNIeibv9rDTh9+vfJYJ2tfpbnqbW1Sh0GOYYS6I8L1FwGUU7m9XykkGHsE2xbcaMiF
         K0blL74bwkQlqwdRbW24MPg6g7dkjJmPFyxbUIoTuMu6JG9yD9qaeGs1mTjkJpevDz/r
         5IzmUgqU2Hm0XZQcS4bjP3NBy3IZFiNxkvaE+aDcjai24UdJXHlLto5Q21dgX4VOz07q
         Yg6w==
X-Forwarded-Encrypted: i=1; AKwUvBwKpfV8wKOZzaYy1CQQ33Y+OZNJrF5wfgcfNG4VhzFM+XCZpN7eNkcW17tVc04M+eOOWnTx5SDw9mejmA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4ptM0XEPWZ3JsT1iHm/KyVq3islBn1OX+mwNNy48wnr2Ho3zE
	93tJlHT2wIy59TVAi78PkLbEUingF4yM4wUCJ6/xhQYh0dZv7PzU47uf
X-Gm-Gg: AYBFou3JmVELe7t/E1uxCTriyAZZ6+myVILJALyjQqg0fFoPqy32Bk4VMYLOjnVreAP
	0euoIpPi8oC2FtMYSIGOBoOfmKPdi5xTjSUyd3w5+chTSIByYsIfiLLT0LquYVJavBIINuFGjFe
	BRSNaQDHcyn/A0UEpXCNEaIPqb36/1BZPqKls7lQ2CoiwTqeMUawEDDaWXRNu5UvvCkhPPOK1uP
	clZIW3NMYrFx3ue+iI/dBxyaXeBIg+wGNFeQZkF2SiGp9Br13SlUJC32uVBekVFpif1LvOlqE99
	5vaQ4ODJY0mvem5YvDvYS5M6upx2K0z61qwqy8A7vtFRcXL0Z0yO9f2DXEw/8GPoZoVaj1rEkKm
	zCVkaUERgOob51aDXENsvlU0HbkOl9WmjdVfIQyzgKNTTetuo8E85vWOLOb9vmZkAG68qKv9Aev
	P5UuGQTdtRbG9Bw83ZaQbshFd8XOYXitwDtMTcM9Kei7nExfGwEDjZC8/6DNK/HZucaGIRgFqpU
	4vC+D/yzWj6qMEF5JMeEA3blTSizyDKaJS0CtLjDzDbnzg6PpxTN+lbMhP0rjlMwDGMaLvCK+58
	AH2T5c8gHD1Mdw==
X-Received: by 2002:a17:90b:4d88:b0:3aa:6b5d:9fe4 with SMTP id 98e67ed59e1d1-3ab3a952849mr13118979a91.12.1791977321825;
        Wed, 14 Oct 2026 04:28:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:41 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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
Subject: [PATCH v3 05/16] ASoC: mediatek: mt8195: Fix main clock error handling
Date: Wed, 14 Oct 2026 18:27:40 +0700
Message-ID: <20261014112752.683032-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check the return values of clock enable functions and propagate
errors to the caller.

Disable previously enabled clocks on failure to match the
main clock disable sequence.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 23 +++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 03d2c4fd1f85..44cddc2b1564 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -716,14 +716,31 @@ static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
 
 int mt8195_afe_enable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8195_afe_enable_timing_sys(afe);
+	int ret;
+
+	ret = mt8195_afe_enable_timing_sys(afe);
+	if (ret)
+		return ret;
 
 	mt8195_afe_enable_afe_on(afe);
 
-	mt8195_afe_enable_apll_tuner(afe, MT8195_AUD_PLL1);
-	mt8195_afe_enable_apll_tuner(afe, MT8195_AUD_PLL2);
+	ret = mt8195_afe_enable_apll_tuner(afe, MT8195_AUD_PLL1);
+	if (ret)
+		goto err_disable_afe_on;
+
+	ret = mt8195_afe_enable_apll_tuner(afe, MT8195_AUD_PLL2);
+	if (ret)
+		goto err_disable_apll1_tuner;
 
 	return 0;
+
+err_disable_apll1_tuner:
+	mt8195_afe_disable_apll_tuner(afe, MT8195_AUD_PLL1);
+err_disable_afe_on:
+	mt8195_afe_disable_afe_on(afe);
+	mt8195_afe_disable_timing_sys(afe);
+
+	return ret;
 }
 
 int mt8195_afe_disable_main_clock(struct mtk_base_afe *afe)
-- 
2.43.0

