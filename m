Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7156547DFB0
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 11:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198255; cv=none; b=s4YKNvv0Tp4/kmuLGkbXBKnt62ADlSgphAjH71vt6pKVtppwfs4jdXhtk6hJwNoDHyCykIMefql+xxLmh7ygeHvIDbFiCBdmiK4d6CDfA9vw5It+GMKJ8O2xBBq51suEVk1nXXKxZZ+S8gXSvlZXlG+HgQJJv71i3xajQ0oxW+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198255; c=relaxed/simple;
	bh=MMm6LoBTkeAomP+0/fA2vfNONTNnzG8MpauClEVrS+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gsw4vH0TnpZOPN73/mLJdNOo/38b+zsMyAlo1s+qMKhtsyOm1v1HUgDHLLTahqaw41Ir7pZxXPQHxQOc7no4PWipgut0UN5Xj2lFbmHs4KdVdhNAgcfA+BS4u4aEfc7S3xKo++1NeGrWxuyx9/4EsdUgDI9fkCBE0e7pzdTo0h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oS4oUzrA; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oS4oUzrA"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cce69f17291so175241a12.1
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 04:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198253; x=1791803053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=oS4oUzrAWOq24GJmKFXlkORVUDf3zS1FT8fRGt/YHhYKeBqn35E9BkeZkq2Tyk7/ZF
         Y8O7rIOdnOIZWB08JwepA+WpqwUKaEULGGWycqbhVHDFZfTIXDuChROHur04vFyzN6Wb
         +L7FZ6Bhps9jvczXM2TJSalp7RHan6/o6w9QR/Tx+k5wlFYQPfNrl9dMOilqdoyYXRCz
         BE8y/tqffPzp3LpjksKRtMwG27TyOFlDMy1eECROVKDTgzmTgdY1UVm04U5FLAzPte3O
         8Ud9GUSsDTLTaYFRKtmLKKdFEMoxfBRPwVqY8sEBvGSrXRcqTxLYFX20+sY8Gm+5iU7c
         HxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198253; x=1791803053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=KF2isoWcgaU6klUoBxRObwfYU8SoF4B9fIcaAG6rCwzL+nyk5xWBHvWikVjUDvSEiQ
         JSYgqHgyv6sswiR35/NEnW/yoKibVVSAwkKL+xQi0e4xvkFIm3CcHHDpDz0V3REJzlUg
         ITklRZ9jgA1VwkNXkV2wpX9ig0mg0bldH3WsP4kgToiKKkK3ivjQN2CUpipJv3dQQpKZ
         IDFH2Ky53aXW0XH3j7O/07WLvUoSJQIDq3wxSz7grES5jtUcRMu+/N9GGCRrkjORgWaz
         4kxbAvZstu2m0ONemrHdfwF8b/A3scXQzvqC6Mi7wtFnzsDxx8lbnNXS1ErfAP+r+Ifc
         8ufA==
X-Forwarded-Encrypted: i=1; AKwUvByVhN8JlHUKjI82ygFxX53n1t8ula7nQY0/XwNVYU3Rt5cx2vWJIH8tYyf+k91F2fVNT504BXDhyJtoxA==@vger.kernel.org
X-Gm-Message-State: AFuF++nUmSUsb/9FeN8uuYortNL9eBMSpHXcELa+wKWNYZSiqVVSVm7c
	oQrOtmJq1SwPgFe+qmWuN3+nPZb+5iN44+2nPhTF8xX3EWvEOQpM9rzT
X-Gm-Gg: AYBFou3QN1NM8K5GTVnR6wuQVWzRSrIfkSUo9sFmVQ1S5vOfazv0+Vc9LyaR8qATKVI
	CAwAv/QGECL5KDwSa8pfA+Us39Pbq0i3e3Fwry05aNLjwiPzortgeO85Rzl/91Rv0g6mSksHzjc
	cdrzB79VkYJ5o6MTZOp0+W/yc+Kjjhhlo2lIzYQnZ4mGI0bPRI3ISplAg3e0+lplssTl8jizVgj
	DyeQinGvVLvrA+IjTPkoIrPqzDpQlvIh7RcJ2rWfvpFSiuPb7hZBt766QRd33VhaH+z5m3AlmF3
	gyafhWpMOLES43slZ68H3PQxOmnnan0xQcNYXdCaZiMqFiyT7rN2C67yIY/+1nLis1jTlp4AZu+
	h1F2irhH4vOt9ub8HQw46fasYJCnhn/IfNw6pzE162CmmSYkJthrm+Jxhd7pkVhRVw6XDKTb/3i
	0DDwwccGafqHyN2q2Z5NT9nRe2ecMY2WszKyylNZ4Z5NiSJd8Sc9/Vbh2FJUdHkhM1fcmG0JgOE
	tJu1V5CjgA/NX2QAbhkSzOddGZzY+zzJ9XJrGDM9DAEjj+qczntcQMA+ei3EgkhvI4lJOpkrUMP
	S9InI9XsqZmSDw==
X-Received: by 2002:a05:6a21:b82:b0:3de:52c4:50bd with SMTP id adf61e73a8af0-3e0bc6a0f48mr10138880637.0.1791198252738;
        Mon, 05 Oct 2026 04:04:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:04:12 -0700 (PDT)
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
Subject: [PATCH v2 12/14] ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
Date: Mon,  5 Oct 2026 18:02:55 +0700
Message-ID: <20261005110257.50145-13-phucduc.bui@gmail.com>
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

