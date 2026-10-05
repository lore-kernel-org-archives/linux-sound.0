Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19D047DF97
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 11:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198230; cv=none; b=WnZhckH68k3ojkTJZ64pKblM+HPKz986n15pvBKT2vvo9e1LvBEaJjMv6mT09Q2/3UtezJq689Vmj55BfrobULg9+UtR4K6ukGCMyXEOFFg7UZywwyojuB6KGM4/oevRyTqQNe4Lk5Wi0BXD1B1hijABXYTXHhD2RduevJmDMW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198230; c=relaxed/simple;
	bh=f+tJ3dmrXsandOwpdq8gnFCHqTQ4x42Fxlbz795xbrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XULTFwy6pnV27Dq5KIHm6XXelwLhAY14tb7Bay9Y3Ui69AFyXiz4bwgdwgFBRurC9zfw5jOjSbh7tIj4xz5tAvWmqPypa29R/PVAZDUubBw7aQU80XnPfgThx9aSPg1I3qjJdS58/6qp4jLvlB/2t9+cCdHBG5EIbtGiEr726P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m29reesL; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m29reesL"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a7906f463dso1212340a91.3
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 04:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198228; x=1791803028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=leelaKplSlz0zBQy959ImAMYPwrGQGI/LdumbuDxIKU=;
        b=m29reesLY4FU1dBXZs7U9hZSuLFHDwBDGsmOETHjoh59Xe2C6Di9dATvpYq/yf/jdx
         9++zfffrCoesarazipvAn9eG9hVF7LEMCdFopsUgE0W0JmqFBwPo6asHYbajZ4nJMJBa
         DlY192eUw3JMedzGJNvqsbefrZRDEpEdy9hZryho0trhNmDzbjj8y847eWwI9bXF+1xU
         IAQePM9bBK2LydCmmYLuAPpGRCQNfd2sY44V+tSc/AagFsSoSFbe2dzfznxTZdQPBoBW
         8Qvks5MnlI2vTw7MjZjDA3ASOxoBEAItiS6+iHu3BhzXJiJuPAqrPN3o4w4H38BkNGx+
         zNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198228; x=1791803028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=leelaKplSlz0zBQy959ImAMYPwrGQGI/LdumbuDxIKU=;
        b=0s09QMFZ2+TWivaINVY+9GOMPb1St3GgDYND2GR+yy3BMBMcbuNQtIUgedOPRyCfWO
         QMq9uLzm0ilZpBzs88N0jZv5lLhgJa1jUek4QxZ0cKAqC9Wj9LPLsgAFYwxngJyThAj4
         CUSORApAiSbm0JAzIlEYcnc2wDte6q4cOODh2nVP12ikO4sq9SnNY3I49CRrUE+2fTr7
         TTjLjb4+7V3pSb2RwI4vFWKvKVTvbLz+Ru7+wg1G59llQ0cfwtUkOZmkiJcMxbWZmgA5
         YJ+vXuEV1F4Soie3Ha0TXqMwZMeX1giQCG8rG+TtycxClAHEwiKEw5OR4s+4LZ2bQv+j
         c6KA==
X-Forwarded-Encrypted: i=1; AKwUvBzriaIWbL/BGwnPMKXCs6dhZo/EaB3HFWmlI52D4bHR1lXysA3ezVNFrzgYfAGkY8Mb1OadV5qwqxsQNg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKeXiqhThod+RS/lQn6M789CXVdkq9VHyfduUpzqPpvK+G5lBm4
	UPms1QkwuinwO5sypXf+kqIENl8KY/Sx6THdVhvKtFFxFD3Z0MWPPOd+
X-Gm-Gg: AYBFou0wfL9tYUQ6RoIybh1W5eRGPSzZKc0tbeZTBchjGrqj/qEI/WecU1RwpxQXzv/
	qQUMnP6X80ioRC5COwCYy/eprSPAityelgBDrXtDucpIGuGle6/yu6SM10sNygTBLTLjEcyrRb1
	dtiqWBfjnkk6oVB5tqfR3hGhqBw/BwjEjp5/+shPJIY+JzdNrX82r9Vh+mqMidhxHSCUsqG28Lu
	/4PtezR0a/ofm7jQGmE6i268Asfj0ocFWecoqJMIC2SggaHUi+KLf0R5Xf4oddOqNgsOAl4+bWg
	xtSsUy6NX6hGJ41j9PVoFpm++mo5OUvv2+AR/XNG+soLFbiwetc4jyivxFF3fzxcm6fJd5OSi7j
	Q2L/G5HmL88XW5d9xBcwtdCJJtZwGNlgoxPMCdH3PgKZ8fJpY3ChxaqlHyqiWPNXycTKubMeHtZ
	xH0FODPyCFAc7T+X8OSK1yMANTaaT0CvdaBeDNXZLYeZhjLt53dnTwevvgpWie/xRkucDEBwaOW
	Tn/LIxGhNOrjeGygGDn2LwEuXoQ7mA0VaLCzvDc8RdtTqOLFSjz5kQIBkPGR0R49nGS493INvLy
	FVgntdPSTyPe+g==
X-Received: by 2002:a17:90b:2b4b:b0:39e:4546:fb13 with SMTP id 98e67ed59e1d1-3a6cec143cbmr8426958a91.19.1791198228110;
        Mon, 05 Oct 2026 04:03:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:47 -0700 (PDT)
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
Subject: [PATCH v2 07/14] ASoC: mediatek: mt8195: Fix runtime resume error handling
Date: Mon,  5 Oct 2026 18:02:50 +0700
Message-ID: <20261005110257.50145-8-phucduc.bui@gmail.com>
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

Check and propagate errors when enabling the register access and main
clocks during runtime resume.

If regcache_sync() or main clock enable fails, restore regmap cache-only
mode and disable the register access clocks before returning the error.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 23 +++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 02736949ae6a..bb357cc674cb 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -2958,18 +2958,31 @@ static int mt8195_afe_runtime_resume(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
-	mt8195_afe_enable_reg_rw_clk(afe);
+	ret = mt8195_afe_enable_reg_rw_clk(afe);
+	if (ret)
+		return ret;
 
 	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
-		goto skip_regmap;
+		return 0;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err_restore_cache;
+
+	ret = mt8195_afe_enable_main_clock(afe);
+	if (ret)
+		goto err_restore_cache;
 
-	mt8195_afe_enable_main_clock(afe);
-skip_regmap:
 	return 0;
+
+err_restore_cache:
+	regcache_cache_only(afe->regmap, true);
+	mt8195_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int init_memif_priv_data(struct mtk_base_afe *afe)
-- 
2.43.0

