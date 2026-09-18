Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7677650C2BE
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738803; cv=none; b=lQahi4+6wZ7AN7JzRsg3bAsrq8WuuoH3n3WYLbhzEUcQsSXu2RBtTXFMHNAij5tcdZahosb6o7PQmdv5l4TOQu7yNXAWTOmWzN4b6+aHuBOG0B+4AgyTj/T7aVL4Y+HgacDvbeDaXN4C7wr8VGbC19BO13/mt7wolLjL/iaKb3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738803; c=relaxed/simple;
	bh=2UqdzWR6fEALGaK8OyI99ixBfI+hStTDFHDHENoig7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUIZh0imgS/nURQliysZRB0KB/XGE/P65fjTE/Nibex05TxiLRrCD/yO6ZAur+QtyI1CGsEprVvfV44dTr5MgMqqcJqCQovLltPfWDy6LXgtfAh1jj1IUDdeNmvsNhzVacGfSegH3xKJj5KFA70YOYdxyXeNT27lkJfhWeGuHUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQi2m5eK; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQi2m5eK"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso766147a91.2
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 06:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738801; x=1790343601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yFohzMwFY5CpqXlk4lNOz4TrcxA63Dsw69mVQSK8Sk=;
        b=fQi2m5eKYEgac20JBzaubLzlWYeWt1ikmhRCvCjAR9+YXnSqsCKnpziJha2mxeQfuq
         GCDal9KuR7AHj7uXMj0Fy4Bb+4YT9NxgaXsP6K0Rne4VH60AP5FtTAwF1dsVkruc22TH
         VNp+NPHhby5AwMJai8ji5FWaDUDM9+nEr36QQ9IJunZY3hR7uIzkzYiWWBITYk4IYf1h
         9LJWSg1dJG7ySIt+1IHTfbxZMWnE+B6dQYg5x8PYzgpude/p6I4nQH/DDCQ+Wf1bhiXp
         MAI8Z9aawgzaTcWlWFG/ZDvMMT5wkm3CtO/TjpiGj+x8ZwkQ1zqTSKvf10hSrva+Ep3j
         N+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738801; x=1790343601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0yFohzMwFY5CpqXlk4lNOz4TrcxA63Dsw69mVQSK8Sk=;
        b=eFDXa3Kfo8yeSx7N8PesAVH1Z/mKyP3uSklLrwhOaViYSCva85lU9W7z42vZD74NsR
         Nc09RINhAZAxU8XOSoUMT3xpt850FoJ4eT2CbFFYAoMDcuEwJvkGLh8WhqekwS+Lb184
         tAwToPvyTtDUA1yQL/pkz9iMsBHgrgETGTn0K53vX8geImDXr7M2gdMdQ8bDp4gQoYZC
         K2BWf0klShRoi8hmvQpNIq2UL5Oj2djTYfreZny7WY2JvnpA/LuB6LPn5eOR2haX47OZ
         kHWPMtE/ytnSOt7pTdl8tqaw7HDZYfQe3kvo9+/1hqoOeGHCSJcmb7S87WaUlOasOPLr
         Ji2w==
X-Forwarded-Encrypted: i=1; AKwUvBwyUjlwOFxoorlzT8GJ3XPfatzN6MhqdziFiHkp/LF4Xv4fYeaI2lIH+qJ2oVwW/0G1YfncjGrmUNY0sA==@vger.kernel.org
X-Gm-Message-State: AFuF++lf2q7ncQaZpqfDSQ9OECSEscL5dxRMiMsHLmRxmnqXUZyrHQRm
	tTRvcktNqfcXwWDxpPqCoBnj9X3SHusF77hNRQm0aVDjtUmO+CqPD9SG
X-Gm-Gg: AYBFou2RAVi0qPWlXwfsds7ztRvUiDd/iKdWpwllrrUiPZ6dnJvCJBO4QO6u4dVswY6
	csY7qLmErYjqCqty09dFMeb/y+2ac4nDnRbyVDEqF+/lotElnVFfB+96cqUttgh2rqStzDhacX0
	ifcYdyXof4CXs61IlhGFpNczcms+aUyj+Sq/hHmlHWyNB6VGD+2RU3SFToUvj9k2/Gs1+NaNbad
	Vw1Az9DPCZHQJySB7lyCMOVzyiQxauBeAnhmhZ/LsibiqlX2Gr1XtrH7wUQQxJ8sI0v8KTE208e
	1wvfSePG0AZKZLnx6w0t5XoplV9F3p/CEVENlucwNJ22E3XCZhzToe+7ZHas5tjMWRxYo4UhBre
	W7ICvjycgMqT5vKpJwB7o/RquJ3UdXfZF0jSv8wkX9TIaEl3jgZpm0OYH+pFw/pNmVUfLT88CsI
	Xdo0CzUSMQweFyLMpSRXL99AkA2F5w9T06jygWJJz17ZXA8LH4kw+AMQkO+JDzcS/O6b3MSpK1I
	mFdnRCUF9OcoA+oHxZI3IFZSUJzopdigJcjWn9GTdgjU0sRZ8pCRatEePblBfVucgm/SLEiyf3+
	A/TxjzpA43WvAg==
X-Received: by 2002:a17:90b:5545:b0:39d:e54c:8643 with SMTP id 98e67ed59e1d1-39e54d13929mr6237236a91.11.1789738801484;
        Fri, 18 Sep 2026 06:40:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:01 -0700 (PDT)
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
Subject: [PATCH 04/15] ASoC: mediatek: mt8192: fix MCK clock error handling
Date: Fri, 18 Sep 2026 20:39:00 +0700
Message-ID: <20260918133912.133799-5-phucduc.bui@gmail.com>
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

If an error occurs after enabling 'm_sel_id' or 'div_clk_id' in
mt8192_mck_enable(), the function returns directly without disabling
the previously enabled clocks, leading to a resource leak.

Fix this by jumping to proper cleanup labels to unwind enabled clocks on
failure paths.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index 118dd4819682..77f596cab92d 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -619,7 +619,7 @@ int mt8192_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 			dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[m_sel_id],
 				aud_clks[apll_clk_id], ret);
-			return ret;
+			goto err_disable_m_sel;
 		}
 	}
 
@@ -628,17 +628,25 @@ int mt8192_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[div_clk_id], ret);
-		return ret;
+		goto err_disable_m_sel;
 	}
 	ret = clk_set_rate(afe_priv->clk[div_clk_id], rate);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_set_rate %s, rate %d, fail %d\n",
 			__func__, aud_clks[div_clk_id],
 			rate, ret);
-		return ret;
+		goto err_disable_div_clk;
 	}
 
 	return 0;
+
+err_disable_div_clk:
+	clk_disable_unprepare(afe_priv->clk[div_clk_id]);
+err_disable_m_sel:
+	if (m_sel_id >= 0)
+		clk_disable_unprepare(afe_priv->clk[m_sel_id]);
+
+	return ret;
 }
 
 void mt8192_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0

