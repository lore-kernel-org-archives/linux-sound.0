Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB4148C400
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 11:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371400; cv=none; b=lsL5479Ui2jttWOhWelFPLKhJWvlySCPky0WSl3J5YhIlgQqPm1eV1EvNRaGoxp0KXbPxbLNHvcZqmCiR941RwfOU0xmINaGq9QHSh0rwWirbPZVamb54Y4rajOucj5qlo7Lfkln0pU636KOMObIcHOHK7IZh9GqRLb+xvsgtQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371400; c=relaxed/simple;
	bh=IPGYtaOQglwuqgGFcejyGd0b+qOVVjwrtRjhs5z1A04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rCwP9TnMdO9wMNEhyIAoosrzHOTE4SnEuFzGTsUgo4t4ynWWzz3psWLFFJ1RzVefuGtQ9lIdg9dcmu/ln2bK89q98/qaiycTev8BRUvvLmJHw8OPV5jpIprksKJqPeJSA0sXSTZM4R2rEFURYhUs64y7AZWHHaWekdUkvjbOTAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1yl3wkw; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1yl3wkw"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso1666410a91.3
        for <linux-sound@vger.kernel.org>; Wed, 07 Oct 2026 04:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371381; x=1791976181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=;
        b=n1yl3wkwKlcY1qJGozAYT88JRdraYWYmldedb8X8BgXHzCDCMb9I9+fNhWuGRFPMro
         n3yq6rbSx3b+F0ecjIx0rYi8k8PM3uLZPbqJhoNKDILryRHhehGjkEkK7tsXStAcCgIL
         sQmcYDKsFDgiMedoHqgsVNDDB6PLs1StVHVznRduQzxRiKh2FIvjVp5gElhVWBmb5Fmd
         JsJl//Rls87/r7yDDUn/AohVyGAtKUmH4ijz5Yj2xU6oAkMoVUXK2LLe2R2HFeLwpfDf
         CcioEeAoCKhObMMk3tAWhayQwdrUfHqJk6ub/zOVSGmyaR6KTJ2MZ/jkYJ3CrkUYlGg4
         H4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371381; x=1791976181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SACGOLnAL8mTnZGcUa8MVcCzBnwjTHmyT/MfByO6AXo=;
        b=NZ96BA/NAYvKyiXOb+Nyof2fWtEJBqtGEZW2XMuE5EHxeYqwLMmRqj+tNcPIMarWfJ
         6ONOD2VPLY4Fql01+a38oigU0tG5CoHU0k5XNdzHkFRPgNMPlnDMKQqEt7645uZfRFeg
         32HemJY8IDRu5DrlQcn6t6yT02ulE8Z5tVFCuoyVD+7fS0do6YCCGjGBcV9Lw4R37+5D
         GTJ1RgYUiAwwrNG1U2KqpCsBcBpY2cHCqaUUfXhtyuAoR9XASCllFnqcSQsGtbgVgPGi
         3Y56Ng98X/Y3VKhUOUn/azFAk7MdRpz0bxsqYJvVM+7awbaJASSuSXGoIziujfTr47Db
         o44g==
X-Forwarded-Encrypted: i=1; AKwUvBy3ZJ0c4MxLhuidf/YWGiJRbSAz04QSCwGrOvHy/cjoWgn463ZAZS0eTZj0n3VIsGRADvV5HUQS5GDGGw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLoUe16RnfFaFjNWIvhaaQlwSwggSHZsI3OPwsgYLsUjSLtoW1c
	KL86cGIVetxrNdegBoSPUZ3yDxCYSOLxSG1pbcmZBYiz8zC9gvazJb9y
X-Gm-Gg: AYBFou3W6vVQq6FLxy7uiB/BMeYmAYj9DvPfWd/lR+GzBlI2tCyBla9ato7FgiGEatF
	2+t31mjyiJHcFP9n3zVLposwCwn8Ng3BGmyscdPgFLlqfNHYTQiTyiYqaKb+dO+6C5ZJyRTzCn3
	8fvbYRa2cyX+TZmkXcikTH5+2Y3isAGc1WnMUc+FxU/bVlgyVyqXOmEhRdkd59GKTmnzYccgiMq
	d23ESnQ+enR0r8tNl4hH2IqT/6lhyWS/5VSuILXta0AIkOalcPrZi2tLccEU8d+turz/sRaLSik
	iBIEG7wqXreANNXarRxM91UVpfRateTUCKdVAfSqAtaZb8qOKedi3DjdJknyr4wIBoGpcK57Z5V
	fnHTTesRS65iTfVKriZpxSEtk2zKG91WJ2LyU6+JtfDUsKzCgtXBZMlV9IRxdoE4BfROi1BscMD
	hp3kRbfNK8VMgPJwGHtrfStKDFrqvAJGopxMdccekZwCdhkVbhwAGWEOQWjTWJrVTN3xIC3KNr1
	PuzdPRIritV8mpjpsBGon/yvGyleKzx51EGRthagAQMQL3NiHmhG7iIrzWxiE47/wVW6+iNNJF4
	tyJXu4EtRe8MXA==
X-Received: by 2002:a17:90b:2d0b:b0:3a6:f90b:20cd with SMTP id 98e67ed59e1d1-3a89f649916mr1577999a91.6.1791371381444;
        Wed, 07 Oct 2026 04:09:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5ec70dbsm1328745a91.2.2026.10.07.04.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:09:41 -0700 (PDT)
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
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/4] ASoC: mediatek: common: Handle constraint return value in FE startup
Date: Wed,  7 Oct 2026 18:08:55 +0700
Message-ID: <20261007110858.509341-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110858.509341-1-phucduc.bui@gmail.com>
References: <20261007110858.509341-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from mtk_afe_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 283b612429a2 ("ASoC: mediatek: implement mediatek common structure")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 948f606cbaf2..ec99bc4a5d5e 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -75,8 +75,10 @@ int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	/* dynamic allocate irq to memif */
 	if (memif->irq_usage < 0) {
@@ -88,10 +90,10 @@ int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 		} else {
 			dev_err(afe->dev, "%s() error: no more asys irq\n",
 				__func__);
-			ret = -EBUSY;
+			return -EBUSY;
 		}
 	}
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_afe_fe_startup);
 
-- 
2.43.0

