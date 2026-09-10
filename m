Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D340048987F
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 12:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045130; cv=none; b=ccSBGlvRgZBAnrwM5v+zV53/0s/Jo3ZzeFaNLCpU37tNHBDUjM+zyeZXFHhURKM0DogZJjFtElPgeAtJpBvteWx1kwhaU188RaQIfMTJadKbZi/39lgGAjrOiWRbEs8qQuzxSI8A1rIOqDZbZ6XGIyRz4qipfyTego0bbtPZWS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045130; c=relaxed/simple;
	bh=L2LE+CaRB/r8u7ksh8vaBEGwU4XGfFxUrv1E4QN5LbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l40bD3msSLIhEXsgjPtriFHQQR/NOAujbJON9E52BK00STDq+XRxUq8BcFNAJK/sN/79jARvpQ0QLKx1rPqzB7o/yEGLWahI0/aycHjR74lj1s5D0Jh2Oln9m2aYeMo688l9hYT9DyJj6bgf85QeowzawLvKXDFDWQ1NjWykeVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZijXHL49; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZijXHL49"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d7so817574a12.0
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 05:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045126; x=1789649926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=;
        b=ZijXHL493SAwG8pbxmPvAaTdsYslEMrAGHVASctHIx4v0Ma2NUaWDGTjDRW1oYgJQ8
         Gz5zVZn6bNBfZhBM1raKicpEDOOIq6z95lMcqivaoUXjhwlquC0WGBz7fIOgVm/PF1Ms
         6BjxRmqJ9U/x9IT9rt6DKG3pieinWVgCCUXeQDD/G824s8eYg+bzGe6M2ODNW59InNNU
         OuH979xmwWk6EqI9weG0HjHuHH7e79NjB9E9Dn6RXLTWiDIpaNCKjaozCmElUhS1nbYc
         6R2U4AlaBzlMp6GxKvsd0LE2Ns0BQYpxIMnuxmLtkYC9DwxMy1/gnEy1rEyO4gyYDMW3
         ALsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045126; x=1789649926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=;
        b=apE3uqBXHFMcUV4M0+wRd5NSRnuJ2H4afCvwwYwW2oqjbhxN/F+Y40t3lK54dDt0hx
         qxbRpRv09j0mvW4PSwbN5FXVoyC/mAxc+IGKk/Q7OMCa4akCYVs4uw0DlFHP1VrBmoOF
         yE149/bXiN1YA26gJng6hkgx+OXn+qfcKk3cg9Fm/xGf+ATzt6qKvpXYO2F8vMVOJrSy
         S1yb09W340VTfWgo8h3ePcew29vH2ArP3Gie36j2z2BqPl8HorjPnPG5uDyxWGYDmOud
         E+hKmWqVFUlnopamJj2b+bddmNCiD6eQxbg38PD6OfE5Z/Ryj28tjxPM4elDTBeIJ2nE
         nEvA==
X-Forwarded-Encrypted: i=1; AKwUvByS7VFOal41ZZeIzWgs2h0ThBGx0J2BY/+FSvgvPhl+vUjAN4+AtGFNFclMeyv9yHSx6amTvD/rV1xdoQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nAAwiwQ2ePB1PZYSMWYNTZxmDZUpfEdQ29CkRjVGAlRTpXg6PQ
	ExZZWV2MEbzaOEDX/j0TXcTKOISIiRwrddMkAwQtZVAVdWpIq2AVmVfX
X-Gm-Gg: AYBFou3JTYWUmmiI61u/cOJnF5G1D5uDjPhCJ07PU5kAE0L/H0EBDoVRB5/3Np2NGAz
	O1s2toEyqX89RRIPB329677y8hq/1dIuTIcu+zUFhSxZLCSF+HkPAE8g9VFayK6sgTC+KsjWMDV
	gLbO5RGj1mGjIvs/T41ZcBdGc21UUzGSlcvwFIEO/p/R6G635SdHNYGiu/Nns01QNKEv4BB04PJ
	ebrZpY01i7B9BHV87tqiluhKzbDEYGiizOrap64lxvd7abVEHkHbnb6xaDA10sexxTHLtLY+vql
	KcVMcPcetFl68WtUWKYb1y/Q4OLn/TfpTxkMJfrTxOv6DtRH1TpuBP4yB2h+Xsvc3jMQzcLlBiA
	sldFTjUqHL0ZGjkqY2Z/8DIl1/ET/HIdp/KhhAzk0ow73HRCcgp5aTR9pgwD1xGT4vnGpyqymYZ
	0xhemPwFk9Jw8WL2r1XsCBSmQAyhF5uDHEPR+coL35xEbdzXibzz8xk9QPV7bUJekaW/iyV5rOA
	EtFn5yvlsEFsK6yAT2lm5JndH0VlNljHkyCLwo9YMDuOcTFSuY5PBUr1wexip0Z9TL8JeBez13r
	pnYZkeNl4chAzvt/bKeYIHDdUw==
X-Received: by 2002:a17:90b:5485:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-39d77a1d83bmr3896223a91.6.1789045126242;
        Thu, 10 Sep 2026 05:58:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:45 -0700 (PDT)
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
Subject: [PATCH 10/13] ASoC: mediatek: mt8189: Propagate MCLK errors
Date: Thu, 10 Sep 2026 19:57:39 +0700
Message-ID: <20260910125742.150902-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_mclk_en_event() currently ignores errors returned by the MCK
enable and disable functions.

Propagate these errors.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 4826ee250d70..f20dbb410223 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -519,6 +519,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret = 0;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -529,17 +530,17 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		ret = mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		i2s_priv->mclk_rate = 0;
-		mt8189_mck_disable(afe, i2s_priv->mclk_id);
+		ret = mt8189_mck_disable(afe, i2s_priv->mclk_id);
 		break;
 	default:
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_i2s_widgets[] = {
-- 
2.43.0

