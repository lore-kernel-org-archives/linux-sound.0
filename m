Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3155F44BC90
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 11:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371421; cv=none; b=eEJ9raP2AjLJ/rV1pBjYHWB8FoPRaUloeKx91h2qZrCOv1Mg4ILfE7ejzfXIi06pAuyiLM+h/GEASB9wbrcYfjQln6tw8TR6EdTB/xzNkZoOGfPbBAwoJJ3UL0XhRmMECl6kkaTGzYv6Hjh/361Afmar/Eur+Ubcgw05w0olpp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371421; c=relaxed/simple;
	bh=H3PDzDrtO5c8WYmCowPyg7cQ4FV1kL+eaDhtUert0sI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=doENr5R+KlZLWcq2MiymZyGEftpb0B7QWuySnURIiONPih0NO4yWOI08Ca951LvOyG5Q7Z2x7go4hbGYZZXvPdlqRaK618XU8dfn+7oJLgmHXboR1qrlYwOwxpBuBMpFCUCOkk9yNSp339Xnx9uc1ithYoH/mZa3ns+rXHbmyso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bt0e4QUU; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bt0e4QUU"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a88d1d911dso842334a91.3
        for <linux-sound@vger.kernel.org>; Wed, 07 Oct 2026 04:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371402; x=1791976202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=;
        b=Bt0e4QUUfLPs8vfmGhBKqHde4p3Zeg8VEjrEnwmZW3o2WwOX0is29QZDpEYjigrfk3
         c9G0W3QOJA/3kbdHX9V5oDBiHiz5Zy8GafnBwjx0hqMgD0KQyNd5NEXCUHIVeBsrcYhz
         GnrggQj1eY6ZvVs3o6Hyu5NQnQ4hnZKPzg3HVLscpTyNt2qc5wbWw+ScoSr2iCDFGyEM
         PHrMDbNfcMTKWzn4yAltr9iZwVAMjscR1JawREqiQ0fpYiDT5uWvURi9GOzjhMDhM1Fr
         O8uc4fbekxLirPRIH0ePtbtLaUdO6N4ZbwrKI4pZ3QKc53lwAjIO/L5DkvYCX4R+Fa9e
         A+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371402; x=1791976202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrZPU62D++2Mpf09f9HLGIFyK7TMDyESiaONSZX8Yvw=;
        b=Ih6i9+DGrtjhze4A4mwiJZTwg3/Ry3vy21s/TmsaCmGNGmiPZlQt3r+KG3PKxTmmhc
         SCm9ZsarcnUTcJe6Yh2K5p4jwGiHjHfQERGd3m5jbA3/G9G9UioWHTk+xyz9lc4QaPkz
         rVo7n0frBxIudP2vYVPqW+VM32aP8cQQW3WGSKIfl21Z9hIdXvh0gaziiavaS6dTylBH
         j4j7vQ+CeWTYWGwaQFs8hCaz9XfKxwMB5GUzfoDR4YB2SSiwI32Lvh8lI36qlQwm8mEw
         gf2kiYlRt+DKSS/NxKruW15jvgyRdDzrLprkEwH/LGSWdExtRPyBLgDjx1BGwZNJFFmY
         fCMw==
X-Forwarded-Encrypted: i=1; AKwUvBxJ7GvFVOefGPtcMpBgrQs5JBiQAE5v/u2WsepDBrdWrpjhqroQBEqdkNium9/55PUPflvaTBtTykNk4g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKArK2QU+Sg5oqqjKSJ+wZJdkmFykvxVegSyDYdDXAq5ujLsc5d
	7+R7oHVhTOkIvh4Dyu1mATdmgykeJ1SixpGu6TTfsds9VBSm0IAuMyfu
X-Gm-Gg: AYBFou3NylDD9A2Q7Ziaw0xBIc4qUCtX+AyRySQpQrmXgxjJU44qxvYmfItw/xrnQSz
	9/keeMdVO9XmHnMU/4eAQxrlwo3dTW46oYOVO7xUjkuxkmQ49yKd1T68cNuv2tVL4+nyEG6U2pc
	FwbtcUFn3Phyq+7Ks1rUZ8x8Xx3AgVrMzGKEwTwaL76lp0TAfpuh3QPGQPIEOoqsfOvj/V8tKIA
	aG+Rl/Y7wRXFJp/PnutJjMaYH8RbVnmCf2D4WUYmnztjFct3MKgzikl/EVuhYu0BYWl2nl1MHtl
	EVRBZNjUSXd4t7dqkAWMZYMDcwuKk8aHFFAYE8SWBCHqSkKd15hJJH+CEprVzCEg+YI7V4WywnE
	/7dKfoeyQnliOuIQMKYMmcm1CVit/OA4gK41gL8aEG5i0wAFP3mDCkkatOJGAxiszEGpHFZfZpH
	fvr2vIbmwGhKyTx7PuvVTwOk7ORcQioJN4AV6vnROEUpnNis9k5dUT7n9LgzjO13Di/fcKDJdRd
	4+b6Stgzs8Onb1D6l5un/xFAkXnWbyt5PC20maBGBFPPT0UAwwQnUdKT3H5r6TUo9PLUAnQfGlx
	+BHARju/wUvwLA==
X-Received: by 2002:a17:90b:4cd0:b0:3a6:f1d2:57f8 with SMTP id 98e67ed59e1d1-3a8a08354bbmr1628776a91.2.1791371402126;
        Wed, 07 Oct 2026 04:10:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a5ec70dbsm1328745a91.2.2026.10.07.04.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:10:01 -0700 (PDT)
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
Subject: [PATCH v2 4/4] ASoC: mediatek: mt8365: Handle constraint return value in FE startup
Date: Wed,  7 Oct 2026 18:08:58 +0700
Message-ID: <20261007110858.509341-5-phucduc.bui@gmail.com>
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
from mt8365_afe_fe_startup(). ASoC only treats 0 as success when marking
the DAI as started, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: e1991d102bc2 ("ASoC: mediatek: mt8365: Add the AFE driver support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index e9497246f37c..314235557fdf 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -514,11 +514,14 @@ static int mt8365_afe_fe_startup(struct snd_pcm_substream *substream,
 	snd_soc_set_runtime_hwparams(substream, afe->mtk_afe_hardware);
 
 	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
 
 	mt8365_afe_enable_main_clk(afe);
-	return ret;
+
+	return 0;
 }
 
 static void mt8365_afe_fe_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0

