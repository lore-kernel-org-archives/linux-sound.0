Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBE650E58D
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738794; cv=none; b=YlvcegkmarxKBaLgzvi8POJGUJSdFeWqkKLHDrq4/fGg13XEodl898kkvQZlGYnHY9ssg+pde6gm80q6zZGTJqi4kimV+RaSttmUe7egLZZYQAR5Ho/jBfWcpeOMjDX/Uuvesmj9u2+pZGgMQ7yWcfkUg0fu7+gpCPWX6Peu6N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738794; c=relaxed/simple;
	bh=Yhr/LGNoTuypBOAzfvG820znUChZLtctV2QUCTymu2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s0YU+bD2OeutD6DA1Bfs0Vbs6Sja7+wP6jRmP1t17U8Krfv0/Qh2V7NCtvBfMxPXZfJxNs9CXstK5MnaD6IY1/uVKouVyyAG3yH1JpcgtoJrViHOcWx1aUuUe0XSA3z7CxFOpu2AENtWDzsX7UnNfAAjaH505Au8I4TqitXjo5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/iG0jN6; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/iG0jN6"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso593982a91.0
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 06:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738792; x=1790343592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ktoNsEAM8yzRGTqWXbn5tE4afzDQIVo6sEvkne09pIg=;
        b=J/iG0jN6qnv4JLDb6hYYsXt+7hJgiSdN00OmeeMBBp9/oYBpHuSlviKaWbiZEwKQj7
         Vc/mdvO81HdYgM5ADuIlMObqq35hqKScFpb5NmQU0PAblF4yFRxpeqlCfvkM8mnAONQF
         LrgUE6QGVieqRcKjN/5pt7S+m9jArxrZiMnUKNk55Qjoyx7eFkCxZbuHOUSCx+thmgEe
         HNrCxJnu2IqFml0gkGgL2KWCETbdx/U2J51uoeXmQvN+DiOGbAO1JbgDBpZZg7tsOf8U
         6zuAKdhwLjzG1c1jtKs1fWcdOQeYhbgfBUaz3bcyfxTo9rdA436EKfCWm3dbj4JNgQui
         AH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738792; x=1790343592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ktoNsEAM8yzRGTqWXbn5tE4afzDQIVo6sEvkne09pIg=;
        b=zaFczrZEEM8T/pI0Rbc43eTavtgNiFda883lcA3kTh1+LoJc87xKSw1JtqLGLlUFEr
         O5kOyrzB8U1ks8AHYpMyTig8khmQ3FWVipIl7I2HpsdqHNofAux3znaysqVq7RShJk8d
         yJ3ercLuIVdmvLNzKQ4SrBtdlUM+ZWGlh5W509V+dOuje7vJqe+LzC+GcbD5Knnidi2a
         2f1gHNHGntccA87rteQZT1YzZid2absvFK7R3VfyYzkrAIxeYojMnjr9OecsyMJqP2Z1
         iB9y5yYQe0jM99xVHbMT3ilaEEILo5tIU7Jy0+QVAMfyC26Gbz2Qf52D0IgXI+V+icXa
         bAlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJs3a3x3GrmrvG+CnhodnnkLc6NS5VRUavOnEIbgc5BaBC87fQSeuCd1OYZ20Wkpczo3xzm8p0AGGgFg==@vger.kernel.org
X-Gm-Message-State: AFuF++nLJbf1goTkMCgc/UV7jI+ajDoEiJP15HqzeNR5Kf4E+KKL4m8g
	HoBzdDUHAfh4ELwh6Aqzn01Qs6Acj4tlP7uPbqdwZdTEDQpVOjeJx+yx
X-Gm-Gg: AYBFou0mN3ufeD4d1gC5p8NpaAk98WqSKJnUZox1Dsp6piQOeCMbaYg7aNonKUTvg8s
	glojqtfJn5AryksGASrZSaL90qPxdN2jcBGXoua3fOOnB5BZNa/QjQCNqyjGdypWDa6s6hPDNYf
	KCKyxxg5v6saEmo06yRRKLVHw/H346gCri9OZBtlbPl5eIwf6KVX71gi3bcipUqbr66tHYynk8b
	zUTB4OIQOQ6HgRJoccjzCE8GAtkSyQSN/arclUk3FYw/dh5yp+jp+JnT1GUNWI8QJZjipHJEF3y
	MIYko9knZBWAyHl3bgrFsqdgJyRH9Rac5hkVUQkZIiP6EsyaGerXu9Mi+E2wWH6m+mqBZ32odLJ
	ArwsOKTFjFWWwbnxsK4JNTTCX94yat7djUJqN0A4yd4b/bZNJkHIShdurdGpO4UGB6lDeAQdIp2
	tCNaeQyBu8PpWc7d/sTRCm8iG/C50Bi1bRqsuvm1EdJoYlaM5h0arKSy5BAxtn3BeqLtL10wUX8
	Ql1bBuLf5/vMpK6zArL0rtHN9lDCFDYpAbGLtK2TZyCbmH7dx/FU3KahaqlRapGlbUm7pIaFOXg
	xXgYXfnxTug+yA==
X-Received: by 2002:a17:90b:398c:b0:39e:1c2c:1d4b with SMTP id 98e67ed59e1d1-39e54bcd0a9mr5957619a91.11.1789738791912;
        Fri, 18 Sep 2026 06:39:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:39:51 -0700 (PDT)
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
Subject: [PATCH 02/15] ASoC: mediatek: mt8192: fix AFE clock error handling
Date: Fri, 18 Sep 2026 20:38:58 +0700
Message-ID: <20260918133912.133799-3-phucduc.bui@gmail.com>
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

If a clock operation fails in mt8192_afe_enable_clock(), the function
returns immediately via the EXIT label without disabling the clocks
that were successfully enabled earlier in the sequence. This leaves
unneeded clocks running and causes a resource leak.

Properly unwind clocks enabled before an error by jumping to appropriate
cleanup labels on failure.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 28 +++++++++++++++-------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index bd778e5663b5..7647bdd463d9 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -220,21 +220,21 @@ int mt8192_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_SYS_AUDIO], ret);
-		goto EXIT;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_AUDIO_26M], ret);
-		goto EXIT;
+		goto err_disable_infra_sys_audio;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIO]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO], ret);
-		goto EXIT;
+		goto err_disable_infra_audio_26m;
 	}
 	ret = clk_set_parent(afe_priv->clk[CLK_MUX_AUDIO],
 			     afe_priv->clk[CLK_CLK26M]);
@@ -242,14 +242,14 @@ int mt8192_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto EXIT;
+		goto err_disable_mux_audio;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIOINTBUS], ret);
-		goto EXIT;
+		goto err_disable_mux_audio;
 	}
 
 	ret = mt8192_set_audio_int_bus_parent(afe, CLK_CLK26M);
@@ -257,7 +257,7 @@ int mt8192_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIOINTBUS],
 			aud_clks[CLK_CLK26M], ret);
-		goto EXIT;
+		goto err_disable_mux_audiointbus;
 	}
 
 	ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUDIO_H],
@@ -266,17 +266,27 @@ int mt8192_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_TOP_MUX_AUDIO_H],
 			aud_clks[CLK_TOP_APLL2_CK], ret);
-		goto EXIT;
+		goto err_disable_mux_audiointbus;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_AFE]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_AFE], ret);
-		goto EXIT;
+		goto err_disable_mux_audiointbus;
 	}
 
-EXIT:
+	return 0;
+
+err_disable_mux_audiointbus:
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
+err_disable_mux_audio:
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
+err_disable_infra_audio_26m:
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
+err_disable_infra_sys_audio:
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+
 	return ret;
 }
 
-- 
2.43.0

