Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DBD3C583B
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 04:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311815; cv=none; b=YSh3cP7JVDfldr06HM16N5j/QA4RpwEARXaHXcA6Qdr1FSl9Kmbe++RCj/xwMN15L5vUYB4Yz3r7C5imCv1lFk+FrDhx//NU+xecqWNCBtbyARW+dWq6j2mFG6+llNiEz288yPGnUofxNMWZ6z6vqNbUQCeF3yMH9od3pKI/ZMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311815; c=relaxed/simple;
	bh=YUm+x0nzeJJbL9Rv9wE9lDbjGN/o/ElldmkNERhZ0M8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=psQJymFaWGIUkCTzei29WFpEI72QvR5LRGMEon8W8klaUHN5434fKXqEkbVwPSvlSNIkMFBBYgHrWy4qLU8X0rEmjDo2ST6Rbm2y9EPfth3MFPGvdm98UciYoCuOtbEd0wOVXNC7+05aTSbsSnN7tu6K8Nu2jNOKfrrEFBKWCrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pFd++4if; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pFd++4if"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso312901a91.2
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 21:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311812; x=1790916612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKjDwPOE3diTKoGaWJLuVQ3uglSGi8QtTacAmTtKLmA=;
        b=pFd++4if9P+dEUPKwwOrSpLkRT3UkZwNSo6Ly3lSXmYdaD1yARG+pptNbQe7fMa03X
         TbuYgsJD1HpC77SdlYYI/tMyisZ4UCcCHby2NTtCFrNNl2uqzPBbEjSnuHPOwVB6jFRR
         iQdEtcG25oXGp9vRBk4lbwVe1zrwGt/8s5/hoKcphW4HGBfMbqr0QDNJ3ALCY2F26Jv0
         YoONOZsHPp2ZxN1lZneY8JAlKrNaeRIsYDTMkYkZVIWh7Xl2qB/3VlDjYsReGMQbJ61E
         ofnudTQ7FhUZKx6g400td8ziUTqNzJ8e0BbzJ0K+JDX1+yaQ5KXtN1kVfsok+WRKbt61
         EbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311812; x=1790916612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GKjDwPOE3diTKoGaWJLuVQ3uglSGi8QtTacAmTtKLmA=;
        b=NJVAre0lrAZlXMuGupUY0CfdcXpAQVQfYYLyRGt0QjPaLWjErMWtbtnnFCzQdErxU5
         C3j33sXpem6uNIZIQ0B9LIvbtTK/1qt/8MjZ6yXbZkLpZUfq72uVL+oXxwG12Nwi8F4d
         R1wHyEgMmjiSUgf0DFqlSZ35x2X6d4ShdIgF9pxMMJVFUsyY1nj5R2qfioOwl7NMNWP+
         Auo9NqZJy9/T0Yp58QR86SOGrRisv2mTQhRddW2pM293Fe1UG4kxD2vq6uedllbIl7AD
         TtwV69ChZgDiTHiVFMr9QWvnMJJ1vbjIiY9SNLOaCxJdxw3HWpz/k4ROM45qDxfDyraE
         HYzg==
X-Forwarded-Encrypted: i=1; AKwUvBw+YGRB1wSNq+tmag0a9gz+ILz3Gp5Fc7LGL/fkJF15t92Px8S1CGt6RUDLwUfpfsJkvCY3dXULQ53q9Q==@vger.kernel.org
X-Gm-Message-State: AFuF++leyt6i0SAQU/x7qMFn4hVPReFC3QAuOpK4iFTCvjMhdu8ccgbj
	R+JqOLFym//Lx7hyBbYtKSGhb6AJdJy7GpghLXTsTr/X8ZYWWzm87uF3
X-Gm-Gg: AYBFou2p1VZj05aIvb2KDNOVT1+cAbSGazgQdGeKqtjRtJ547XlGN0QXfIAygq1N0Nm
	hy++9v7HGKhACk23Cjqm6ZVAEa2KQMd9J/ATUqw05A+cjagxBf4f6E7v0b4CziGhwe6YHcr9NDd
	IQVtkIaO0JyhvEXGSV+MrdtxwrHuzNqnNlfulFJtKJzs3EVGyS2aZ/35xT/VB7/Fw5xSVjScyD6
	NiYBzWnq1b8YLPc4ci09GpbN6hbEeSsWUWqkCEMCJ/yHfiSeqg/OwKzMY0+14Ri6eRaWpVeTZ3Q
	V7PFGMAf5tZCDVaajH/UaG17/vHYZye1vNRqAWmgl0y3cI7DO5yUJXd1ZsTWxncAhsMGyBYykgH
	oRFgJxNCflIhpKZNyCri1yINPx37NLnxTZUh9UYOyR2/bkD1s0LxfkyS+z4KXAqfCQR7EF0qMYB
	buWpUKXetN9HZaPjqMKbDzVV9H0qzBMk5XQqypbPRsPCmkEX6RlAOidkz+IEO0EyqMkLD3Ucj09
	9cYdxIfry5cX0y1O73KQif4ogvfy5r1TnoTcCkVeM9HcvWxPBO5pfyYlxmdleAoQc2aGUcT//XG
	uPEYr+zOC5bRIg==
X-Received: by 2002:a17:90b:5404:b0:39e:3713:c2e4 with SMTP id 98e67ed59e1d1-3a098ad3c2emr3883170a91.14.1790311811708;
        Thu, 24 Sep 2026 21:50:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:11 -0700 (PDT)
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
Subject: [PATCH 04/14] ASoC: mediatek: mt8195: Fix timing system clock error handling
Date: Fri, 25 Sep 2026 11:48:58 +0700
Message-ID: <20260925044908.450775-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check the return value of mt8195_afe_enable_clk() when enabling the
timing system clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller. In
mt8195_afe_enable_main_clock(), return the error instead of continuing
with AFE clock enable.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 34c828fdea29..ef7a62fba6ec 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -662,7 +662,7 @@ static int mt8195_afe_disable_afe_on(struct mtk_base_afe *afe)
 static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_AUD_A1SYS,
 		MT8195_CLK_AUD_A2SYS,
@@ -673,13 +673,22 @@ static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 		MT8195_TOP_CG_26M_TIMING,
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(cg_array); i++)
 		mt8195_afe_enable_top_cg(afe, cg_array[i]);
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
@@ -707,7 +716,11 @@ static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
 
 int mt8195_afe_enable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8195_afe_enable_timing_sys(afe);
+	int ret;
+
+	ret = mt8195_afe_enable_timing_sys(afe);
+	if (ret)
+		return ret;
 
 	mt8195_afe_enable_afe_on(afe);
 
-- 
2.43.0

