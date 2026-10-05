Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373E447CC82
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 11:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198220; cv=none; b=mmyto+XP7bhwic+PQYt8B3xOJul2r/lGvURLplNGjp+e4huK5ovPuNbBWBiCxfE4VrHQK3ljiAzW72ZOYdJzDujxjUcJKgvzpLKbmoybBp/54b418Fy8v2mCoDpG1SHtc+CRKoduNxb8u6Vh/hL//tPBJHDVxBMrKWTcvoV5GXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198220; c=relaxed/simple;
	bh=75Pi527tpe9avIX9uIyazGSmLusLOPieiQVrl5PsM34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eoHWGa8SzH2Iz1vVgNVjMGmej6+XQMlsQOSftv3Rb/Y+RxVh2DxOQJDxDH23LI5/NPyuUfba9jwybof54LPK7nvyV96YpQ3sC4hAZHq6jBt+1L1Bumd8v1fXV+P6q+dtrq30DuDa7spYYe9CT7wSj1vLnSQvGWzSQFp9EbNqoWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxCHU8xp; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxCHU8xp"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so1244402a91.2
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 04:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198219; x=1791803019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=QxCHU8xpjMXz2yRGVQj7shw+5hSaRUjCMDtnxiPjTq4M7Y8RIVGe4RlE+htpMNzy3H
         TwH9yq9l2/fA9wALXk+zYdTf1GFj4Ddz64SYoeAJ4Qhq7vAA3R3cTIu4z+ah3VP3WO0p
         bxkb4QvFueZulOyFlY89b/5h3iljxClkr0pk8GgiIsoDqEoVS4z/R9J+YWb0lixAwmpx
         r4lv7305GdM7gce4KdauJnQxrPKjg9Y9iAUAweJW8gIExy5lHg0f7qtbbWU6QyJT+2A1
         IN0PWC0hqbhncqwjft/dmm91QLIpFU1IyEX2fF9/EH6vJEG+fVfesdVPkMdLXUOrQkdJ
         oY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198219; x=1791803019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jzleEuY4fxtuuqAMZY5BgUyZW117KjLIE0OgBW0FxFU=;
        b=Vs+zL1yiqFFs7oPT7+kiNYa7uxlhtB3LmRPq5Qx+rt09A6cyTzyGJMj2N41Ds4vwRD
         6VeohSXi8R43Vw6KHz2YmxaGrXtYxwbgELSelQMT9OeBI5xTSe3Njqfi+kmpUaAgI1qp
         ryL736Cy9RPKfS6cIzhOkwDJ+uLZj+FARUryMEfk67Nv9qsHp70tVG8xtriGMKN+trUd
         n0KeEAtQRueDXlo6IXbhzVLqCSD/jDpqM8ReOTCHMrfngiKc8r/xF8zW70zuGy8OLSrS
         bfsl3nNjE/BN7fv6WkIj/PeEyjeYN+HcUXBvXcebX/RG8RMXNtfGIWQLUWsD+WfU//BC
         BfvA==
X-Forwarded-Encrypted: i=1; AKwUvBzHYT9KtNbgpar+xWNJtMth5iCyO/2yQRyEcKHOfGmB3TejyUHEZgGHJyAyh4NAsrpkBiMwexojDz2MDw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJosVEvSNdtN3zYDZqoeBp5s74j7W4wsnYHk1Anod2258ZC7+L9
	NlfCqyZdsXlEsRC6R5G/RLz194vp3HMi+tUBX2JOBpZ+e2CCr+cJGwYEyuMz6w==
X-Gm-Gg: AYBFou11RyOwyNXnrHfeOKIMzw9PS3OZQaDkftnH4rK9FpcWhWDlFtQEPzlUcuQkMV5
	QNrp8Z6btr/emX70QKqGneib9LB/cB5yFNZUrwoL6e0J3G9omwu69l51Yt5NgzpzvVvD9/5N9Wj
	b3XOa+ykhd15KzN0dnE1WdR3TqcgdopurFEXOuQzJYJcOrjk0dCAlzMEjRZ0LpEW5lQrUap6AJL
	59r4p1kBWcVomTh24Sk6H38c57wtVsLn6e6f6zVYRvie13ZeP1hKCKUBY/t+IaoQ4smitr1xJG+
	kZermTFYVwP3rAW/5DDbd8scATb9f4pJfzhtI9fgE0a/JCgjvGweNtrV4Jimt0uLxcksrgNXIrz
	J8Qaup+piWOYgE8/1qSnlLFgVsQ/BshbKErwkXRozT66YjGDUXP122vTmZ7I+kN2fC8xIaYppNh
	23xN2760cw3IE+7kSU75WW8ctuJijeYK4XnP+4uX8zh99k/nBlTBFfyxh3Y1KwoMGr4qv33o25u
	VTODjJycJGwtiRk3Bnrj24PK3u4/wvB3anOViXsJIB/OQadF4nhaNssEpwjH8rkzpirADFsjXLy
	4dGwQLsCzELWdg==
X-Received: by 2002:a17:90b:4b83:b0:3a5:1c7:c2f with SMTP id 98e67ed59e1d1-3a6ce986288mr9784031a91.59.1791198218535;
        Mon, 05 Oct 2026 04:03:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:38 -0700 (PDT)
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
Subject: [PATCH v2 05/14] ASoC: mediatek: mt8195: Fix paired memif clock error handling
Date: Mon,  5 Oct 2026 18:02:48 +0700
Message-ID: <20261005110257.50145-6-phucduc.bui@gmail.com>
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

Check and propagate errors when preparing and enabling the paired
DL8/DL10 memif clocks.

If enabling the second clock fails, undo the clock that was already
prepared or enabled to keep the clock state balanced.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 24 ++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 52c3381e6766..1d3e01e2c3e7 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -286,15 +286,23 @@ mt8195_afe_paired_memif_clk_prepare(struct snd_pcm_substream *substream,
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
+	int ret;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
 		return 0;
 
 	if (enable) {
 		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
-		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		if (ret)
+			return ret;
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-		mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_prepare_clk(afe, afe_priv->clk[clk_id]);
+		if (ret) {
+			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+			mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
+			return ret;
+		}
 	} else {
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
 		mt8195_afe_unprepare_clk(afe, afe_priv->clk[clk_id]);
@@ -315,6 +323,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
+	int ret;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
 		return 0;
@@ -322,11 +331,18 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	if (enable) {
 		/* DL8_DL10_MEM */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL10;
-		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		if (ret)
+			return ret;
 		udelay(1);
 		/* DL8_DL10_AGENT */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-		mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		ret = mt8195_afe_enable_clk_atomic(afe, afe_priv->clk[clk_id]);
+		if (ret) {
+			clk_id = MT8195_CLK_AUD_MEMIF_DL10;
+			mt8195_afe_disable_clk_atomic(afe, afe_priv->clk[clk_id]);
+			return ret;
+		}
 	} else {
 		/* DL8_DL10_AGENT */
 		clk_id = MT8195_CLK_AUD_MEMIF_DL8;
-- 
2.43.0

