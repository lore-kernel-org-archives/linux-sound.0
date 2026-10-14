Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F405A4FC8FB
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 11:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977377; cv=none; b=XXLt/JDYu8GdF+b7Tw2Ho+cGDoiCdWC+o7Kq1LpxvaydkVX0RmhBYRtwMI/6UZGjoa7Uqp0YPzLPT6dkjivaf/hbXYNNNGMzhg75PmLl35a4YmK2Ax8fvYM+iQ0nIKV8Lk3813GOZUVGAY2ztEB0Re1qzNKD8DbURcVTuVNZ8rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977377; c=relaxed/simple;
	bh=MMm6LoBTkeAomP+0/fA2vfNONTNnzG8MpauClEVrS+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=euwYsEo+VS+iX+0ecNN/u3AIT7mcMnLF3UPFfvgmNAX5LDK8lR81GH5TvSWek33V697XR2HlCts0ql8hJbxhzpzURzbrwhofsyTmskFzD4i2vTdBeWwJsORiAT+6VNotK53Rrx4XT/qw2C9msE9ZntXZey+PWRB7vXmSQJF7E4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9CNsucb; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9CNsucb"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1793423a12.3
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 04:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977375; x=1792582175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=Z9CNsucbeWMyZjdrWIDKPcMHC/QD4tM/5tMr2fXlM1Yk8fME0IEVXyBBGs/i7wvdXG
         pHaEZ1xMCopo/1wn4uY3olacQbixo9K28ZCqAu/FjJIU5HgQLupVI3HHHBa7YUMznR5L
         FdO9Cf3UBo/anTYnydrxqCZYP4r1A3z6xUOoftIY83D/2gCIWIcIV9TzZchKJ8z6h5rB
         dGcNiN5esSz0/EfXk4FsYUSEMr86M4DaTgcSEtxdI7yv5VRb8z9WtNKjySxMc1Qqz6RZ
         pYVta2bCIFeaxoA7mGG9J2IsyDTgKoBqE22YfHhUWzJWiCxU1id+8//AKDQG8uj/uxZF
         1slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977375; x=1792582175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=2lqIjWUWbZBaCW0+P2C40VGKrAwP2M6G1K7TUqeqwrgKx72jo/CMCOLYC6BhqGNvgK
         V0cleBMJEkjZLca/sYqHJvnrIMNUx2zc6rzobuDkjnQo7+dhOW0qnhutuWxPkK1YaHUW
         92JvKDSXawden/nwQJc32WUpYVFyjs/bfc18rP4jDNXghcirCzQQL65OfqdtWpKKxB0q
         kRJZXWSU+R/fFSOKnaYf1vxoc0+sfQprjCju6g4u9FaLcGd2uUqGNJQxFHGLvl+s2UJJ
         jBdxQtv2bRoHON5Cb8GDYW/SOVQL+7YiUC03CLXhzarOuS8vnNW/zXep9UbLYkUoHID0
         le9g==
X-Forwarded-Encrypted: i=1; AKwUvBxnnALFChJfWyUPhi1bnhuNsVGsnYUhI2CC1wyL+C3pLNJG8d/Hlsvj93a4W0hwgSErlUT8Z+y+rmvy5g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJF6QphfBvq3s/IhGrBlFJ9Um7XDpYlxoqDRHin7tk9/IWcaNpF
	Wh44+UaMefDVI06Q19tDGblTJ4/3XAM5v4wW4a3UQkt3zqYV3QEy0Io1
X-Gm-Gg: AYBFou3le+XM201LP3xykNKBqUp6n5RmOL6zgXRTt4zGKRhfKCQUVLh4EGwmiESWRT2
	wBDYssFruKb4svEWb+EIfsCOHeJ4b8FQ+9Ch8SWZTbr25k83juZW6ow6mcwN+wdu1wIF3aH53pd
	VUdfSgqk91hjUc/27W9mGX7xpgMSKhaiyCQ7U3l1Z2q1e0ngpIfgB5xaIyn3pjZlT2sZy1za/S2
	vhFkBTdcoj3E77PPLaaSlMkfyUNVeatXAVUk5Xg0B53GpS3Wv5YdnLqnc3aV/GawQLAV7uIBALO
	+Jp+LmNNqDe+p6tPh0z8qQO/U73oHDOC6XBPOrbAfZFLm9zdUqzA0uIUPL0wxKd6dJlMKIF7sP7
	MOzzzVNiHiA2QfA1VsXZ/eyNzy+n4xVv4rbVLssPceqRv2pghmCriSdG8CX6R0BuGV0W7InOWSV
	6ZLac/wRuqft7xR5d5jz91pkaM8MxrFK224duVuxTN7DQtLqPpdSEJynpASsDSfYIsVD6ad72i3
	KSVuV2mk70CnbeEWTO4/EMOKFv9NTSaxxJzl3xkXx9pgdp+EAHlQyTM0/fou3+4jUlhYaOCHjWh
	Kh1gsStTtj5UeA==
X-Received: by 2002:a17:90a:4ca2:b0:3ab:7031:d962 with SMTP id 98e67ed59e1d1-3ab70412990mr8076731a91.41.1791977375198;
        Wed, 14 Oct 2026 04:29:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:34 -0700 (PDT)
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
Subject: [PATCH v3 14/16] ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
Date: Wed, 14 Oct 2026 18:27:49 +0700
Message-ID: <20261014112752.683032-15-phucduc.bui@gmail.com>
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

Check and propagate errors when enabling the clock gate and MCLK
during HDMI TX/DP TX startup.

If MCLK enabling fails, disable the clock gate that was already
enabled before returning the error.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 1270fcac6b3f..11317cdd14ab 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2321,13 +2321,25 @@ static int mtk_dai_hdmitx_dptx_startup(struct snd_pcm_substream *substream,
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
+	int ret;
 
-	if (cg_id >= 0)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+	if (cg_id >= 0) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (ret)
+			return ret;
+	}
 
-	mtk_dai_etdm_enable_mclk(afe, dai->id);
+	ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+	if (ret)
+		goto err_disable_cg_clk;
 
 	return 0;
+
+err_disable_cg_clk:
+	if (cg_id >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+
+	return ret;
 }
 
 static void mtk_dai_hdmitx_dptx_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0

